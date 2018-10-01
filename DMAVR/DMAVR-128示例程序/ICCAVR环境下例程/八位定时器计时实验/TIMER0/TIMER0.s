	.module TIMER0.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
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
_table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
	.dbsym e table _table A[16:16]c
_time_1s_count::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
	.dbsym e time_1s_count _time_1s_count c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 50
; //DMAVR-128的利用定时器0实现999s加1计数功能，每1s加1
; //定时器用普通模式，溢出中断，加1计数
; //定时器初值计算，定时10ms，1024分频为例，(FF-X)*F_CPU/1024=0.1s
; //秒表在数码管上显示
; //编译环境 ICCAVR V7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.26
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <iom128v.h>						   //Atmega128头文件						 
; #include <delay.h> 							   //延时程序头文件，针对7.3728M时钟
; 
; //***********************************************************************
; //			定义变量区
; //***********************************************************************
; #define f_count         183              	//定时器初值，定时器加一计数
; #define timer_clk       0x07				//时钟1024分频
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
; //***********************************************************************
; //			共阴数码管显示的断码表0～F
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; 
; 
; uchar time_1s_count=0;
; uint  second;
; uint  A1,A2,A3;
; 
; //***********************************************************************
; //			IO端口初始化
; //***********************************************************************
; 
; void system_init()
; {
	.dbline 51
;     Data_IO=0xFF;             				//数据口为输出
	ldi R24,255
	out 0x1b,R24
	.dbline 52
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 54
; 
;     PORTD=0xFF;               				//74HC573的控制口，设置为输出
	out 0x12,R24
	.dbline 55
;     DDRD=0xFF;
	out 0x11,R24
	.dbline 57
; 	
; 	PORTB=0XFF;								//关闭发光二极管
	out 0x18,R24
	.dbline 58
; 	DDRB=0XFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e timer0_init _timer0_init fV
	.even
_timer0_init::
	.dbline -1
	.dbline 67
; }
; 
; 
; //*************************************************************************
; //			定时器0初始化子程序
; //*************************************************************************
; 
; void timer0_init()                                 //定时器初始化
; {
	.dbline 68
;   TCCR0=0x07;                                      //普通模式，OC0不输出，1024分频
	ldi R24,7
	out 0x33,R24
	.dbline 69
;   TCNT0=f_count;                                    //初值，定时为10ms
	ldi R24,183
	out 0x32,R24
	.dbline 70
;   TIFR=0x01;                                       //清中断标志位
	ldi R24,1
	out 0x36,R24
	.dbline 71
;   TIMSK=0x01;                                      //使能定时器0溢出中断
	out 0x37,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R10
;         temp_d -> R10,R11
	.even
_data_do::
	st -y,R10
	st -y,R11
	movw R10,R16
	.dbline -1
	.dbline 78
; }
; 
; //*************************************************************************
; //		数据处理函数
; //*************************************************************************
;  void data_do(uint temp_d)
;  {
	.dbline 80
;      uchar A2t;
;      A1=temp_d/100;                       		  //分出百，十，和个位
	ldi R18,100
	ldi R19,0
	movw R16,R10
	xcall div16u
	sts _A1+1,R17
	sts _A1,R16
	.dbline 81
;      A2t=temp_d%100;
	ldi R18,100
	ldi R19,0
	movw R16,R10
	xcall mod16u
	movw R10,R16
	.dbline 82
;      A2=A2t/10;
	ldi R18,10
	ldi R19,0
	clr R17
	xcall div16s
	sts _A2+1,R17
	sts _A2,R16
	.dbline 83
;      A3=A2t%10;
	ldi R18,10
	ldi R19,0
	mov R16,R10
	clr R17
	xcall mod16s
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym r A2t 10 c
	.dbsym r temp_d 10 i
	.dbend
	.dbfunc e Display_Timer0 _Display_Timer0 fV
;              i -> R22
;              j -> R20
	.even
_Display_Timer0::
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 91
; }
; 
; //*************************************************************************
; //			74HC573控制数码管动态扫描显示函数，显示采集到的温度
; //*************************************************************************
; 
; void Display_Timer0(void)
; {
	.dbline 93
; 	 uchar i,j;
; 	 system_init();
	xcall _system_init
	.dbline 94
;      j=0x01;                    			//此数据用来控制位选
	ldi R20,1
	.dbline 95
;  for(i=0;i<5;i++)               			//用后3位数码管来显示
	clr R22
	xjmp L26
L23:
	.dbline 96
;   {
	.dbline 97
;      D_LE1;                     
	sbi 0x12,4
	.dbline 98
;      W_LE1;                     
	sbi 0x12,5
	.dbline 99
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 100
;      W_LE0;                      
	cbi 0x12,5
	.dbline 101
; 	 j=(j<<1);
	lsl R20
	.dbline 102
;      Data_IO=0x00;           
	clr R2
	out 0x1b,R2
	.dbline 103
;      D_LE0;                      
	cbi 0x12,4
	.dbline 104
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 105
;   }
L24:
	.dbline 95
	inc R22
L26:
	.dbline 95
	cpi R22,5
	brlo L23
X3:
	.dbline 106
;      D_LE1;                    
	sbi 0x12,4
	.dbline 107
;      W_LE1;                    
	sbi 0x12,5
	.dbline 108
;      Data_IO=~j;               
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 109
;      W_LE0;                    
	cbi 0x12,5
	.dbline 110
; 	 j=(j<<1);
	lsl R20
	.dbline 111
;      Data_IO=table[A1];         
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 112
;      D_LE0;                    
	cbi 0x12,4
	.dbline 113
;      delay_nms(1);              
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 115
; 
;      D_LE1;                     
	sbi 0x12,4
	.dbline 116
;      W_LE1;                     
	sbi 0x12,5
	.dbline 117
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 118
;      W_LE0;                      
	cbi 0x12,5
	.dbline 119
; 	 j=(j<<1);
	lsl R20
	.dbline 120
;      Data_IO=table[A2];             
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 121
;      D_LE0;                      
	cbi 0x12,4
	.dbline 122
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 124
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 125
;      W_LE1;                     
	sbi 0x12,5
	.dbline 126
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 127
;      W_LE0;                      
	cbi 0x12,5
	.dbline 128
; 	 j=(j<<1);
	lsl R20
	.dbline 129
;      Data_IO=table[A3];           
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 130
;      D_LE0;                      
	cbi 0x12,4
	.dbline 131
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 133
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 134
;      W_LE1;                     
	sbi 0x12,5
	.dbline 135
;      Data_IO=0xff;                
	ldi R24,255
	out 0x1b,R24
	.dbline 136
;      W_LE0;                      
	cbi 0x12,5
	.dbline -2
L22:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	ret
	.dbsym r i 22 c
	.dbsym r j 20 c
	.dbend
	.area vector(rom, abs)
	.org 64
	jmp _TIMER0_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 146
; 
; }
; 
; 
; //*************************************************************************
; //		定时器0中断服务子程序
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:iv_TIM0_OVF
; void TIMER0_ISR() 	 	
;    { 
	.dbline 148
;     
; 	TCNT0=f_count;                              //定时器赋初值，非自动重装模式
	ldi R24,183
	out 0x32,R24
	.dbline 149
;    if(time_1s_count!=100)
	lds R24,_time_1s_count
	cpi R24,100
	breq L28
X4:
	.dbline 150
;       {
	.dbline 151
; 	  time_1s_count++;                          //定时器定时10ms，计数100次为1s
	subi R24,255    ; addi 1
	sts _time_1s_count,R24
	.dbline 153
; //	  time_1s_flag=0;                           //未到1s，标志位为0
; 	  }
	xjmp L29
L28:
	.dbline 155
;    else
;       {
	.dbline 156
; 	  if(second!=999)                           //最大计时999s
	lds R24,_second
	lds R25,_second+1
	cpi R24,231
	ldi R30,3
	cpc R25,R30
	breq L30
X5:
	.dbline 157
; 	     {
	.dbline 158
; 		 second++;
	adiw R24,1
	sts _second+1,R25
	sts _second,R24
	.dbline 159
; 		 }
	xjmp L31
L30:
	.dbline 161
;       else
; 	     second=0;                              //到999s则清0
	clr R2
	clr R3
	sts _second+1,R3
	sts _second,R2
L31:
	.dbline 162
; 	  time_1s_count=0;
	clr R2
	sts _time_1s_count,R2
	.dbline 164
; //	  time_1s_flag=1;
; 	  data_do(second);                         //将秒转化为BCD码，供显示
	lds R16,_second
	lds R17,_second+1
	xcall _data_do
	.dbline 165
; 	  }
L29:
	.dbline -2
L27:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 174
; }
; 
; 
; //*************************************************************************
; //		主程序
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 175
;   system_init();                             //系统初始化
	xcall _system_init
	.dbline 176
;   timer0_init();                             //定时器0初始化，完成定时器相关配置 
	xcall _timer0_init
	.dbline 177
;   time_1s_count=0;                           //计数值清0
	clr R2
	sts _time_1s_count,R2
	.dbline 178
;   SREG|=0x80;                                //开启全局中断
	bset 7
	xjmp L34
L33:
	.dbline 180
;   while(1)
;   {
	.dbline 182
; 
; 	   Display_Timer0();             		//显示计数值
	xcall _Display_Timer0
	.dbline 184
; 
;   }
L34:
	.dbline 179
	xjmp L33
X6:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\TIMER0\TIMER0.C
_A3::
	.blkb 2
	.dbsym e A3 _A3 i
_A2::
	.blkb 2
	.dbsym e A2 _A2 i
_A1::
	.blkb 2
	.dbsym e A1 _A1 i
_second::
	.blkb 2
	.dbsym e second _second i
; }
