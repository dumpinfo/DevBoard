	.module _4X4KEY.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128µÄ4X4Î»¾ØÕó¼üÅÌ¿ØÖÆ³ÌĞò£¬ÏÔÊ¾¼üÖµ
; //±àÒë»·¾³ ICCAVR 7.16A
; //ÏµÍ³Ê±ÖÓ7.3728MHZ£¬ÉèÖÃÈÛË¿Î»ÎªÍâ²¿¸ßÆµÊ¯Ó¢¾§ÌåÕñµ
; //ÖÒĞËµç×ÓÔª¼şµê±à¼­
; //ÈÕÆÚ£º2010.05.24
; //***********************************************************************
; //			°üº¬ÎÄ¼ş
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
; 
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define key_io          PORTC               //¶ÀÁ¢¼üÅÌÓëPC4ºÍPC5Á¬½Ó
; #define key_ior         PINC                //¶ÁÈ¡IO¿ÚÖµÎªPINCµÄÖµ
	.dbline 21
; #define Data_IO	        PORTA                //ÊıÂë¹ÜÊı¾İ¿Ú
	nop
	.dbline 22
; #define Data_DDR        DDRA                 //ÊıÂë¹ÜÊı¾İ¿Ú·½Ïò¼Ä´æÆ÷
	nop
	.dbline 23
; #define D_LE0	        PORTD &= ~(1 << PD4) //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª0£¬Ëø´æ¶Ë¿ÚÊı¾İ
	nop
	.dbline 24
; #define D_LE1           PORTD |= (1 << PD4)  //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª1£¬Ëø´æÆ÷Êä³öÓë¶Ë¿ÚÒ»ÖÂ
	nop
	.dbline 25
; #define W_LE0	        PORTD &= ~(1 << PD5) //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª0
	nop
	.dbline 26
; #define W_LE1           PORTD |= (1 << PD5)  //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª1
	nop
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_3us _delay_3us fV
	.even
_delay_3us::
	.dbline -1
	.dbline 30
; 
; 
; //***********************************************************************
; //			¹²ÒõÊıÂë¹ÜÏÔÊ¾µÄ¶ÏÂë±í0¡«F
	.dbline 32
; //***********************************************************************
; 
	nop
	.dbline 33
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
	nop
	.dbline 34
; 	           0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 35
; uchar key;
	nop
	.dbline 36
; 
	nop
	.dbline 37
; //***********************************************************************
	nop
	.dbline 38
; //			IO¶Ë¿Ú³õÊ¼»¯
	nop
	.dbline 39
; //***********************************************************************
	nop
	.dbline 40
; 
	nop
	.dbline 41
; void System_Init()
	nop
	.dbline 42
; {
	nop
	.dbline 43
;     Data_IO=0xFF;             //Êı¾İ¿ÚÎªÊä³ö
	nop
	.dbline 44
;     Data_DDR=0xFF;
	nop
	.dbline 45
; 
	nop
	.dbline 46
;     PORTD=0xFF;               //74HC573µÄ¿ØÖÆ¿Ú£¬ÉèÖÃÎªÊä³ö
	nop
	.dbline 47
;     DDRD=0xFF;
	nop
	.dbline 48
; 
	nop
	.dbline 49
;     PORTB=0xFF;		     //¹Ø±Õ·¢¹â¶ş¼«¹Ü
	nop
	.dbline 50
;     DDRB=0xFF;
	nop
	.dbline 51
; }
	nop
	.dbline 52
; 
	nop
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_10us _delay_10us fV
	.even
_delay_10us::
	.dbline -1
	.dbline 56
; //*************************************************************************
; //			74HC573¿ØÖÆÊıÂë¹Ü¶¯Ì¬É¨ÃèÏÔÊ¾º¯Êı
; //*************************************************************************
; 
	.dbline 57
; void Display_Key(uchar num)
	xcall _delay_3us
	.dbline 58
; {
	xcall _delay_3us
	.dbline 59
; 	 uchar i,j;
	xcall _delay_3us
	.dbline -2
L3:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_50us _delay_50us fV
	.even
_delay_50us::
	.dbline -1
	.dbline 63
; 	 System_Init();
;    j=0x01;                    //´ËÊı¾İÓÃÀ´¿ØÖÆÎ»Ñ¡
;   for(i=0;i<8;i++)
;   {
	.dbline 64
;     D_LE1;                    //¿ØÖÆÊıÂë¹Ü¶ÎÊı¾İµÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
	xcall _delay_10us
	.dbline 65
;     W_LE1;                    //¿ØÖÆÊıÂë¹ÜÎ»µÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
	xcall _delay_10us
	.dbline 66
;     Data_IO=0x00;               //ÉèÖÃÒªÏÔÊ¾µÄÎ»£¬Ò²¾ÍÊÇÄÄÒ»¸öÊıÂë¹ÜÁÁ£¬ÕâÀïÊÇ°Ë¸öÒ»ÆğÏÔÊ¾
	xcall _delay_10us
	.dbline 67
;     W_LE0;                    //Ëø´æÎ»Êı¾İ£¬ÏÂÃæËÍÉÏ¶ÎÊı¾İÒÔºó£¬¾ÍÏÔÊ¾³öÀ´ÁË
	xcall _delay_10us
	.dbline -2
L4:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_100us _delay_100us fV
	.even
_delay_100us::
	.dbline -1
	.dbline 70
; 	j=(j<<1);
;     Data_IO=table[num];         //ËÍÒªÏÔÊ¾µÄÊı¾İ£¬¾ÍÊÇ¶ÎÊı¾İ£¬ÈçÏÔÊ¾0ËÍµÄÊÇ0x3f
;     D_LE0;                    //Ëø´æ¶ÎÊı¾İ£¬ÊıÂë¹ÜÁÁÒ»¸öÊ±¼äÆ¬¿Ì
	.dbline 71
;     delay_nms(1);              //ÏÔÊ¾Ò»¸öÊ±¼äÆ¬¿Ì£¬»áÓ°ÏìÁÁ¶ÈºÍÉÁË¸ĞÔ
	xcall _delay_50us
	.dbline 72
; 
	xcall _delay_50us
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_n100us _delay_n100us fV
;         n100us -> R20
	.even
_delay_n100us::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 75
;   }
; 
; }
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L7
	.dbline -2
L6:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r n100us 20 c
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
	.even
_delay_1ms::
	.dbline -1
	.dbline 89
; //**********************************************************************
; //	¼üÅÌÉ¨Ãè×Ó³ÌĞò£¬²ÉÓÃÖğ¼üÉ¨ÃèµÄ·½Ê½
; //**********************************************************************
; uchar keyboardscan(void) 
; {
;   uchar statevalue,key_checkin,key_check;
;   key_io=0xf0;                    //ÔÚIO¿ÚÓÉÊä³ö·½Ê½±äÎªÊäÈë·½Ê½Ê±ÒªÑÓ³ÙÒ»¸öÖÜÆÚ
;   key_io=0xf0;                    //²ÉÈ¡Ğ´Á½´ÎµÄ·½·¨ÑÓÊ±
;   key_checkin=key_ior;            //¶ÁÈ¡IO¿Ú×´Ì¬£¬ÅĞ¶ÏÊÇ·ñÓĞ¼ü°´ÏÂ
;   if(key_checkin!=0xf0)           //IO¿ÚÖµ·¢Éú±ä»¯Ôò±íÊ¾ÓĞ¼ü°´ÏÂ
;   {
;     delay_nms(20);                 //¼üÅÌÏû¶¶£¬ÑÓÊ±20MS
;     key_checkin=key_ior;
	.dbline 90
;     if(key_checkin!=0xf0)
	xcall _delay_100us
	.dbline 91
;     {
	xcall _delay_100us
	.dbline 92
;      key_io=0xfe;                 //ÖğĞĞÉ¨Ãè¿ªÊ¼
	xcall _delay_100us
	.dbline 93
;      key_io=0xfe;                 //Ğ´Á½´ÎÑÓÊ±£¬ÏÂÍ¬
	xcall _delay_100us
	.dbline 94
;      key_check=key_ior;
	xcall _delay_100us
	.dbline 95
;      switch (key_check)           //¸ù¾İ¶Áµ½µÄIO¿ÚÖµÅĞ¶Ï°´¼üµÄ°´ÏÂÇé¿ö
	xcall _delay_100us
	.dbline 96
;      {
	xcall _delay_100us
	.dbline 97
;      case 0xee:key=15;break;
	xcall _delay_100us
	.dbline 98
;      case 0xde:key=11;break;
	xcall _delay_100us
	.dbline 99
;      case 0xbe:key=8;break;
	xcall _delay_100us
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;            nms -> R20,R21
	.even
_delay_nms::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 109
;      case 0x7e:key=4;break;
;      }
;      
;      key_io=0xfd;
;      key_io=0xfd;
;      key_check=key_ior;
;      switch (key_check)
;      {
;      case 0xed:key=14;break;
;      case 0xdd:key=10;break;
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
;      case 0xbd:key=7;break;
	movw R2,R20
	subi R20,1
	sbci R21,0
	tst R2
	brne L12
	tst R3
	brne L12
X0:
	.dbline -2
L11:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r nms 20 i
	.dbend
	.dbfunc e delay_ns _delay_ns fV
;             ns -> R20
	.even
_delay_ns::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 114
;      case 0x7d:key=3;break;
;      }
;      
;      key_io=0xfb;
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
;      key_io=0xfb;
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L16
	.dbline -2
L15:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r ns 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
_table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\7.4X4¾ØÕó¼üÅÌÊµÑé\4X4KEY\4X4KEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\7.4X4¾ØÕó¼üÅÌÊµÑé\4X4KEY\4X4KEY.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 42
	.dbline 43
	ldi R24,255
	out 0x1b,R24
	.dbline 44
	out 0x1a,R24
	.dbline 46
	out 0x12,R24
	.dbline 47
	out 0x11,R24
	.dbline 49
	out 0x18,R24
	.dbline 50
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_Key _Display_Key fV
;              j -> R20
;              i -> R22
;            num -> R10
	.even
_Display_Key::
	xcall push_gset3
	mov R10,R16
	.dbline -1
	.dbline 58
	.dbline 60
	xcall _System_Init
	.dbline 61
	ldi R20,1
	.dbline 62
	clr R22
	xjmp L24
L21:
	.dbline 63
	.dbline 64
	sbi 0x12,4
	.dbline 65
	sbi 0x12,5
	.dbline 66
	clr R2
	out 0x1b,R2
	.dbline 67
	cbi 0x12,5
	.dbline 68
	lsl R20
	.dbline 69
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 70
	cbi 0x12,4
	.dbline 71
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 73
L22:
	.dbline 62
	inc R22
L24:
	.dbline 62
	cpi R22,8
	brlo L21
	.dbline -2
L20:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r j 20 c
	.dbsym r i 22 c
	.dbsym r num 10 c
	.dbend
	.dbfunc e keyboardscan _keyboardscan fc
;     statevalue -> R20
;      key_check -> R20
;    key_checkin -> R20
	.even
_keyboardscan::
	xcall push_gset2
	.dbline -1
	.dbline 81
	.dbline 83
	ldi R24,240
	out 0x15,R24
	.dbline 84
	out 0x15,R24
	.dbline 85
	in R20,0x13
	.dbline 86
	cpi R20,240
	brne X5
	xjmp L26
X5:
	.dbline 87
	.dbline 88
	ldi R16,20
	ldi R17,0
	xcall _delay_nms
	.dbline 89
	in R20,0x13
	.dbline 90
	cpi R20,240
	brne X6
	xjmp L27
X6:
	.dbline 91
	.dbline 92
	ldi R24,254
	out 0x15,R24
	.dbline 93
	out 0x15,R24
	.dbline 94
	in R20,0x13
	.dbline 95
	mov R22,R20
	clr R23
	cpi R22,190
	ldi R30,0
	cpc R23,R30
	breq L35
	ldi R24,190
	ldi R25,0
	cp R24,R22
	cpc R25,R23
	brlt L38
L37:
	cpi R22,126
	ldi R30,0
	cpc R23,R30
	breq L36
	xjmp L30
L38:
	cpi R22,222
	ldi R30,0
	cpc R23,R30
	breq L34
	cpi R22,222
	ldi R30,0
	cpc R23,R30
	brlt L30
L39:
	cpi R22,238
	ldi R30,0
	cpc R23,R30
	breq L33
	xjmp L30
X1:
	.dbline 96
L33:
	.dbline 97
	ldi R24,15
	sts _key,R24
	.dbline 97
	xjmp L31
L34:
	.dbline 98
	ldi R24,11
	sts _key,R24
	.dbline 98
	xjmp L31
L35:
	.dbline 99
	ldi R24,8
	sts _key,R24
	.dbline 99
	xjmp L31
L36:
	.dbline 100
	ldi R24,4
	sts _key,R24
	.dbline 100
L30:
L31:
	.dbline 103
	ldi R24,253
	out 0x15,R24
	.dbline 104
	out 0x15,R24
	.dbline 105
	in R20,0x13
	.dbline 106
	mov R22,R20
	clr R23
	cpi R22,189
	ldi R30,0
	cpc R23,R30
	breq L45
	ldi R24,189
	ldi R25,0
	cp R24,R22
	cpc R25,R23
	brlt L48
L47:
	cpi R22,125
	ldi R30,0
	cpc R23,R30
	breq L46
	xjmp L40
L48:
	cpi R22,221
	ldi R30,0
	cpc R23,R30
	breq L44
	cpi R22,221
	ldi R30,0
	cpc R23,R30
	brlt L40
L49:
	cpi R22,237
	ldi R30,0
	cpc R23,R30
	breq L43
	xjmp L40
X2:
	.dbline 107
L43:
	.dbline 108
	ldi R24,14
	sts _key,R24
	.dbline 108
	xjmp L41
L44:
	.dbline 109
	ldi R24,10
	sts _key,R24
	.dbline 109
	xjmp L41
L45:
	.dbline 110
	ldi R24,7
	sts _key,R24
	.dbline 110
	xjmp L41
L46:
	.dbline 111
	ldi R24,3
	sts _key,R24
	.dbline 111
L40:
L41:
	.dbline 114
	ldi R24,251
	out 0x15,R24
	.dbline 115
	out 0x15,R24
	.dbline 116
;      key_check=key_ior;
	in R20,0x13
	.dbline 117
;      switch (key_check)
	mov R22,R20
	clr R23
	cpi R22,187
	ldi R30,0
	cpc R23,R30
	breq L55
	ldi R24,187
	ldi R25,0
	cp R24,R22
	cpc R25,R23
	brlt L58
L57:
	cpi R22,123
	ldi R30,0
	cpc R23,R30
	breq L56
	xjmp L50
L58:
	cpi R22,219
	ldi R30,0
	cpc R23,R30
	breq L54
	cpi R22,219
	ldi R30,0
	cpc R23,R30
	brlt L50
L59:
	cpi R22,235
	ldi R30,0
	cpc R23,R30
	breq L53
	xjmp L50
X3:
	.dbline 118
;      {
L53:
	.dbline 119
;      case 0xeb:key=13;break;
	ldi R24,13
	sts _key,R24
	.dbline 119
	xjmp L51
L54:
	.dbline 120
;      case 0xdb:key=0;break;
	clr R2
	sts _key,R2
	.dbline 120
	xjmp L51
L55:
	.dbline 121
;      case 0xbb:key=6;break;
	ldi R24,6
	sts _key,R24
	.dbline 121
	xjmp L51
L56:
	.dbline 122
;      case 0x7b:key=2;break;
	ldi R24,2
	sts _key,R24
	.dbline 122
L50:
L51:
	.dbline 125
;      }
;      
;       key_io=0xf7;
	ldi R24,247
	out 0x15,R24
	.dbline 126
;       key_io=0xf7;
	out 0x15,R24
	.dbline 127
;       key_check=key_ior;
	in R20,0x13
	.dbline 128
;      switch (key_check)
	clr R21
	cpi R20,183
	ldi R30,0
	cpc R21,R30
	breq L65
	ldi R24,183
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L68
L67:
	cpi R20,119
	ldi R30,0
	cpc R21,R30
	breq L66
	xjmp L27
L68:
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	breq L64
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	brlt L27
L69:
	cpi R20,231
	ldi R30,0
	cpc R21,R30
	breq L63
	xjmp L27
X4:
	.dbline 129
;      {
L63:
	.dbline 130
;      case 0xe7:key=12;break;
	ldi R24,12
	sts _key,R24
	.dbline 130
	xjmp L27
L64:
	.dbline 131
;      case 0xd7:key=9;break;
	ldi R24,9
	sts _key,R24
	.dbline 131
	xjmp L27
L65:
	.dbline 132
;      case 0xb7:key=5;break;
	ldi R24,5
	sts _key,R24
	.dbline 132
	xjmp L27
L66:
	.dbline 133
;      case 0x77:key=1;break;
	ldi R24,1
	sts _key,R24
	.dbline 133
	.dbline 136
;      }
;      
;     }
	.dbline 137
;   }
	xjmp L27
L26:
	.dbline 139
	.dbline 140
	ldi R20,255
	.dbline 141
	sts _key,R20
	.dbline 142
	mov R16,R20
L27:
	.dbline -2
L25:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r statevalue 20 c
	.dbsym r key_check 20 c
	.dbsym r key_checkin 20 c
	.dbend
	.dbfunc e main _main fV
	.area func_lit(rom, con, rel)
L95:
	.word `L88
	.word `L79
	.word `L80
	.word `L81
	.word `L82
	.word `L83
	.word `L84
	.word `L85
	.word `L86
	.word `L87
	.word `L89
	.word `L90
	.word `L91
	.word `L92
	.word `L93
	.word `L94
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\7.4X4¾ØÕó¼üÅÌÊµÑé\4X4KEY\4X4KEY.C
;      key_store -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 152
;   else
;   {
;   statevalue=0xff;                      //ÎŞ°´¼üÊ±·µ»ØÖµ
;   key=statevalue;
;   return(key);
;   }
; }
; 
; //*************************************************************************
; //			Ö÷³ÌĞò
; //*************************************************************************
; 
; void main()
; 
; {         
	.dbline 153
; 	  uint key_store=0x01;
	ldi R20,1
	ldi R21,0
	.dbline 154
; 	  DDRC=0x0f;                        //PC¿ÚÉÏÀ­µç×èÊ¹ÄÜ
	ldi R24,15
	out 0x14,R24
	.dbline 155
;       PORTC=0xf0;                       //PC¸ßËÄÎ»ÊäÈëµÍËÄÎ»Êä³ö
	ldi R24,240
	out 0x15,R24
	xjmp L72
L71:
	.dbline 159
; 
; 
; while(1)
;   {
	.dbline 161
; 
;   keyboardscan();                         //¼üÅÌÉ¨Ãè£¬¿´ÊÇ·ñÓĞ°´¼ü°´ÏÂ
	xcall _keyboardscan
	.dbline 162
;     if(key!=0xff)                        //Èç¹ûÓĞ°´¼ü°´ÏÂ£¬ÔòÏÔÊ¾¸Ã°´¼ü¼üÖµ0~15
	lds R24,_key
	cpi R24,255
	brne X9
	xjmp L74
X9:
	.dbline 163
;       {
	.dbline 164
; 	      { switch(key)
	.dbline 164
	mov R22,R24
	clr R23
	cpi R22,0
	ldi R30,0
	cpc R23,R30
	brge X10
	xjmp L75
X10:
	ldi R24,15
	ldi R25,0
	cp R24,R22
	cpc R25,R23
	brge X11
	xjmp L75
X11:
	ldi R16,2
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R30,R16
	ldi R24,<L95
	ldi R25,>L95
	add R30,R24
	adc R31,R25
	lpm R0,Z+
	lpm R1,Z
	movw R30,R0
	ijmp
X7:
	.dbline 165
; 		   {  
L79:
	.dbline 166
; 		     case 1: Display_Key(0x01);key_store=0x01;break;   //¸ù¾İ¼üÖµÏÔÊ¾µ½ÊıÂë¹ÜÉÏ
	ldi R16,1
	xcall _Display_Key
	.dbline 166
	ldi R20,1
	ldi R21,0
	.dbline 166
	xjmp L75
L80:
	.dbline 167
; 		     case 2: Display_Key(0x02);key_store=0x02;break;
	ldi R16,2
	xcall _Display_Key
	.dbline 167
	ldi R20,2
	ldi R21,0
	.dbline 167
	xjmp L75
L81:
	.dbline 168
; 		     case 3: Display_Key(0x03);key_store=0x03;break;
	ldi R16,3
	xcall _Display_Key
	.dbline 168
	ldi R20,3
	ldi R21,0
	.dbline 168
	xjmp L75
L82:
	.dbline 169
; 		     case 4: Display_Key(0x04);key_store=0x04;break;
	ldi R16,4
	xcall _Display_Key
	.dbline 169
	ldi R20,4
	ldi R21,0
	.dbline 169
	xjmp L75
L83:
	.dbline 170
; 		     case 5: Display_Key(0x05);key_store=0x05;break;
	ldi R16,5
	xcall _Display_Key
	.dbline 170
	ldi R20,5
	ldi R21,0
	.dbline 170
	xjmp L75
L84:
	.dbline 171
; 		     case 6: Display_Key(0x06);key_store=0x06;break;
	ldi R16,6
	xcall _Display_Key
	.dbline 171
	ldi R20,6
	ldi R21,0
	.dbline 171
	xjmp L75
L85:
	.dbline 172
; 		     case 7: Display_Key(0x07);key_store=0x07;break;
	ldi R16,7
	xcall _Display_Key
	.dbline 172
	ldi R20,7
	ldi R21,0
	.dbline 172
	xjmp L75
L86:
	.dbline 173
; 		     case 8: Display_Key(0x08);key_store=0x08;break;
	ldi R16,8
	xcall _Display_Key
	.dbline 173
	ldi R20,8
	ldi R21,0
	.dbline 173
	xjmp L75
L87:
	.dbline 174
; 		     case 9: Display_Key(0x09);key_store=0x09;break;
	ldi R16,9
	xcall _Display_Key
	.dbline 174
	ldi R20,9
	ldi R21,0
	.dbline 174
	xjmp L75
L88:
	.dbline 175
; 		     case 0: Display_Key(0x00);key_store=0x00;break;
	clr R16
	xcall _Display_Key
	.dbline 175
	clr R20
	clr R21
	.dbline 175
	xjmp L75
L89:
	.dbline 176
; 		     case 10: Display_Key(0x0a);key_store=0x0a;break;
	ldi R16,10
	xcall _Display_Key
	.dbline 176
	ldi R20,10
	ldi R21,0
	.dbline 176
	xjmp L75
L90:
	.dbline 177
; 		     case 11: Display_Key(0x0b);key_store=0x0b;break;
	ldi R16,11
	xcall _Display_Key
	.dbline 177
	ldi R20,11
	ldi R21,0
	.dbline 177
	xjmp L75
L91:
	.dbline 178
; 		     case 12: Display_Key(0x0c);key_store=0x0c;break;
	ldi R16,12
	xcall _Display_Key
	.dbline 178
	ldi R20,12
	ldi R21,0
	.dbline 178
	xjmp L75
L92:
	.dbline 179
; 		     case 13: Display_Key(0x0d);key_store=0x0d;break;
	ldi R16,13
	xcall _Display_Key
	.dbline 179
	ldi R20,13
	ldi R21,0
	.dbline 179
	xjmp L75
L93:
	.dbline 180
; 	         case 14: Display_Key(0x0e);key_store=0x0e;break;
	ldi R16,14
	xcall _Display_Key
	.dbline 180
	ldi R20,14
	ldi R21,0
	.dbline 180
	xjmp L75
L94:
	.dbline 181
;              case 15: Display_Key(0x0f);key_store=0x0f;break;
	ldi R16,15
	xcall _Display_Key
	.dbline 181
	ldi R20,15
	ldi R21,0
	.dbline 181
	.dbline 184
;            }
; 
;           }
	.dbline 186
; 	
;        }
	xjmp L75
L74:
	.dbline 188
;   else
; 	 {
	.dbline 189
; 	 Display_Key(key_store);              //Ã»ÓĞ°´¼üµÄÊ±ºòÏÔÊ¾ÉÏ´ÎµÄ¼üÖµ
	mov R16,R20
	xcall _Display_Key
	.dbline 190
; 	 }
L75:
	.dbline 192
L72:
	.dbline 158
	xjmp L71
X8:
	.dbline -2
L70:
	.dbline 0 ; func end
	ret
	.dbsym r key_store 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\7.4X4¾ØÕó¼üÅÌÊµÑé\4X4KEY\4X4KEY.C
_key::
	.blkb 1
	.dbsym e key _key c
