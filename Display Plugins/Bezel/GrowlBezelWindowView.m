//
//  GrowlBezelWindowView.m
//  Display Plugins
//
//  Created by Jorge Salvador Caffarena on 09/09/04.
//  Copyright 2004 Jorge Salvador Caffarena. All rights reserved.
//

#import "GrowlBezelWindowView.h"
#import "GrowlImageAdditions.h"
#import "GrowlBezierPathAdditions.h"

#define BORDER_RADIUS 20.0f
#define ELLIPSIS_STRING @"..."

@implementation GrowlBezelWindowView

- (id)initWithFrame:(NSRect)frame {
	if( ( self = [super initWithFrame:frame] ) ) {
		_icon = nil;
		_title = nil;
		_text = nil;
		_textHeight = 0;
		_target = nil;
		_action = nil;
	}
	return self;
}

- (void)dealloc {
	[_icon release];
	[_title release];
	[_text release];

	[super dealloc];
}

- (void)drawRect:(NSRect)rect {
	NSRect bounds = [self bounds];

	// clear the window
	[[NSColor clearColor] set];
	NSRectFill( [self frame] );

	NSBezierPath *path = [NSBezierPath roundedRectPath:bounds radius:BORDER_RADIUS lineWidth:1.f];

	int opacityPref = 40;
	READ_GROWL_PREF_INT(BEZEL_OPACITY_PREF, BezelPrefDomain, &opacityPref);
	
	[[NSColor colorWithCalibratedRed:0.f green:0.f blue:0.f alpha:(opacityPref*0.01f)] set];
	[path fill];
	
	int sizePref = 0;
	READ_GROWL_PREF_INT(BEZEL_SIZE_PREF, BezelPrefDomain, &sizePref);

	// rects
	NSRect titleRect, textRect;
	NSPoint iconPoint;
	int maxRows;
	int iconOffset = 0;
	NSSize maxIconSize;
	NSSize iconSize = [_icon size];
	if (sizePref == BEZEL_SIZE_NORMAL) {
		titleRect = NSMakeRect(12.f, 90.f, 187.f, 30.f);
		textRect =  NSMakeRect(12.f, 4.f, 187.f, 80.f);
		maxRows = 4;
		maxIconSize = NSMakeSize(72.f, 72.f);
		iconSize = [_icon adjustSizeToDrawAtSize:maxIconSize];
		if ( iconSize.width < maxIconSize.width ) {
			iconOffset = ceilf( (maxIconSize.width - iconSize.width) * 0.5f );
		}
		iconPoint = NSMakePoint(70.f + iconOffset, 120.f);
	} else {
		titleRect = NSMakeRect(8.f, 52.f, 143.f, 24.f);
		textRect =  NSMakeRect(8.f, 4.f, 143.f, 49.f);
		maxRows = 2;
		maxIconSize = NSMakeSize(48.f, 48.f);
		iconSize = [_icon adjustSizeToDrawAtSize:maxIconSize];
		if ( iconSize.width < maxIconSize.width ) {
			iconOffset = ceilf( (maxIconSize.width - iconSize.width) * 0.5f );
		}
		iconPoint = NSMakePoint(57.f + iconOffset, 83.f);
	}

	// If we are on Panther or better, pretty shadow
	BOOL pantherOrLater = ( floor( NSAppKitVersionNumber ) > NSAppKitVersionNumber10_2 );
	id textShadow = nil; // NSShadow
	if ( pantherOrLater ) {
		Class NSShadowClass = NSClassFromString(@"NSShadow");
        textShadow = [[[NSShadowClass alloc] init] autorelease];
        
		NSSize      shadowSize = NSMakeSize(0.f, -2.f);
        [textShadow setShadowOffset:shadowSize];
        [textShadow setShadowBlurRadius:3.0f];
		[textShadow setShadowColor:[NSColor colorWithCalibratedRed:0.f green:0.f blue:0.f alpha:1.0f]];
	}
	
	// Draw the title, resize if text too big
	float titleFontSize = 20.0f;
    NSMutableParagraphStyle *parrafo = [[[[NSParagraphStyle defaultParagraphStyle] mutableCopy] 
			setAlignment:NSCenterTextAlignment] autorelease];
	NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				[NSColor whiteColor], NSForegroundColorAttributeName,
				parrafo, NSParagraphStyleAttributeName,
				[NSFont boldSystemFontOfSize:titleFontSize], NSFontAttributeName, nil];
	if ( pantherOrLater ) {
		[titleAttributes setObject:textShadow forKey:NSShadowAttributeName];
	}
	float accumulator = 0.f;
	BOOL minFontSize = NO;
	//[titleAttributes setObject:[NSFont boldSystemFontOfSize:titleFontSize] forKey:NSFontAttributeName];
	NSSize titleSize = [_title sizeWithAttributes:titleAttributes];

	while ( titleSize.width > ( NSWidth(titleRect) - ( titleSize.height * 0.5f ) ) ) {
		minFontSize = ( titleFontSize < 12.f );
		if ( minFontSize ) {
			[self setTitle: [_title substringToIndex:[_title length] - 1]];
		} else {
			titleFontSize -= 1.f;
			accumulator += 0.5f;
		}
		[titleAttributes setObject:[NSFont boldSystemFontOfSize:titleFontSize] forKey:NSFontAttributeName];
		titleSize = [_title sizeWithAttributes:titleAttributes];
	}

	titleRect.origin.y += ceilf(accumulator);

	if ( minFontSize ) {
		[self setTitle: [NSString stringWithFormat:@"%@%@",[_title substringToIndex:[_title length]-1], ELLIPSIS_STRING]];
	}

	titleRect.size.height = titleSize.height;
	[_title drawInRect:titleRect withAttributes:titleAttributes];
	
	NSMutableDictionary *textAttributes = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				[NSColor whiteColor], NSForegroundColorAttributeName,
				parrafo, NSParagraphStyleAttributeName,
				[NSFont systemFontOfSize:14.0f], NSFontAttributeName, nil];
	if ( pantherOrLater ) {
		[textAttributes setObject:textShadow forKey:NSShadowAttributeName];
	}
	NSAttributedString *_textAttributed;
	NSArray *linesN = [_text componentsSeparatedByString:@"\n"];
	int rowCount = 0;
	if ( [linesN count] > 1 ) {
		NSEnumerator *stringEnum = [linesN objectEnumerator];
		NSString *stringLine;
		while( (stringLine = [stringEnum nextObject] ) ) {
			_textAttributed = [[NSAttributedString alloc] initWithString:stringLine attributes:textAttributes];
			rowCount += [self descriptionRowCount:_textAttributed inRect:textRect];
			[_textAttributed release];
			_textHeight = 0;
		}
	} else {
		_textAttributed = [[[NSAttributedString alloc] initWithString:_text attributes:textAttributes] autorelease];
		rowCount = [self descriptionRowCount:_textAttributed inRect:textRect];
		[_textAttributed release];
	}

	if ( rowCount > maxRows ) {
		[textAttributes setObject:[NSFont systemFontOfSize:12.0f] forKey:NSFontAttributeName];
	}
	[_text drawInRect:textRect withAttributes:textAttributes];

	NSRect iconRect;
	iconRect.origin = iconPoint;
	iconRect.size = maxIconSize;
	[_icon drawScaledInRect:iconRect operation:NSCompositeSourceOver fraction:1.f];
}

- (void)setIcon:(NSImage *)icon {
	[_icon autorelease];
	_icon = [icon retain];
	[self setNeedsDisplay:YES];
}

- (void)setTitle:(NSString *)title {
	[_title autorelease];
	_title = [title copy];
	[self setNeedsDisplay:YES];
}

- (void)setText:(NSString *)text {
	[_text autorelease];
	_text = [text copy];
	_textHeight = 0;
	[self setNeedsDisplay:YES];
}

- (float)descriptionHeight:(NSAttributedString *)text inRect:(NSRect)theRect {

	if (_textHeight == 0) {
		NSTextStorage* textStorage = [[NSTextStorage alloc] initWithAttributedString:text];
		NSTextContainer* textContainer = [[[NSTextContainer alloc]
			initWithContainerSize:NSMakeSize(NSWidth(theRect),NSHeight(theRect)+1000.f)] autorelease];
		NSLayoutManager* layoutManager = [[[NSLayoutManager alloc] init] autorelease];

		[layoutManager addTextContainer:textContainer];
		[textStorage addLayoutManager:layoutManager];
		(void)[layoutManager glyphRangeForTextContainer:textContainer];
	
		_textHeight = [layoutManager usedRectForTextContainer:textContainer].size.height;
		_textHeight = _textHeight / 13 * 14;
	}
	return MAX (_textHeight, 30);
}

- (int)descriptionRowCount:(NSAttributedString *)text inRect:(NSRect)theRect{
	float height = [self descriptionHeight:text inRect:theRect];
	float lineHeight = [text size].height;
	return (int) (height / lineHeight);
}

- (id) target {
	return _target;
}

- (void) setTarget:(id) object {
	_target = object;
}

#pragma mark -

- (SEL) action {
	return _action;
}

- (void) setAction:(SEL) selector {
	_action = selector;
}

#pragma mark -

- (void) mouseUp:(NSEvent *) event {
	if( _target && _action && [_target respondsToSelector:_action] ) {
		[_target performSelector:_action withObject:self];
	}
}

@end
