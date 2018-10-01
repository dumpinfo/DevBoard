	.module MADA.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
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
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
_F_Rotation::
	.blkb 2
	.area idata
	.byte 226,230
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 228,236
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 232,248
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 240,242
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.dbsym e F_Rotation _F_Rotation A[8:8]c
_B_Rotation::
	.blkb 2
	.area idata
	.byte 242,240
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 248,232
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 236,228
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 230,226
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.dbsym e B_Rotation _B_Rotation A[8:8]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\MADA\MADA.C
	.dbfunc e main _main fV
;              j -> R20,R21
;              i -> R22,R23
	.even
_main::
	.dbline -1
	.dbline 36
; //DMAVR-128的步进电机驱动程序
; //步进电机为四相八拍驱动方式，额定电压5V
; //初始设置为12小时制，下午时间
; ///编译环境 ICCAVR 7.16A
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
; //			定义变量区
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define Data_IO	        PORTA                //液晶数据口
; #define Data_DDR        DDRA                 //数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; //uchar  F_Rotation[8]={0xf7,0xf3,0xfb,0xf9,0xfd,0xfc,0xfe,0xf6}; //正转表格， 0111，0011 1011，1001 1101，1100 ，1110，0110
; //uchar  B_Rotation[8]={0xf6,0xfe,0xfc,0xfd,0xf9,0xfb,0xf3,0xf7}; //反转表格，
; uchar  F_Rotation[8]={0xE2,0xE6,0xE4,0xEC,0xE8,0xF8,0xF0,0xF2};
; uchar  B_Rotation[8]={0xF2,0xF0,0xF8,0xE8,0xEC,0xE4,0xE6,0xE2};
; 
; void main(void)
; {
	.dbline 38
;  uint i,j;
;  DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 39
;  PORTD=0xFF;
	out 0x12,R24
	.dbline 40
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 41
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 42
;     W_LE1;                     
	sbi 0x12,5
	.dbline 43
;     Data_IO=0xFF;                      //关数码管            
	out 0x1b,R24
	.dbline 44
;     W_LE0; 
	cbi 0x12,5
	xjmp L21
L20:
	.dbline 46
;   while(1)
;    {
	.dbline 47
;    for(j=0;j<64*8;j++)
	clr R20
	clr R21
	xjmp L26
L23:
	.dbline 48
;    {
	.dbline 49
;     for(i=0;i<8;i++)
	clr R22
	clr R23
	xjmp L30
L27:
	.dbline 50
; 	{
	.dbline 51
;     PORTB=B_Rotation[i];
	ldi R24,<_B_Rotation
	ldi R25,>_B_Rotation
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 52
; 	delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 53
;     }
L28:
	.dbline 49
	subi R22,255  ; offset = 1
	sbci R23,255
L30:
	.dbline 49
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L27
X3:
	.dbline 54
;    }
L24:
	.dbline 47
	subi R20,255  ; offset = 1
	sbci R21,255
L26:
	.dbline 47
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L23
X4:
	.dbline 55
;    for(j=0;j<64*8;j++)
	clr R20
	clr R21
	xjmp L34
L31:
	.dbline 56
;    {
	.dbline 57
;     for(i=0;i<8;i++)
	clr R22
	clr R23
	xjmp L38
L35:
	.dbline 58
; 	{
	.dbline 59
;     PORTB=F_Rotation[i];
	ldi R24,<_F_Rotation
	ldi R25,>_F_Rotation
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 60
; 	delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 61
;     }
L36:
	.dbline 57
	subi R22,255  ; offset = 1
	sbci R23,255
L38:
	.dbline 57
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L35
X5:
	.dbline 62
;    }
L32:
	.dbline 55
	subi R20,255  ; offset = 1
	sbci R21,255
L34:
	.dbline 55
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L31
X6:
	.dbline 64
;    
;    }
L21:
	.dbline 45
	xjmp L20
X7:
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 22 i
	.dbend
; }
