	.module PWM_CON.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
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
_auc_SinParam::
	.blkb 2
	.area idata
	.byte 128,134
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 140,147
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 153,159
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 165,171
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 177,182
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 188,193
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 198,204
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 208,213
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 218,222
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 226,230
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 233,237
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 240,242
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 245,247
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 249,251
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 252,253
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 254,254
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 254,254
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 253,252
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 251,250
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 248,246
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 244,241
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 238,235
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 232,228
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 224,220
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 215,211
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 206,201
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 196,191
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 185,179
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 174,168
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 162,156
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 150,144
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 137,131
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 125,'w
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'p,'j
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'd,94
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'X,'R
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'M,'G
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'A,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 55,50
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 45,41
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 36,32
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 28,24
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 21,18
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 15,12
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 10,8
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 6,5
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 4,3
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 2,2
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 2,2
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 3,4
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 5,7
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 9,11
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 14,16
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 19,23
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 26,30
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 34,38
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 43,48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 52,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 63,'D
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'J,'O
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'U,91
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'a,'g
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'm,'t
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'z,128
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
	.dbsym e auc_SinParam _auc_SinParam A[128:128]c
_x_SW::
	.blkb 1
	.area idata
	.byte 8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
	.dbsym e x_SW _x_SW c
_X_LUT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
	.dbsym e X_LUT _X_LUT c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 54
; //DMAVR-M16的定时器实现快速PWM输出示例程序，定时器0溢出中断的方式
; //输出PWM波形驱动发光二极管，亮度由暗到灭，呈闪烁状态
; //样值采取正弦波公式，示例如下
; //正弦波采样值计算公式
; //                    f(x)=128+127*sin(2*3.1415*x/127) x=[0....127]
; //PWM输出也可通过控制LED发光来直观的看到效果，亮度持续的变化
; //可以通过选跳线帽选择是通过LED直接查看还是通过滤波器查看实际波形
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
; #define f_count         254                              //0CR0寄存器初始值
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
; uchar auc_SinParam[128] = {
; 128,134,140,147,153,159,165,171,177,182,188,193,198,204,208,213,
; 218,222,226,230,233,237,240,242,245,247,249,251,252,253,254,254,
; 254,254,253,252,251,250,248,246,244,241,238,235,232,228,224,220,
; 215,211,206,201,196,191,185,179,174,168,162,156,150,144,137,131,
; 125,119,112,106,100,94,88,82,77,71,65,60,55,50,45,41,
; 36,32,28,24,21,18,15,12,10,8,6,5,4,3,2,2,
; 2,2,3,4,5,7,9,11,14,16,19,23,26,30,34,38,
; 43,48,52,57,63,68,74,79,85,91,97,103,109,116,122,128}; 	// 128点正弦波样本值
; 
; uchar x_SW = 8,X_LUT = 0;
; 
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()                                   //IO口初始化
; {
	.dbline 56
;   
;   PORTB=0xff;                                       //PB设置为输出
	ldi R24,255
	out 0x18,R24
	.dbline 57
;   DDRB=0xff;                                        //上拉电阻无效
	out 0x17,R24
	.dbline 59
;   
;   D_LE1;                             				//关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 60
;   W_LE1;                     
	sbi 0x12,5
	.dbline 61
;   Data_IO=0xFF;                      				//关数码管            
	out 0x1b,R24
	.dbline 62
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
	.dbline 66
; }
; 
; void timer0_init()                                 //定时器初始化
; {
	.dbline 67
;   TCCR0=0x68|timer_clk;                            //快读PWM模式，OC0输出，分频
	ldi R24,111
	out 0x33,R24
	.dbline 68
;   OCR0=128;                                        //OCR0比较匹配寄存器值
	ldi R24,128
	out 0x31,R24
	.dbline 69
;   TIFR=0x01;                                       //清中断标志位
	ldi R24,1
	out 0x36,R24
	.dbline 70
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
	.dbfile E:\DMAVR-~3\PWM_CON\PWM_CON.C
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
; }
; 
; 
; //*************************************************************************
; //		定时器0中断服务子程序
; //*************************************************************************
; 
; #pragma interrupt_handler  TIMER0_ISR:iv_TIM0_OVF
; void TIMER0_ISR() 	 	
; {
	.dbline 81
;     X_LUT += x_SW;  							 // 新样点指针
	lds R2,_x_SW
	lds R3,_X_LUT
	add R3,R2
	sts _X_LUT,R3
	.dbline 82
; 	if (X_LUT > 127) X_LUT -= 128;	         	 // 样点指针调整
	ldi R24,127
	mov R2,R3
	cp R24,R3
	brsh L22
X3:
	.dbline 82
	mov R24,R3
	subi R24,128
	sts _X_LUT,R24
L22:
	.dbline 83
; 	OCR0 =auc_SinParam[X_LUT];				  	 // 取样点指针到比较匹配寄存器
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
	.dbline 0 ; func end
	ld R2,y+
	out 0x3f,R2
	ld R31,y+
	ld R30,y+
	ld R25,y+
	ld R24,y+
	ld R3,y+
	ld R2,y+
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 91
; }
; 
; //*************************************************************************
; //		主程序
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 92
;   system_init();                             	 //系统初始化.PB3输出PWM波形
	xcall _system_init
	.dbline 93
;   timer0_init();                             	 //定时器0初始化，完成PWM相关配置
	xcall _timer0_init
	.dbline 94
;   SREG|=0x80;                                	 //开启全局中断
	bset 7
L25:
	.dbline 96
;   while(1)
;   {
	.dbline 97
;   }
L26:
	.dbline 95
	xjmp L25
X4:
	.dbline -2
L24:
	.dbline 0 ; func end
	ret
	.dbend
; }
