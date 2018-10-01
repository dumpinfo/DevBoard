	.module main.c
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //DMAVR-128的DS1302实时时钟芯片驱动程序，如果使用备用电池，只需执行一次写DS1302操作
; //编译环境 ICCAVR 7.16A
; //使用前请通过修改time_buf[8]来设置当前启动日期
; //当前设置2010-02-01 03：22 下午 周一
; //0xb0表示12小时制，下午，当前时间的小时数为03，具体位的意义参考DS1302的数据手册
; #include <TFTclock_main.h>
;      
; 	 
; //***********************************************************************
; //         绘制时钟界面
; //***********************************************************************                             
; void GUIclock()
;  {
; 	GUIcircle(64,64,60,0x00ff);
; 	GUIfull(61,60,67,67,0xf800);    //时钟中心
; 	GUIline(64,5,64,10,0x700); 		//12点钟方向
; 	GUIline(63,5,63,10,0x700); 		//12点钟方向
; 	GUIline(65,5,65,10,0x700); 		//12点钟方向
; 	GUIline(95,12,92,15,0x700); 	//1点钟方向
; 	GUIline(116,34,113,37,0x700); 	//2点钟方向
	.dbline 21
; 	GUIline(123,64,118,64,0x700);  	//3点钟方向
	nop
	.dbline 22
; 	GUIline(123,63,118,63,0x700);  	//3点钟方向
	nop
	.dbline 23
; 	GUIline(123,65,118,65,0x700);  	//3点钟方向
	nop
	.dbline 24
;     GUIline(116,94,113,91,0x700); 	//4点钟方向
	nop
	.dbline 25
; 	GUIline(95,116,92,113,0x700); 	//5点钟方向
	nop
	.dbline 26
;     GUIline(64,123,64,118,0x700);  	//6点钟方向
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
; 	GUIline(63,123,63,118,0x700);  	//6点钟方向
; 	GUIline(65,123,65,118,0x700);  	//6点钟方向
;  	GUIline(34,116,37,113,0x700); 	//7点钟方向
; 	GUIline(12,93,15,90,0x700);    	//8点钟方向		
	.dbline 32
; 	GUIline(5,64,10,64,0x700);     	//9点钟方向
; 	GUIline(5,63,10,63,0x700);     	//9点钟方向
	nop
	.dbline 33
; 	GUIline(5,65,10,65,0x700);     	//9点钟方向
	nop
	.dbline 34
; 	GUIline(12,34,15,37,0x700); 	//10点钟方向
	nop
	.dbline 35
; 	GUIline(34,12,37,15,0x700); 	//11点钟方向
	nop
	.dbline 36
; 
	nop
	.dbline 37
;  } 
	nop
	.dbline 38
; 
	nop
	.dbline 39
; //***********************************************************************
	nop
	.dbline 40
; //         从DS1302中读取时钟数据并处理
	nop
	.dbline 41
; //***********************************************************************
	nop
	.dbline 42
; void TimeGet()
	nop
	.dbline 43
;  {
	nop
	.dbline 44
;     time_hour=((time_buf[4]&0x1F) >> 4)*10+(time_buf[4] & 0x0F);	//小时
	nop
	.dbline 45
; 	time_h=(time_buf[4] >> 4)&0x02;									//判断是上午还是下午
	nop
	.dbline 46
; 	time_min=(time_buf[5] >> 4)*10+(time_buf[5] & 0x0F);			//分钟
	nop
	.dbline 47
; 	time_sec=(time_buf[6] >> 4)*10+(time_buf[6] & 0x0F);			//秒
	nop
	.dbline 48
; 	data_yearq=(time_buf[0] >> 4);      		//年数据的千位
	nop
	.dbline 49
; 	data_yearb=(time_buf[0] & 0x0F);    		//年数据的百位
	nop
	.dbline 50
; 	data_years=(time_buf[1] >> 4);      		//年数据的十位
	nop
	.dbline 51
; 	data_yearg=(time_buf[1] & 0x0F);            //年数据的个位
	nop
	.dbline 52
; 	data_months=(time_buf[2] >> 4);             //月数据的十位
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
; 	data_monthg=(time_buf[2] & 0x0F);			//月数据的个位
; 	data_days=(time_buf[3] >> 4);				//日数据的十位
; 	data_dayg=(time_buf[3] & 0x0F);				//日数据的个位
; 	week=(time_buf[7] & 0x0F);					//星期数据
	.dbline 57
;  }
	xcall _delay_3us
	.dbline 58
; 
	xcall _delay_3us
	.dbline 59
; //***********************************************************************
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
; //         显示日期和星期
; //***********************************************************************
; void DisplayData()
;  {
	.dbline 64
;     DisplayChar(data_yearq+'0',0,9,0x0eee);
	xcall _delay_10us
	.dbline 65
; 	DisplayChar(data_yearb+'0',1,9,0x0eee);
	xcall _delay_10us
	.dbline 66
; 	DisplayChar(data_years+'0',2,9,0x0eee);
	xcall _delay_10us
	.dbline 67
; 	DisplayChar(data_yearg+'0',3,9,0x0eee);
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
;     
; 	DisplayChar('/',4,9,0x0eee);  					// "/"符号
; 
	.dbline 71
; 	DisplayChar(data_months+'0',5,9,0x0eee);
	xcall _delay_50us
	.dbline 72
; 	DisplayChar(data_monthg+'0',6,9,0x0eee);
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
; 	DisplayChar('/',7,9,0x0eee);  					// "/"符号
; 
; 
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 	DisplayChar(data_days+'0',8,9,0x0eee);
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
; 	DisplayChar(data_dayg+'0',9,9,0x0eee);
;     
; 	DisplayGB2312(6,5,9,0x3fef);   					//星
; 	DisplayGB2312(7,6,9,0x3fef);   					//期
; 	DisplayGB2312(week+7,7,9,0x3fef);  			 	//星期几
;  }
; 
; //***********************************************************************
; //         主函数
; //***********************************************************************
; 
; int main(void)
; {
	.dbline 90
;   delay_nms(100);
	xcall _delay_100us
	.dbline 91
;   McuInit();
	xcall _delay_100us
	.dbline 92
;   LCD_RD1; 
	xcall _delay_100us
	.dbline 93
;   LCD_Init();
	xcall _delay_100us
	.dbline 94
;   LCD_clear(0);
	xcall _delay_100us
	.dbline 95
;   ds1302_init();                        						//DS1302初始化
	xcall _delay_100us
	.dbline 96
;   delay_nms(10);
	xcall _delay_100us
	.dbline 97
;   ds1302_write_time();                 							//向DS1302写初始数据，如年月和时间等	 
	xcall _delay_100us
	.dbline 98
;   GUIclock();    												//画时钟界面框
	xcall _delay_100us
	.dbline 99
; 	
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
;   while(1)
;     {
; 	  
;     delay_nms(900);
; 	ds1302_read_time();                							//读DS1302数据
;     GUIline(64,64,sxi,syi,0);  									//清除秒指针显示痕迹
; 	TimeGet(); 
; 	
;   if(time_h==0x02)
;    {
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 	DisplayGB2312(16,3,5,0x079ff);  			 				//下
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
;    }
;   else
;    {
; 	DisplayGB2312(15,3,5,0x79ff);  			 					//上
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
;    }
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\main.c
	.dbfunc e GUIclock _GUIclock fV
	.even
_GUIclock::
	sbiw R28,6
	.dbline -1
	.dbline 13
	.dbline 14
	ldi R24,255
	ldi R25,0
	std y+3,R25
	std y+2,R24
	ldi R24,60
	std y+0,R24
	ldi R18,64
	ldi R16,64
	xcall _GUIcircle
	.dbline 15
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
	.dbline 16
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
	.dbline 17
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
	.dbline 18
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
	.dbline 19
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
	.dbline 20
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
	.dbline 21
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
	.dbline 22
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
	.dbline 23
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
	.dbline 24
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
	.dbline 25
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
	.dbline 26
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
	.dbline 27
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
	.dbline 28
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
	.dbline 29
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
	.dbline 30
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
	.dbline 31
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
	.dbline 32
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
	.dbline 33
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
	.dbline 34
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
	.dbline 35
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
	adiw R28,6
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e TimeGet _TimeGet fV
	.even
_TimeGet::
	.dbline -1
	.dbline 43
	.dbline 44
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
	.dbline 45
	lds R24,_time_buf+4
	swap R24
	andi R24,#0x0F
	andi R24,2
	sts _time_h,R24
	.dbline 46
	lds R24,_time_buf+5
	swap R24
	andi R24,#0x0F
	mul R25,R24
	lds R24,_time_buf+5
	andi R24,15
	mov R2,R0
	add R2,R24
	sts _time_min,R2
	.dbline 47
	lds R24,_time_buf+6
	swap R24
	andi R24,#0x0F
	mul R25,R24
	lds R24,_time_buf+6
	andi R24,15
	mov R2,R0
	add R2,R24
	sts _time_sec,R2
	.dbline 48
	lds R24,_time_buf
	swap R24
	andi R24,#0x0F
	sts _data_yearq,R24
	.dbline 49
	lds R24,_time_buf
	andi R24,15
	sts _data_yearb,R24
	.dbline 50
	lds R24,_time_buf+1
	swap R24
	andi R24,#0x0F
	sts _data_years,R24
	.dbline 51
	lds R24,_time_buf+1
	andi R24,15
	sts _data_yearg,R24
	.dbline 52
	lds R24,_time_buf+2
	swap R24
	andi R24,#0x0F
	sts _data_months,R24
	.dbline 53
	lds R24,_time_buf+2
	andi R24,15
	sts _data_monthg,R24
	.dbline 54
	lds R24,_time_buf+3
	swap R24
	andi R24,#0x0F
	sts _data_days,R24
	.dbline 55
	lds R24,_time_buf+3
	andi R24,15
	sts _data_dayg,R24
	.dbline 56
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
	.dbline 63
	.dbline 64
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
	.dbline 65
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
	.dbline 66
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
	.dbline 67
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
	.dbline 69
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,4
	ldi R16,47
	xcall _DisplayChar
	.dbline 71
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
	.dbline 72
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
	.dbline 73
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,7
	ldi R16,47
	xcall _DisplayChar
	.dbline 76
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
	.dbline 77
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
	.dbline 79
	ldi R24,16367
	ldi R25,63
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,5
	ldi R16,6
	xcall _DisplayGB2312
	.dbline 80
	ldi R24,16367
	ldi R25,63
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,6
	ldi R16,7
	xcall _DisplayGB2312
	.dbline 81
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
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	sbiw R28,22
	.dbline -1
	.dbline 89
	.dbline 90
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 91
	xcall _McuInit
	.dbline 92
	lds R24,101
	ori R24,16
	sts 101,R24
	.dbline 93
	xcall _LCD_Init
	.dbline 94
	clr R16
	clr R17
	xcall _LCD_clear
	.dbline 95
	xcall _ds1302_init
	.dbline 96
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 97
	xcall _ds1302_write_time
	.dbline 98
	xcall _GUIclock
	xjmp L38
L37:
	.dbline 101
	.dbline 103
	ldi R16,900
	ldi R17,3
	xcall _delay_nms
	.dbline 104
	xcall _ds1302_read_time
	.dbline 105
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
	.dbline 106
	xcall _TimeGet
	.dbline 108
	lds R24,_time_h
	cpi R24,2
	brne L40
	.dbline 109
	.dbline 110
	ldi R24,31231
	ldi R25,121
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	ldi R18,3
	ldi R16,16
	xcall _DisplayGB2312
	.dbline 111
	xjmp L41
L40:
	.dbline 113
	.dbline 114
	ldi R24,31231
	ldi R25,121
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	ldi R18,3
	ldi R16,15
	xcall _DisplayGB2312
	.dbline 115
L41:
	.dbline 117
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
	.dbline 119
; 	
; 	DisplayData();
	xcall _DisplayData
	.dbline 121
; 
;    if(time_sec==00)
	lds R2,_time_sec
	tst R2
	breq X2
	xjmp L42
X2:
	.dbline 122
; 	{
	.dbline 123
;     hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹横坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L44
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L45
L44:
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall fp2int
	movw R20,R16
L45:
	sts _hxi,R20
	.dbline 124
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*(time_min-1)/360)*30;  //小时根据分钟的变化轨迹纵坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+10,R16
	std z+11,R17
	std z+12,R18
	std z+13,R19
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L53
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L54
L53:
	movw R30,R28
	ldd R16,z+10
	ldd R17,z+11
	ldd R18,z+12
	ldd R19,z+13
	xcall fp2int
	movw R20,R16
L54:
	sts _hyi,R20
	.dbline 125
; 	GUIline(64,64,hxi,hyi,0);  						             //小时指针在小时更新后清除前一痕迹
	clr R2
	clr R3
	std y+5,R3
	std y+4,R2
	mov R2,R20
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 127
; 
; 	hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;  	    
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+14,R16
	std z+15,R17
	std z+16,R18
	std z+17,R19
	movw R30,R28
	ldd R2,z+14
	ldd R3,z+15
	ldd R4,z+16
	ldd R5,z+17
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L55
	movw R30,R28
	ldd R2,z+14
	ldd R3,z+15
	ldd R4,z+16
	ldd R5,z+17
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L56
L55:
	movw R30,R28
	ldd R16,z+14
	ldd R17,z+15
	ldd R18,z+16
	ldd R19,z+17
	xcall fp2int
	movw R20,R16
L56:
	sts _hxi,R20
	.dbline 128
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+18,R16
	std z+19,R17
	std z+20,R18
	std z+21,R19
	movw R30,R28
	ldd R2,z+18
	ldd R3,z+19
	ldd R4,z+20
	ldd R5,z+21
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L57
	movw R30,R28
	ldd R2,z+18
	ldd R3,z+19
	ldd R4,z+20
	ldd R5,z+21
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L58
L57:
	movw R30,R28
	ldd R16,z+18
	ldd R17,z+19
	ldd R18,z+20
	ldd R19,z+21
	xcall fp2int
	movw R20,R16
L58:
	sts _hyi,R20
	.dbline 129
; 	GUIline(64,64,hxi,hyi,0x2ee0);  				             //小时指针在分钟更新后显示新的位置
	ldi R24,12000
	ldi R25,46
	std y+5,R25
	std y+4,R24
	mov R2,R20
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 130
; 	}
	xjmp L43
L42:
	.dbline 132
;    else
; 	{
	.dbline 133
;     hxi=64+cos(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L59
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L60
L59:
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall fp2int
	movw R20,R16
L60:
	sts _hxi,R20
	.dbline 134
;     hyi=64-sin(PI*0.5-PI*(time_hour)/6-PI*time_min/360)*30;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_hour
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L49
	ldi R17,>L49
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32fs
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L50
	ldi R17,>L50
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L46
	ldi R17,>L46
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+10,R16
	std z+11,R17
	std z+12,R18
	std z+13,R19
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L61
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L62
L61:
	movw R30,R28
	ldd R16,z+10
	ldd R17,z+11
	ldd R18,z+12
	ldd R19,z+13
	xcall fp2int
	movw R20,R16
L62:
	sts _hyi,R20
	.dbline 135
; 	GUIline(64,64,hxi,hyi,0x2ee0);  				            //小时指针在分钟不更新时显示原来位置
	ldi R24,12000
	ldi R25,46
	std y+5,R25
	std y+4,R24
	mov R2,R20
	std y+2,R2
	lds R2,_hxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 136
; 	}	
L43:
	.dbline 139
; 
; 
;    if(time_sec==00)												//分钟指针在秒更新后清除前一痕迹
	lds R2,_time_sec
	tst R2
	breq X3
	xjmp L63
X3:
	.dbline 140
; 	{
	.dbline 141
; 	mxi=64+cos(PI*0.5-PI*(time_min-1)/30)*40;				
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L65
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L66
L65:
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall fp2int
	movw R20,R16
L66:
	sts _mxi,R20
	.dbline 142
;     myi=64-sin(PI*0.5-PI*(time_min-1)/30)*40;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	subi R16,1
	sbci R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+10,R16
	std z+11,R17
	std z+12,R18
	std z+13,R19
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L69
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L70
L69:
	movw R30,R28
	ldd R16,z+10
	ldd R17,z+11
	ldd R18,z+12
	ldd R19,z+13
	xcall fp2int
	movw R20,R16
L70:
	sts _myi,R20
	.dbline 143
; 	GUIline(64,64,mxi,myi,0);  									
	clr R2
	clr R3
	std y+5,R3
	std y+4,R2
	mov R2,R20
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 144
; 	mxi=64+cos(PI*0.5-PI*time_min/30)*40;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+14,R16
	std z+15,R17
	std z+16,R18
	std z+17,R19
	movw R30,R28
	ldd R2,z+14
	ldd R3,z+15
	ldd R4,z+16
	ldd R5,z+17
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L71
	movw R30,R28
	ldd R2,z+14
	ldd R3,z+15
	ldd R4,z+16
	ldd R5,z+17
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L72
L71:
	movw R30,R28
	ldd R16,z+14
	ldd R17,z+15
	ldd R18,z+16
	ldd R19,z+17
	xcall fp2int
	movw R20,R16
L72:
	sts _mxi,R20
	.dbline 145
;     myi=64-sin(PI*0.5-PI*time_min/30)*40;
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+18,R16
	std z+19,R17
	std z+20,R18
	std z+21,R19
	movw R30,R28
	ldd R2,z+18
	ldd R3,z+19
	ldd R4,z+20
	ldd R5,z+21
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L73
	movw R30,R28
	ldd R2,z+18
	ldd R3,z+19
	ldd R4,z+20
	ldd R5,z+21
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L74
L73:
	movw R30,R28
	ldd R16,z+18
	ldd R17,z+19
	ldd R18,z+20
	ldd R19,z+21
	xcall fp2int
	movw R20,R16
L74:
	sts _myi,R20
	.dbline 146
; 	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒更新后显示新的位置
	ldi R24,736
	ldi R25,2
	std y+5,R25
	std y+4,R24
	mov R2,R20
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 147
; 	}
	xjmp L64
L63:
	.dbline 149
;   else
;  	{
	.dbline 150
;     mxi=64+cos(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹横坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L75
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L76
L75:
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall fp2int
	movw R20,R16
L76:
	sts _mxi,R20
	.dbline 151
;     myi=64-sin(PI*0.5-PI*time_min/30)*40;						//分钟的变化轨迹纵坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_min
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L67
	ldi R17,>L67
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+10,R16
	std z+11,R17
	std z+12,R18
	std z+13,R19
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L77
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L78
L77:
	movw R30,R28
	ldd R16,z+10
	ldd R17,z+11
	ldd R18,z+12
	ldd R19,z+13
	xcall fp2int
	movw R20,R16
L78:
	sts _myi,R20
	.dbline 152
; 	GUIline(64,64,mxi,myi,0x2e0);  								//分钟指针在秒不更新时显示原来的位置
	ldi R24,736
	ldi R25,2
	std y+5,R25
	std y+4,R24
	mov R2,R20
	std y+2,R2
	lds R2,_mxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 153
;   	}
L64:
	.dbline 155
; 
; 	sxi=64+cos(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹横坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_sec
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _cos
	movw R2,R16
	movw R4,R18
	ldi R16,<L81
	ldi R17,>L81
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L79
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L80
L79:
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall fp2int
	movw R20,R16
L80:
	sts _sxi,R20
	.dbline 156
;     syi=64-sin(PI*0.5-PI*time_sec/30)*50;						//秒指针的变化轨迹纵坐标计算公式
	ldi R16,<L47
	ldi R17,>L47
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L48
	ldi R17,>L48
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_time_sec
	clr R17
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	ldi R16,<L68
	ldi R17,>L68
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall div32fs
	xcall sub32f
	xcall _sin
	movw R2,R16
	movw R4,R18
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L81
	ldi R17,>L81
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32fs
	xcall sub32f
	movw R30,R28
	std z+10,R16
	std z+11,R17
	std z+12,R18
	std z+13,R19
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L82
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R20,R16
	subi R20,0  ; offset = 32768
	sbci R21,128
	xjmp L83
L82:
	movw R30,R28
	ldd R16,z+10
	ldd R17,z+11
	ldd R18,z+12
	ldd R19,z+13
	xcall fp2int
	movw R20,R16
L83:
	sts _syi,R20
	.dbline 158
	ldi R24,65504
	ldi R25,255
	std y+5,R25
	std y+4,R24
	mov R2,R20
	std y+2,R2
	lds R2,_sxi
	std y+0,R2
	ldi R18,64
	ldi R16,64
	xcall _GUIline
	.dbline 159
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
	.dbline 160
L38:
	.dbline 100
	xjmp L37
X1:
	.dbline -2
L36:
	adiw R28,22
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\main.c
_time_h::
	.blkb 1
	.dbfile C:/icc/include/TFTclock_main.h
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
L81:
	.word 0x0,0x4248
L68:
	.word 0x0,0x41f0
L67:
	.word 0x0,0x4220
L52:
	.word 0x0,0x4700
L51:
	.word 0x0,0x4280
L50:
	.word 0x0,0x43b4
L49:
	.word 0x0,0x40c0
L48:
	.word 0xfda,0x4049
L47:
	.word 0xfda,0x3fc9
L46:
	.word 0x0,0x41f0
