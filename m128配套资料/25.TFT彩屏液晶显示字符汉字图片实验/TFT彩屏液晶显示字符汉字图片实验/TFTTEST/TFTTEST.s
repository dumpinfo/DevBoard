	.module TFTTEST.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的基于TFT彩屏液晶测试程序，用来显示字符汉字和图片
; //相关外部头文件：main.h tft.h GB2312.h ascii8x16.h 使用前请将相关头文件加入编译器安装路径下的avr文件夹
; //图片数据文件picture-xin.c mmp.c ，存储在Flash中
; //编译环境 ICCAVR
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <iom128v.h>
; #include <TFT_main.h>
; 
;      
; //***********************************************************************
; //         调用显示字符和汉字示例
; //***********************************************************************
	.dbline 21
; void DisplayData()
	nop
	.dbline 22
;  {
	nop
	.dbline 23
;     DisplayChar(2+'0',0,4,0x0eee);
	nop
	.dbline 24
; 	DisplayChar(0+'0',1,4,0x0eee);
	nop
	.dbline 25
; 	DisplayChar(1+'0',2,4,0x0eee);
	nop
	.dbline 26
; 	DisplayChar(0+'0',3,4,0x0eee);
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
; 	DisplayChar('/',4,4,0x0eee);  					// "/"符号
; 
; 	DisplayChar(0+'0',5,4,0x0eee);
	.dbline 32
; 	DisplayChar(1+'0',6,4,0x0eee);
; 	DisplayChar('/',7,4,0x0eee);  					// "/"符号
	nop
	.dbline 33
; 
	nop
	.dbline 34
; 
	nop
	.dbline 35
; 	DisplayChar(2+'0',8,4,0x0eee);
	nop
	.dbline 36
; 	DisplayChar(9+'0',9,4,0x0eee);
	nop
	.dbline 37
;     
	nop
	.dbline 38
; 	DisplayGB2312(6,5,4,0xa000);   					//星
	nop
	.dbline 39
; 	DisplayGB2312(7,6,4,0xa000);   					//期
	nop
	.dbline 40
; 	DisplayGB2312(5+7,7,4,0xa000);  			 	//星期几
	nop
	.dbline 41
;  }
	nop
	.dbline 42
; 
	nop
	.dbline 43
; 
	nop
	.dbline 44
; 
	nop
	.dbline 45
; //***********************************************************************
	nop
	.dbline 46
; //         主函数
	nop
	.dbline 47
; //***********************************************************************
	nop
	.dbline 48
; 
	nop
	.dbline 49
; void main(void)
	nop
	.dbline 50
; {
	nop
	.dbline 51
;   uchar i;
	nop
	.dbline 52
;   //delay_ms(100);
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
;   McuInit();                                         //单片机初始化
;   LCD_RD1; 
;   LCD_Init();
;   LCD_clear(0);
	.dbline 57
; 	
	xcall _delay_3us
	.dbline 58
;   while(1)
	xcall _delay_3us
	.dbline 59
;     {
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
; 		DisplayString("ATMEGA128 Board",0,1,0xeee);  //字符串显示调用
; 		DisplayString("TFT Testing",2,2,0xeee);		 //字符串显示调用
; 		DisplayData();								 //字符汉字调用
; 		delay_nms(1000);								 //延时
	.dbline 64
; 		delay_nms(1000);
	xcall _delay_10us
	.dbline 65
; 		delay_nms(1000);
	xcall _delay_10us
	.dbline 66
; 		delay_nms(1000);
	xcall _delay_10us
	.dbline 67
; 
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
; 	    LCD_MM();									 //小屏显示图片96X64
; 		delay_nms(1000);
; 		delay_nms(1000);
	.dbline 71
; 		LCD_test();									 //显示彩条和纯色
	xcall _delay_50us
	.dbline 72
; 		LCD_clear(0);								 //清屏
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
; 
; 		
;     }
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; }
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
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline 90
; 
	xcall _delay_100us
	.dbline 91
; 
	xcall _delay_100us
	.dbline 92
; 
	xcall _delay_100us
	.dbline 93
; 
	xcall _delay_100us
	.dbline 94
; 
	xcall _delay_100us
	.dbline 95
; 
	xcall _delay_100us
	.dbline 96
; 
	xcall _delay_100us
	.dbline 97
; 
	xcall _delay_100us
	.dbline 98
; 
	xcall _delay_100us
	.dbline 99
; 
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
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 
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
; 
; 
; 
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFTTEST.C
	.dbfunc e DisplayData _DisplayData fV
	.even
_DisplayData::
	sbiw R28,4
	.dbline -1
	.dbline 22
	.dbline 23
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	clr R18
	ldi R16,50
	xcall _DisplayChar
	.dbline 24
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,1
	ldi R16,48
	xcall _DisplayChar
	.dbline 25
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,2
	ldi R16,49
	xcall _DisplayChar
	.dbline 26
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,3
	ldi R16,48
	xcall _DisplayChar
	.dbline 28
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,4
	ldi R16,47
	xcall _DisplayChar
	.dbline 30
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,5
	ldi R16,48
	xcall _DisplayChar
	.dbline 31
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,6
	ldi R16,49
	xcall _DisplayChar
	.dbline 32
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,7
	ldi R16,47
	xcall _DisplayChar
	.dbline 35
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,8
	ldi R16,50
	xcall _DisplayChar
	.dbline 36
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,9
	ldi R16,57
	xcall _DisplayChar
	.dbline 38
	ldi R24,40960
	ldi R25,160
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,5
	ldi R16,6
	xcall _DisplayGB2312
	.dbline 39
	ldi R24,40960
	ldi R25,160
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,6
	ldi R16,7
	xcall _DisplayGB2312
	.dbline 40
	ldi R24,40960
	ldi R25,160
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,7
	ldi R16,12
	xcall _DisplayGB2312
	.dbline -2
L19:
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	sbiw R28,4
	.dbline -1
	.dbline 50
	.dbline 53
	xcall _McuInit
	.dbline 54
	lds R24,101
	ori R24,16
	sts 101,R24
	.dbline 55
	xcall _LCD_Init
	.dbline 56
	clr R16
	clr R17
	xcall _LCD_clear
	xjmp L22
L21:
	.dbline 59
	.dbline 60
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,1
	std y+0,R24
	clr R18
	ldi R16,<L24
	ldi R17,>L24
	xcall _DisplayString
	.dbline 61
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,2
	std y+0,R24
	ldi R18,2
	ldi R16,<L25
	ldi R17,>L25
	xcall _DisplayString
	.dbline 62
	xcall _DisplayData
	.dbline 63
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 64
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 65
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 66
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 68
	xcall _LCD_MM
	.dbline 69
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 70
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 71
	xcall _LCD_test
	.dbline 72
	clr R16
	clr R17
	xcall _LCD_clear
	.dbline 75
L22:
	.dbline 58
	xjmp L21
X1:
	.dbline -2
L20:
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l i 5 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFTTEST.C
_postion_y::
	.blkb 1
	.dbfile C:/icc/include/TFT_main.h
	.dbsym e postion_y _postion_y c
_postion_x::
	.blkb 1
	.dbsym e postion_x _postion_x c
	.area data(ram, con, rel)
	.dbfile C:/icc/include/TFT_main.h
L25:
	.blkb 12
	.area idata
	.byte 'T,'F,'T,32,'T,'e,'s,'t,'i,'n,'g,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/TFT_main.h
L24:
	.blkb 16
	.area idata
	.byte 'A,'T,'M,'E,'G,'A,49,50,56,32,'B,'o,'a,'r,'d,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/TFT_main.h
