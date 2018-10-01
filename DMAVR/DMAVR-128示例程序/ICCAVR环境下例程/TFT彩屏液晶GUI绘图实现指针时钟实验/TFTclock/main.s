	.module main.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\main.c
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
	.dbfile E:\DMAVR-~3\TFTclock\main.c
	.dbfunc e GUIclock _GUIclock fV
	.even
_GUIclock::
	sbiw R28,6
	.dbline -1
	.dbline 17
; //DMAVR-128的基于TFT彩屏液晶和DS1302时钟芯片的指针式日历时钟程序
; //指针相关坐标根据三角函数换算，所以应包含math.h头文件
; //初始设置为12小时制，下午时间
; //编译环境 AVR Studio 4.17/AVR GCC
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.28
; 
; 
; #include <TFTclock_main.h>
;      
; 	 
; //***********************************************************************
; //         绘制时钟界面
; //***********************************************************************                             
; void GUIclock()
;  {
	.dbline 18
; 	GUIcircle(64,64,60,0x00ff);
	ldi R24,255
	ldi R25,0
	std y+3,R25
	std y+2,R24
	ldi R24,60
	std y+0,R24
	ldi R18,64
	ldi R16,64
	xcall _GUIcircle
	.dbline 19
; 	GUIfull(61,60,67,67,0xf800);    //时钟中心
	ldi R24,63488
	ldi R25,248
	std y+5,R25
	std y+4,R24
	ldi R24,67
	std y+2,R24
	std y+0,R24
	ldi R18,60
	ldi R16,61
	xcall _GUIfull
	.dbline 20
; 	GUIline(64,5,64,10,0x700); 		//12点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,10
	std y+2,R24
	ldi R24,64
	std y+0,R24
	ldi R18,5
	ldi R16,64
	xcall _GUIline
	.dbline 21
; 	GUIline(63,5,63,10,0x700); 		//12点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,10
	std y+2,R24
	ldi R24,63
	std y+0,R24
	ldi R18,5
	ldi R16,63
	xcall _GUIline
	.dbline 22
; 	GUIline(65,5,65,10,0x700); 		//12点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,10
	std y+2,R24
	ldi R24,65
	std y+0,R24
	ldi R18,5
	ldi R16,65
	xcall _GUIline
	.dbline 23
; 	GUIline(95,12,92,15,0x700); 	//1点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,15
	std y+2,R24
	ldi R24,92
	std y+0,R24
	ldi R18,12
	ldi R16,95
	xcall _GUIline
	.dbline 24
; 	GUIline(116,34,113,37,0x700); 	//2点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,37
	std y+2,R24
	ldi R24,113
	std y+0,R24
	ldi R18,34
	ldi R16,116
	xcall _GUIline
	.dbline 25
; 	GUIline(123,64,118,64,0x700);  	//3点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,64
	std y+2,R24
	ldi R24,118
	std y+0,R24
	ldi R18,64
	ldi R16,123
	xcall _GUIline
	.dbline 26
; 	GUIline(123,63,118,63,0x700);  	//3点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,63
	std y+2,R24
	ldi R24,118
	std y+0,R24
	ldi R18,63
	ldi R16,123
	xcall _GUIline
	.dbline 27
; 	GUIline(123,65,118,65,0x700);  	//3点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,65
	std y+2,R24
	ldi R24,118
	std y+0,R24
	ldi R18,65
	ldi R16,123
	xcall _GUIline
	.dbline 28
;     GUIline(116,94,113,91,0x700); 	//4点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,91
	std y+2,R24
	ldi R24,113
	std y+0,R24
	ldi R18,94
	ldi R16,116
	xcall _GUIline
	.dbline 29
; 	GUIline(95,116,92,113,0x700); 	//5点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,113
	std y+2,R24
	ldi R24,92
	std y+0,R24
	ldi R18,116
	ldi R16,95
	xcall _GUIline
	.dbline 30
;     GUIline(64,123,64,118,0x700);  	//6点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,118
	std y+2,R24
	ldi R24,64
	std y+0,R24
	ldi R18,123
	ldi R16,64
	xcall _GUIline
	.dbline 31
; 	GUIline(63,123,63,118,0x700);  	//6点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,118
	std y+2,R24
	ldi R24,63
	std y+0,R24
	ldi R18,123
	ldi R16,63
	xcall _GUIline
	.dbline 32
; 	GUIline(65,123,65,118,0x700);  	//6点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,118
	std y+2,R24
	ldi R24,65
	std y+0,R24
	ldi R18,123
	ldi R16,65
	xcall _GUIline
	.dbline 33
;  	GUIline(34,116,37,113,0x700); 	//7点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,113
	std y+2,R24
	ldi R24,37
	std y+0,R24
	ldi R18,116
	ldi R16,34
	xcall _GUIline
	.dbline 34
; 	GUIline(12,93,15,90,0x700);    	//8点钟方向		
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,90
	std y+2,R24
	ldi R24,15
	std y+0,R24
	ldi R18,93
	ldi R16,12
	xcall _GUIline
	.dbline 35
; 	GUIline(5,64,10,64,0x700);     	//9点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,64
	std y+2,R24
	ldi R24,10
	std y+0,R24
	ldi R18,64
	ldi R16,5
	xcall _GUIline
	.dbline 36
; 	GUIline(5,63,10,63,0x700);     	//9点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,63
	std y+2,R24
	ldi R24,10
	std y+0,R24
	ldi R18,63
	ldi R16,5
	xcall _GUIline
	.dbline 37
; 	GUIline(5,65,10,65,0x700);     	//9点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,65
	std y+2,R24
	ldi R24,10
	std y+0,R24
	ldi R18,65
	ldi R16,5
	xcall _GUIline
	.dbline 38
; 	GUIline(12,34,15,37,0x700); 	//10点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,37
	std y+2,R24
	ldi R24,15
	std y+0,R24
	ldi R18,34
	ldi R16,12
	xcall _GUIline
	.dbline 39
; 	GUIline(34,12,37,15,0x700); 	//11点钟方向
	ldi R24,1792
	ldi R25,7
	std y+5,R25
	std y+4,R24
	ldi R24,15
	std y+2,R24
	ldi R24,37
	std y+0,R24
	ldi R18,12
	ldi R16,34
	xcall _GUIline
	.dbline -2
L19:
	.dbline 0 ; func end
	adiw R28,6
	ret
	.dbend
	.dbfunc e TimeGet _TimeGet fV
	.even
_TimeGet::
	.dbline -1
	.dbline 47
; 
;  } 
; 
; //***********************************************************************
; //         从DS1302中读取时钟数据并处理
; //***********************************************************************
; void TimeGet()
;  {
	.dbline 48
;     time_hour=((time_buf[4]&0x1F) >> 4)*10+(time_buf[4] & 0x0F);	//小时
	lds R24,_time_buf+4
	andi R24,31
	swap R24
	andi R24,#0x0F
	ldi R25,10
	mul R25,R24
	lds R24,_time_buf+4
	andi R24,15
	mov R2,R0
	add R2,R24
	sts _time_hour,R2
	.dbline 49
; 	time_h=(time_buf[4] >> 4)&0x02;									//判断是上午还是下午
	lds R24,_time_buf+4
	swap R24
	andi R24,#0x0F
	andi R24,2
	sts _time_h,R24
	.dbline 50
; 	time_min=(time_buf[5] >> 4)*10+(time_buf[5] & 0x0F);			//分钟
	lds R24,_time_buf+5
	swap R24
	andi R24,#0x0F
	mul R25,R24
	lds R24,_time_buf+5
	andi R24,15
	mov R2,R0
	add R2,R24
	sts _time_min,R2
	.dbline 51
; 	time_sec=(time_buf[6] >> 4)*10+(time_buf[6] & 0x0F);			//秒
	lds R24,_time_buf+6
	swap R24
	andi R24,#0x0F
	mul R25,R24
	lds R24,_time_buf+6
	andi R24,15
	mov R2,R0
	add R2,R24
	sts _time_sec,R2
	.dbline 52
; 	data_yearq=(time_buf[0] >> 4);      		//年数据的千位
	lds R24,_time_buf
	swap R24
	andi R24,#0x0F
	sts _data_yearq,R24
	.dbline 53
; 	data_yearb=(time_buf[0] & 0x0F);    		//年数据的百位
	lds R24,_time_buf
	andi R24,15
	sts _data_yearb,R24
	.dbline 54
; 	data_years=(time_buf[1] >> 4);      		//年数据的十位
	lds R24,_time_buf+1
	swap R24
	andi R24,#0x0F
	sts _data_years,R24
	.dbline 55
; 	data_yearg=(time_buf[1] & 0x0F);            //年数据的个位
	lds R24,_time_buf+1
	andi R24,15
	sts _data_yearg,R24
	.dbline 56
; 	data_months=(time_buf[2] >> 4);             //月数据的十位
	lds R24,_time_buf+2
	swap R24
	andi R24,#0x0F
	sts _data_months,R24
	.dbline 57
; 	data_monthg=(time_buf[2] & 0x0F);			//月数据的个位
	lds R24,_time_buf+2
	andi R24,15
	sts _data_monthg,R24
	.dbline 58
; 	data_days=(time_buf[3] >> 4);				//日数据的十位
	lds R24,_time_buf+3
	swap R24
	andi R24,#0x0F
	sts _data_days,R24
	.dbline 59
; 	data_dayg=(time_buf[3] & 0x0F);				//日数据的个位
	lds R24,_time_buf+3
	andi R24,15
	sts _data_dayg,R24
	.dbline 60
; 	week=(time_buf[7] & 0x0F);					//星期数据
	lds R24,_time_buf+7
	andi R24,15
	sts _week,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e DisplayData _DisplayData fV
	.even
_DisplayData::
	sbiw R28,4
	.dbline -1
	.dbline 67
;  }
; 
; //***********************************************************************
; //         显示日期和星期
; //***********************************************************************
; void DisplayData()
;  {
	.dbline 68
;     DisplayChar(data_yearq+'0',0,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	clr R18
	lds R16,_data_yearq
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 69
; 	DisplayChar(data_yearb+'0',1,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,1
	lds R16,_data_yearb
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 70
; 	DisplayChar(data_years+'0',2,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,2
	lds R16,_data_years
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 71
; 	DisplayChar(data_yearg+'0',3,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,3
	lds R16,_data_yearg
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 73
;     
; 	DisplayChar('/',4,9,0x0eee);  					// "/"符号
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,4
	ldi R16,47
	xcall _DisplayChar
	.dbline 75
; 
; 	DisplayChar(data_months+'0',5,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,5
	lds R16,_data_months
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 76
; 	DisplayChar(data_monthg+'0',6,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,6
	lds R16,_data_monthg
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 77
; 	DisplayChar('/',7,9,0x0eee);  					// "/"符号
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,7
	ldi R16,47
	xcall _DisplayChar
	.dbline 80
; 
; 
; 	DisplayChar(data_days+'0',8,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,8
	lds R16,_data_days
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 81
; 	DisplayChar(data_dayg+'0',9,9,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,9
	lds R16,_data_dayg
	subi R16,208    ; addi 48
	xcall _DisplayChar
	.dbline 83
;     
; 	DisplayGB2312(6,5,9,0x3fef);   					//星
	ldi R24,16367
	ldi R25,63
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,5
	ldi R16,6
	xcall _DisplayGB2312
	.dbline 84
; 	DisplayGB2312(7,6,9,0x3fef);   					//期
	ldi R24,16367
	ldi R25,63
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,6
	ldi R16,7
	xcall _DisplayGB2312
	.dbline 85
; 	DisplayGB2312(week+7,7,9,0x3fef);  			 	//星期几
	ldi R24,16367
	ldi R25,63
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,7
	lds R16,_week
	subi R16,249    ; addi 7
	xcall _DisplayGB2312
	.dbline -2
L35:
	.dbline 0 ; func end
	adiw R28,4
	ret
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	sbiw R28,6
	.dbline -1
	.dbline 93
;  }
; 
; //***********************************************************************
; //         主函数
; //***********************************************************************
; 
; int main(void)
; {
	.dbline 94
;   delay_nms(100);
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 95
;   McuInit();
	xcall _McuInit
	.dbline 96
;   LCD_RD1; 
	lds R24,101
	ori R24,16
	sts 101,R24
	.dbline 97
;   LCD_Init();
	xcall _LCD_Init
	.dbline 98
;   LCD_clear(0);
	clr R16
	clr R17
	xcall _LCD_clear
	.dbline 99
;   ds1302_init();                        						//DS1302初始化
	xcall _ds1302_init
	.dbline 100
;   delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 101
;   ds1302_write_time();                 							//向DS1302写初始数据，如年月和时间等	 
	xcall _ds1302_write_time
	.dbline 102
;   GUIclock();    												//画时钟界面框
	xcall _GUIclock
	xjmp L38
L37:
	.dbline 105
; 	
;   while(1)
;     {
	.dbline 107
; 	  
;     delay_nms(900);
	ldi R16,900
	ldi R17,3
	xcall _delay_nms
	.dbline 108
; 	ds1302_read_time();                							//读DS1302数据
	xcall _ds1302_read_time
	.dbline 109
;     GUIline(64,64,sxi,syi,0);  									//清除秒指针显示痕迹
	clr R2
	clr R3
	std y+5,R3
	std y+4,R2
	lds R2,_syi
	std y+2,R2
	lds R2,_sxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 110
; 	TimeGet(); 
	xcall _TimeGet
	.dbline 112
; 	
;   if(time_h==0x02)
	lds R24,_time_h
	cpi R24,2
	brne L40
X3:
	.dbline 113
;    {
	.dbline 114
; 	DisplayGB2312(16,3,5,0x079ff);  			 				//下
	ldi R24,31231
	ldi R25,121
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	ldi R18,3
	ldi R16,16
	xcall _DisplayGB2312
	.dbline 115
;    }
	xjmp L41
L40:
	.dbline 117
;   else
;    {
	.dbline 118
; 	DisplayGB2312(15,3,5,0x79ff);  			 					//上
	ldi R24,31231
	ldi R25,121
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	ldi R18,3
	ldi R16,15
	xcall _DisplayGB2312
	.dbline 119
;    }
L41:
	.dbline 121
; 
; 	DisplayGB2312(17,4,5,0x79ff);  			 					//午
	ldi R24,31231
	ldi R25,121
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	ldi R18,4
	ldi R16,17
	xcall _DisplayGB2312
	.dbline 123
; 	
; 	DisplayData();
	xcall _DisplayData
	.dbline 125
; 
;    if(time_sec==00)
	lds R2,_time_sec
	tst R2
	breq X7
	xjmp L42
X7:
X4:
	.dbline 126
; 	{
	.dbline 127
;     hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹横坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _hxi,R16
	.dbline 128
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹纵坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _hyi,R16
	.dbline 129
; 	GUIline(64,64,hxi,hyi,0);  						             //小时指针在小时更新后清除前一痕迹
	clr R2
	clr R3
	std y+5,R3
	std y+4,R2
	mov R2,R16
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 131
; 
; 	hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;  	    
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _hxi,R16
	.dbline 132
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _hyi,R16
	.dbline 133
; 	GUIline(64,64,hxi,hyi,0x2ee0);  				             //小时指针在分钟更新后显示新的位置
	ldi R24,12000
	ldi R25,46
	std y+5,R25
	std y+4,R24
	mov R2,R16
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 134
; 	}
	xjmp L43
L42:
	.dbline 136
;    else
; 	{
	.dbline 137
;     hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _hxi,R16
	.dbline 138
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L48
	ldi R17,>L48
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _hyi,R16
	.dbline 139
; 	GUIline(64,64,hxi,hyi,0x2ee0);  				            //小时指针在分钟不更新时显示原来位置
	ldi R24,12000
	ldi R25,46
	std y+5,R25
	std y+4,R24
	mov R2,R16
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 140
; 	}	
L43:
	.dbline 143
; 
; 
;    if(time_sec==00)												//分钟指针在秒更新后清除前一痕迹
	lds R2,_time_sec
	tst R2
	breq X8
	xjmp L50
X8:
X5:
	.dbline 144
; 	{
	.dbline 145
; 	mxi=64+cos(PI*0.5-PI*(time_min-1)/30)*40;				
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _mxi,R16
	.dbline 146
;     myi=64-sin(PI*0.5-PI*(time_min-1)/30)*40;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _myi,R16
	.dbline 147
; 	GUIline(64,64,mxi,myi,0);  									
	clr R2
	clr R3
	std y+5,R3
	std y+4,R2
	mov R2,R16
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 148
; 	mxi=64+cos(PI*0.5-PI*time_min/30)*40;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _mxi,R16
	.dbline 149
;     myi=64-sin(PI*0.5-PI*time_min/30)*40;
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _myi,R16
	.dbline 150
; 	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒更新后显示新的位置
	ldi R24,736
	ldi R25,2
	std y+5,R25
	std y+4,R24
	mov R2,R16
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 151
; 	}
	xjmp L51
L50:
	.dbline 153
;   else
;  	{
	.dbline 154
;     mxi=64+cos(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹横坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _mxi,R16
	.dbline 155
;     myi=64-sin(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹纵坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L52
	ldi R17,>L52
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _myi,R16
	.dbline 156
; 	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒不更新时显示原来的位置
	ldi R24,736
	ldi R25,2
	std y+5,R25
	std y+4,R24
	mov R2,R16
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 157
;   	}
L51:
	.dbline 159
; 
; 	sxi=64+cos(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹横坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_sec
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _cosf
	movw R2,R16
	movw R4,R18
	ldi R16,<L54
	ldi R17,>L54
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpadd2
	xcall fpint
	sts _sxi,R16
	.dbline 160
;     syi=64-sin(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹纵坐标计算公式
	ldi R16,<L45
	ldi R17,>L45
	xcall elpm32
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall elpm32
	movw R6,R16
	movw R8,R18
	lds R16,_time_sec
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpmule2
	movw R6,R16
	movw R8,R18
	ldi R16,<L53
	ldi R17,>L53
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R6
	movw R18,R8
	xcall fpdiv2x
	movw R16,R2
	movw R18,R4
	xcall fpsub2
	xcall _sinf
	movw R2,R16
	movw R4,R18
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R6,R16
	movw R8,R18
	ldi R16,<L54
	ldi R17,>L54
	xcall elpm32
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall fpmule2x
	movw R16,R6
	movw R18,R8
	xcall fpsub2
	xcall fpint
	sts _syi,R16
	.dbline 162
; 	
; 	GUIline(64,64,sxi,syi,0xffe0);  							//显示秒指针位置
	ldi R24,65504
	ldi R25,255
	std y+5,R25
	std y+4,R24
	mov R2,R16
	std y+2,R2
	lds R2,_sxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 163
;     GUIfull(61,60,67,67,0xf800);   								//显示时钟中心      
	ldi R24,63488
	ldi R25,248
	std y+5,R25
	std y+4,R24
	ldi R24,67
	std y+2,R24
	std y+0,R24
	ldi R18,60
	ldi R16,61
	xcall _GUIfull
	.dbline 164
; 	 }
L38:
	.dbline 104
	xjmp L37
X6:
	.dbline -2
L36:
	.dbline 0 ; func end
	adiw R28,6
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\main.c
_time_h::
	.blkb 1
	.dbfile F:\PROGRA~1\iccavr\include\TFTclock_main.h
	.dbsym e time_h _time_h c
_week::
	.blkb 1
	.dbsym e week _week c
_data_dayg::
	.blkb 1
	.dbsym e data_dayg _data_dayg c
_data_days::
	.blkb 1
	.dbsym e data_days _data_days c
_data_monthg::
	.blkb 1
	.dbsym e data_monthg _data_monthg c
_data_months::
	.blkb 1
	.dbsym e data_months _data_months c
_data_yearg::
	.blkb 1
	.dbsym e data_yearg _data_yearg c
_data_years::
	.blkb 1
	.dbsym e data_years _data_years c
_data_yearb::
	.blkb 1
	.dbsym e data_yearb _data_yearb c
_data_yearq::
	.blkb 1
	.dbsym e data_yearq _data_yearq c
_time_sec::
	.blkb 1
	.dbsym e time_sec _time_sec c
_time_min::
	.blkb 1
	.dbsym e time_min _time_min c
_time_hour::
	.blkb 1
	.dbsym e time_hour _time_hour c
_hyi::
	.blkb 1
	.dbsym e hyi _hyi c
_hxi::
	.blkb 1
	.dbsym e hxi _hxi c
_myi::
	.blkb 1
	.dbsym e myi _myi c
_mxi::
	.blkb 1
	.dbsym e mxi _mxi c
_syi::
	.blkb 1
	.dbsym e syi _syi c
_sxi::
	.blkb 1
	.dbsym e sxi _sxi c
_postion_y::
	.blkb 1
	.dbsym e postion_y _postion_y c
_postion_x::
	.blkb 1
	.dbsym e postion_x _postion_x c
	.area lit(rom, con, rel)
L54:
	.word 0x0,0x4248
L53:
	.word 0x0,0x41f0
L52:
	.word 0x0,0x4220
L49:
	.word 0x0,0x4280
L48:
	.word 0x0,0x43b4
L47:
	.word 0x0,0x40c0
L46:
	.word 0xfda,0x4049
L45:
	.word 0xfda,0x3fc9
L44:
	.word 0x0,0x41f0
; }
; 
; 
