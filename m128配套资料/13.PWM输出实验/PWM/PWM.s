	.module PWM.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的定时器实现快速PWM输出示例程序，定时器0溢出中断的方式
; //PWM输出通过控制LED发光来直观的看到效果，改变OCR0的值，可以控制亮度
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
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
; #define f_count         25                    //0CR0寄存器初始值
	.dbline 21
; #define timer_clk       0x07
	nop
	.dbline 22
; 
	nop
	.dbline 23
; #define uchar           unsigned char
	nop
	.dbline 24
; #define uint            unsigned int
	nop
	.dbline 25
; 
	nop
	.dbline 26
; #define Data_IO	        PORTA                //数码管数据口
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
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
	.dbline 32
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
	nop
	.dbline 33
; //*************************************************************************
	nop
	.dbline 34
; //			初始化子程序
	nop
	.dbline 35
; //*************************************************************************
	nop
	.dbline 36
; void system_init()                                   //IO口初始化
	nop
	.dbline 37
; {
	nop
	.dbline 38
;   
	nop
	.dbline 39
;   PORTB=0xff;                                       //PB设置为输出
	nop
	.dbline 40
;   DDRB=0xff;                                        //上拉电阻无效
	nop
	.dbline 41
;   
	nop
	.dbline 42
;   D_LE1;//关掉数码管，以免显示乱码                   
	nop
	.dbline 43
;   W_LE1;
	nop
	.dbline 44
;   Data_IO=0xFF;//关数码管            
	nop
	.dbline 45
;   W_LE0;
	nop
	.dbline 46
; 
	nop
	.dbline 47
; }
	nop
	.dbline 48
; 
	nop
	.dbline 49
; void timer0_init()                                 //定时器初始化
	nop
	.dbline 50
; {
	nop
	.dbline 51
;   TCCR0=0x68|timer_clk;                            //快读PWM模式，OC0输出，1024分频
	nop
	.dbline 52
;   OCR0=f_count;                                    //OCR0比较匹配寄存器值
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
;   TIFR=0x01;                                       //清中断标志位
;   TIMSK=0x01;                                      //使能定时器0溢出中断
; }
; 
	.dbline 57
; 
	xcall _delay_3us
	.dbline 58
; //*************************************************************************
	xcall _delay_3us
	.dbline 59
; //		定时器0中断服务子程序
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
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:17
; void TIMER0_ISR() 	 	
; {
	.dbline 64
;   OCR0=f_count;                                 //改变OCR0的值可以改变PWM输出
	xcall _delay_10us
	.dbline 65
; }
	xcall _delay_10us
	.dbline 66
; 
	xcall _delay_10us
	.dbline 67
; //*************************************************************************
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
; //		主程序
; //*************************************************************************
; 
	.dbline 71
; void main(void)
	xcall _delay_50us
	.dbline 72
; {
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
;   system_init();                             //系统初始化.PB4输出PWM波形
;   timer0_init();                             //定时器0初始化，完成PWM相关配置
;   SREG|=0x80;                                //开启全局中断
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;   while(1)
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
;   {
;   }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 90
; }
	xcall _delay_100us
	.dbline 91
; }
	xcall _delay_100us
	.dbline 92
; }
	xcall _delay_100us
	.dbline 93
; }
	xcall _delay_100us
	.dbline 94
; }
	xcall _delay_100us
	.dbline 95
; }
	xcall _delay_100us
	.dbline 96
; }
	xcall _delay_100us
	.dbline 97
; }
	xcall _delay_100us
	.dbline 98
; }
	xcall _delay_100us
	.dbline 99
; }
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
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; }
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
; }
; }
; }
; }
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\15.PWM输出实验\PWM\PWM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 37
	.dbline 39
	ldi R24,255
	out 0x18,R24
	.dbline 40
	out 0x17,R24
	.dbline 42
	sbi 0x12,4
	.dbline 43
	sbi 0x12,5
	.dbline 44
	out 0x1b,R24
	.dbline 45
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
	.dbline 51
	ldi R24,111
	out 0x33,R24
	.dbline 52
	ldi R24,25
	out 0x31,R24
	.dbline 53
	ldi R24,1
	out 0x36,R24
	.dbline 54
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\15.PWM输出实验\PWM\PWM.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R24
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 63
	.dbline 64
	ldi R24,25
	out 0x31,R24
	.dbline -2
L21:
	ld R24,y+
	out 0x3f,R24
	ld R24,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 72
	.dbline 73
	xcall _system_init
	.dbline 74
	xcall _timer0_init
	.dbline 75
	bset 7
L23:
	.dbline 77
	.dbline 78
L24:
	.dbline 76
	xjmp L23
X1:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
