FasdUAS 1.101.10   ��   ��    k             l      �� ��   \V
New Item Alert with Filenames


For the Folder Notification scripts to work, they have to be placed in "Scripts/Folder Action Scripts" ... either in /Library or ~/Library. After placing them there, right-click on the folder for which you want notifications and choose "Attach a Folder Action."


Based on ADD - NEW ITEM ALERT (�2002 Apple Computer)

This Folder Action script is designed for use with Mac OS X version 10.2 and higher.

This Folder Action handler is triggered whenever items are added to the attached folder.  The script will display an alert 
containing the number of items added
       	  l     ������  ��   	  
  
 i         I     ��  
�� .facofget****      � ****  o      ���� 0 this_folder    �� ��
�� 
flst  o      ���� 0 added_items  ��    Q     �  ��  k    �       O    2    k    1       l   �� ��      get the name of the folder         r        l   
  ��   n    
 ! " ! 1    
��
�� 
pnam " o    ���� 0 this_folder  ��    l      #�� # o      ���� 0 folder_name  ��     $ % $ r     & ' & m     ( (       ' o      ���� 0 thefiles theFiles %  )�� ) X    1 *�� + * r   ! , , - , b   ! * . / . b   ! $ 0 1 0 o   ! "���� 0 thefiles theFiles 1 o   " #��
�� 
ret  / l  $ ) 2�� 2 c   $ ) 3 4 3 n   $ ' 5 6 5 1   % '��
�� 
pnam 6 o   $ %���� 0 thefile theFile 4 m   ' (��
�� 
ctxt��   - o      ���� 0 thefiles theFiles�� 0 thefile theFile + o    ���� 0 added_items  ��    m     7 7�null     ߀��  "
Finder.app��@� �0��Ȑ 7���p��ݰ ]00   )       (�� ��ݐ �MACS   alis    r  Macintosh HD               �N�.H+    "
Finder.app                                                       3��n�H        ����  	                CoreServices    �N�      �n�8      "      3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     8 9 8 l  3 3������  ��   9  : ; : r   3 ; < = < n  3 9 > ? > I   4 9�� @���� 0 alias_to_url alias_to_URL @  A�� A o   4 5���� 0 this_folder  ��  ��   ?  f   3 4 = o      ���� 0 folder_icon   ;  B C B l  < <������  ��   C  D E D r   < C F G F l  < A H�� H n   < A I J I m   ? A��
�� 
nmbr J n  < ? K L K 2  = ?��
�� 
cobj L l  < = M�� M o   < =���� 0 added_items  ��  ��   G l      N�� N o      ���� 0 
item_count  ��   E  O P O Z   D [ Q R�� S Q ?  D G T U T l  D E V�� V o   D E���� 0 
item_count  ��   U m   E F����  R k   J Q W W  X Y X r   J M Z [ Z m   J K \ \  s    [ o      ���� 0 	plurality   Y  ]�� ] r   N Q ^ _ ^ m   N O ` ` 
 have    _ o      ���� 0 	have_verb  ��  ��   S k   T [ a a  b c b r   T W d e d m   T U f f       e o      ���� 0 	plurality   c  g�� g r   X [ h i h m   X Y j j 	 has    i o      ���� 0 	have_verb  ��   P  k l k l  \ \������  ��   l  m n m r   \ e o p o b   \ c q r q b   \ a s t s b   \ _ u v u m   \ ] w w  New File    v o   ] ^���� 0 	plurality   t m   _ ` x x 
  in     r l  a b y�� y o   a b���� 0 folder_name  ��   p o      ���� 0 thetitle theTitle n  z { z r   f } | } | b   f { ~  ~ b   f y � � � b   f u � � � b   f s � � � b   f o � � � b   f m � � � l  f i ��� � c   f i � � � l  f g ��� � o   f g���� 0 
item_count  ��   � m   g h��
�� 
ctxt��   � m   i l � �   item    � o   m n���� 0 	plurality   � m   o r � �       � o   s t���� 0 	have_verb   � m   u x � �   been added:     o   y z���� 0 thefiles theFiles } o      ���� 0 thetext theText {  � � � l  ~ ~������  ��   �  � � � I   ~ ��� ����� 0 growlnotify GrowlNotify �  � � � o    ����� 0 thetitle theTitle �  � � � o   � ����� 0 thetext theText �  � � � m   � � � �  icon of file    �  � � � o   � ����� 0 folder_icon   �  ��� � m   � ���
�� boovfals��  ��   �  ��� � l  � �������  ��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     � � � l     ������  ��   �  � � � i     � � � I      �� ����� 0 growlnotify GrowlNotify �  � � � o      ���� 0 thetitle theTitle �  � � � o      ���� 0 thetext theText �  � � � o      ���� 0 	imagetype 	imageType �  � � � o      ����  0 imagespecifier imageSpecifier �  ��� � o      ���� 
0 sticky  ��  ��   � k     � � �  � � � O     � � � r     � � � l 	   ��� � l    ��� � I   �� ���
�� .corecnte****       **** � l    ��� � 6    � � � 2   ��
�� 
pcap � l    ��� � =    � � � 1   	 ��
�� 
pnam � l 	   ��� � m     � �  GrowlHelperApp   ��  ��  ��  ��  ��  ��   � o      ���� 0 growlrunning GrowlRunning � m      � ��null     ߀��  "System Events.app���� 7��ހ���� ]0(   )       (�� ��ޠ �sevs   alis    �  Macintosh HD               �N�.H+    "System Events.app                                                \e�n�
        ����  	                CoreServices    �N�      �n��      "      :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   �  � � � l   ������  ��   �  � � � Z    � � ��� � � @     � � � o    ���� 0 growlrunning GrowlRunning � m    ����  � k    g � �  � � � r    + � � � b    ) � � � b    ' � � � b    % � � � b    # � � � b    ! � � � l 	   ��� � m     � �  notify with title "   ��   � o     ���� 0 thetitle theTitle � m   ! " � �  "     � l 	 # $ ��� � m   # $ � �  description "   ��   � o   % &���� 0 thetext theText � m   ' ( � �  "    � o      ���� 0 notifycommand notifyCommand �  � � � l  , ,������  ��   �  � � � Z   , K � ����� � F   , 7 � � � >   , / � � � o   , -���� 0 	imagetype 	imageType � m   - . � �       � >   2 5 � � � o   2 3����  0 imagespecifier imageSpecifier � m   3 4 � �       � r   : G � � � b   : E � � � b   : C � � � b   : A � � � b   : ? � � � b   : = � � � o   : ;���� 0 notifycommand notifyCommand � l 	 ; < ��� � m   ; < � �      ��   � o   = >���� 0 	imagetype 	imageType � m   ? @ � �   "    � o   A B����  0 imagespecifier imageSpecifier � m   C D � �  "    � o      ���� 0 notifycommand notifyCommand��  ��   �    l  L L������  ��    l  L L����   * $ work around AppleScript's potential     l  L L����   ' ! "Where is GrowlHelperApp" dialog    	 r   L Q

 m   L O  GrowlHelperApp    o      ���� 
0 gha GHA	 � O  R g I  [ f�~�}
�~ .sysodsct****        scpt b   [ b b   [ ` l 	 [ \�| o   [ \�{�{ 0 notifycommand notifyCommand�|   m   \ _  sticky     o   ` a�z�z 
0 sticky  �}   4   R X�y
�y 
capp o   V W�x�x 
0 gha GHA�  ��   � I  j ��w
�w .sysodlogaskr        TEXT b   j u b   j s b   j o o   j k�v�v 0 thetitle theTitle o   k n�u
�u 
ret  o   o r�t
�t 
ret  o   s t�s�s 0 thetext theText �r !
�r 
btns  J   x }"" #�q# m   x {$$  OK   �q  ! �p%�o
�p 
dflt% m   � ��n�n �o   � &�m& l  � ��l�k�l  �k  �m   � '(' l     �j�i�j  �i  ( )*) l     �h+�h  + / ) translate a file alias to a file:/// URL   * ,-, i    ./. I      �g0�f�g 0 alias_to_url alias_to_URL0 1�e1 o      �d�d 0 	this_file  �e  �f  / k     R22 343 r     565 c     787 n     9:9 1    �c
�c 
psxp: o     �b�b 0 	this_file  8 m    �a
�a 
ctxt6 o      �`�` 0 	this_file  4 ;<; r    =>= m    	??  /   > n     @A@ 1   
 �_
�_ 
txdlA 1   	 
�^
�^ 
ascr< BCB r    DED n    FGF 2    �]
�] 
citmG o    �\�\ 0 	this_file  E l     H�[H o      �Z�Z 0 path_segments  �[  C IJI Y    ;K�YLM�XK k   " 6NN OPO r   " (QRQ n   " &STS 4   # &�WU
�W 
cobjU o   $ %�V�V 0 i  T l  " #V�UV o   " #�T�T 0 path_segments  �U  R o      �S�S 0 this_segment  P W�RW r   ) 6XYX l 	 ) 1Z�QZ n  ) 1[\[ I   * 1�P]�O�P 0 encode_text  ] ^_^ o   * +�N�N 0 this_segment  _ `a` m   + ,�M
�M boovtruea b�Lb m   , -�K
�K boovfals�L  �O  \  f   ) *�Q  Y n      cdc 4   2 5�Je
�J 
cobje o   3 4�I�I 0 i  d l  1 2f�Hf o   1 2�G�G 0 path_segments  �H  �R  �Y 0 i  L m    �F�F M l   g�Eg I   �Dh�C
�D .corecnte****       ****h l   i�Bi o    �A�A 0 path_segments  �B  �C  �E  �X  J jkj r   < Alml m   < =nn  /   m n     opo 1   > @�@
�@ 
txdlp 1   = >�?
�? 
ascrk qrq r   B Gsts c   B Euvu l  B Cw�>w o   B C�=�= 0 path_segments  �>  v m   C D�<
�< 
TEXTt o      �;�; 0 	this_file  r xyx r   H Mz{z m   H I||      { n     }~} 1   J L�:
�: 
txdl~ 1   I J�9
�9 
ascry �8 L   N R�� b   N Q��� m   N O��  file://   � o   O P�7�7 0 	this_file  �8  - ��� l     �6�5�6  �5  � ��� i    ��� I      �4��3�4 0 encode_text  � ��� o      �2�2 0 	this_text  � ��� o      �1�1 0 encode_url_a encode_URL_A� ��0� o      �/�/ 0 encode_url_b encode_URL_B�0  �3  � k     f�� ��� r     ��� l 	   ��.� m     �� * $abcdefghijklmnopqrstuvwxyz0123456789   �.  � l     ��-� o      �,�, 0 standard_characters  �-  � ��� r    ��� m    ��  $+!'/?;&@=#%><{}[]"~`^\|*   � l     ��+� o      �*�* 0 url_a_chars URL_A_chars�+  � ��� r    ��� m    	�� 
 .-_:   � l     ��)� o      �(�( 0 url_b_chars URL_B_chars�)  � ��� r    ��� l   ��'� o    �&�& 0 standard_characters  �'  � l     ��%� o      �$�$ 0 acceptable_characters  �%  � ��� Z   ���#�"� =   ��� o    �!�! 0 encode_url_a encode_URL_A� m    � 
�  boovfals� l 	  ��� r    ��� b    ��� l 	  ��� l   ��� o    �� 0 acceptable_characters  �  �  � l   ��� o    �� 0 url_a_chars URL_A_chars�  � l     ��� o      �� 0 acceptable_characters  �  �  �#  �"  � ��� Z    /����� =    #��� o     !�� 0 encode_url_b encode_URL_B� m   ! "�
� boovfals� l 	 & +��� r   & +��� b   & )��� l 	 & '��� l  & '��� o   & '�� 0 acceptable_characters  �  �  � l  ' (��� o   ' (�� 0 url_b_chars URL_B_chars�  � l     ��� o      �� 0 acceptable_characters  �  �  �  �  � ��� r   0 3��� m   0 1��      � l     ��� o      �
�
 0 encoded_text  �  � ��� X   4 c��	�� Z   D ^����� E  D G��� l  D E��� o   D E�� 0 acceptable_characters  �  � o   E F�� 0 	this_char  � r   J O��� l  J M��� b   J M��� l  J K��� o   J K�� 0 encoded_text  �  � o   K L�� 0 	this_char  �  � l     �� � o      ���� 0 encoded_text  �   �  � r   R ^��� c   R \��� l  R Z���� b   R Z��� l  R S���� o   R S���� 0 encoded_text  ��  � l 	 S Y���� I   S Y������� 0 encode_char  � ���� o   T U���� 0 	this_char  ��  ��  ��  ��  � m   Z [��
�� 
TEXT� l     ���� o      ���� 0 encoded_text  ��  �	 0 	this_char  � o   7 8���� 0 	this_text  � ���� L   d f�� l  d e���� o   d e���� 0 encoded_text  ��  ��  � ��� l     ������  ��  � ���� i    ��� I      ������� 0 encode_char  � ���� o      ���� 0 	this_char  ��  ��  � k     K�� ��� r     ��� l    ���� l    ���� I    �����
�� .sysoctonshor       TEXT� o     ���� 0 	this_char  ��  ��  ��  � l     ���� o      ���� 0 	ascii_num 	ASCII_num��  � ��� r        l 	  �� J      m    	  0     m   	 
		  1    

 m   
   2     m      3     m      4     m      5     m      6     l 	  �� m      7   ��    m      8     !  m    ""  9   ! #$# m    %%  A   $ &'& m    ((  B   ' )*) m    ++  C   * ,-, m    ..  D   - /0/ l 	  1��1 m    22  E   ��  0 3��3 m    44  F   ��  ��   l     5��5 o      ���� 0 hex_list  ��  � 676 r   ! /898 n   ! -:;: 4   " -��<
�� 
cobj< l  % ,=��= [   % ,>?> l  % *@��@ _   % *ABA o   % &���� 0 	ascii_num 	ASCII_numB m   & )���� ��  ? m   * +���� ��  ; l  ! "C��C o   ! "���� 0 hex_list  ��  9 o      ���� 0 x  7 DED r   0 >FGF n   0 <HIH 4   1 <��J
�� 
cobjJ l  4 ;K��K [   4 ;LML l  4 9N��N `   4 9OPO o   4 5���� 0 	ascii_num 	ASCII_numP m   5 8���� ��  M m   9 :���� ��  I l  0 1Q��Q o   0 1���� 0 hex_list  ��  G o      ���� 0 y  E R��R L   ? KSS c   ? JTUT l  ? FV��V b   ? FWXW b   ? DYZY m   ? B[[  %   Z o   B C���� 0 x  X o   D E���� 0 y  ��  U m   F I��
�� 
TEXT��  ��       ��\]^_`a��  \ ����������
�� .facofget****      � ****�� 0 growlnotify GrowlNotify�� 0 alias_to_url alias_to_URL�� 0 encode_text  �� 0 encode_char  ] �� ����bc��
�� .facofget****      � ****�� 0 this_folder  �� ������
�� 
flst�� 0 added_items  ��  b ������������������������ 0 this_folder  �� 0 added_items  �� 0 folder_name  �� 0 thefiles theFiles�� 0 thefile theFile�� 0 folder_icon  �� 0 
item_count  �� 0 	plurality  �� 0 	have_verb  �� 0 thetitle theTitle�� 0 thetext theTextc  7�� (�������������� \ ` f j w x � � � ���������
�� 
pnam
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
ret 
�� 
ctxt�� 0 alias_to_url alias_to_URL
�� 
nmbr�� �� 0 growlnotify GrowlNotify��  ��  �� � �� ,��,E�O�E�O �[��l kh ��%��,�&%E�[OY��UO)�k+ E�O��-�,E�O�k �E�O�E�Y 	�E�O�E�O�%�%�%E�O��&a %�%a %�%a %�%E�O*��a �fa + OPW X  h^ �� �����de���� 0 growlnotify GrowlNotify�� ��f�� f  ������������ 0 thetitle theTitle�� 0 thetext theText�� 0 	imagetype 	imageType��  0 imagespecifier imageSpecifier�� 
0 sticky  ��  d ������������������ 0 thetitle theTitle�� 0 thetext theText�� 0 	imagetype 	imageType��  0 imagespecifier imageSpecifier�� 
0 sticky  �� 0 growlrunning GrowlRunning�� 0 notifycommand notifyCommand�� 
0 gha GHAe  ���g�� ��� � � � � � ��� � � ���������$������
�� 
pcapg  
�� 
pnam
�� .corecnte****       ****
�� 
bool
�� 
capp
�� .sysodsct****        scpt
�� 
ret 
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT�� �� *�-�[�,\Z�81j E�UO�k N�%�%�%�%�%E�O��	 ���& ��%�%�%�%�%E�Y hOa E�O*a �/ �a %�%j UY �_ %_ %�%a a kva ka  OP_ ��/����hi���� 0 alias_to_url alias_to_URL�� �j� j  �~�~ 0 	this_file  ��  h �}�|�{�z�} 0 	this_file  �| 0 path_segments  �{ 0 i  �z 0 this_segment  i �y�x?�w�v�u�t�s�rn�q|�
�y 
psxp
�x 
ctxt
�w 
ascr
�v 
txdl
�u 
citm
�t .corecnte****       ****
�s 
cobj�r 0 encode_text  
�q 
TEXT�� S��,�&E�O���,FO��-E�O &k�j kh ��/E�O)�efm+ ��/F[OY��O���,FO��&E�O���,FO�%` �p��o�nkl�m�p 0 encode_text  �o �lm�l m  �k�j�i�k 0 	this_text  �j 0 encode_url_a encode_URL_A�i 0 encode_url_b encode_URL_B�n  k 	�h�g�f�e�d�c�b�a�`�h 0 	this_text  �g 0 encode_url_a encode_URL_A�f 0 encode_url_b encode_URL_B�e 0 standard_characters  �d 0 url_a_chars URL_A_chars�c 0 url_b_chars URL_B_chars�b 0 acceptable_characters  �a 0 encoded_text  �` 0 	this_char  l 	�����_�^�]�\�[
�_ 
kocl
�^ 
cobj
�] .corecnte****       ****�\ 0 encode_char  
�[ 
TEXT�m g�E�O�E�O�E�O�E�O�f  
��%E�Y hO�f  
��%E�Y hO�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O�a �Z��Y�Xno�W�Z 0 encode_char  �Y �Vp�V p  �U�U 0 	this_char  �X  n �T�S�R�Q�P�T 0 	this_char  �S 0 	ascii_num 	ASCII_num�R 0 hex_list  �Q 0 x  �P 0 y  o �O	"%(+.24�N�M[�L
�O .sysoctonshor       TEXT�N 
�M 
cobj
�L 
TEXT�W L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a &ascr  ��ޭ