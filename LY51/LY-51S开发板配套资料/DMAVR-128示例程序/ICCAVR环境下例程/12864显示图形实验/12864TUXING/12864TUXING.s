	.module _12864TUXING.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 9
; //********************************************************************
; /*函 数 名：delay_us
; 建立日期：2010年1月28日
; 编译环境：ICCAVR7.16A
; 函数作用：微秒级的延时程序
; 说    明：7.3728M晶振下
; ********************************************************************/
; void delay_1us(void)                 //1us延时函数，不能连续调用， 
; { 
	.dbline 10
;    asm("nop");                       //1时钟周期
	nop
	.dbline 11
;    asm("nop");
	nop
	.dbline 12
;    asm("nop");
	nop
	.dbline 13
;    asm("nop");
	nop
	.dbline 14
;    asm("nop");                       //1T
	nop
	.dbline 15
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
	.dbline 19
; 
; }
; void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
; { 
	.dbline 21
;    
;    asm("nop");
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
;    asm("nop");
	nop
	.dbline 26
;    asm("nop");
	nop
	.dbline 27
;    asm("nop");                       
	nop
	.dbline 28
;    asm("nop");
	nop
	.dbline 29
;    asm("nop");
	nop
	.dbline 30
;    asm("nop");
	nop
	.dbline 31
;    asm("nop");                       
	nop
	.dbline 32
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
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_10us _delay_10us fV
	.even
_delay_10us::
	.dbline -1
	.dbline 45
; } 
; 
; void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
; {
	.dbline 46
;    delay_3us();
	xcall _delay_3us
	.dbline 47
;    delay_3us(); 
	xcall _delay_3us
	.dbline 48
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
	.dbline 52
; }
;   
; void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
; { 
	.dbline 53
;    delay_10us();
	xcall _delay_10us
	.dbline 54
;    delay_10us(); 
	xcall _delay_10us
	.dbline 55
;    delay_10us();
	xcall _delay_10us
	.dbline 56
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
	.dbline 59
; }
; void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
; {
	.dbline 60
;  delay_50us();
	xcall _delay_50us
	.dbline 61
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
	.dbline 64
; }
; void delay_n100us(unsigned char n100us)
; {
	xjmp L8
L7:
	.dbline 66
;  while(n100us--)                          
;  delay_100us();
	xcall _delay_100us
L8:
	.dbline 65
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
	.dbline 78
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
	.dbline 79
;  delay_100us();
	xcall _delay_100us
	.dbline 80
;  delay_100us();
	xcall _delay_100us
	.dbline 81
;  delay_100us();
	xcall _delay_100us
	.dbline 82
;  delay_100us();
	xcall _delay_100us
	.dbline 83
;  delay_100us();
	xcall _delay_100us
	.dbline 84
;  delay_100us();
	xcall _delay_100us
	.dbline 85
;  delay_100us();
	xcall _delay_100us
	.dbline 86
;  delay_100us();
	xcall _delay_100us
	.dbline 87
;  delay_100us();
	xcall _delay_100us
	.dbline 88
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
	.dbline 98
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
	.dbline 100
;  while(nms--) 
;  delay_1ms();
	xcall _delay_1ms
L13:
	.dbline 99
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
	.dbline 103
; }
; void delay_ns(unsigned char ns)
; {
	xjmp L17
L16:
	.dbline 105
;  while(ns--) 
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 104
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
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
_photo1::
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,4
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 56,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,12
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 56,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,16
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,30
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'x,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 29,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 28,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 31,158
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 7,254
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'h,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 29,129
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 199,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 30,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 31,190
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 7,255
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 220,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,31
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 252,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 227,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 30,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 28,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,248
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,249
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 152,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,31
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 248,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 230,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 56,'l
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,184
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,241
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 184,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,30
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 48,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 198,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 63,'h
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 27,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,187
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 240,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,28
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 48,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 133,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'x,224
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 63,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 31,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,243
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 176,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,63
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 246,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 141,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'y,224
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 15,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,225
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 144,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 251,15
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 221,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 241,224
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,195
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 251,7
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 57,64
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 241,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,224
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,227
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 242,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'i,'a
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 243,240
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,160
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 12,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,'f
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 242,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'R,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 179,48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 52,176
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 8,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 6,6
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,16
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'v,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 16,3
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 158,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 17,24
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 8,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 24,7
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 124,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,3
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 8,24
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,12
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 8,192
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,13
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 96,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,3
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,12
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,64
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,15
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 96,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,4
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,32
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbsym e photo1 _photo1 A[528:528]c
_photo2::
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 94,189
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,14
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'w,236
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'x,241
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 142,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'R,165
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,17
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 34,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 145,18
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 32,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 145,42
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'R,165
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 20,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 145,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 17,42
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'R,165
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,9
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 20,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'a,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 17,42
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 161,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,17
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 20,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 129,18
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 38,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 145,42
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 161,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,15
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 136,248
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,225
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 198,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 14,'k
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 136,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'p,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbsym e photo2 _photo2 A[512:512]c
_photo3::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,24
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 15,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,16
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,14
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 34,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 12,24
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,5
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'B,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,12
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,13
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,127
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'B,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 220,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,232
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,62
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 179,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,248
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 188,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,62
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 235,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,24
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,184
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 254,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,60
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 254,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 202,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,152
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 195,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 15,143
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 2,127
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 193,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'x
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 5,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 193,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 160,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'y
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 207,160
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 15,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,136
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'w
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 216,162
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 56,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,137
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,127
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 216,130
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 27,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,154
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 48,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,243
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,194
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,158
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 48,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'p,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,194
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 60,28
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,248
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,180
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 40,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 126,130
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,14
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,254
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,230
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 44,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,226
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 38,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'p,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 35,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbsym e photo3 _photo3 A[512:512]c
_photo4::
	.blkb 2
	.area idata
	.byte 14,28
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'x,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 124,15
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,255
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'g,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,6
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 62,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,15
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 20,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'C
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 48,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 31,195
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,31
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,2
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'd,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'C
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 177,252
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,60
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 9,254
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,'r
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,126
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,134
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,62
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 12,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,124
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,58
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'D
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,134
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,127
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,'F
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'G,155
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'d
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,132
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,127
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 130,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 32,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'F,217
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,36
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 17,4
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,239
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 195,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'b
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 228,40
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 191,164
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 29,8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,231
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 193,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,33
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 252,32
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,252
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 31,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,227
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,231
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 50,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,220
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 35,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,195
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,254
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 18,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,132
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 33,216
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'q,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 14,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 2,50
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,4
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,136
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 57,194
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,28
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,18
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 62,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,140
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,130
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,19
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,3
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 129,4
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 8,130
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 2,17
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 50,128
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,5
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 198,28
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 8,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,50
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 180,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 14,12
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 254,56
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,250
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'L,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,248
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,206
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 12,64
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,254
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,38
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,142
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 11,192
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,191
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,22
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,139
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 26,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,159
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,21
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,145
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,207
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,12
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,241
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 242,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,207
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,7
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,16
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 18,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,199
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,19
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 30,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,227
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,23
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 32,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,225
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,28
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,224
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,96
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,16
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbsym e photo4 _photo4 A[512:512]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\12864TUXING\12864TUXING.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 210
; //DMAVR-128的12864型LCD显示图形驱动程序
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
; #include <delay.h>
; #include <iom128v.h>
; 
; //***********************************************************************
; //	定义变量区
; //***********************************************************************
; #define uchar unsigned char
; #define uint  unsigned int
; 
; 
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
; #define RS_SET	PORTF |= (1 << PF1)                  //RS置高
; 
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
; #define RW_SET	PORTF |= (1 << PF2)                  //RW置高
; 
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
; #define EN_SET	PORTF |= (1 << PF3)                  //E置高
; 
; #define LOW		    0
; #define HIGH		1
; #define FIRST_ADDR  0          	     //定义字符/汉字显示起始位置
; 
; //12864相关初始化指令
; #define CLEAR_SCREEN	0x01		//清屏指令：清屏且AC值为00H
; #define AC_INIT		    0x02		//将AC设置为00H。且游标移到原点位置
; #define CURSE_ADD	    0x06		//设定游标移到方向及图像整体移动方向（默认游标右移，图像整体不动）
; #define FUN_MODE	    0x30		//工作模式：8位基本指令集
; #define DISPLAY_ON	    0x0c		//显示开,显示游标，且游标位置反白
; #define DISPLAY_OFF	    0x08		//显示关
; #define CURSE_DIR  	    0x14		//游标向右移动:AC=AC+1
; #define SET_CG_AC	    0x40		//设置AC，范围为：00H~3FH
; #define SET_DD_AC	    0x80
; #define FUN_MODEK	    0x36		//工作模式：8位扩展指令集
; 
; #define X1address       0x80        //12864上半屏X轴起始地址
; #define X2address       0x88        //12864下半屏X轴起始地址
; #define Yaddress        0x80        //Y轴起始地址
; 
; #define Data_IO	        PORTA                //液晶数据口
; #define Data_DDR        DDRA                 //数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; //图形数据<成功从欣开始图片>
; //#pragma data:code 
;  uchar  photo1[]={
; 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x38,0x01,
; 0x80,0x00,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x00,0x00,0x00,0x00,0x38,0x01,
; 0x80,0x00,0x0C,0x00,0x00,0x80,0x0C,0x10,0x01,0x1E,0x00,0x00,0x00,0x70,0x78,0x01,
; 0x80,0x00,0x1D,0x00,0x01,0x80,0x1C,0x38,0x1F,0x9E,0x07,0xFE,0x00,0x70,0x68,0x01,
; 0x80,0x00,0x1D,0x81,0xC7,0xF0,0x1E,0x78,0x1F,0xBE,0x07,0xFF,0x00,0xF0,0xDC,0x01,
; 0x80,0x1F,0xFC,0x01,0xE3,0xF0,0x1E,0x78,0x1C,0x3C,0x01,0xF8,0x03,0xF9,0x98,0x01,
; 0x80,0x1F,0xF8,0x01,0xE6,0xC0,0x3C,0xF0,0x38,0x6C,0x03,0xB8,0x03,0xF1,0xB8,0x01,
; 0x80,0x1E,0x30,0x01,0xC6,0x80,0x3C,0xF0,0x3F,0x68,0x1B,0x78,0x03,0xBB,0xF0,0x01,
; 0x80,0x1C,0x30,0x01,0x85,0x80,0x78,0xE0,0x3F,0x78,0x1F,0xF0,0x03,0xF3,0xB0,0x01,
; 0x80,0x3F,0xF6,0x01,0x8D,0x80,0x79,0xE0,0x3C,0x78,0x0F,0xC0,0x01,0xE1,0x90,0x01,
; 0x80,0x3C,0xFB,0x0F,0xDD,0x80,0xF1,0xE0,0x3C,0xF0,0x0C,0xC0,0x00,0xC3,0x80,0x01,
; 0x80,0x3C,0xFB,0x07,0x39,0x40,0xF1,0xF0,0x3C,0xE0,0x0C,0xC0,0x01,0xE3,0x80,0x01,
; 0x80,0x38,0xF2,0x00,0x69,0x61,0xF3,0xF0,0x3C,0xA0,0x0C,0xC0,0x03,0x66,0x80,0x01,
; 0x80,0x39,0xF2,0x00,0x52,0x39,0xB3,0x30,0x34,0xB0,0x08,0x80,0x06,0x06,0x80,0x01,
; 0x80,0x10,0x76,0x00,0x10,0x03,0x9E,0x38,0x11,0x18,0x08,0x80,0x18,0x07,0x80,0x01,
; 0x80,0x00,0x7C,0x00,0x00,0x03,0x08,0x18,0x00,0x0C,0x08,0xC0,0x00,0x0D,0x00,0x01,
; 0x80,0x00,0x60,0x00,0x00,0x03,0x00,0x0C,0x00,0x00,0x00,0x40,0x00,0x0F,0x00,0x01,
; 0x80,0x00,0x60,0x00,0x00,0x02,0x00,0x04,0x00,0x00,0x00,0x20,0x00,0x06,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01
; 
; }; 
; 
;  uchar photo2[]={
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x03,0x5E,0xBD,0x60,0x0E,0x77,0xEC,0x78,0xF1,0xE0,0x07,0x8E,0x7C,0x00,0x01,
; 0x80,0x01,0x52,0xA5,0x40,0x11,0x22,0x30,0x91,0x12,0x20,0x08,0x91,0x2A,0x00,0x01,
; 0x80,0x01,0x52,0xA5,0x40,0x07,0x14,0x20,0x91,0x02,0x00,0x08,0x11,0x2A,0x00,0x01,
; 0x80,0x01,0x52,0xA5,0x40,0x09,0x14,0x20,0x61,0x02,0x00,0x08,0x11,0x2A,0x00,0x01,
; 0x80,0x00,0xA1,0x42,0x8C,0x11,0x14,0x20,0x81,0x12,0x26,0x08,0x91,0x2A,0x00,0x01,
; 0x80,0x00,0xA1,0x42,0x8C,0x0F,0x88,0xF8,0xF0,0xE1,0xC6,0x07,0x0E,0x6B,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x88,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
; 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
; 
; };
; 
; //图形数据<欣世纪电子>
;  uchar photo3[]={
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x02,0x00,0x00,0x00,0x18,0x03,0xC0,0x00,0x00,0x03,0xC0,0x00,0x00,0x00,0x00,
; 0x00,0x02,0x00,0x00,0x00,0x30,0x0F,0xC0,0x00,0x00,0x06,0x60,0x00,0x06,0x00,0x00,
; 0x00,0x06,0x00,0x00,0x00,0x70,0x18,0x40,0x00,0x00,0x04,0x10,0x00,0x06,0x00,0x00,
; 0x00,0x0E,0x00,0x00,0x01,0xE0,0x22,0x40,0x00,0x00,0x0C,0x18,0x00,0x05,0x00,0x00,
; 0x00,0x1E,0x00,0x00,0x07,0xE0,0x42,0x00,0x00,0x07,0xF8,0x0C,0x00,0x0D,0x00,0x00,
; 0x00,0x1E,0x00,0x7F,0xFF,0xC0,0x42,0x60,0x00,0x1F,0xDC,0x06,0x00,0xE8,0x80,0x00,
; 0x00,0x3E,0x01,0xFF,0xFF,0x80,0xB3,0xE0,0x00,0x70,0x04,0x08,0x00,0xF8,0xBC,0x00,
; 0x00,0x3E,0x03,0xFF,0xFF,0x00,0xEB,0x20,0x00,0xC0,0x04,0x18,0x00,0xB8,0xFE,0x00,
; 0x00,0x3C,0x07,0xFF,0xFE,0x00,0xCA,0x20,0x01,0x00,0x06,0x30,0x00,0x98,0xC3,0x00,
; 0x00,0x7C,0x0F,0x8F,0xF8,0x00,0x8C,0x20,0x02,0x7F,0x03,0xE0,0x00,0x08,0xC1,0x00,
; 0x00,0x78,0x7F,0xC0,0x00,0x00,0x8C,0x20,0x05,0xFF,0xC1,0xC0,0x00,0x08,0xA0,0x80,
; 0x00,0x79,0xFF,0xF0,0x00,0x00,0xCF,0xA0,0x0F,0x00,0xE0,0x00,0x00,0x88,0xE0,0x80,
; 0x00,0x77,0x00,0x7C,0x00,0x00,0xD8,0xA2,0x1C,0x00,0x38,0x00,0x00,0x89,0xE0,0x40,
; 0x00,0x7F,0x00,0x1E,0x00,0x00,0xD8,0x82,0x1B,0xC0,0x1C,0x00,0x00,0x9A,0x30,0x40,
; 0x00,0xF3,0xC0,0x07,0x00,0x00,0xF8,0xC2,0x3F,0xF0,0x06,0xF0,0x00,0x9E,0x30,0x40,
; 0x00,0xC0,0x70,0x03,0x80,0x00,0xF8,0xC2,0x3C,0x1C,0x03,0xF8,0x00,0xB4,0x28,0x20,
; 0x01,0x80,0x1C,0x01,0x80,0x00,0x7E,0x82,0x60,0x0E,0x00,0xFE,0x00,0xE6,0x2C,0x20,
; 0x03,0x00,0x06,0x00,0xC0,0x00,0x7F,0x06,0xC0,0x02,0x00,0xFF,0xC0,0xE2,0x26,0x20,
; 0x07,0xF0,0x03,0x00,0x70,0x00,0x3F,0x06,0x80,0x01,0x00,0xFF,0xC0,0x42,0x23,0x60,
; 
; };
;  uchar  photo4[]={
; 0x0E,0x1C,0x01,0x80,0x78,0x00,0x7C,0x0F,0x00,0x03,0x8C,0xFF,0x00,0x42,0x67,0xC0,
; 0x18,0x06,0x00,0x80,0x3E,0x00,0xC0,0x0F,0x00,0x02,0x14,0x7C,0x00,0x43,0xFF,0xF0,
; 0x30,0x03,0x00,0x40,0x1F,0xC3,0x80,0x1F,0x80,0x02,0x64,0x7C,0x00,0x43,0xB1,0xFC,
; 0x60,0x03,0x80,0x3C,0x09,0xFE,0x00,0x1F,0xC0,0x72,0x60,0x7E,0x00,0x42,0x10,0x86,
; 0x40,0x03,0x80,0x3E,0x0C,0x00,0x00,0x1F,0xC0,0x7C,0x00,0x3A,0x00,0x44,0x10,0x86,
; 0x80,0x03,0xC0,0x7F,0x06,0x00,0x00,0x1F,0xE0,0x46,0x47,0x9B,0x00,0x64,0x10,0x84,
; 0x00,0x01,0xE0,0x7F,0x82,0x00,0x00,0x30,0x20,0x42,0x46,0xD9,0x00,0x24,0x11,0x04,
; 0x00,0x01,0xE0,0xEF,0xC3,0x00,0x00,0x60,0x00,0x62,0xE4,0x28,0xBF,0xA4,0x1D,0x08,
; 0x00,0x01,0xE0,0xE7,0xC1,0x80,0x00,0xC0,0x00,0x21,0xFC,0x20,0xFF,0xFC,0x1F,0x30,
; 0x00,0x00,0xF0,0xE3,0xC0,0xC0,0x01,0x80,0x01,0xE7,0x32,0x40,0x7F,0xDC,0x23,0xF0,
; 0x00,0x00,0xF0,0xC3,0x80,0x60,0x03,0x00,0x03,0xFE,0x12,0x40,0x7F,0x84,0x21,0xD8,
; 0x00,0x00,0x71,0xC0,0x00,0x30,0x0E,0x00,0x02,0x32,0x13,0x80,0x3F,0x04,0x60,0x88,
; 0x00,0x00,0x39,0xC2,0x40,0x1C,0x1C,0x00,0x04,0x12,0x13,0x80,0x3E,0x03,0xC0,0x8C,
; 0x00,0x00,0x18,0x82,0x40,0x07,0xF8,0x00,0x04,0x13,0x13,0x80,0x18,0x03,0x81,0x04,
; 0x00,0x00,0x08,0x82,0x40,0x01,0xC0,0x00,0x02,0x11,0x32,0x80,0x1C,0x05,0xC6,0x1C,
; 0x00,0x00,0x08,0x42,0x40,0x00,0x00,0x00,0x03,0x32,0xB4,0x40,0x0E,0x0C,0xFE,0x38,
; 0x00,0x00,0x00,0x42,0x40,0x00,0x00,0x00,0x01,0xFA,0x4C,0x40,0x07,0xF8,0x3F,0xE0,
; 0x00,0x00,0x00,0x42,0x40,0x00,0x00,0x00,0x00,0xCE,0x0C,0x40,0x07,0xFE,0x00,0x00,
; 0x00,0x00,0x00,0x26,0x00,0x00,0x00,0x00,0x00,0x8E,0x0B,0xC0,0x07,0xBF,0x00,0x00,
; 0x00,0x00,0x00,0x16,0x80,0x00,0x00,0x00,0x00,0x8B,0x1A,0x00,0x07,0x9F,0x80,0x00,
; 0x00,0x00,0x00,0x15,0x80,0x00,0x00,0x00,0x00,0x91,0xF0,0x00,0x03,0xCF,0xC0,0x00,
; 0x00,0x00,0x00,0x0C,0x80,0x00,0x00,0x00,0x00,0xF1,0xF2,0x00,0x03,0xCF,0xC0,0x00,
; 0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x00,0x00,0x10,0x12,0x00,0x01,0xC7,0xC0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x13,0x1E,0x00,0x01,0xE3,0xE0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x17,0x20,0x00,0x00,0xE1,0xE0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1C,0xE0,0x00,0x00,0xE0,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x60,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; };
; //#pragma data:data
; 
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()
; {
	.dbline 212
; 
; 	Data_IO = 0xFF;				        //电平设置
	ldi R24,255
	out 0x1b,R24
	.dbline 213
; 	Data_DDR = 0xFF;				    //方向输出
	out 0x1a,R24
	.dbline 214
; 	PORTF = 0xFF;                       //电平设置
	sts 98,R24
	.dbline 215
; 	DDRF = 0xFF;                        //方向输出
	sts 97,R24
	.dbline 216
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 217
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 218
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 219
;     W_LE1;                     
	sbi 0x12,5
	.dbline 220
;     Data_IO=0xFF;                      //关数码管            
	out 0x1b,R24
	.dbline 221
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R10
	.even
_LCD_write_com::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 230
; }
; 
; //***********************************************************************
; //	显示屏命令写入函数
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 231
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 232
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 233
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 234
; 	Data_IO = com;
	out 0x1b,R10
	.dbline 235
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 236
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r com 10 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R10
	.even
_LCD_write_data::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 243
; }
; //***********************************************************************
; //	显示屏数据写入函数
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 244
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 245
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 246
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 247
; 	Data_IO = data;
	out 0x1b,R10
	.dbline 248
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 249
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r data 10 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 257
; }
; 
; //***********************************************************************
; //	显示屏清空显示
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 258
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 259
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L22:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e DisplayCgrom _DisplayCgrom fV
;             hz -> R20,R21
;           addr -> R10
	.even
_DisplayCgrom::
	xcall push_xgset300C
	movw R20,R18
	mov R10,R16
	.dbline -1
	.dbline 269
; }
; 
; //***********************************************************************
; //函数名称：DisplayCgrom(uchar hz)显示CGROM里的汉字
; //入口参数：无
; //返回参数：无
; //***********************************************************************
; 
; void DisplayCgrom(uchar addr,uchar *hz)
; {
	.dbline 271
; 
; 	LCD_write_com(addr);
	mov R16,R10
	xcall _LCD_write_com
	.dbline 272
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 274
; 	while(*hz != '\0')
; 	{
	.dbline 275
; 		LCD_write_data(*hz);
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 276
; 		hz++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 277
;         delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 278
; 	}
L25:
	.dbline 273
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L24
X3:
	.dbline -2
L23:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r hz 20 pc
	.dbsym r addr 10 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 287
; 
; } 
; 
; //***********************************************************************
; //	显示屏初始化函数
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 288
; 	LCD_write_com(FUN_MODE);			//显示模式设置
	ldi R16,48
	xcall _LCD_write_com
	.dbline 289
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 290
; 	LCD_write_com(FUN_MODE);			//显示模式设置
	ldi R16,48
	xcall _LCD_write_com
	.dbline 291
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 292
;     LCD_write_com(DISPLAY_ON);			//显示开
	ldi R16,12
	xcall _LCD_write_com
	.dbline 293
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 294
;     LCD_write_com(CLEAR_SCREEN);        //清屏
	ldi R16,1
	xcall _LCD_write_com
	.dbline 295
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	.dbline -2
L27:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e Display_photo1 _Display_photo1 fV
;              i -> R20,R21
;              j -> R22,R23
;           img1 -> R10,R11
	.even
_Display_photo1::
	xcall push_xgsetF00C
	movw R10,R16
	.dbline -1
	.dbline 303
; }
; 
; //****************************************************************
; //函数名称：Display_photo(uchar *hz)显示自定义图形，分上下半屏来写
; //****************************************************************
; 
; void Display_photo1( uchar *img1)                      //写上半屏图形数据函数
; {
	.dbline 306
;    int i,j;     
; 
;    for(i=0;i<32;i++)                                 //上半屏32行
	clr R20
	clr R21
L29:
	.dbline 307
;     {  
	.dbline 308
; 		LCD_write_com(FUN_MODEK);                     //扩展指令，开绘图显示
	ldi R16,54
	xcall _LCD_write_com
	.dbline 309
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 311
;      
;  		LCD_write_com(Yaddress+i);                   //先写垂直地址，即Y地址，不能自动加一
	movw R16,R20
	subi R16,128  ; offset = 128
	sbci R17,255
	xcall _LCD_write_com
	.dbline 312
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 314
; 
;         LCD_write_com(X1address);                    //再写水平地址，即X地址
	ldi R16,128
	xcall _LCD_write_com
	.dbline 315
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 317
;       
;  	for(j=0;j<8;j++)                       //连续写入2个字节的数据，一共8次，为一行，即16*8位数据
	clr R22
	clr R23
L33:
	.dbline 318
;         {  			                                     
	.dbline 319
; 		LCD_write_data(img1[i*16+j*2]);
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	movw R2,R22
	lsl R2
	rol R3
	add R30,R2
	adc R31,R3
	add R30,R10
	adc R31,R11
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 320
; 		delay_nms(2);                       //这个延时是必须的，因为没有对液晶进行判忙操作，所以进行延时
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 321
; 		LCD_write_data(img1[i*16+j*2+1]); 
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	movw R2,R22
	lsl R2
	rol R3
	add R30,R2
	adc R31,R3
	add R30,R10
	adc R31,R11
	ldd R16,z+1
	xcall _LCD_write_data
	.dbline 322
; 		delay_nms(2);          
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 323
;         }
L34:
	.dbline 317
	subi R22,255  ; offset = 1
	sbci R23,255
	.dbline 317
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlt L33
X4:
	.dbline 325
; 
;     }
L30:
	.dbline 306
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 306
	cpi R20,32
	ldi R30,0
	cpc R21,R30
	brge X6
	xjmp L29
X6:
X5:
	.dbline -2
L28:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r i 20 I
	.dbsym r j 22 I
	.dbsym r img1 10 pc
	.dbend
	.dbfunc e Display_photo2 _Display_photo2 fV
;              i -> R20,R21
;              j -> R22,R23
;           img2 -> R10,R11
	.even
_Display_photo2::
	xcall push_xgsetF00C
	movw R10,R16
	.dbline -1
	.dbline 329
; }
; 
; void Display_photo2( uchar *img2)                   //写下半屏图形数据
; {
	.dbline 332
; 	int i,j;
; 
; 	for(i=0;i<32;i++)                         //下半屏32行
	clr R20
	clr R21
L38:
	.dbline 333
; 	{  
	.dbline 335
; 
; 	 	LCD_write_com(Yaddress+i);                //先写垂直地址，即Y地址，不能自动加一
	movw R16,R20
	subi R16,128  ; offset = 128
	sbci R17,255
	xcall _LCD_write_com
	.dbline 336
; 	    delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 337
; 		LCD_write_com(X2address);                 //再写水平地址，即X地址
	ldi R16,136
	xcall _LCD_write_com
	.dbline 338
; 	    delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 339
; 	 	 for(j=0;j<8;j++)                        //连续写入2个字节的数据，一共8次，为一行，即16*8位数据
	clr R22
	clr R23
L42:
	.dbline 340
; 	    {
	.dbline 342
; 			
; 			LCD_write_data(img2[i*16+j*2]);
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	movw R2,R22
	lsl R2
	rol R3
	add R30,R2
	adc R31,R3
	add R30,R10
	adc R31,R11
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 343
; 			delay_nms(2);                    
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 344
; 			LCD_write_data(img2[i*16+j*2+1]);  
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	movw R2,R22
	lsl R2
	rol R3
	add R30,R2
	adc R31,R3
	add R30,R10
	adc R31,R11
	ldd R16,z+1
	xcall _LCD_write_data
	.dbline 345
; 			delay_nms(2);  
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 347
;       
; 		}
L43:
	.dbline 339
	subi R22,255  ; offset = 1
	sbci R23,255
	.dbline 339
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlt L42
X7:
	.dbline 349
; 
; 	}
L39:
	.dbline 332
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 332
	cpi R20,32
	ldi R30,0
	cpc R21,R30
	brge X9
	xjmp L38
X9:
X8:
	.dbline -2
L37:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r i 20 I
	.dbsym r j 22 I
	.dbsym r img2 10 pc
	.dbend
	.dbfunc e main _main fV
;              m -> <dead>
	.even
_main::
	.dbline -1
	.dbline 358
; 
; }
; 
; //****************************************************************
; //函数名称：主函数，调用相关子程序，显示图形
; //****************************************************************
; 
; void main(void)
; {
	.dbline 360
; 	int m;
;     system_init();                      //系统初始化，设置IO口属性
	xcall _system_init
	.dbline 361
; 	delay_nms(1);                        //延时1ms
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 362
; 	LCD_init();                        //液晶参数初始化设置
	xcall _LCD_init
	.dbline 363
;     LCD_clear(); 
	xcall _LCD_clear
	xjmp L48
L47:
	.dbline 365
;   while(1)
; 	{
	.dbline 367
; 	
;     	Display_photo1(photo1);        //显示上半屏数据	
	ldi R16,<_photo1
	ldi R17,>_photo1
	xcall _Display_photo1
	.dbline 368
; 		Display_photo2(photo2);        //显示下半屏数据
	ldi R16,<_photo2
	ldi R17,>_photo2
	xcall _Display_photo2
	.dbline 369
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 370
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 372
; 
; 	   	Display_photo1(photo3);     //显示上半屏数据
	ldi R16,<_photo3
	ldi R17,>_photo3
	xcall _Display_photo1
	.dbline 373
; 		Display_photo2(photo4);     //显示下半屏数据
	ldi R16,<_photo4
	ldi R17,>_photo4
	xcall _Display_photo2
	.dbline 374
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 375
; 		delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 376
; 	}
L48:
	.dbline 364
	xjmp L47
X10:
	.dbline -2
L46:
	.dbline 0 ; func end
	ret
	.dbsym l m 1 I
	.dbend
; }
