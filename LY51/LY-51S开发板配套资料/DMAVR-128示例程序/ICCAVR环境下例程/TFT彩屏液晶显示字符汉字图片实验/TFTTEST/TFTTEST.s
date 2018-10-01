	.module TFTTEST.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TFTTEST\TFTTEST.C
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //********************************************************************
; /*函 数 名：delay_us
; 建立日期：2010年1月28日
; 编译环境：ICCAVR7.16A
; 函数作用：微秒级的延时程序
; 说    明：7.3728M晶振下
; ********************************************************************/
; void delay_1us(void);
; void delay_3us(void);
; void delay_10us(void);
; void delay_50us(void);
; void delay_100us(void);
; void delay_n100us(unsigned char n100us);
; void delay_1ms(void);
; void delay_nms(unsigned int nms);
; void delay_ns(unsigned char ns);
; 
; 
; void delay_1us(void)                 //1us延时函数，不能连续调用， 
; { 
	.dbline 21
;    asm("nop");                       //1时钟周期
	nop
	.dbline 22
;    asm("nop");
	nop
	.dbline 23
;    asm("nop");
	nop
	.dbline 24
;    asm("nop");
	nop
	.dbline 25
;    asm("nop");                       //1T
	nop
	.dbline 26
;    asm("nop");
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
; }
; void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
; { 
	.dbline 32
;    
;    asm("nop");
	nop
	.dbline 33
;    asm("nop");
	nop
	.dbline 34
;    asm("nop");                       
	nop
	.dbline 35
;    asm("nop");
	nop
	.dbline 36
;    asm("nop");
	nop
	.dbline 37
;    asm("nop");
	nop
	.dbline 38
;    asm("nop");                       
	nop
	.dbline 39
;    asm("nop");
	nop
	.dbline 40
;    asm("nop");
	nop
	.dbline 41
;    asm("nop");
	nop
	.dbline 42
;    asm("nop");                       
	nop
	.dbline 43
;    asm("nop");
	nop
	.dbline 44
;    asm("nop");
	nop
	.dbline 45
;    asm("nop");
	nop
	.dbline 46
;    asm("nop");                       
	nop
	.dbline 47
;    asm("nop");
	nop
	.dbline 48
;    asm("nop");
	nop
	.dbline 49
;    asm("nop");
	nop
	.dbline 50
;    asm("nop");
	nop
	.dbline 51
;    asm("nop");
	nop
	.dbline 52
;    asm("nop");                       
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
; } 
; 
; void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
; {
	.dbline 57
;    delay_3us();
	xcall _delay_3us
	.dbline 58
;    delay_3us(); 
	xcall _delay_3us
	.dbline 59
;    delay_3us();  
	.dbline -2
L3:
	.dbline 0 ; func end
	xjmp _delay_3us
	.dbend
	.dbfunc e delay_50us _delay_50us fV
	.even
_delay_50us::
	.dbline -1
	.dbline 63
; }
;   
; void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
; { 
	.dbline 64
;    delay_10us();
	xcall _delay_10us
	.dbline 65
;    delay_10us(); 
	xcall _delay_10us
	.dbline 66
;    delay_10us();
	xcall _delay_10us
	.dbline 67
;    delay_10us();
	.dbline -2
L4:
	.dbline 0 ; func end
	xjmp _delay_10us
	.dbend
	.dbfunc e delay_100us _delay_100us fV
	.even
_delay_100us::
	.dbline -1
	.dbline 70
; }
; void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
; {
	.dbline 71
;  delay_50us();
	xcall _delay_50us
	.dbline 72
;  delay_50us();
	.dbline -2
L5:
	.dbline 0 ; func end
	xjmp _delay_50us
	.dbend
	.dbfunc e delay_n100us _delay_n100us fV
;         n100us -> R20
	.even
_delay_n100us::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 75
; }
; void delay_n100us(unsigned char n100us)
; {
	xjmp L8
L7:
	.dbline 77
;  while(n100us--)                          
;  delay_100us();
	xcall _delay_100us
L8:
	.dbline 76
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L7
X0:
	.dbline -2
L6:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r n100us 20 c
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
	.even
_delay_1ms::
	.dbline -1
	.dbline 89
; }
; /*delay_n100us(2)        250us
; delay_n100us(3)          360us
; delay_n100us(4)          470us
; delay_n100us(5)          580us
; delay_n100us(6)          690us
; delay_n100us(7)       800us
; delay_n100us(8)          900us              主要是由于函数声明及while,,,大概6us
; 
; */
; void delay_1ms()
; {
	.dbline 90
;  delay_100us();
	xcall _delay_100us
	.dbline 91
;  delay_100us();
	xcall _delay_100us
	.dbline 92
;  delay_100us();
	xcall _delay_100us
	.dbline 93
;  delay_100us();
	xcall _delay_100us
	.dbline 94
;  delay_100us();
	xcall _delay_100us
	.dbline 95
;  delay_100us();
	xcall _delay_100us
	.dbline 96
;  delay_100us();
	xcall _delay_100us
	.dbline 97
;  delay_100us();
	xcall _delay_100us
	.dbline 98
;  delay_100us();
	xcall _delay_100us
	.dbline 99
;  delay_100us();
	.dbline -2
L10:
	.dbline 0 ; func end
	xjmp _delay_100us
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;            nms -> R20,R21
	.even
_delay_nms::
	st -y,R20
	st -y,R21
	movw R20,R16
	.dbline -1
	.dbline 109
; }
; /********************************************************************
; 函 数 名：Delay_ms
; 建立日期：2010年1月28日
; 修改日期：
; 函数作用：毫秒级的精确延时程序
; 说    明：
; ********************************************************************/
; void delay_nms(unsigned int nms)
; {
	xjmp L13
L12:
	.dbline 111
;  while(nms--) 
;  delay_1ms();
	xcall _delay_1ms
L13:
	.dbline 110
	movw R2,R20
	subi R20,1
	sbci R21,0
	tst R2
	brne L12
	tst R3
	brne L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ld R21,y+
	ld R20,y+
	ret
	.dbsym r nms 20 i
	.dbend
	.dbfunc e delay_ns _delay_ns fV
;             ns -> R20
	.even
_delay_ns::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 114
; }
; void delay_ns(unsigned char ns)
; {
	xjmp L17
L16:
	.dbline 116
;  while(ns--) 
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L16
X2:
	.dbline -2
L15:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r ns 20 c
	.dbend
	.dbfile E:\DMAVR-~3\TFTTEST\TFTTEST.C
	.dbfunc e DisplayData _DisplayData fV
	.even
_DisplayData::
	sbiw R28,4
	.dbline -1
	.dbline 23
; //DMAVR-128的基于TFT彩屏液晶测试程序，用来显示字符汉字和图片
; //相关外部头文件：main.h tft.h GB2312.h ascii8x16.h 使用前请将相关头文件加入编译器安装路径下的avr文件夹
; //图片数据文件picture-xin.c mmp.c ，存储在Flash中
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; 
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
; void DisplayData()
;  {
	.dbline 24
;     DisplayChar(2+'0',0,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	clr R18
	ldi R16,50
	xcall _DisplayChar
	.dbline 25
; 	DisplayChar(0+'0',1,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,1
	ldi R16,48
	xcall _DisplayChar
	.dbline 26
; 	DisplayChar(1+'0',2,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,2
	ldi R16,49
	xcall _DisplayChar
	.dbline 27
; 	DisplayChar(0+'0',3,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,3
	ldi R16,48
	xcall _DisplayChar
	.dbline 29
;     
; 	DisplayChar('/',4,4,0x0eee);  					// "/"符号
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,4
	ldi R16,47
	xcall _DisplayChar
	.dbline 31
; 
; 	DisplayChar(0+'0',5,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,5
	ldi R16,48
	xcall _DisplayChar
	.dbline 32
; 	DisplayChar(1+'0',6,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,6
	ldi R16,49
	xcall _DisplayChar
	.dbline 33
; 	DisplayChar('/',7,4,0x0eee);  					// "/"符号
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,7
	ldi R16,47
	xcall _DisplayChar
	.dbline 36
; 
; 
; 	DisplayChar(2+'0',8,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,8
	ldi R16,50
	xcall _DisplayChar
	.dbline 37
; 	DisplayChar(9+'0',9,4,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,9
	ldi R16,57
	xcall _DisplayChar
	.dbline 39
;     
; 	DisplayGB2312(6,5,4,0xa000);   					//星
	ldi R24,40960
	ldi R25,160
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,5
	ldi R16,6
	xcall _DisplayGB2312
	.dbline 40
; 	DisplayGB2312(7,6,4,0xa000);   					//期
	ldi R24,40960
	ldi R25,160
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	ldi R18,6
	ldi R16,7
	xcall _DisplayGB2312
	.dbline 41
; 	DisplayGB2312(5+7,7,4,0xa000);  			 	//星期几
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
	.dbline 0 ; func end
	adiw R28,4
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	sbiw R28,4
	.dbline -1
	.dbline 51
;  }
; 
; 
; 
; //***********************************************************************
; //         主函数
; //***********************************************************************
; 
; void main(void)
; {
	.dbline 54
;   uchar i;
;   //delay_ms(100);
;   McuInit();                                         //单片机初始化
	xcall _McuInit
	.dbline 55
;   LCD_RD1; 
	lds R24,101
	ori R24,16
	sts 101,R24
	.dbline 56
;   LCD_Init();
	xcall _LCD_Init
	.dbline 57
;   LCD_clear(0);
	clr R16
	clr R17
	xcall _LCD_clear
	xjmp L22
L21:
	.dbline 60
; 	
;   while(1)
;     {
	.dbline 61
; 		DisplayString("DMAVR-128 Board",0,1,0xeee);  //字符串显示调用
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
	.dbline 62
; 		DisplayString("TFT Testing",2,2,0xeee);		 //字符串显示调用
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
	.dbline 63
; 		DisplayData();								 //字符汉字调用
	xcall _DisplayData
	.dbline 64
; 		delay_nms(1000);								 //延时
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 65
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 66
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 67
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 68
; 		LCD_ph();									 //大屏显示图片128X160
	xcall _LCD_ph
	.dbline 69
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 70
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 71
; 	    LCD_MM();									 //小屏显示图片96X64
	xcall _LCD_MM
	.dbline 72
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 73
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 74
; 		LCD_test();									 //显示彩条和纯色
	xcall _LCD_test
	.dbline 75
; 		LCD_clear(0);								 //清屏
	clr R16
	clr R17
	xcall _LCD_clear
	.dbline 78
; 
; 		
;     }
L22:
	.dbline 59
	xjmp L21
X3:
	.dbline -2
L20:
	.dbline 0 ; func end
	adiw R28,4
	ret
	.dbsym l i 5 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTTEST\TFTTEST.C
_postion_y::
	.blkb 1
	.dbfile F:\PROGRA~1\iccavr\include\TFT_main.h
	.dbsym e postion_y _postion_y c
_postion_x::
	.blkb 1
	.dbsym e postion_x _postion_x c
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\TFT_main.h
L25:
	.blkb 12
	.area idata
	.byte 'T,'F,'T,32,'T,'e,'s,'t,'i,'n,'g,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\TFT_main.h
L24:
	.blkb 16
	.area idata
	.byte 'D,'M,'A,'V,'R,45,49,50,56,32,'B,'o,'a,'r,'d,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\TFT_main.h
; }
; 
; 
