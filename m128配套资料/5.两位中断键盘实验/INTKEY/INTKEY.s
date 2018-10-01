	.module INTKEY.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128ÖĞ¶ÏÊ½¶ÀÁ¢¼üÅÌÊ¾Àı³ÌĞò£¬¼üÖµ±ä»¯¿ÉÄÜ²»ÎÈ£¬ÒòÎª¼üÅÌÓ²¼şµÄ¶¶¶¯Ô­Òò
; //Á½¸öÖĞ¶Ï¼üÅÌ½øĞĞ¼Ó1»òÕß¼õ1¼ÆÊı
; //×¢ÒâICCAVRÖĞ¶Ïº¯Êı´¦Àí·½·¨£¬ÖĞ¶ÏÏòÁ¿ºÅ¿ÉÒÔÔÚÍ·ÎÄ¼şiom128v.hÖĞ²éÕÒ
; //±àÒë»·¾³ ICCAVR 
; //ÏµÍ³Ê±ÖÓ7.3728MHZ£¬ÉèÖÃÈÛË¿Î»ÎªÍâ²¿¸ßÆµÊ¯Ó¢¾§ÌåÕñµ
; //×÷Õß£ºÖÒĞËµç×ÓÔª¼şµê
; //ÈÕÆÚ£º2010.05.24
; 
; //***********************************************************************
; //			°üº¬ÎÄ¼ş
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
; 
; #define Data_IO	        PORTA                //Êı¾İ¿Ú
; #define Data_DDR        DDRA                 //Êı¾İ¿Ú·½Ïò¼Ä´æÆ÷
; #define D_LE0	        PORTD &= ~(1 << PD4) //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª0
	.dbline 21
; #define D_LE1           PORTD |= (1 << PD4)  //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª1
	nop
	.dbline 22
; #define W_LE0	        PORTD &= ~(1 << PD5) //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª0
	nop
	.dbline 23
; #define W_LE1           PORTD |= (1 << PD5)  //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª1
	nop
	.dbline 24
; 
	nop
	.dbline 25
; #define uchar           unsigned char
	nop
	.dbline 26
; #define uint            unsigned int
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
; uchar count;                                  //¶¨Òå¼üÅÌ¼ÆÊı±äÁ¿
; 
; //***********************************************************************
	.dbline 32
; //			¹²ÒõÊıÂë¹ÜÏÔÊ¾µÄ¶ÏÂë±í
; //***********************************************************************
	nop
	.dbline 33
; 
	nop
	.dbline 34
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
	nop
	.dbline 35
; 	           0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
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
; 	PORTD=0x7F;               //PD0 PD1ÉèÖÃÎªÊäÈë
	nop
	.dbline 47
; 	DDRD=0x70;                //PD0 PD1ÉÏÀ­µç×èÊ¹ÄÜÓĞĞ§
	nop
	.dbline 48
; 	
	nop
	.dbline 49
; 	PORTB=0xFF;				  //¹Ø±Õ·¢¹â¶ş¼«¹Ü
	nop
	.dbline 50
; 	DDRB=0xFF;
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
;      j=0x01;                   //´ËÊı¾İÓÃÀ´¿ØÖÆÎ»Ñ¡
;   for(i=0;i<8;i++)
;   {
	.dbline 64
;     D_LE1;                    //¿ØÖÆÊıÂë¹Ü¶ÎÊı¾İµÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
	xcall _delay_10us
	.dbline 65
;     W_LE1;                    //¿ØÖÆÊıÂë¹ÜÎ»µÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
	xcall _delay_10us
	.dbline 66
;     Data_IO=0x00;             //ÉèÖÃÏÔÊ¾µÄÎ»£¬Ò²¾ÍÊÇÄÄ¸öÊıÂë¹ÜÁÁ£¬ÕâÀïÊÇ°Ë¸öÒ»ÆğÏÔÊ¾
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
;     Data_IO=table[num];       //ËÍÒªÏÔÊ¾µÄÊı¾İ£¬¾ÍÊÇ¶ÎÊı¾İ£¬ÈçÏÔÊ¾0ËÍµÄÊÇ0x3f
;     D_LE0;                    //Ëø´æ¶ÎÊı¾İ£¬ÊıÂë¹ÜÁÁÒ»¸öÊ±¼äÆ¬¿Ì
	.dbline 71
;     delay_nms(1);             //ÏÔÊ¾Ò»¸öÊ±¼äÆ¬¿Ì£¬»áÓ°ÏìÁÁ¶ÈºÍÉÁË¸ĞÔ
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
; void Interrupt_Init()
; {
;   EIMSK|=0x03;                                     //Ê¹ÄÜÍâ²¿ÖĞ¶Ï0ºÍÍâ²¿ÖĞ¶Ï1
;   EICRA=0x0A;                                     //ÏÂ½µÑØ´¥·¢·½Ê½
;   MCUCSR=0x00;                                    //¿ØÖÆºÍ×´Ì¬¼Ä´æÆ÷³õÊ¼»¯
; }
; 
; //*************************************************************************
; //	   ÖĞ¶Ï·şÎñ×Ó³ÌĞò
; //*************************************************************************
; 
; #pragma interrupt_handler  INT0_ISR:iv_INT0 //int0_ISR£ºÖĞ¶Ïº¯ÊıÃû£¬½Ó×ÅÊÇÖĞ¶ÏÏòÁ¿ºÅ
; void INT0_ISR() 	 				  		//ÖĞ¶Ï0·şÎñ³ÌĞò
	.dbline 90
;    { 
	xcall _delay_100us
	.dbline 91
;    	 if(++count>=16) 
	xcall _delay_100us
	.dbline 92
;    	 count=0;
	xcall _delay_100us
	.dbline 93
;    } 
	xcall _delay_100us
	.dbline 94
; 
	xcall _delay_100us
	.dbline 95
; #pragma interrupt_handler  INT1_ISR:iv_INT1
	xcall _delay_100us
	.dbline 96
; void INT1_ISR() 	 				 	   //ÖĞ¶Ï1·şÎñ³ÌĞò
	xcall _delay_100us
	.dbline 97
;    { 
	xcall _delay_100us
	.dbline 98
;    	 if(count) --count;
	xcall _delay_100us
	.dbline 99
;    	 else count=15;
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
;   }
; 
; 
; //*************************************************************************
; //			Ö÷³ÌĞò
; //*************************************************************************
; int main(void)
; {
;   System_Init();                             //ÏµÍ³³õÊ¼»¯
;   Interrupt_Init();                          //ÖĞ¶ÏÅäÖÃ³õÊ¼»¯
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
;   SREG|=0x80;                                //¿ªÆôÈ«¾ÖÖĞ¶Ï
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
;   while(1)
;   {
;     Display_Key(count);                     //ÏÔÊ¾¼üÖµ
;   }
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; }
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
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\5.Á½Î»ÖĞ¶Ï¼üÅÌÊµÑé\INTKEY\INTKEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\5.Á½Î»ÖĞ¶Ï¼üÅÌÊµÑé\INTKEY\INTKEY.C
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
	ldi R24,127
	out 0x12,R24
	.dbline 47
	ldi R24,112
	out 0x11,R24
	.dbline 49
	ldi R24,255
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
	.dbfunc e Interrupt_Init _Interrupt_Init fV
	.even
_Interrupt_Init::
	.dbline -1
	.dbline 78
	.dbline 79
	in R24,0x39
	ori R24,3
	out 0x39,R24
	.dbline 80
	ldi R24,10
	sts 106,R24
	.dbline 81
	clr R2
	out 0x34,R2
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 4
	jmp _INT0_ISR
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\5.Á½Î»ÖĞ¶Ï¼üÅÌÊµÑé\INTKEY\INTKEY.C
	.dbfunc e INT0_ISR _INT0_ISR fV
	.even
_INT0_ISR::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 90
	.dbline 91
	lds R24,_count
	subi R24,255    ; addi 1
	mov R2,R24
	sts _count,R2
	cpi R24,16
	brlo L27
	.dbline 92
	clr R2
	sts _count,R2
L27:
	.dbline -2
L26:
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.area vector(rom, abs)
	.org 8
	jmp _INT1_ISR
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\5.Á½Î»ÖĞ¶Ï¼üÅÌÊµÑé\INTKEY\INTKEY.C
	.dbfunc e INT1_ISR _INT1_ISR fV
	.even
_INT1_ISR::
	st -y,R2
	st -y,R24
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 97
	.dbline 98
	lds R2,_count
	tst R2
	breq L30
	.dbline 98
	mov R24,R2
	subi R24,1
	sts _count,R24
	xjmp L31
L30:
	.dbline 99
	ldi R24,15
	sts _count,R24
L31:
	.dbline -2
L29:
	ld R2,y+
	out 0x3f,R2
	ld R24,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	.dbline -1
	.dbline 107
	.dbline 108
	xcall _System_Init
	.dbline 109
	xcall _Interrupt_Init
	.dbline 110
	bset 7
	xjmp L34
L33:
	.dbline 112
	.dbline 113
	lds R16,_count
	xcall _Display_Key
	.dbline 114
L34:
	.dbline 111
	xjmp L33
X1:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128¿ª·¢°å\ÎÒµÄATMEGA128×îĞ¡ÏµÍ³°å\M128_ZZX_1ÅäÌ××ÊÁÏ\5.Á½Î»ÖĞ¶Ï¼üÅÌÊµÑé\INTKEY\INTKEY.C
_count::
	.blkb 1
	.dbsym e count _count c
