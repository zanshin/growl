FasdUAS 1.101.10   ��   ��    k             l      �� ��   		
* This script requires Growl. You can download Growl here: http://growl.info
* Once you have installed Growl, you can save this script as an application,
* remember to check the "Stays Open" option before saving.
* Then double-click the new application and enjoy.
*
* Comments and ideas to arminb@mac.com
* Sorry, If I made the code looks dirty, This is the
* first time I learn and write applescript
* Modified by Piti Ongmongkolkul May 5
* -- fix aim where some user does not have display picture and caused the program not to show notification
* -- display picture is now available for jabber --> you need to add it manually via address book
* just right click the name and get info
* -- fix(again) bug where the program sends every username to this growl.(Reported by benjamindaines)
* -- when aim buddy went away. It displays name(away) followed by status message 
* Modified by Piti Ongmongkolku May 4
* -- as pointed out by ben on growl forum
* this program cause ichat to reopen
* -- case the program tell iChat while it's closed caused it to reopen 
* -- fix: add semaphores
* -- also add semaphores for growl
* Modified by Piti Ongmongkolkul May 3 05
* -- correct behavior for aim account
* --display account name
* --display picture weeeeee
* -- huge code overhaul
* Modified by Piti Ongmongkolkul May 2 05
* -- put try and on error on every module
* 	to catch "connection error" when shutdown(hopefully)(I hate racing problem :( )
* -- fix show-everybody-bug when the program is
* 	launched after ichat or when the user log off and log in again
* 	by adding a variable userWasOnline variable and isJustOnline() module which will 
* 	touch userWasOnline variable and return true iff user was not online and just become online
* Modified by Piti Ongmongkolkul May 1 05 again
* --ignore work around method. Who cares when someone goes offline
* --fix bug when the user log off and log on again and send
* 	unknown status to growl.
* Modified by Piti Ongmongkolkul May 1 05
* --change theName from name to status id
* 	to account for msn messenger display name
* 	(use jabber msn transport)
* --workaround  (blank) went offline bug
* 	this happened because when the user is offline
* 	the status is set to blank. work around was done
* 	by using name instead of status in the case where
* 	the user went offline 
       	  l     ������  ��   	  
  
 j     �� �� 0 idletime idleTime  m     ����       l          j    �� �� 0 waitidletime waitIdleTime  m    ���� 	  ) #wait until the list is fully loaded         j    �� �� &0 jabberservicename jabberServiceName  m        Jabber         j   	 �� ��  0 aimservicename aimServiceName  m   	 
   	 AIM         j    �� �� "0 aimserviceindex aimServiceIndex  m    ����       j    �� �� (0 jabberserviceindex jabberServiceIndex  m    ����      !   l       " # " j    �� $�� 0 	delaytime 	delayTime $ J     % %  & ' & m    ����   '  (�� ( m    ����  ��   # 2 ,delay when found that  user is not available    !  ) * ) j    �� +�� 0 lastlist lastList + J     , ,  - . - J    ����   .  /�� / J    ����  ��   *  0 1 0 j     %�� 2�� 0 	wasonline 	wasOnline 2 J     $ 3 3  4 5 4 m     !��
�� boovfals 5  6�� 6 m   ! "��
�� boovfals��   1  7 8 7 j   & (�� 9�� &0 alreadyregistered alreadyRegistered 9 m   & '��
�� boovfals 8  : ; : j   ) /�� <�� 0 newline   < I  ) .�� =��
�� .sysontocTEXT       shor = m   ) *���� 
��   ;  > ? > l     ������  ��   ?  @ A @ i   0 3 B C B I     ������
�� .aevtoappnull  �   � ****��  ��   C Q     : D E F D k    , G G  H I H Z    % J K���� J n    L M L I    ��������  0 isichatrunning isIChatRunning��  ��   M  f     K O    ! N O N k      P P  Q R Q l    �� S��   S  activate    R  T U T r     V W V n    X Y X I    �������� 0 getlist getList��  ��   Y  f     W o      ���� 0 lastlist lastList U  Z [ Z l    �� \��   \  my jabberJustLogIn()    [  ]�� ] n     ^ _ ^ I     �������� 0 aimjustlogin aimJustLogin��  ��   _  f    ��   O m     ` `�null     ߀��  d	iChat.app����    �!@�����  x@@   )       ��(� l����@efez!  alis    H  Macintosh HD               ����H+    d	iChat.app                                                        k����s        ����  	                Applications    ���/      ��ϳ      d  #Macintosh HD:Applications:iChat.app    	 i C h a t . a p p    M a c i n t o s h   H D  Applications/iChat.app  / ��  ��  ��   I  a�� a L   & , b b o   & +���� 0 waitidletime waitIdleTime��   E R      ������
�� .ascrerr ****      � ****��  ��   F L   4 : c c o   4 9���� 0 waitidletime waitIdleTime A  d e d l     ������  ��   e  f g f i   4 7 h i h I     ������
�� .miscidlenmbr    ��� null��  ��   i Q     n j k l j k    S m m  n o n l    �� p��   p  register to growl    o  q r q Z    F s t�� u s H    	 v v o    ���� &0 alreadyregistered alreadyRegistered t Z    B w x�� y w n    z { z I    ��������  0 isgrowlrunning isGrowlRunning��  ��   {  f     x k    = | |  } ~ } O    5  �  k    4 � �  � � � r     � � � m     � �  iChat    � o      ���� 0 appname appName �  � � � l    �� ���   � O Iset defaultNotifs to {"iChat Aim Status"}
				set notifs to defaultNotifs    �  � � � r    " � � � J      � �  � � � m     � �  iChat Aim Status    �  ��� � m     � �  iChat Jabber Status   ��   � o      ���� 0 defaultnotifs defaultNotifs �  � � � r   # & � � � o   # $���� 0 defaultnotifs defaultNotifs � o      ���� 
0 notifs   �  ��� � I  ' 4���� �
�� .registernull��� ��� null��   � �� � �
�� 
appl � m   ) * � �  iChat    � �� � �
�� 
anot � o   + ,���� 
0 notifs   � �� � �
�� 
dnot � o   - .���� 
0 notifs   � �� ���
�� 
iapp � m   / 0 � �  iChat   ��  ��   � m     � �2null     ߀�� 
}9GrowlHelperApp.app!@�����@  �x@X   )       ��(� l����peGRRR   alis    �  Macintosh HD               ����H+   
}9GrowlHelperApp.app                                              
}[�p{H        ����  	                	Resources     ���/      �p��     
}9 
}5 
}4 ��    YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��   ~  ��� � r   6 = � � � m   6 7��
�� boovtrue � o      ���� &0 alreadyregistered alreadyRegistered��  ��   y L   @ B����  ��   u l   E E�� ���   �  
do nothing    r  � � � l   G G�� ���   �  do Aim    �  � � � n  G L � � � I   H L�������� 0 mainaim mainAim��  ��   �  f   G H �  � � � l   M M�� ���   �  	do Jabber    �  � � � l   M M�� ���   �  my mainJabber()    �  � � � l   M M�� ���   �  check jabber    �  ��� � L   M S � � o   M R���� 0 idletime idleTime��   k R      ������
�� .ascrerr ****      � ****��  ��   l k   [ n � �  � � � r   [ g � � � J   [ a � �  � � � J   [ ]����   �  ��� � J   ] _����  ��   � o      ���� 0 lastlist lastList �  ��� � L   h n � � o   h m���� 0 idletime idleTime��   g  � � � l     ������  ��   �  � � � i   8 ; � � � I      �������� 0 mainaim mainAim��  ��   � k     � � �  � � � l      �� ���   �  	check aim    �  ��� � Q     � � � � � Z    � � ��� � � n    � � � I    ��������  0 isichatrunning isIChatRunning��  ��   �  f     � k    � � �  � � � r     � � � n    � � � I    �������� 0 aimjustlogin aimJustLogin��  ��   �  f     � o      ���� *0 aimaccountjustlogin aimAccountJustLogin �  � � � r     � � � n    � � � I    �������� *0 getavailableaimlist getAvailableAimList��  ��   �  f     � o      ����  0 currentaimlist currentAimList �  � � � r    " � � � n     � � � I     ��~�}�  0 getlastaimlist getLastAimList�~  �}   �  f     � o      �|�| 0 lastaimlist lastAimList �  � � � l  # #�{�z�{  �z   �  � � � l   # #�y ��y   �  send aim    �  � � � Z   # � � ��x � � ?   # / � � � n  # - � � � I   $ -�w ��v�w 0 getdelaytime getDelayTime �  ��u � o   $ )�t�t "0 aimserviceindex aimServiceIndex�u  �v   �  f   # $ � m   - .�s�s   � n  2 < � � � I   3 <�r ��q�r &0 decreasedelaytime decreaseDelayTime �  ��p � o   3 8�o�o "0 aimserviceindex aimServiceIndex�p  �q   �  f   2 3�x   � Z   ? � � �n � o   ? @�m�m *0 aimaccountjustlogin aimAccountJustLogin  l   C C�l�l    
do nothing   �n   k   G �  X   G m�k Z   W h	�j�i H   W [

 E  W Z o   W X�h�h 0 lastaimlist lastAimList o   X Y�g�g 0 x  	 n  ^ d I   _ d�f�e�f 00 aimnotifywithaccountid aimNotifyWithAccountID �d o   _ `�c�c 0 x  �d  �e    f   ^ _�j  �i  �k 0 x   o   J K�b�b  0 currentaimlist currentAimList  l  n n�a�`�a  �`   �_ X   n ��^ Z   ~ ��]�\ H   ~ � E  ~ � o   ~ �[�[  0 currentaimlist currentAimList o    ��Z�Z 0 x   n  � � I   � ��Y�X�Y 00 aimnotifywithaccountid aimNotifyWithAccountID �W o   � ��V�V 0 x  �W  �X    f   � ��]  �\  �^ 0 x   o   q r�U�U 0 lastaimlist lastAimList�_   �   l   � ��T!�T  ! J Dif modified make sure it conforms with 
				aimIndex and jabberIndex     "�S" r   � �#$# o   � ��R�R  0 currentaimlist currentAimList$ n      %&% 4   � ��Q'
�Q 
cobj' o   � ��P�P "0 aimserviceindex aimServiceIndex& o   � ��O�O 0 lastlist lastList�S  ��   � r   � �()( J   � �** +,+ J   � ��N�N  , -�M- J   � ��L�L  �M  ) o      �K�K 0 lastlist lastList � R      �J�I�H
�J .ascrerr ****      � ****�I  �H   � k   � �.. /0/ r   � �121 J   � ��G�G  2 n      343 4   � ��F5
�F 
cobj5 o   � ��E�E "0 aimserviceindex aimServiceIndex4 o   � ��D�D 0 lastlist lastList0 6�C6 L   � ��B�B  �C  ��   � 787 l      �A9�A  9 ( "check jabber and send notification   8 :;: i   < ?<=< I      �@�?�>�@ 0 
mainjabber 
mainJabber�?  �>  = Q     �>?@> Z    �AB�=CA n   DED I    �<�;�:�<  0 isichatrunning isIChatRunning�;  �:  E  f    B k    �FF GHG r    IJI n   KLK I    �9�8�7�9 "0 jabberjustlogin jabberJustLogIn�8  �7  L  f    J o      �6�6 00 jabberaccountjustlogin jabberAccountJustLoginH MNM r    OPO n   QRQ I    �5�4�3�5 00 getavailablejabberlist getAvailableJabberList�4  �3  R  f    P o      �2�2 &0 currentjabberlist currentJabberListN STS r    "UVU n    WXW I     �1�0�/�1 &0 getlastjabberlist getLastJabberList�0  �/  X  f    V o      �.�.  0 lastjabberlist lastJabberListT YZY l   # #�-[�-  [  send all notification   Z \]\ l   # #�,^�,  ^  send jabber   ] _`_ Z   # �ab�+ca ?   # /ded n  # -fgf I   $ -�*h�)�* 0 getdelaytime getDelayTimeh i�(i o   $ )�'�' (0 jabberserviceindex jabberServiceIndex�(  �)  g  f   # $e m   - .�&�&  b n  2 <jkj I   3 <�%l�$�% &0 decreasedelaytime decreaseDelayTimel m�#m o   3 8�"�" (0 jabberserviceindex jabberServiceIndex�#  �$  k  f   2 3�+  c Z   ? �no�!pn o   ? @� �  00 jabberaccountjustlogin jabberAccountJustLogino l   C C�q�  q  
do nothing   �!  p k   G �rr sts X   G mu�vu Z   W hwx��w H   W [yy E  W Zz{z o   W X��  0 lastjabberlist lastJabberList{ o   X Y�� 0 x  x n  ^ d|}| I   _ d�~�� 60 jabbernotifywithaccountid jabberNotifyWithAccountID~ � o   _ `�� 0 x  �  �  }  f   ^ _�  �  � 0 x  v o   J K�� &0 currentjabberlist currentJabberListt ��� l  n n���  �  � ��� X   n ����� Z   ~ ������ H   ~ ��� E  ~ ���� o   ~ �� &0 currentjabberlist currentJabberList� o    ��� 0 x  � n  � ���� I   � ����� 60 jabbernotifywithaccountid jabberNotifyWithAccountID� ��
� o   � ��	�	 0 x  �
  �  �  f   � ��  �  � 0 x  � o   q r��  0 lastjabberlist lastJabberList�  ` ��� l   � ����  � J Dif modified make sure it conforms with 
				aimIndex and jabberIndex   � ��� r   � ���� o   � ��� &0 currentjabberlist currentJabberList� n      ��� 4   � ���
� 
cobj� o   � ��� (0 jabberserviceindex jabberServiceIndex� o   � ��� 0 lastlist lastList�  �=  C r   � ���� J   � ��� ��� J   � ���  � �� � J   � �����  �   � o      ���� 0 lastlist lastList? R      ������
�� .ascrerr ****      � ****��  ��  @ L   � �����  ; ��� i   @ C��� I      ������� 00 aimnotifywithaccountid aimNotifyWithAccountID� ���� o      ���� 0 theid theID��  ��  � Q    ����� k   ��� ��� l    �����  � 0 *Make sure these conform with registeration   � ��� r    ��� m    ��  iChat   � o      ���� 0 appname appName� ��� r    
��� m    ��  iChat Aim Status   � o      ���� $0 notificationname notificationName� ��� l   ������  ��  � ���� Z   �������� n   ��� I    ��������  0 isgrowlrunning isGrowlRunning��  ��  �  f    � Z   �������� n   ��� I    ��������  0 isichatrunning isIChatRunning��  ��  �  f    � O   ���� Z   �������� l   @���� I   @�����
�� .coredoexbool       obj � l   <���� 6  <��� n    3��� 4  0 3���
�� 
pres� m   1 2���� � l   0���� 6  0��� 4   #���
�� 
icsv� m   ! "���� � =  $ /��� 1   % '��
�� 
ID  � o   ( .����  0 aimservicename aimServiceName��  � =  4 ;��� 1   5 7��
�� 
ID  � o   8 :���� 0 theid theID��  ��  ��  � k   C��� ��� r   C d��� n   C b��� 1   ` b��
�� 
stat� l  C `���� 6 C `��� n   C W��� 4  T W���
�� 
pres� m   U V���� � l  C T���� 6 C T��� 4  C G���
�� 
icsv� m   E F���� � =  H S��� 1   I K��
�� 
ID  � o   L R����  0 aimservicename aimServiceName��  � =  X _��� 1   Y [��
�� 
ID  � o   \ ^���� 0 theid theID��  � o      ���� 0 
thisstatus 
thisStatus� ��� w   e_� `� Z   g_����� =  g j��� o   g h���� 0 
thisstatus 
thisStatus� m   h i��
�� pstaoffl� k   m ��� ��� r   m ���� n   m ���� 1   � ���
�� 
pnam� l  m ����� 6 m ���� n   m ���� 4  ~ ����
�� 
pres� m    ����� � l  m ~���� 6 m ~� � 4  m q��
�� 
icsv m   o p����   =  r } 1   s u��
�� 
ID   o   v |����  0 aimservicename aimServiceName��  � =  � � 1   � ���
�� 
ID   o   � ����� 0 theid theID��  � o      ���� 0 thename theName� �� r   � � n  � �	
	 I   � ������� "0 stringforstatus stringForStatus �� o   � ����� 0 
thisstatus 
thisStatus��  ��  
  f   � � o      ���� 0 	thestatus 	theStatus��  �  l  � ��� =  � � o   � ����� 0 
thisstatus 
thisStatus m   � ���
�� pstaaway��    k   � �  r   � � n   � � 1   � ���
�� 
pnam l  � ��� 6 � � n   � � 4  � ��� 
�� 
pres  m   � �����  l  � �!��! 6 � �"#" 4  � ���$
�� 
icsv$ m   � ����� # =  � �%&% 1   � ���
�� 
ID  & o   � �����  0 aimservicename aimServiceName��   =  � �'(' 1   � ���
�� 
ID  ( o   � ����� 0 theid theID��   o      ���� 0 thename theName )��) r   � �*+* l  � �,��, b   � �-.- b   � �/0/ n  � �121 I   � ���3���� "0 stringforstatus stringForStatus3 4��4 o   � ����� 0 
thisstatus 
thisStatus��  ��  2  f   � �0 o   � ����� 0 newline  . l  � �5��5 n   � �676 1   � ���
�� 
smsg7 l  � �8��8 6 � �9:9 n   � �;<; 4  � ���=
�� 
pres= m   � ����� < l  � �>��> 6 � �?@? 4  � ���A
�� 
icsvA m   � ����� @ =  � �BCB 1   � ���
�� 
ID  C o   � �����  0 aimservicename aimServiceName��  : =  � �DED 1   � ���
�� 
ID  E o   � ����� 0 theid theID��  ��  ��  + o      ���� 0 	thestatus 	theStatus��   FGF l  � �H��H =  � �IJI o   � ����� 0 
thisstatus 
thisStatusJ m   � ���
�� pstaaval��  G KLK k   �%MM NON r   �PQP n   �RSR 1  ��
�� 
pnamS l  �T��T 6 �UVU n   �WXW 4 ��Y
�� 
presY m  ���� X l  �Z��Z 6 �[\[ 4  � ���]
�� 
icsv] m   � ����� \ =  ^_^ 1  ��
�� 
ID  _ o  
����  0 aimservicename aimServiceName��  V = `a` 1  ��
�� 
ID  a o  ���� 0 theid theID��  Q o      ���� 0 thename theNameO b��b r  %cdc n #efe I  #��g���� "0 stringforstatus stringForStatusg h��h o  ���� 0 
thisstatus 
thisStatus��  ��  f  f  d o      �� 0 	thestatus 	theStatus��  L iji l (-k�~k = (-lml o  ()�}�} 0 
thisstatus 
thisStatusm m  ),�|
�| pstaidle�~  j n�{n k  0Zoo pqp r  0Qrsr n  0Otut 1  MO�z
�z 
pnamu l 0Mv�yv 60Mwxw n  0Dyzy 4 AD�x{
�x 
pres{ m  BC�w�w z l 0A|�v| 60A}~} 4 04�u
�u 
icsv m  23�t�t ~ = 5@��� 1  68�s
�s 
ID  � o  9?�r�r  0 aimservicename aimServiceName�v  x = EL��� 1  FH�q
�q 
ID  � o  IK�p�p 0 theid theID�y  s o      �o�o 0 thename theNameq ��n� r  RZ��� n RX��� I  SX�m��l�m "0 stringforstatus stringForStatus� ��k� o  ST�j�j 0 
thisstatus 
thisStatus�k  �l  �  f  RS� o      �i�i 0 	thestatus 	theStatus�n  �{  � L  ]_�h�h  � ��� l  ``�g��g  �  try using picture   � ��f� Q  `����� Z  c����e�� n ch��� I  dh�d�c�b�d  0 isichatrunning isIChatRunning�c  �b  �  f  cd� k  k��� ��� r  k���� l k���a� n  k���� 1  ���`
�` 
imaA� l k���_� 6k���� n  k��� 4 |�^�
�^ 
pres� m  }~�]�] � l k|��\� 6k|��� 4 ko�[�
�[ 
icsv� m  mn�Z�Z � = p{��� 1  qs�Y
�Y 
ID  � o  tz�X�X  0 aimservicename aimServiceName�\  � = ����� 1  ���W
�W 
ID  � o  ���V�V 0 theid theID�_  �a  � l     ��U� o      �T�T 0 
displaypic 
displayPic�U  � ��S� O  ����� I ���R�Q�
�R .notifygrnull��� ��� null�Q  � �P��
�P 
name� o  ���O�O $0 notificationname notificationName� �N��
�N 
titl� o  ���M�M 0 thename theName� �L��
�L 
appl� o  ���K�K 0 appname appName� �J��
�J 
desc� o  ���I�I 0 	thestatus 	theStatus� �H��G
�H 
imag� l ����F� o  ���E�E 0 
displaypic 
displayPic�F  �G  � m  �� ��S  �e  � L  ���D�D  � R      �C�B�A
�C .ascrerr ****      � ****�B  �A  � O  ����� I ���@�?�
�@ .notifygrnull��� ��� null�?  � �>��
�> 
name� o  ���=�= $0 notificationname notificationName� �<��
�< 
titl� o  ���;�; 0 thename theName� �:��
�: 
appl� o  ���9�9 0 appname appName� �8��7
�8 
desc� o  ���6�6 0 	thestatus 	theStatus�7  � m  �� ��f  ��  ��  � m     `��  ��  ��  ��  ��  � R      �5�4�3
�5 .ascrerr ****      � ****�4  �3  � L  ���2�2  � ��� l     �1�0�1  �0  � ��� i   D G��� I      �/��.�/ 60 jabbernotifywithaccountid jabberNotifyWithAccountID� ��-� o      �,�, 0 theid theID�-  �.  � Q    S���� Z   I���+�*� n   ��� I    �)�(�'�)  0 isichatrunning isIChatRunning�(  �'  �  f    � Z   E���&�%� n   ��� I    �$�#�"�$  0 isgrowlrunning isGrowlRunning�#  �"  �  f    � k   A�� ��� r    ��� m    ��  iChat   � o      �!�! 0 appname appName� ��� r    ��� m    ��  iChat Jabber Status   � o      � �  $0 notificationname notificationName� ��� r     ��� J    �� ��� o    �� $0 notificationname notificationName�  � o      �� 
0 notifs  � ��� O   !A��� Z   %@����� l  % F��� I  % F���
� .coredoexbool       obj � l  % B��� 6 % B��� n   % 9��� 4  6 9��
� 
pres� m   7 8�� � l  % 6��� 6 % 6��� 4  % )��
� 
icsv� m   ' (�� � =  * 5��� 1   + -�
� 
ID  � o   . 4�� &0 jabberservicename jabberServiceName�  � =  : A��� 1   ; =�
� 
ID  � o   > @�� 0 theid theID�  �  �  � k   I<��    r   I j n   I h 1   f h�
� 
stat l  I f� 6 I f n   I ]	
	 4  Z ]�

�
 
pres m   [ \�	�	 
 l  I Z� 6 I Z 4  I M�
� 
icsv m   K L��  =  N Y 1   O Q�
� 
ID   o   R X�� &0 jabberservicename jabberServiceName�   =  ^ e 1   _ a�
� 
ID   o   b d�� 0 theid theID�   o      �� 0 
thisstatus 
thisStatus  l  k k� ���   ��    w   k � ` Z   m � =  m p o   m n���� 0 
thisstatus 
thisStatus m   n o��
�� pstaoffl k   s u  !  l   s s��"��  " + %set theName to name of the theAccount   ! #��# L   s u����  ��   $%$ G   x �&'& G   x �()( l  x {*��* =  x {+,+ o   x y���� 0 
thisstatus 
thisStatus, m   y z��
�� pstaaway��  ) l  ~ �-��- =  ~ �./. o   ~ ���� 0 
thisstatus 
thisStatus/ m    ���
�� pstaaval��  ' l  � �0��0 =  � �121 o   � ����� 0 
thisstatus 
thisStatus2 m   � ���
�� pstaidle��  % 3��3 r   � �454 n   � �676 1   � ���
�� 
smsg7 l  � �8��8 6 � �9:9 n   � �;<; 4  � ���=
�� 
pres= m   � ����� < l  � �>��> 6 � �?@? 4  � ���A
�� 
icsvA m   � ����� @ =  � �BCB 1   � ���
�� 
ID  C o   � ����� &0 jabberservicename jabberServiceName��  : =  � �DED 1   � ���
�� 
ID  E o   � ����� 0 theid theID��  5 o      ���� 0 thename theName��   L   � �����   FGF r   � �HIH n  � �JKJ I   � ���L���� "0 stringforstatus stringForStatusL M��M o   � ����� 0 
thisstatus 
thisStatus��  ��  K  f   � �I o      ���� 0 	thestatus 	theStatusG NON l   � ���P��  P  deprecrated   O QRQ l   � ���S��  S + %set theService to first word of theID   R TUT l   � ���V��  V  try using picture   U W��W Q   �<XYZX Z   �[\��][ n  � �^_^ I   � ���������  0 isichatrunning isIChatRunning��  ��  _  f   � �\ k   �`` aba r   � �cdc l  � �e��e n   � �fgf 1   � ���
�� 
imaAg l  � �h��h 6 � �iji n   � �klk 4  � ���m
�� 
presm m   � ����� l l  � �n��n 6 � �opo 4  � ���q
�� 
icsvq m   � ����� p =  � �rsr 1   � ���
�� 
ID  s o   � ����� &0 jabberservicename jabberServiceName��  j =  � �tut 1   � ���
�� 
ID  u o   � ����� 0 theid theID��  ��  d l     v��v o      ���� 0 
displaypic 
displayPic��  b w��w O   �xyx I  �����z
�� .notifygrnull��� ��� null��  z ��{|
�� 
name{ o   � ����� $0 notificationname notificationName| ��}~
�� 
titl} o   � ����� 0 thename theName~ ���
�� 
appl o  ���� 0 appname appName� ����
�� 
desc� o  ���� 0 	thestatus 	theStatus� �����
�� 
imag� l 	
���� o  	
���� 0 
displaypic 
displayPic��  ��  y m   � � ���  ��  ] L  ����  Y R      ������
�� .ascrerr ****      � ****��  ��  Z O  <��� I $;�����
�� .notifygrnull��� ��� null��  � ����
�� 
name� o  ()���� $0 notificationname notificationName� ����
�� 
titl� o  ,-���� 0 thename theName� ����
�� 
appl� o  01���� 0 appname appName� �����
�� 
desc� o  45���� 0 	thestatus 	theStatus��  � m  ! ���  �  �  � m   ! " `�  �&  �%  �+  �*  � R      ������
�� .ascrerr ****      � ****��  ��  � L  QS����  � ��� l     ������  ��  � ��� i   H K��� I      ������� "0 stringforstatus stringForStatus� ���� o      ���� 0 s  ��  ��  � Q     =���� w    3� `� Z    3����� =   ��� o    ���� 0 s  � m    ��
�� pstaaway� L    �� m    ��  is away   � ��� =   ��� o    ���� 0 s  � m    ��
�� pstaoffl� ��� L    �� m    ��  went offline   � ��� =   ��� o    ���� 0 s  � m    ��
�� pstaaval� ��� L   ! #�� m   ! "��  is available   � ��� =  & )��� o   & '���� 0 s  � m   ' (��
�� pstaidle� ���� L   , .�� m   , -��  	is idling   ��  � L   1 3�� m   1 2��  status is unknown   � R      ������
�� .ascrerr ****      � ****��  ��  � L   ; =�� m   ; <��      � ��� l     ������  ��  � ��� i   L O��� I      ��������  0 isichatrunning isIChatRunning��  ��  � Q     ���� O    ��� L    �� I   �����
�� .coredoexbool       obj � 4    ���
�� 
prcs� m   	 
��  iChat   ��  � m    ���null     ߀��  "System Events.app�!@<������ngfox@(   )       ��(� l����esevs   alis    �  Macintosh HD               ����H+    "System Events.app                                                `����y        ����  	                CoreServices    ���/      ��ʹ      "      :Macintosh HD:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � R      ������
�� .ascrerr ****      � ****��  ��  � L    �� m    ��
�� boovfals� ��� i   P S��� I      ��������  0 isgrowlrunning isGrowlRunning��  ��  � Q     ���� O    ��� L    �� I   �����
�� .coredoexbool       obj � 4    ���
�� 
prcs� m   	 
��  GrowlHelperApp   ��  � m    �� R      �����
�� .ascrerr ****      � ****��  �  � L    �� m    �~
�~ boovfals� ��� i   T W��� I      �}�|�{�} 0 getlist getList�|  �{  � l    ��� L     �� J     �� ��� n    ��� I    �z�y�x�z 00 getavailablejabberlist getAvailableJabberList�y  �x  �  f     � ��w� n   
��� I    
�v�u�t�v *0 getavailableaimlist getAvailableAimList�u  �t  �  f    �w  � ( "make sure this conforms to indices   � ��� i   X [��� I      �s�r�q�s &0 getlastjabberlist getLastJabberList�r  �q  � L     �� n     ��� 4    �p�
�p 
cobj� o    �o�o (0 jabberserviceindex jabberServiceIndex� o     �n�n 0 lastlist lastList� ��� i   \ _��� I      �m�l�k�m  0 getlastaimlist getLastAimList�l  �k  � L     �� n     ��� 4    �j�
�j 
cobj� o    �i�i "0 aimserviceindex aimServiceIndex� o     �h�h 0 lastlist lastList� ��� l     �g�f�g  �f  � ��� i   ` c   I      �e�d�e $0 getavailablelist getAvailableList �c o      �b�b 0 servicename serviceName�c  �d   Q     = Z    2�a	 n   

 I    �`�_�^�`  0 isichatrunning isIChatRunning�_  �^    f     O    , L    + l   *�] 6  * n      1     �\
�\ 
ID   n     2    �[
�[ 
pres l   �Z 6   4   �Y
�Y 
icsv m    �X�X  =    1    �W
�W 
ID   o    �V�V 0 servicename serviceName�Z   =  ! ( 1   " $�U
�U 
stat m   % '�T
�T pstaaval�]   m     `�a  	 L   / 2 J   / 1�S�S   R      �R�Q�P
�R .ascrerr ****      � ****�Q  �P   L   : = J   : <�O�O  �  !  i   d g"#" I      �N�M�L�N 00 getavailablejabberlist getAvailableJabberList�M  �L  # k     $$ %&% L     '' J     �K�K  & (�J( l    �I)�I  ) 3 -return my getAvailableList(jabberServiceName)   �J  ! *+* i   h k,-, I      �H�G�F�H *0 getavailableaimlist getAvailableAimList�G  �F  - L     .. n    
/0/ I    
�E1�D�E $0 getavailablelist getAvailableList1 2�C2 o    �B�B  0 aimservicename aimServiceName�C  �D  0  f     + 343 l     �A�@�A  �@  4 565 i   l o787 I      �?�>�=�? "0 jabberjustlogin jabberJustLogIn�>  �=  8 L     99 n    :;: I    �<<�;�< 0 isjustlogin isJustLogIn< =>= o    �:�: &0 jabberservicename jabberServiceName> ?�9? o    �8�8 (0 jabberserviceindex jabberServiceIndex�9  �;  ;  f     6 @A@ i   p sBCB I      �7�6�5�7 0 aimjustlogin aimJustLogin�6  �5  C L     DD n    EFE I    �4G�3�4 0 isjustlogin isJustLogInG HIH o    �2�2  0 aimservicename aimServiceNameI J�1J o    �0�0 "0 aimserviceindex aimServiceIndex�1  �3  F  f     A KLK l      �/M�/  M 0 *
	return delayTime for given serviceIndex
   L NON i   t wPQP I      �.R�-�. 0 getdelaytime getDelayTimeR S�,S o      �+�+ 0 serviceindex serviceIndex�,  �-  Q L     
TT n     	UVU 4    �*W
�* 
cobjW o    �)�) 0 serviceindex serviceIndexV o     �(�( 0 	delaytime 	delayTimeO XYX l      �'Z�'  Z > 8
	decrease dealyTime for given serviceIndex by idleTime
   Y [\[ i   x {]^] I      �&_�%�& &0 decreasedelaytime decreaseDelayTime_ `�$` o      �#�# 0 serviceindex serviceIndex�$  �%  ^ k     3aa bcb r     ded l    f�"f \     ghg l    i�!i n     jkj 4    � l
�  
cobjl o    �� 0 serviceindex serviceIndexk o     �� 0 	delaytime 	delayTime�!  h o    �� 0 idletime idleTime�"  e n      mnm 4    �o
� 
cobjo o    �� 0 serviceindex serviceIndexn o    �� 0 	delaytime 	delayTimec p�p Z    3qr��q A    "sts n     uvu 4     �w
� 
cobjw o    �� 0 serviceindex serviceIndexv o    �� 0 	delaytime 	delayTimet m     !��  r r   % /xyx m   % &��  y n      z{z 4   + .�|
� 
cobj| o   , -�� 0 serviceindex serviceIndex{ o   & +�� 0 	delaytime 	delayTime�  �  �  \ }~} l      ��   � �
	touch wasOnline and return true if not userwasonline and user is now online
	also touch delay if the user is not online then set delay to waitDelaytime
	otherwise don't touch it
   ~ ��� i   | ��� I      ���� 0 isjustlogin isJustLogIn� ��� o      �
�
 0 servicename serviceName� ��	� o      �� 0 serviceindex serviceIndex�	  �  � Q     ����� Z    ������ n   ��� I    ����  0 isichatrunning isIChatRunning�  �  �  f    � O    ���� w    �� `� k    ��� ��� r    "��� l    ��� n     ��� 1     �
� 
stat� l   ��� 6  ��� 4   � �
�  
icsv� m    ���� � =   ��� 1    ��
�� 
ID  � o    ���� 0 servicename serviceName�  �  � o      ���� 0 currentstatus currentStatus� ���� Z   # ������� l  # ,���� n   # ,��� 4   ( +���
�� 
cobj� o   ) *���� 0 serviceindex serviceIndex� o   # (���� 0 	wasonline 	wasOnline��  � k   / U�� ��� Z   / R������ =  / 2��� o   / 0���� 0 currentstatus currentStatus� m   0 1��
�� sstaconn� l   5 5�����  �  
do nothing   ��  � k   9 R�� ��� r   9 C��� m   9 :��
�� boovfals� l     ���� n      ��� 4   ? B���
�� 
cobj� o   @ A���� 0 serviceindex serviceIndex� o   : ?���� 0 	wasonline 	wasOnline��  � ���� r   D R��� o   D I���� 0 waitidletime waitIdleTime� n      ��� 4   N Q���
�� 
cobj� o   O P���� 0 serviceindex serviceIndex� o   I N���� 0 	delaytime 	delayTime��  � ���� L   S U�� m   S T��
�� boovfals��  ��  � Z   X ������� =  X [��� o   X Y���� 0 currentstatus currentStatus� m   Y Z��
�� sstaconn� k   ^ z�� ��� r   ^ h��� m   ^ _��
�� boovtrue� l     ���� n      ��� 4   d g���
�� 
cobj� o   e f���� 0 serviceindex serviceIndex� o   _ d���� 0 	wasonline 	wasOnline��  � ��� r   i w��� o   i n���� 0 waitidletime waitIdleTime� n      ��� 4   s v���
�� 
cobj� o   t u���� 0 serviceindex serviceIndex� o   n s���� 0 	delaytime 	delayTime� ���� L   x z�� m   x y��
�� boovtrue��  ��  � k   } ��� ��� r   } ���� m   } ~��
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   ~ ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  ��  � m     `�  � k   � ��� ��� r   � ���� m   � ���
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   � ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  � R      ������
�� .ascrerr ****      � ****��  ��  � k   � ��� ��� r   � ���� m   � ���
�� boovfals� l     ���� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 serviceindex serviceIndex� o   � ����� 0 	wasonline 	wasOnline��  � ���� L   � ��� m   � ���
�� boovfals��  �       !�������  ����������� 	
��  � ���������������������������������������������������������������� 0 idletime idleTime�� 0 waitidletime waitIdleTime�� &0 jabberservicename jabberServiceName��  0 aimservicename aimServiceName�� "0 aimserviceindex aimServiceIndex�� (0 jabberserviceindex jabberServiceIndex�� 0 	delaytime 	delayTime�� 0 lastlist lastList�� 0 	wasonline 	wasOnline�� &0 alreadyregistered alreadyRegistered�� 0 newline  
�� .aevtoappnull  �   � ****
�� .miscidlenmbr    ��� null�� 0 mainaim mainAim�� 0 
mainjabber 
mainJabber�� 00 aimnotifywithaccountid aimNotifyWithAccountID�� 60 jabbernotifywithaccountid jabberNotifyWithAccountID�� "0 stringforstatus stringForStatus��  0 isichatrunning isIChatRunning��  0 isgrowlrunning isGrowlRunning�� 0 getlist getList�� &0 getlastjabberlist getLastJabberList��  0 getlastaimlist getLastAimList�� $0 getavailablelist getAvailableList�� 00 getavailablejabberlist getAvailableJabberList�� *0 getavailableaimlist getAvailableAimList�� "0 jabberjustlogin jabberJustLogIn�� 0 aimjustlogin aimJustLogin�� 0 getdelaytime getDelayTime�� &0 decreasedelaytime decreaseDelayTime�� 0 isjustlogin isJustLogIn�� �� 	�� �� � ����   ������  ��  � ����    ������  ��   ������  ��  � ����   ����
�� boovfals
�� boovfals
�� boovfals�  
   � �� C������
�� .aevtoappnull  �   � ****��  ��     �� `����������  0 isichatrunning isIChatRunning�� 0 getlist getList�� 0 aimjustlogin aimJustLogin��  ��  �� ; .)j+   � )j+ Ec  O)j+ UY hOb  W X  b    �� i������
�� .miscidlenmbr    ��� null��  ��   �������� 0 appname appName�� 0 defaultnotifs defaultNotifs�� 
0 notifs   � � � � ��~ ��}�|�{ ��z�y�x�w�v�  0 isgrowlrunning isGrowlRunning
�~ 
appl
�} 
anot
�| 
dnot
�{ 
iapp�z 
�y .registernull��� ��� null�x 0 mainaim mainAim�w  �v  �� o Ub  	 ;)j+   .� �E�O��lvE�O�E�O*������� UOeEc  	Y hY hO)j+ Ob   W X  jvjvlvEc  Ob    �u ��t�s�r�u 0 mainaim mainAim�t  �s   �q�p�o�n�q *0 aimaccountjustlogin aimAccountJustLogin�p  0 currentaimlist currentAimList�o 0 lastaimlist lastAimList�n 0 x   �m�l�k�j�i�h�g�f�e�d�c�b�m  0 isichatrunning isIChatRunning�l 0 aimjustlogin aimJustLogin�k *0 getavailableaimlist getAvailableAimList�j  0 getlastaimlist getLastAimList�i 0 getdelaytime getDelayTime�h &0 decreasedelaytime decreaseDelayTime
�g 
kocl
�f 
cobj
�e .corecnte****       ****�d 00 aimnotifywithaccountid aimNotifyWithAccountID�c  �b  �r � �)j+   �)j+ E�O)j+ E�O)j+ E�O)b  k+ j )b  k+ Y W� hY O %�[��l kh �� )�k+ 	Y h[OY��O %�[��l kh �� )�k+ 	Y h[OY��O�b  �b  /FY jvjvlvEc  W X 
 jvb  �b  /FOh �a=�`�_�^�a 0 
mainjabber 
mainJabber�`  �_   �]�\�[�Z�] 00 jabberaccountjustlogin jabberAccountJustLogin�\ &0 currentjabberlist currentJabberList�[  0 lastjabberlist lastJabberList�Z 0 x   �Y�X�W�V�U�T�S�R�Q�P�O�N�Y  0 isichatrunning isIChatRunning�X "0 jabberjustlogin jabberJustLogIn�W 00 getavailablejabberlist getAvailableJabberList�V &0 getlastjabberlist getLastJabberList�U 0 getdelaytime getDelayTime�T &0 decreasedelaytime decreaseDelayTime
�S 
kocl
�R 
cobj
�Q .corecnte****       ****�P 60 jabbernotifywithaccountid jabberNotifyWithAccountID�O  �N  �^ � �)j+   �)j+ E�O)j+ E�O)j+ E�O)b  k+ j )b  k+ Y W� hY O %�[��l kh �� )�k+ 	Y h[OY��O %�[��l kh �� )�k+ 	Y h[OY��O�b  �b  /FY jvjvlvEc  W 	X 
 h �M��L�K !�J�M 00 aimnotifywithaccountid aimNotifyWithAccountID�L �I"�I "  �H�H 0 theid theID�K    �G�F�E�D�C�B�A�G 0 theid theID�F 0 appname appName�E $0 notificationname notificationName�D 0 
thisstatus 
thisStatus�C 0 thename theName�B 0 	thestatus 	theStatus�A 0 
displaypic 
displayPic! ���@�? `�>#�=�<�;�:�9�8�7�6�5�4�3�2 ��1�0�/�.�-�,�+�*�)�(�@  0 isgrowlrunning isGrowlRunning�?  0 isichatrunning isIChatRunning
�> 
icsv#  
�= 
ID  
�< 
pres
�; .coredoexbool       obj 
�: 
stat
�9 pstaoffl
�8 
pnam�7 "0 stringforstatus stringForStatus
�6 pstaaway
�5 
smsg
�4 pstaaval
�3 pstaidle
�2 
imaA
�1 
name
�0 
titl
�/ 
appl
�. 
desc
�- 
imag�, 

�+ .notifygrnull��� ��� null�*  �)  �( �J���E�O�E�O)j+ �)j+ ���*�k/�[�,\Zb  81�k/�[�,\Z�81j 	�*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O�Z��  /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y ǣ�  U*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ b  
%*�k/�[�,\Zb  81�k/�[�,\Z�81�,%E�Y n�a   /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y 9�a   /*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O)�k+ E�Y hO X)j+  K*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Oa  *a �a �a �a �a �a  UY hW %X  a  *a �a �a �a �a  UY hUY hY hW 	X  h �'��&�%$%�$�' 60 jabbernotifywithaccountid jabberNotifyWithAccountID�& �#&�# &  �"�" 0 theid theID�%  $ �!� �������! 0 theid theID�  0 appname appName� $0 notificationname notificationName� 
0 notifs  � 0 
thisstatus 
thisStatus� 0 thename theName� 0 	thestatus 	theStatus� 0 
displaypic 
displayPic% ���� `�#������������ ��
�	���������  0 isichatrunning isIChatRunning�  0 isgrowlrunning isGrowlRunning
� 
icsv
� 
ID  
� 
pres
� .coredoexbool       obj 
� 
stat
� pstaoffl
� pstaaway
� pstaaval
� 
bool
� pstaidle
� 
smsg� "0 stringforstatus stringForStatus
� 
imaA
�
 
name
�	 
titl
� 
appl
� 
desc
� 
imag� 

� .notifygrnull��� ��� null�  �  � �$TK)j+  ?)j+ 3�E�O�E�O�kvE�O�*�k/�[�,\Zb  81�k/�[�,\Z�81j 	 �*�k/�[�,\Zb  81�k/�[�,\Z�81�,E�O�Z��  hY @�� 
 �� �&
 �� �& (*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Y hO)�k+ E�O X)j+   K*�k/�[�,\Zb  81�k/�[�,\Z�81a ,E�Oa  *a �a �a �a �a �a  UY hW %X  a  *a �a �a �a �a  UY hUY hY hW 	X  h � �����'(���  "0 stringforstatus stringForStatus�� ��)�� )  ���� 0 s  ��  ' ���� 0 s  (  `������������������
�� pstaaway
�� pstaoffl
�� pstaaval
�� pstaidle��  ��  �� > 5�Z��  �Y %��  �Y ��  �Y ��  �Y �W 	X 
 � �������*+����  0 isichatrunning isIChatRunning��  ��  *  + ����������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f �������,-����  0 isgrowlrunning isGrowlRunning��  ��  ,  - ����������
�� 
prcs
�� .coredoexbool       obj ��  ��  ��  � *��/j UW 	X  f �������./���� 0 getlist getList��  ��  .  / ������ 00 getavailablejabberlist getAvailableJabberList�� *0 getavailableaimlist getAvailableAimList�� )j+  )j+ lv	 �������01���� &0 getlastjabberlist getLastJabberList��  ��  0  1 ��
�� 
cobj�� b  �b  /E
 �������23����  0 getlastaimlist getLastAimList��  ��  2  3 ��
�� 
cobj�� b  �b  /E ������45���� $0 getavailablelist getAvailableList�� ��6�� 6  ���� 0 servicename serviceName��  4 ���� 0 servicename serviceName5 
�� `��#��������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
ID  
�� 
pres
�� 
stat
�� pstaaval��  ��  �� > 4)j+   &� *�k/�[�,\Z�81�-�,�[�,\Z�81EUY jvW 
X  	jv ��#����78���� 00 getavailablejabberlist getAvailableJabberList��  ��  7  8  �� jvOP ��-����9:���� *0 getavailableaimlist getAvailableAimList��  ��  9  : ���� $0 getavailablelist getAvailableList�� )b  k+   ��8����;<���� "0 jabberjustlogin jabberJustLogIn��  ��  ;  < ���� 0 isjustlogin isJustLogIn�� )b  b  l+   ��C����=>���� 0 aimjustlogin aimJustLogin��  ��  =  > ���� 0 isjustlogin isJustLogIn�� )b  b  l+   ��Q����?@���� 0 getdelaytime getDelayTime�� ��A�� A  ���� 0 serviceindex serviceIndex��  ? ���� 0 serviceindex serviceIndex@ ��
�� 
cobj�� b  �/E ��^����BC���� &0 decreasedelaytime decreaseDelayTime�� ��D�� D  ���� 0 serviceindex serviceIndex��  B ���� 0 serviceindex serviceIndexC ��
�� 
cobj�� 4b  �/b   b  �/FOb  �/j jb  �/FY h �������EF���� 0 isjustlogin isJustLogIn�� ��G�� G  ������ 0 servicename serviceName�� 0 serviceindex serviceIndex��  E �������� 0 servicename serviceName�� 0 serviceindex serviceIndex�� 0 currentstatus currentStatusF 
�� `��#��������������  0 isichatrunning isIChatRunning
�� 
icsv
�� 
ID  
�� 
stat
�� 
cobj
�� sstaconn��  ��  �� � �)j+   �� }�Z*�k/�[�,\Z�81�,E�Ob  �/E +��  hY fb  �/FOb  b  �/FOfY 4��  !eb  �/FOb  b  �/FOeY fb  �/FOfUY fb  �/FOfW X  	fb  �/FOf ascr  ��ޭ