	.module TIMER0.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的利用定时器0实现999s加1计数功能，每1s加1
; //定时器用普通模式，溢出中断，加1计数
; //定时器初值计算，定时10ms，1024分频为例，(FF-X)*F_CPU/1024=0.01s
; //秒表在数码管上显示
; //编译环境 ICCAVR V7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
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
	.dbline 21
; #define f_count         183              	//定时器初值，定时器加一计数
	nop
	.dbline 22
; #define timer_clk       0x07				//时钟1024分频
	nop
	.dbline 23
; 
	nop
	.dbline 24
; #define uchar           unsigned char
	nop
	.dbline 25
; #define uint            unsigned int
	nop
	.dbline 26
; 
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
; #define Data_IO	        PORTA                //数码管数据口
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
	.dbline 32
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
	nop
	.dbline 33
; 
	nop
	.dbline 34
; //***********************************************************************
	nop
	.dbline 35
; //			共阴数码管显示的断码表0～F
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; 
	nop
	.dbline 38
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 39
; 
	nop
	.dbline 40
; 
	nop
	.dbline 41
; uchar time_1s_count=0;
	nop
	.dbline 42
; uint  second;
	nop
	.dbline 43
; uint  A1,A2,A3;
	nop
	.dbline 44
; 
	nop
	.dbline 45
; //***********************************************************************
	nop
	.dbline 46
; //			IO端口初始化
	nop
	.dbline 47
; //***********************************************************************
	nop
	.dbline 48
; 
	nop
	.dbline 49
; void system_init()
	nop
	.dbline 50
; {
	nop
	.dbline 51
;     Data_IO=0xFF;             				//数据口为输出
	nop
	.dbline 52
;     Data_DDR=0xFF;
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
; 
;     PORTD=0xFF;               				//74HC573的控制口，设置为输出
;     DDRD=0xFF;
; 	
	.dbline 57
; 	PORTB=0XFF;								//关闭发光二极管
	xcall _delay_3us
	.dbline 58
; 	DDRB=0XFF;
	xcall _delay_3us
	.dbline 59
; }
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
; 
; 
; //*************************************************************************
; //			定时器0初始化子程序
	.dbline 64
; //*************************************************************************
	xcall _delay_10us
	.dbline 65
; 
	xcall _delay_10us
	.dbline 66
; void timer0_init()                                 //定时器初始化
	xcall _delay_10us
	.dbline 67
; {
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
;   TCCR0=0x07;                                      //普通模式，OC0不输出，1024分频
;   TCNT0=f_count;                                    //初值，定时为10ms
;   TIFR=0x01;                                       //清中断标志位
	.dbline 71
;   TIMSK=0x01;                                      //使能定时器0溢出中断
	xcall _delay_50us
	.dbline 72
; }
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
; //		数据处理函数
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
;  void data_do(uint temp_d)
;  {
;      uchar A2t;
;      A1=temp_d/100;                       		  //分出百，十，和个位
;      A2t=temp_d%100;
;      A2=A2t/10;
;      A3=A2t%10;
; }
; //*************************************************************************
; //			74HC573控制数码管动态扫描显示函数，显示采集到的温度
; //*************************************************************************
; void Display_Timer0(void)
; {
	.dbline 90
; 	 uchar i,j;
	xcall _delay_100us
	.dbline 91
; 	 system_init();
	xcall _delay_100us
	.dbline 92
;      j=0x01;                    			//此数据用来控制位选
	xcall _delay_100us
	.dbline 93
;  for(i=0;i<5;i++)               			//用后3位数码管来显示
	xcall _delay_100us
	.dbline 94
;   {
	xcall _delay_100us
	.dbline 95
;      D_LE1;                     
	xcall _delay_100us
	.dbline 96
;      W_LE1;                     
	xcall _delay_100us
	.dbline 97
;      Data_IO=~j;                
	xcall _delay_100us
	.dbline 98
;      W_LE0;                      
	xcall _delay_100us
	.dbline 99
; 	 j=(j<<1);
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
;      Data_IO=0x00;           
;      D_LE0;                      
;      delay_nms(1);                
;   }
;      D_LE1;                    
;      W_LE1;                    
;      Data_IO=~j;               
;      W_LE0;                    
; 	 j=(j<<1);
;      Data_IO=table[A1];         
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
;      D_LE0;                    
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
;      delay_nms(1);              
; 
;      D_LE1;                     
;      W_LE1;                     
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
;      Data_IO=~j;                
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
_table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\8.八位定时器计时实验\TIMER0\TIMER0.C
	.dbsym e table _table A[16:16]c
_time_1s_count::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\8.八位定时器计时实验\TIMER0\TIMER0.C
	.dbsym e time_1s_count _time_1s_count c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\8.八位定时器计时实验\TIMER0\TIMER0.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 50
	.dbline 51
	ldi R24,255
	out 0x1b,R24
	.dbline 52
	out 0x1a,R24
	.dbline 54
	out 0x12,R24
	.dbline 55
	out 0x11,R24
	.dbline 57
	out 0x18,R24
	.dbline 58
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
	.dbline 68
	ldi R24,7
	out 0x33,R24
	.dbline 69
	ldi R24,183
	out 0x32,R24
	.dbline 70
	ldi R24,1
	out 0x36,R24
	.dbline 71
	out 0x37,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R20
;         temp_d -> R20,R21
	.even
_data_do::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 78
	.dbline 80
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall div16u
	sts _A1+1,R17
	sts _A1,R16
	.dbline 81
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	mov R20,R16
	.dbline 82
	ldi R18,10
	ldi R19,0
	clr R17
	xcall div16s
	sts _A2+1,R17
	sts _A2,R16
	.dbline 83
	ldi R18,10
	ldi R19,0
	mov R16,R20
	clr R17
	xcall mod16s
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L21:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r A2t 20 c
	.dbsym r temp_d 20 i
	.dbend
	.dbfunc e Display_Timer0 _Display_Timer0 fV
;              i -> R20
;              j -> R22
	.even
_Display_Timer0::
	xcall push_gset2
	.dbline -1
	.dbline 89
	.dbline 91
	xcall _system_init
	.dbline 92
	ldi R22,1
	.dbline 93
	clr R20
	xjmp L26
L23:
	.dbline 94
	.dbline 95
	sbi 0x12,4
	.dbline 96
	sbi 0x12,5
	.dbline 97
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 98
	cbi 0x12,5
	.dbline 99
	lsl R22
	.dbline 100
	clr R2
	out 0x1b,R2
	.dbline 101
	cbi 0x12,4
	.dbline 102
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 103
L24:
	.dbline 93
	inc R20
L26:
	.dbline 93
	cpi R20,5
	brlo L23
	.dbline 104
	sbi 0x12,4
	.dbline 105
	sbi 0x12,5
	.dbline 106
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 107
	cbi 0x12,5
	.dbline 108
	lsl R22
	.dbline 109
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 110
	cbi 0x12,4
	.dbline 111
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 113
	sbi 0x12,4
	.dbline 114
	sbi 0x12,5
	.dbline 115
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 116
;      W_LE0;                      
	cbi 0x12,5
	.dbline 117
; 	 j=(j<<1);
	lsl R22
	.dbline 118
;      Data_IO=table[A2];             
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 119
;      D_LE0;                      
	cbi 0x12,4
	.dbline 120
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 122
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 123
;      W_LE1;                     
	sbi 0x12,5
	.dbline 124
;      Data_IO=~j;                
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 125
;      W_LE0;                      
	cbi 0x12,5
	.dbline 126
; 	 j=(j<<1);
	lsl R22
	.dbline 127
;      Data_IO=table[A3];           
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 128
;      D_LE0;                      
	cbi 0x12,4
	.dbline 129
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 131
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 132
;      W_LE1;                     
	sbi 0x12,5
	.dbline 133
;      Data_IO=0xff;                
	ldi R24,255
	out 0x1b,R24
	.dbline 134
;      W_LE0;                      
	cbi 0x12,5
	.dbline -2
L22:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbend
	.area vector(rom, abs)
	.org 64
	jmp _TIMER0_ISR
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\8.八位定时器计时实验\TIMER0\TIMER0.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	xcall push_lset
	.dbline -1
	.dbline 142
; 
; }
; //*************************************************************************
; //		定时器0中断服务子程序
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:17
; void TIMER0_ISR() 	 	
;    { 
	.dbline 144
;     
; 	TCNT0=f_count;                              //定时器赋初值，非自动重装模式
	ldi R24,183
	out 0x32,R24
	.dbline 145
;    if(time_1s_count!=100)
	lds R24,_time_1s_count
	cpi R24,100
	breq L28
	.dbline 146
;       {
	.dbline 147
; 	  time_1s_count++;                          //定时器定时10ms，计数100次为1s
	subi R24,255    ; addi 1
	sts _time_1s_count,R24
	.dbline 148
; 	  }
	xjmp L29
L28:
	.dbline 150
;    else
;       {
	.dbline 151
; 	  if(second!=999)                           //最大计时999s
	lds R24,_second
	lds R25,_second+1
	cpi R24,231
	ldi R30,3
	cpc R25,R30
	breq L30
	.dbline 152
; 	     {
	.dbline 153
; 		 second++;
	adiw R24,1
	sts _second+1,R25
	sts _second,R24
	.dbline 154
; 		 }
	xjmp L31
L30:
	.dbline 156
;       else
; 	     second=0;                              //到999s则清0
	clr R2
	clr R3
	sts _second+1,R3
	sts _second,R2
L31:
	.dbline 157
	clr R2
	sts _time_1s_count,R2
	.dbline 158
	lds R16,_second
	lds R17,_second+1
	xcall _data_do
	.dbline 159
L29:
	.dbline -2
L27:
	xcall pop_lset
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 166
; 	  time_1s_count=0;
; 	  data_do(second);                         //将秒转化为BCD码，供显示
; 	  }
; }
; //*************************************************************************
; //		主程序
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 167
;   system_init();                             //系统初始化
	xcall _system_init
	.dbline 168
;   timer0_init();                             //定时器0初始化，完成定时器相关配置 
	xcall _timer0_init
	.dbline 169
;   time_1s_count=0;                           //计数值清0
	clr R2
	sts _time_1s_count,R2
	.dbline 170
;   SREG|=0x80;                                //开启全局中断
	bset 7
	xjmp L34
L33:
	.dbline 172
	.dbline 173
	xcall _Display_Timer0
	.dbline 174
L34:
	.dbline 171
	xjmp L33
X1:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\8.八位定时器计时实验\TIMER0\TIMER0.C
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
