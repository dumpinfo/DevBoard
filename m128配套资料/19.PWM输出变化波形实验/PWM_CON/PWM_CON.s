	.module PWM_CON.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA16的定时器实现快速PWM输出示例程序，定时器0溢出中断的方式
; //输出PWM波形驱动发光二极管，亮度由暗到灭，呈闪烁状态
; //样值采取正弦波公式，示例如下
; //正弦波采样值计算公式
; //                    f(x)=128+127*sin(2*3.1415*x/127) x=[0....127]
; //PWM输出也可通过控制LED发光来直观的看到效果，亮度持续的变化
; //可以通过选跳线帽选择是通过LED直接查看还是通过滤波器查看实际波形
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.06.14
; 
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
	.dbline 21
; 
	nop
	.dbline 22
; //***********************************************************************
	nop
	.dbline 23
; //			定义变量区
	nop
	.dbline 24
; //***********************************************************************
	nop
	.dbline 25
; #define f_count         254                              //0CR0寄存器初始值
	nop
	.dbline 26
; #define timer_clk       0x07
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
; #define uchar           unsigned char
; #define uint            unsigned int
; 
	.dbline 32
; #define Data_IO	        PORTA                //数码管数据口
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
	nop
	.dbline 33
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	nop
	.dbline 34
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
	nop
	.dbline 35
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
	nop
	.dbline 36
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
	nop
	.dbline 37
; 
	nop
	.dbline 38
; uchar auc_SinParam[128] = {
	nop
	.dbline 39
; 128,134,140,147,153,159,165,171,177,182,188,193,198,204,208,213,
	nop
	.dbline 40
; 218,222,226,230,233,237,240,242,245,247,249,251,252,253,254,254,
	nop
	.dbline 41
; 254,254,253,252,251,250,248,246,244,241,238,235,232,228,224,220,
	nop
	.dbline 42
; 215,211,206,201,196,191,185,179,174,168,162,156,150,144,137,131,
	nop
	.dbline 43
; 125,119,112,106,100,94,88,82,77,71,65,60,55,50,45,41,
	nop
	.dbline 44
; 36,32,28,24,21,18,15,12,10,8,6,5,4,3,2,2,
	nop
	.dbline 45
; 2,2,3,4,5,7,9,11,14,16,19,23,26,30,34,38,
	nop
	.dbline 46
; 43,48,52,57,63,68,74,79,85,91,97,103,109,116,122,128}; 	// 128点正弦波样本值
	nop
	.dbline 47
; 
	nop
	.dbline 48
; uchar x_SW = 8,X_LUT = 0;
	nop
	.dbline 49
; 
	nop
	.dbline 50
; //*************************************************************************
	nop
	.dbline 51
; //			初始化子程序
	nop
	.dbline 52
; //*************************************************************************
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
; void system_init()                                   //IO口初始化
; {
;   
;   PORTB=0xff;                                       //PB设置为输出
	.dbline 57
;   DDRB=0xff;                                        //上拉电阻无效
	xcall _delay_3us
	.dbline 58
;   
	xcall _delay_3us
	.dbline 59
;   D_LE1;                             				//关掉数码管，以免显示乱码                   
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
;   W_LE1;                     
;   Data_IO=0xFF;                      				//关数码管            
;   W_LE0; 
; }
	.dbline 64
; 
	xcall _delay_10us
	.dbline 65
; void timer0_init()                                 //定时器初始化
	xcall _delay_10us
	.dbline 66
; {
	xcall _delay_10us
	.dbline 67
;   TCCR0=0x68|timer_clk;                            //快读PWM模式，OC0输出，分频
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
;   OCR0=128;                                        //OCR0比较匹配寄存器值
;   TIFR=0x01;                                       //清中断标志位
;   TIMSK=0x01;                                      //使能定时器0溢出中断
	.dbline 71
; }
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
; 
; //*************************************************************************
; //		定时器0中断服务子程序
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; //*************************************************************************
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
; #pragma interrupt_handler  TIMER0_ISR:17
; void TIMER0_ISR() 	 	
; {
;     X_LUT += x_SW;  							 // 新样点指针
; 	if (X_LUT > 127) X_LUT -= 128;	         	 // 样点指针调整
; 	OCR0 =auc_SinParam[X_LUT];				  	 // 取样点指针到比较匹配寄存器
; }
; 
; //*************************************************************************
; //		主程序
; //*************************************************************************
; 
	.dbline 90
; void main(void)
	xcall _delay_100us
	.dbline 91
; {
	xcall _delay_100us
	.dbline 92
;   system_init();                             	 //系统初始化.PB3输出PWM波形
	xcall _delay_100us
	.dbline 93
;   timer0_init();                             	 //定时器0初始化，完成PWM相关配置
	xcall _delay_100us
	.dbline 94
;   SREG|=0x80;                                	 //开启全局中断
	xcall _delay_100us
	.dbline 95
;   while(1)
	xcall _delay_100us
	.dbline 96
;   {
	xcall _delay_100us
	.dbline 97
;   }
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
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
_auc_SinParam::
	.blkb 2
	.area idata
	.byte 128,134
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 140,147
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 153,159
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 165,171
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 177,182
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 188,193
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 198,204
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 208,213
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 218,222
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 226,230
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 233,237
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 240,242
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 245,247
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 249,251
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 252,253
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 254,254
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 254,254
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 253,252
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 251,250
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 248,246
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 244,241
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 238,235
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 232,228
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 224,220
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 215,211
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 206,201
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 196,191
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 185,179
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 174,168
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 162,156
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 150,144
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 137,131
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 125,'w
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'p,'j
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'd,94
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'X,'R
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'M,'G
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'A,60
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 55,50
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 45,41
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 36,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 28,24
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 21,18
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 15,12
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 10,8
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 6,5
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 4,3
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 2,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 2,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,4
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 5,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 9,11
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 14,16
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 19,23
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 26,30
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 34,38
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 43,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 52,57
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 63,'D
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'J,'O
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'U,91
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'a,'g
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'm,'t
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'z,128
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\21.PWM输出变化波形实验\PWM_CON\PWM_CON.C
	.dbsym e auc_SinParam _auc_SinParam A[128:128]c
_x_SW::
	.blkb 1
	.area idata
	.byte 8
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\21.PWM输出变化波形实验\PWM_CON\PWM_CON.C
	.dbsym e x_SW _x_SW c
_X_LUT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\21.PWM输出变化波形实验\PWM_CON\PWM_CON.C
	.dbsym e X_LUT _X_LUT c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\21.PWM输出变化波形实验\PWM_CON\PWM_CON.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 54
	.dbline 56
	ldi R24,255
	out 0x18,R24
	.dbline 57
	out 0x17,R24
	.dbline 59
	sbi 0x12,4
	.dbline 60
	sbi 0x12,5
	.dbline 61
	out 0x1b,R24
	.dbline 62
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
	.dbline 66
	.dbline 67
	ldi R24,111
	out 0x33,R24
	.dbline 68
	ldi R24,128
	out 0x31,R24
	.dbline 69
	ldi R24,1
	out 0x36,R24
	.dbline 70
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\21.PWM输出变化波形实验\PWM_CON\PWM_CON.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R2
	st -y,R3
	st -y,R24
	st -y,R25
	st -y,R30
	st -y,R31
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 80
	.dbline 81
	lds R2,_x_SW
	lds R3,_X_LUT
	add R3,R2
	sts _X_LUT,R3
	.dbline 82
	ldi R24,127
	cp R24,R3
	brsh L22
	.dbline 82
	mov R24,R3
	subi R24,128
	sts _X_LUT,R24
L22:
	.dbline 83
	ldi R24,<_auc_SinParam
	ldi R25,>_auc_SinParam
	lds R30,_X_LUT
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x31,R2
	.dbline -2
L21:
	ld R2,y+
	out 0x3f,R2
	ld R31,y+
	ld R30,y+
	ld R25,y+
	ld R24,y+
	ld R3,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 91
	.dbline 92
	xcall _system_init
	.dbline 93
	xcall _timer0_init
	.dbline 94
	bset 7
L25:
	.dbline 96
	.dbline 97
L26:
	.dbline 95
	xjmp L25
X1:
	.dbline -2
L24:
	.dbline 0 ; func end
	ret
	.dbend
