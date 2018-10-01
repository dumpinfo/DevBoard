	.module DAC.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\DAC\DAC.C
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
	.dbfile E:\DMAVR-~3\DAC\DAC.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 37
; //DMAVR-128的DAC转换驱动程序，DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615
; //驱动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换，LED指示灯对应从暗到亮
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
; #define cs0     PORTB &= ~(1 << PB0)
; #define cs1   	PORTB |= (1 << PB0)
; #define din0    PORTB &= ~(1 << PB2)
; #define din1   	PORTB |= (1 << PB2)
; #define dout0   PORTB &= ~(1 << PB3)
; #define dout1   PORTB |= (1 << PB3)
; #define sclk0   PORTB &= ~(1 << PB1)
; #define sclk1   PORTB |= (1 << PB1)
; 
; uint da_data;
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()
; {
	.dbline 39
; 
; 	PORTB = 0xFF;				        //电平设置
	ldi R24,255
	out 0x18,R24
	.dbline 40
; 	DDRB = 0xFF;				        //方向输出
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e DAC_SER _DAC_SER fV
;       da_data2 -> R10,R11
;              i -> R20
;           data -> R22,R23
	.even
_DAC_SER::
	xcall push_xgsetF00C
	movw R22,R16
	.dbline -1
	.dbline 47
; 
; }
; //*************************************************************************
; //			DAC转换程序
; //*************************************************************************
; void DAC_SER(uint data)
; {
	.dbline 51
;   uchar i;
;   uint da_data2;
; 
;   cs0;                       //片选DAC，置低有效
	cbi 0x18,0
	.dbline 52
;   sclk0;        
	cbi 0x18,1
	.dbline 54
; 
;   for (i=0;i<16;i++)         //尽管是10位DAC，但是其寄存器为16位，只有10位数据有效
	clr R20
	xjmp L24
L21:
	.dbline 55
;   {
	.dbline 56
;    da_data2=data&0x8000;    //逐位取出
	movw R24,R22
	andi R24,0
	andi R25,128
	movw R10,R24
	.dbline 57
;    if(da_data2>>15)
	ldi R18,15
	ldi R19,0
	movw R16,R24
	xcall lsr16
	cpi R16,0
	cpc R16,R17
	breq L25
X3:
	.dbline 58
;    din1;
	sbi 0x18,2
	xjmp L26
L25:
	.dbline 60
;    else
;    din0;
	cbi 0x18,2
L26:
	.dbline 61
;    sclk1;                  //上升沿数据锁存
	sbi 0x18,1
	.dbline 62
;    data<<=1;               //移位
	lsl R22
	rol R23
	.dbline 63
;    sclk0;
	cbi 0x18,1
	.dbline 65
;    
;   }
L22:
	.dbline 54
	inc R20
L24:
	.dbline 54
	cpi R20,16
	brlo L21
X4:
	.dbline 66
;   delay_10us();				//延时10us
	xcall _delay_10us
	.dbline 67
;    cs1;
	sbi 0x18,0
	.dbline 68
;    sclk0;
	cbi 0x18,1
	.dbline -2
L20:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r da_data2 10 i
	.dbsym r i 20 c
	.dbsym r data 22 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 77
; 
; }
; 
; 
; //*************************************************************************
; //			主程序
; //*************************************************************************
; void main(void)
; {
	.dbline 78
;   system_init();              					  //系统初始化
	xcall _system_init
	xjmp L29
L28:
	.dbline 80
;   while(1)
;   {
	.dbline 81
;    for(da_data=0x000;da_data<0xffc;da_data++)    //连续转换，输出电压从小到大
	clr R2
	clr R3
	sts _da_data+1,R3
	sts _da_data,R2
	xjmp L34
L31:
	.dbline 82
;    {
	.dbline 83
;      DAC_SER(da_data);
	lds R16,_da_data
	lds R17,_da_data+1
	xcall _DAC_SER
	.dbline 84
;      delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 85
;   }
L32:
	.dbline 81
	lds R24,_da_data
	lds R25,_da_data+1
	adiw R24,1
	sts _da_data+1,R25
	sts _da_data,R24
L34:
	.dbline 81
	lds R24,_da_data
	lds R25,_da_data+1
	cpi R24,252
	ldi R30,15
	cpc R25,R30
	brlo L31
X5:
	.dbline 86
;   } 
L29:
	.dbline 79
	xjmp L28
X6:
	.dbline -2
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\DAC\DAC.C
_da_data::
	.blkb 2
	.dbsym e da_data _da_data i
; }
