	.module PWM.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM\PWM.C
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
	.dbfile E:\DMAVR-~3\PWM\PWM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 37
; //DMAVR-128的定时器实现快速PWM输出示例程序，定时器0溢出中断的方式
; //PWM输出通过控制LED发光来直观的看到效果，改变OCR0的值，可以控制亮度
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
; //			定义变量区
; //***********************************************************************
; #define f_count         25                              //0CR0寄存器初始值
; #define timer_clk       0x07
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define Data_IO	        PORTA                //数码管数据口
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()                                   //IO口初始化
; {
	.dbline 39
;   
;   PORTB=0xff;                                       //PB设置为输出
	ldi R24,255
	out 0x18,R24
	.dbline 40
;   DDRB=0xff;                                        //上拉电阻无效
	out 0x17,R24
	.dbline 42
;   
;   D_LE1;                             				//关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 43
;   W_LE1;                     
	sbi 0x12,5
	.dbline 44
;   Data_IO=0xFF;                      				//关数码管            
	out 0x1b,R24
	.dbline 45
;   W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e timer0_init _timer0_init fV
	.even
_timer0_init::
	.dbline -1
	.dbline 50
; 
; }
; 
; void timer0_init()                                 //定时器初始化
; {
	.dbline 51
;   TCCR0=0x68|timer_clk;                            //快读PWM模式，OC0输出，1024分频
	ldi R24,111
	out 0x33,R24
	.dbline 52
;   OCR0=f_count;                                    //OCR0比较匹配寄存器值
	ldi R24,25
	out 0x31,R24
	.dbline 53
;   TIFR=0x01;                                       //清中断标志位
	ldi R24,1
	out 0x36,R24
	.dbline 54
;   TIMSK=0x01;                                      //使能定时器0溢出中断
	out 0x37,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 64
	jmp _TIMER0_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM\PWM.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R24
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 63
; }
; 
; 
; //*************************************************************************
; //		定时器0中断服务子程序
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:iv_TIM0_OVF
; void TIMER0_ISR() 	 	
; {
	.dbline 64
;   OCR0=f_count;                                 //改变OCR0的值可以改变PWM输出
	ldi R24,25
	out 0x31,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R24,y+
	out 0x3f,R24
	ld R24,y+
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 72
; }
; 
; //*************************************************************************
; //		主程序
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 73
;   system_init();                             //系统初始化.PB4输出PWM波形
	xcall _system_init
	.dbline 74
;   timer0_init();                             //定时器0初始化，完成PWM相关配置
	xcall _timer0_init
	.dbline 75
;   SREG|=0x80;                                //开启全局中断
	bset 7
L23:
	.dbline 77
;   while(1)
;   {
	.dbline 78
;   }
L24:
	.dbline 76
	xjmp L23
X3:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
; }
