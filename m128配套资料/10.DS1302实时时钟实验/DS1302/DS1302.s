	.module DS1302.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的DS1302实时时钟芯片驱动程序，若使用备用电池，
; //则在第一次写入初始数据后就不再写初始数据
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡
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
; //	定义变量区
; //***********************************************************************
; #define uchar unsigned char
	.dbline 21
; #define uint  unsigned int
	nop
	.dbline 22
; 
	nop
	.dbline 23
; /*复位脚*/
	nop
	.dbline 24
; #define RST_CLR	PORTE &= ~(1 << PE7)              //电平置低
	nop
	.dbline 25
; #define RST_SET	PORTE |= (1 << PE7)               //电平置高
	nop
	.dbline 26
; #define RST_IN	DDRE &= ~(1 << PE7)               //方向输入
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
; #define RST_OUT	DDRE |= (1 << PE7)                //方向输出
; 
; /*双向数据*/
; #define IO_CLR	PORTE &= ~(1 << PE6)              //电平置低
	.dbline 32
; #define IO_SET	PORTE |= (1 << PE6)               //电平置高
; #define IO_R	PINE & (1 << PE6)                 //电平读取
	nop
	.dbline 33
; #define IO_IN	DDRE &= ~(1 << PE6)               //方向输入
	nop
	.dbline 34
; #define IO_OUT	DDRE |= (1 << PE6)                //方向输出
	nop
	.dbline 35
; 
	nop
	.dbline 36
; /*时钟信号*/
	nop
	.dbline 37
; #define SCK_CLR	PORTE &= ~(1 << PE5)              //时钟信号
	nop
	.dbline 38
; #define SCK_SET	PORTE |= (1 << PE5)               //电平置高
	nop
	.dbline 39
; #define SCK_IN	DDRE &= ~(1 << PE5)               //方向输入
	nop
	.dbline 40
; #define SCK_OUT	DDRE |= (1 << PE5)                //方向输出
	nop
	.dbline 41
; 
	nop
	.dbline 42
; /*ds1302命令与相关地址*/
	nop
	.dbline 43
; #define ds1302_sec_add			0x80		//秒数据地址
	nop
	.dbline 44
; #define ds1302_min_add			0x82		//分数据地址
	nop
	.dbline 45
; #define ds1302_hr_add			0x84		//时数据地址
	nop
	.dbline 46
; #define ds1302_date_add			0x86		//日数据地址
	nop
	.dbline 47
; #define ds1302_month_add		0x88		//月数据地址
	nop
	.dbline 48
; #define ds1302_day_add			0x8a		//星期数据地址
	nop
	.dbline 49
; #define ds1302_year_add			0x8c		//年数据地址
	nop
	.dbline 50
; #define ds1302_control_add		0x8e		//控制数据地址
	nop
	.dbline 51
; #define ds1302_charger_add		0x90 					 
	nop
	.dbline 52
; #define ds1302_clkburst_add		0xbe
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
; #define RS_CLR	PORTF &= ~(1 << PF1)       //RS置低
; #define RS_SET	PORTF |= (1 << PF1)        //RS置高
; 
	.dbline 57
; #define RW_CLR	PORTF &= ~(1 << PF2)       //RW置低
	xcall _delay_3us
	.dbline 58
; #define RW_SET	PORTF |= (1 << PF2)        //RW置高
	xcall _delay_3us
	.dbline 59
; 
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
; #define EN_CLR	PORTF &= ~(1 << PF3)       //E置低
; #define EN_SET	PORTF |= (1 << PF3)        //E置高
; 
; #define Data_IO	        PORTA                //液晶数据口
	.dbline 64
; #define Data_DDR        DDRA                 //数据口方向寄存器
	xcall _delay_10us
	.dbline 65
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	xcall _delay_10us
	.dbline 66
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
	xcall _delay_10us
	.dbline 67
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
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
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; uchar time_buf[8] = {0x20,0x10,0x01,0x14,0x09,0x55,0x00,0x02};//DS1302初始值
	.dbline 71
; 
	xcall _delay_50us
	.dbline 72
; //*************************************************************************
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
; //			初始化子程序
; //*************************************************************************
; void system_init()
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; {
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
; 	Data_IO = 0xFF;				        //电平设置
; 	Data_DDR = 0xFF;				        //方向输出
; 	PORTF = 0xFF;                       //电平设置
; 	DDRF = 0xFF;                        //方向输出
;     PORTD=0xFF;
; 	DDRD=0xFF;
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
;     W_LE1;                     
;     Data_IO=0xFF;                      //关数码管            
;     W_LE0; 
; }
; 
	.dbline 90
; //***********************************************************************
	xcall _delay_100us
	.dbline 91
; //向DS1302写入一字节数据
	xcall _delay_100us
	.dbline 92
; //***********************************************************************
	xcall _delay_100us
	.dbline 93
; void ds1302_write_byte(unsigned char addr, unsigned char d) 
	xcall _delay_100us
	.dbline 94
; {
	xcall _delay_100us
	.dbline 95
; 
	xcall _delay_100us
	.dbline 96
; 	unsigned char i;
	xcall _delay_100us
	.dbline 97
; 	RST_SET;					//启动DS1302总线
	xcall _delay_100us
	.dbline 98
; 	
	xcall _delay_100us
	.dbline 99
; 	                                                //写入目标地址：addr
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
; 	IO_OUT;
; 	addr = addr & 0xFE;                            //最低位置零
; 	for (i = 0; i < 8; i ++) {
; 		if (addr & 0x01) {
; 			IO_SET;
; 			}
; 		else {
; 			IO_CLR;
; 			}
; 		SCK_SET;
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 		SCK_CLR;
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
; 		addr = addr >> 1;
; 		}
; 	
; 	                                              //写入数据：d
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 	IO_OUT;
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
_time_buf::
	.blkb 2
	.area idata
	.byte 32,16
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 1,20
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 9,'U
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\10.DS1302实时时钟实验\DS1302\DS1302.C
	.dbsym e time_buf _time_buf A[8:8]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\10.DS1302实时时钟实验\DS1302\DS1302.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 76
	.dbline 78
	ldi R24,255
	out 0x1b,R24
	.dbline 79
	out 0x1a,R24
	.dbline 80
	sts 98,R24
	.dbline 81
	sts 97,R24
	.dbline 82
	out 0x12,R24
	.dbline 83
	out 0x11,R24
	.dbline 84
	sbi 0x12,4
	.dbline 85
	sbi 0x12,5
	.dbline 86
	out 0x1b,R24
	.dbline 87
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ds1302_write_byte _ds1302_write_byte fV
;              i -> R20
;              d -> R18
;           addr -> R16
	.even
_ds1302_write_byte::
	xcall push_gset1
	.dbline -1
	.dbline 94
	.dbline 97
	sbi 0x3,7
	.dbline 100
	sbi 0x2,6
	.dbline 101
	andi R16,254
	.dbline 102
	clr R20
	xjmp L24
L21:
	.dbline 102
	.dbline 103
	sbrs R16,0
	rjmp L25
	.dbline 103
	.dbline 104
	sbi 0x3,6
	.dbline 105
	xjmp L26
L25:
	.dbline 106
	.dbline 107
	cbi 0x3,6
	.dbline 108
L26:
	.dbline 109
	sbi 0x3,5
	.dbline 110
	cbi 0x3,5
	.dbline 111
	lsr R16
	.dbline 112
L22:
	.dbline 102
	inc R20
L24:
	.dbline 102
	cpi R20,8
	brlo L21
	.dbline 115
	sbi 0x2,6
	.dbline 116
	clr R20
	xjmp L30
L27:
	.dbline 116
; 	for (i = 0; i < 8; i ++) {
	.dbline 117
; 		if (d & 0x01) {
	sbrs R18,0
	rjmp L31
	.dbline 117
	.dbline 118
; 			IO_SET;
	sbi 0x3,6
	.dbline 119
; 			}
	xjmp L32
L31:
	.dbline 120
; 		else {
	.dbline 121
; 			IO_CLR;
	cbi 0x3,6
	.dbline 122
; 			}
L32:
	.dbline 123
	sbi 0x3,5
	.dbline 124
	cbi 0x3,5
	.dbline 125
	lsr R18
	.dbline 126
L28:
	.dbline 116
	inc R20
L30:
	.dbline 116
	cpi R20,8
	brlo L27
	.dbline 127
; 		SCK_SET;
; 		SCK_CLR;
; 		d = d >> 1;
; 		}
; 	RST_CLR;					//停止DS1302总线
	cbi 0x3,7
	.dbline -2
L20:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r d 18 c
	.dbsym r addr 16 c
	.dbend
	.dbfunc e ds1302_read_byte _ds1302_read_byte fc
;           temp -> R20
;              i -> R22
;           addr -> R16
	.even
_ds1302_read_byte::
	xcall push_gset2
	.dbline -1
	.dbline 133
; }
; //***********************************************************************
; //                   从DS1302读出一字节数据
; //***********************************************************************
; unsigned char ds1302_read_byte(unsigned char addr)
;  {
	.dbline 137
; 
; 	unsigned char i;
; 	unsigned char temp;
; 	RST_SET;					//启动DS1302总线
	sbi 0x3,7
	.dbline 140
; 
; 	                                                //写入目标地址：addr
; 	IO_OUT;
	sbi 0x2,6
	.dbline 141
; 	addr = addr | 0x01;                             //最低位置高
	ori R16,1
	.dbline 142
	clr R22
	xjmp L37
L34:
	.dbline 142
; 	for (i = 0; i < 8; i ++) {
	.dbline 143
; 		if (addr & 0x01) {
	sbrs R16,0
	rjmp L38
	.dbline 143
	.dbline 144
; 			IO_SET;
	sbi 0x3,6
	.dbline 145
; 			}
	xjmp L39
L38:
	.dbline 146
; 		else {
	.dbline 147
; 			IO_CLR;
	cbi 0x3,6
	.dbline 148
; 			}
L39:
	.dbline 149
	sbi 0x3,5
	.dbline 150
	cbi 0x3,5
	.dbline 151
	lsr R16
	.dbline 152
L35:
	.dbline 142
	inc R22
L37:
	.dbline 142
	cpi R22,8
	brlo L34
	.dbline 155
; 		SCK_SET;
; 		SCK_CLR;
; 		addr = addr >> 1;
; 		}
; 	
; 	/*输出数据：temp*/
; 	IO_IN;
	cbi 0x2,6
	.dbline 156
	clr R22
	xjmp L43
L40:
	.dbline 156
; 	for (i = 0; i < 8; i ++) {
	.dbline 157
; 		temp = temp >> 1;
	lsr R20
	.dbline 158
; 		if (IO_R) {
	sbis 0x1,6
	rjmp L44
	.dbline 158
	.dbline 159
; 			temp |= 0x80;
	ori R20,128
	.dbline 160
; 			}
	xjmp L45
L44:
	.dbline 161
; 		else {
	.dbline 162
; 			temp &= 0x7F;
	andi R20,127
	.dbline 163
; 			}
L45:
	.dbline 164
	sbi 0x3,5
	.dbline 165
	cbi 0x3,5
	.dbline 166
L41:
	.dbline 156
	inc R22
L43:
	.dbline 156
	cpi R22,8
	brlo L40
	.dbline 168
; 		SCK_SET;
; 		SCK_CLR;
; 		}
; 	
; 	RST_CLR;					//停止DS1302总线
	cbi 0x3,7
	.dbline 169
; 	return temp;
	mov R16,R20
	.dbline -2
L33:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r temp 20 c
	.dbsym r i 22 c
	.dbsym r addr 16 c
	.dbend
	.dbfunc e ds1302_write_time _ds1302_write_time fV
	.even
_ds1302_write_time::
	.dbline -1
	.dbline 177
; }
; 
; //***********************************************************************
; //                   向DS302写入时钟数据
; //***********************************************************************
; 
; void ds1302_write_time(void)
;  {
	.dbline 179
; 
; 	ds1302_write_byte(ds1302_control_add,0x00);		//关闭写保护 
	clr R18
	ldi R16,142
	xcall _ds1302_write_byte
	.dbline 180
; 	ds1302_write_byte(ds1302_sec_add,0x80);			//暂停 
	ldi R18,128
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 182
; 	//ds1302_write_byte(ds1302_charger_add,0xa9);		//涓流充电 
; 	ds1302_write_byte(ds1302_year_add,time_buf[1]);		//年 
	lds R18,_time_buf+1
	ldi R16,140
	xcall _ds1302_write_byte
	.dbline 183
; 	ds1302_write_byte(ds1302_month_add,time_buf[2]);	//月 
	lds R18,_time_buf+2
	ldi R16,136
	xcall _ds1302_write_byte
	.dbline 184
; 	ds1302_write_byte(ds1302_date_add,time_buf[3]);		//日 
	lds R18,_time_buf+3
	ldi R16,134
	xcall _ds1302_write_byte
	.dbline 185
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//周 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 186
; 	ds1302_write_byte(ds1302_hr_add,time_buf[4]);		//时 
	lds R18,_time_buf+4
	ldi R16,132
	xcall _ds1302_write_byte
	.dbline 187
; 	ds1302_write_byte(ds1302_min_add,time_buf[5]);		//分
	lds R18,_time_buf+5
	ldi R16,130
	xcall _ds1302_write_byte
	.dbline 188
; 	ds1302_write_byte(ds1302_sec_add,time_buf[6]);		//秒
	lds R18,_time_buf+6
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 189
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//周 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 190
; 	ds1302_write_byte(ds1302_control_add,0x80);		//打开写保护 
	ldi R18,128
	ldi R16,142
	xcall _ds1302_write_byte
	.dbline -2
L46:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ds1302_read_time _ds1302_read_time fV
	.even
_ds1302_read_time::
	.dbline -1
	.dbline 198
; }
; 
; //***********************************************************************
; //                     从DS302读出时钟数据
; //***********************************************************************
; 
; void ds1302_read_time(void)  
; { 
	.dbline 200
; 
; 	time_buf[1]=ds1302_read_byte(ds1302_year_add);		//年 
	ldi R16,140
	xcall _ds1302_read_byte
	sts _time_buf+1,R16
	.dbline 201
; 	time_buf[2]=ds1302_read_byte(ds1302_month_add);		//月 
	ldi R16,136
	xcall _ds1302_read_byte
	sts _time_buf+2,R16
	.dbline 202
; 	time_buf[3]=ds1302_read_byte(ds1302_date_add);		//日 
	ldi R16,134
	xcall _ds1302_read_byte
	sts _time_buf+3,R16
	.dbline 203
; 	time_buf[4]=ds1302_read_byte(ds1302_hr_add);		//时 
	ldi R16,132
	xcall _ds1302_read_byte
	sts _time_buf+4,R16
	.dbline 204
; 	time_buf[5]=ds1302_read_byte(ds1302_min_add);		//分 
	ldi R16,130
	xcall _ds1302_read_byte
	sts _time_buf+5,R16
	.dbline 205
; 	time_buf[6]=(ds1302_read_byte(ds1302_sec_add))&0x7F;//秒 
	ldi R16,128
	xcall _ds1302_read_byte
	mov R24,R16
	andi R24,127
	sts _time_buf+6,R24
	.dbline 206
; 	time_buf[7]=ds1302_read_byte(ds1302_day_add);		//周 
	ldi R16,138
	xcall _ds1302_read_byte
	sts _time_buf+7,R16
	.dbline -2
L55:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ds1302_init _ds1302_init fV
	.even
_ds1302_init::
	.dbline -1
	.dbline 214
; }
; 
; //***********************************************************************
; //               DS302初始化函数
; //***********************************************************************
; 
; void ds1302_init(void) 
; {
	.dbline 216
; 	
; 	RST_CLR;			//RST脚置低
	cbi 0x3,7
	.dbline 217
; 	SCK_CLR;			//SCK脚置低
	cbi 0x3,5
	.dbline 218
; 	RST_OUT;			//RST脚设置为输出
	sbi 0x2,7
	.dbline 219
; 	SCK_OUT;			//SCK脚设置为输出
	sbi 0x2,5
	.dbline -2
L63:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R20
	.even
_LCD_write_com::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 228
; }
; 
; //***********************************************************************
; //	显示屏命令写入函数
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 229
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 230
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 231
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 232
; 	Data_IO = com;
	out 0x1b,R20
	.dbline 233
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 234
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L64:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r com 20 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R20
	.even
_LCD_write_data::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 241
; }
; //***********************************************************************
; //	显示屏数据写入函数
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 242
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 243
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 244
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 245
; 	Data_IO = data;
	out 0x1b,R20
	.dbline 246
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 247
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L65:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r data 20 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 254
; }
; //***********************************************************************
; //	显示屏清空显示
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 255
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 256
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L66:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_gset3
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 263
; }
; //***********************************************************************
; //	显示屏字符串写入函数
; //***********************************************************************
; 
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
; {
	.dbline 265
; 	
;     if (y == 0) 
	tst R10
	brne L68
	.dbline 266
;     {
	.dbline 267
;     	LCD_write_com(0x80 + x);
	mov R16,R22
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 268
;     }
	xjmp L71
L68:
	.dbline 270
;     else 
;     {
	.dbline 271
;     	LCD_write_com(0xC0 + x);
	mov R16,R22
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 272
;     }
	xjmp L71
L70:
	.dbline 275
	.dbline 276
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 277
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 278
L71:
	.dbline 274
;     
;     while (*s) 
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L70
	.dbline -2
L67:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+4
;              y -> R22
;              x -> R20
	.even
_LCD_write_char::
	xcall push_gset2
	mov R22,R18
	mov R20,R16
	.dbline -1
	.dbline 285
;     {
;     	LCD_write_data( *s);
;     	s ++;
;     }
; }
; //***********************************************************************
; //	显示屏单字符写入函数
; //***********************************************************************
; 
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
; {
	.dbline 287
; 	
;     if (y == 0) 
	tst R22
	brne L74
	.dbline 288
;     {
	.dbline 289
;     	LCD_write_com(0x80 + x);
	mov R16,R20
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 290
;     }
	xjmp L75
L74:
	.dbline 292
;     else 
;     {
	.dbline 293
;     	LCD_write_com(0xC0 + x);
	mov R16,R20
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 294
;     }
L75:
	.dbline 296
;     
;     LCD_write_data( data);  
	ldd R16,y+4
	xcall _LCD_write_data
	.dbline -2
L73:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym l data 4 c
	.dbsym r y 22 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 303
; }
; //***********************************************************************
; //	显示屏初始化函数
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 304
; 	system_init();
	xcall _system_init
	.dbline 305
; 	LCD_write_com(0x38);				//显示模式设置
	ldi R16,56
	xcall _LCD_write_com
	.dbline 306
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 307
; 	LCD_write_com(0x08);				//显示关闭
	ldi R16,8
	xcall _LCD_write_com
	.dbline 308
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 309
;     LCD_write_com(0x01);				//显示清屏
	ldi R16,1
	xcall _LCD_write_com
	.dbline 310
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 311
;     LCD_write_com(0x06);				//显示光标移动设置
	ldi R16,6
	xcall _LCD_write_com
	.dbline 312
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 313
; 	LCD_write_com(0x0C);				//显示开及光标设置
	ldi R16,12
	xcall _LCD_write_com
	.dbline 314
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L76:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;           temp -> R20
	.even
_main::
	sbiw R28,1
	.dbline -1
	.dbline 323
; }
; 
; //***********************************************************************
; //	主函数
; //***********************************************************************
; 
; void main(void) 
; 
; {
	.dbline 326
; 
; 	unsigned char temp;
;  	delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 327
; 	LCD_init();                           //1602液晶初始化
	xcall _LCD_init
	.dbline 328
; 	ds1302_init();                        //DS1302初始化
	xcall _ds1302_init
	.dbline 329
; 	delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 330
; 	ds1302_write_time();                 //向DS1302写初始数据，如年月和时间等
	xcall _ds1302_write_time
	xjmp L79
L78:
	.dbline 333
	.dbline 334
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 335
	xcall _ds1302_read_time
	.dbline 337
	lds R20,_time_buf
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 338
	std y+0,R20
	clr R18
	clr R16
	xcall _LCD_write_char
	.dbline 339
	lds R20,_time_buf
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 340
	std y+0,R20
	clr R18
	ldi R16,1
	xcall _LCD_write_char
	.dbline 341
	lds R20,_time_buf+1
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 342
	std y+0,R20
	clr R18
	ldi R16,2
	xcall _LCD_write_char
	.dbline 343
	lds R20,_time_buf+1
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 344
	std y+0,R20
	clr R18
	ldi R16,3
	xcall _LCD_write_char
	.dbline 345
	ldi R24,45
	std y+0,R24
	clr R18
	ldi R16,4
	xcall _LCD_write_char
	.dbline 347
	lds R20,_time_buf+2
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 348
	std y+0,R20
	clr R18
	ldi R16,5
	xcall _LCD_write_char
	.dbline 349
	lds R20,_time_buf+2
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 350
	std y+0,R20
	clr R18
	ldi R16,6
	xcall _LCD_write_char
	.dbline 351
	ldi R24,45
	std y+0,R24
	clr R18
	ldi R16,7
	xcall _LCD_write_char
	.dbline 353
	lds R20,_time_buf+3
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 354
	std y+0,R20
	clr R18
	ldi R16,8
	xcall _LCD_write_char
	.dbline 355
	lds R20,_time_buf+3
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 356
	std y+0,R20
	clr R18
	ldi R16,9
	xcall _LCD_write_char
	.dbline 358
	lds R20,_time_buf+4
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 359
	std y+0,R20
	ldi R18,1
	ldi R16,8
	xcall _LCD_write_char
	.dbline 360
	lds R20,_time_buf+4
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 361
	std y+0,R20
	ldi R18,1
	ldi R16,9
	xcall _LCD_write_char
	.dbline 362
	ldi R24,58
	std y+0,R24
	ldi R18,1
	ldi R16,10
	xcall _LCD_write_char
	.dbline 364
	lds R20,_time_buf+5
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 365
	std y+0,R20
	ldi R18,1
	ldi R16,11
	xcall _LCD_write_char
	.dbline 366
	lds R20,_time_buf+5
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 367
	std y+0,R20
	ldi R18,1
	ldi R16,12
	xcall _LCD_write_char
	.dbline 368
	ldi R24,58
	std y+0,R24
	ldi R18,1
	ldi R16,13
	xcall _LCD_write_char
	.dbline 370
	lds R20,_time_buf+6
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 371
	std y+0,R20
	ldi R18,1
	ldi R16,14
	xcall _LCD_write_char
	.dbline 372
	lds R20,_time_buf+6
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 373
	std y+0,R20
	ldi R18,1
	ldi R16,15
	xcall _LCD_write_char
	.dbline 374
L79:
	.dbline 332
	xjmp L78
X1:
	.dbline -2
L77:
	adiw R28,1
	.dbline 0 ; func end
	ret
	.dbsym r temp 20 c
	.dbend
