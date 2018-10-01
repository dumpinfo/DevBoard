	.module DS18B20.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的温度传感器DS18B20控制程序，显示环境温度
; //DS18b20的C语言驱动程序，三位数码管显示，读取当前环境温度，精度达0.1度，温度范围0-99度
; //DS18B20 详细引脚功能描述1、GND 地信号；2、DQ数据输入出引脚。开漏单总线接口引脚。当被用在寄生电源下
; //也可以向器件提供电源；3、VDD可选择的VDD 引脚。当工作于寄生电源时，此引脚必须接地。
; //DS18B20 的使用方法。DS18B20 采用的是1－Wire 总线协议方式
; //即在一根数据线实现数据的双向传输
; //编译环境 ICCAVR 
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
	.dbline 21
; //***********************************************************************
	nop
	.dbline 22
; //			定义变量区
	nop
	.dbline 23
; //***********************************************************************
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
; #define Data_IO	        PORTA                   //数码管数据口
; #define Data_DDR        DDRA                 	//数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) 	//数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  	//数码管段控制位为1，锁存器输出与端口一致
	.dbline 32
; #define W_LE0	        PORTD &= ~(1 << PD5) 	//数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  	//数码管位控制位为1
	nop
	.dbline 33
; 
	nop
	.dbline 34
; #define DQ_IN	        DDRE &= ~(1 << PE4)		//设置输入，DS18B20接单片机PE4口
	nop
	.dbline 35
; #define DQ_OUT	        DDRE |= (1 << PE4)		//设置输出
	nop
	.dbline 36
; #define DQ_CLR	        PORTE &= ~(1 << PE4)	//置低电平
	nop
	.dbline 37
; #define DQ_SET	        PORTE |= (1 << PE4)		//置高电平
	nop
	.dbline 38
; #define DQ_R	        PINE & (1 << PE4)		//读电平
	nop
	.dbline 39
; 
	nop
	.dbline 40
; uchar key;
	nop
	.dbline 41
; uint temp_value;
	nop
	.dbline 42
; uint temp,A1,A2,A3;             		      	//定义的变量,显示数据处理
	nop
	.dbline 43
; uchar flag1; 
	nop
	.dbline 44
; 
	nop
	.dbline 45
; //***********************************************************************
	nop
	.dbline 46
; //			共阴数码管显示的断码表0～F
	nop
	.dbline 47
; //***********************************************************************
	nop
	.dbline 48
; 
	nop
	.dbline 49
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
	nop
	.dbline 50
; 	           0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 51
; 
	nop
	.dbline 52
; //***********************************************************************
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
; //			IO端口初始化
; //***********************************************************************
; 
; void System_Init()
	.dbline 57
; {
	xcall _delay_3us
	.dbline 58
;     Data_IO=0xFF;             //数据口为输出
	xcall _delay_3us
	.dbline 59
;     Data_DDR=0xFF;
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
;     PORTD=0xFF;               //74HC573的控制口，设置为输出
;     DDRD=0xFF;
; 	
	.dbline 64
; 	PORTB=0xFF;				  //关闭发光二极管
	xcall _delay_10us
	.dbline 65
; 	DDRB=0xFF;
	xcall _delay_10us
	.dbline 66
; }
	xcall _delay_10us
	.dbline 67
; 
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
; //*************************************************************************
; //			74HC573控制数码管动态扫描显示函数，显示采集到的温度
; //*************************************************************************
	.dbline 71
; 
	xcall _delay_50us
	.dbline 72
; void Display_DS18B20(uint data_b,uint data_s,uint data_g)
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
; {
; 	 uchar i,j;
; 	 System_Init();
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;      j=0x01;                    //此数据用来控制位选
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
;  for(i=0;i<5;i++)               //用后3位数码管来显示
;   {
;      D_LE1;                     
;      W_LE1;                     
;      Data_IO=~j;                
;      W_LE0;                      
; 	 j=(j<<1);
;      Data_IO=0x00;           
;      D_LE0;                      
;      delay_nms(1);                
;   }
;      D_LE1;                    
;      W_LE1;                    
	.dbline 90
;      Data_IO=~j;               
	xcall _delay_100us
	.dbline 91
;      W_LE0;                    
	xcall _delay_100us
	.dbline 92
; 	 j=(j<<1);
	xcall _delay_100us
	.dbline 93
;      Data_IO=table[A1];         
	xcall _delay_100us
	.dbline 94
;      D_LE0;                    
	xcall _delay_100us
	.dbline 95
;      delay_nms(1);              
	xcall _delay_100us
	.dbline 96
; 
	xcall _delay_100us
	.dbline 97
;      D_LE1;                     
	xcall _delay_100us
	.dbline 98
;      W_LE1;                     
	xcall _delay_100us
	.dbline 99
;      Data_IO=~j;                
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
;      W_LE0;                      
; 	 j=(j<<1);
;      Data_IO=table[A2]|0x80;         //显示小数点    
;      D_LE0;                      
;      delay_nms(1);                
; 
; 	 D_LE1;                     
;      W_LE1;                     
;      Data_IO=~j;                
;      W_LE0;                      
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 	 j=(j<<1);
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
;      Data_IO=table[A3];           
;      D_LE0;                      
;      delay_nms(1);                
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 	 D_LE1;                     
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\16.DS18B20温度传感器实验\DS18B20\DS18B20.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\16.DS18B20温度传感器实验\DS18B20\DS18B20.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 57
	.dbline 58
	ldi R24,255
	out 0x1b,R24
	.dbline 59
	out 0x1a,R24
	.dbline 61
	out 0x12,R24
	.dbline 62
	out 0x11,R24
	.dbline 64
	out 0x18,R24
	.dbline 65
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_DS18B20 _Display_DS18B20 fV
;              i -> R20
;              j -> R22
;         data_g -> y+4
;         data_s -> R20,R21
;         data_b -> R22,R23
	.even
_Display_DS18B20::
	xcall push_gset2
	movw R20,R18
	movw R22,R16
	.dbline -1
	.dbline 73
	.dbline 75
	xcall _System_Init
	.dbline 76
	ldi R22,1
	.dbline 77
	clr R20
	xjmp L24
L21:
	.dbline 78
	.dbline 79
	sbi 0x12,4
	.dbline 80
	sbi 0x12,5
	.dbline 81
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 82
	cbi 0x12,5
	.dbline 83
	lsl R22
	.dbline 84
	clr R2
	out 0x1b,R2
	.dbline 85
	cbi 0x12,4
	.dbline 86
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 87
L22:
	.dbline 77
	inc R20
L24:
	.dbline 77
	cpi R20,5
	brlo L21
	.dbline 88
	sbi 0x12,4
	.dbline 89
	sbi 0x12,5
	.dbline 90
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 91
	cbi 0x12,5
	.dbline 92
	lsl R22
	.dbline 93
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 94
	cbi 0x12,4
	.dbline 95
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 97
	sbi 0x12,4
	.dbline 98
	sbi 0x12,5
	.dbline 99
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 100
	cbi 0x12,5
	.dbline 101
	lsl R22
	.dbline 102
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R24,z+0
	ori R24,128
	out 0x1b,R24
	.dbline 103
	cbi 0x12,4
	.dbline 104
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 106
	sbi 0x12,4
	.dbline 107
	sbi 0x12,5
	.dbline 108
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 109
	cbi 0x12,5
	.dbline 110
	lsl R22
	.dbline 111
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 112
	cbi 0x12,4
	.dbline 113
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 115
	sbi 0x12,4
	.dbline 116
;      W_LE1;                     
	sbi 0x12,5
	.dbline 117
;      Data_IO=0xff;                
	ldi R24,255
	out 0x1b,R24
	.dbline 118
;      W_LE0;                      
	cbi 0x12,5
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbsym l data_g 4 i
	.dbsym r data_s 20 i
	.dbsym r data_b 22 i
	.dbend
	.dbfunc e DS18B20_Reset _DS18B20_Reset fc
;              i -> R20
	.even
_DS18B20_Reset::
	xcall push_gset1
	.dbline -1
	.dbline 129
; 
; }
; 
; 
; //************************************************************************* 
; //			DS18B20初始化
; //*************************************************************************
; 
; unsigned char DS18B20_Reset(void)                 //初始化和复位
; 
; {
	.dbline 131
; unsigned char i;
;     DQ_OUT;
	sbi 0x2,4
	.dbline 132
; 	DQ_CLR;
	cbi 0x3,4
	.dbline 133
; 	delay_n100us(5);				//延时500uS(480-960)
	ldi R16,5
	xcall _delay_n100us
	.dbline 134
; 	DQ_SET;
	sbi 0x3,4
	.dbline 135
; 	DQ_IN;
	cbi 0x2,4
	.dbline 136
; 	delay_n100us(1);				//延时100uS
	ldi R16,1
	xcall _delay_n100us
	.dbline 137
; 	i = DQ_R;
	in R20,0x1
	andi R20,16
	.dbline 138
; 	delay_n100us(5);				//延时500uS(保持>480uS)
	ldi R16,5
	xcall _delay_n100us
	.dbline 140
; 	
; 	if (i) 
	tst R20
	breq L26
	.dbline 141
;         {
	.dbline 142
; 		return 0x00;
	clr R16
	xjmp L25
L26:
	.dbline 146
; 		
;         }
; 	else 
;         {
	.dbline 147
; 		return 0x01;
	ldi R16,1
	.dbline -2
L25:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.dbfunc e DS18B20_Read_byte _DS18B20_Read_byte fc
;          value -> R20
;              i -> R22
	.even
_DS18B20_Read_byte::
	xcall push_gset2
	.dbline -1
	.dbline 159
; 		
;         }
; 
; }
; 
; 
; //************************************************************************* 
; //			DS18B20读一个字节函数
; //************************************************************************* 
;    
; unsigned char DS18B20_Read_byte(void) 
; {
	.dbline 162
; 
; 	unsigned char i;
; 	unsigned char value = 0;
	clr R20
	.dbline 163
; 	for (i = 8; i != 0; i--) 
	ldi R22,8
	xjmp L32
L29:
	.dbline 164
;         {
	.dbline 165
; 		value >>= 1;
	lsr R20
	.dbline 166
; 		DQ_OUT;
	sbi 0x2,4
	.dbline 167
; 		DQ_CLR;
	cbi 0x3,4
	.dbline 168
;         delay_10us();				//*延时10uS
	xcall _delay_10us
	.dbline 170
; 		
; 		DQ_SET;
	sbi 0x3,4
	.dbline 171
; 		DQ_IN;
	cbi 0x2,4
	.dbline 172
;         delay_10us();				//*延时10uS
	xcall _delay_10us
	.dbline 174
; 		
; 		if (DQ_R) 
	sbis 0x1,4
	rjmp L33
	.dbline 175
;                 {
	.dbline 176
; 			value|=0x80;
	ori R20,128
	.dbline 178
; 			
;                 }
L33:
	.dbline 179
	xcall _delay_50us
	.dbline 181
L30:
	.dbline 163
	dec R22
L32:
	.dbline 163
	tst R22
	brne L29
	.dbline 183
; 		delay_50us();			       //*延时50uS
; 		
;         }
; 	
; 	return(value);
	mov R16,R20
	.dbline -2
L28:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r value 20 c
	.dbsym r i 22 c
	.dbend
	.dbfunc e ds1820_write_byte _ds1820_write_byte fV
;              i -> R20
;          value -> R22
	.even
_ds1820_write_byte::
	xcall push_gset2
	mov R22,R16
	.dbline -1
	.dbline 191
; }
; 
; //************************************************************************* 
; //			向18B20写一个字节函数
; //*************************************************************************  
; 
; void ds1820_write_byte(unsigned char value) 
; {
	.dbline 194
; 
; 	unsigned char i;
; 	for (i = 8; i != 0; i--) 
	ldi R20,8
	xjmp L39
L36:
	.dbline 195
;         {
	.dbline 196
; 		DQ_OUT;
	sbi 0x2,4
	.dbline 197
; 		DQ_CLR;
	cbi 0x3,4
	.dbline 198
;         delay_10us();				 //延时10uS
	xcall _delay_10us
	.dbline 199
; 		if (value & 0x01) 
	sbrc R22,0
	.dbline 200
;                 {
	.dbline 201
; 			DQ_SET;
	sbi 0x3,4
	.dbline 203
; 			
;                 }
L40:
	.dbline 204
	ldi R16,1
	xcall _delay_n100us
	.dbline 205
	sbi 0x3,4
	.dbline 206
	lsr R22
	.dbline 208
L37:
	.dbline 194
	dec R20
L39:
	.dbline 194
	tst R20
	brne L36
	.dbline -2
L35:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r value 22 c
	.dbend
	.dbfunc e ds1820_start _ds1820_start fV
	.even
_ds1820_start::
	.dbline -1
	.dbline 216
; 		delay_n100us(1);			//延时100uS
; 		DQ_SET;			        	//位结束
; 		value >>= 1;
; 		
;         }
; 	
; }
; //*************************************************************************
; //				发送温度转换命令
; //************************************************************************* 
; 
; /*启动ds1820转换*/
; void ds1820_start(void) {
	.dbline 218
; 
; 	DS18B20_Reset();
	xcall _DS18B20_Reset
	.dbline 219
; 	ds1820_write_byte(0xCC);	
	ldi R16,204
	xcall _ds1820_write_byte
	.dbline 220
; 	ds1820_write_byte(0x44);	//启动转换
	ldi R16,68
	xcall _ds1820_write_byte
	.dbline -2
L42:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e DS18B20_Read_temp _DS18B20_Read_temp fi
;            buf -> y+0
;              i -> R20,R21
	.even
_DS18B20_Read_temp::
	xcall push_gset2
	sbiw R28,13
	.dbline -1
	.dbline 228
; }
; 
; //*************************************************************************
; //				DS8B20读取温度信息
; //************************************************************************* 
; 
; unsigned int DS18B20_Read_temp(void) 
; {
	.dbline 233
; 
; 	unsigned int i;
; 	unsigned char buf[9];
; 
; 	DS18B20_Reset();
	xcall _DS18B20_Reset
	.dbline 234
; 	ds1820_write_byte(0xCC);	
	ldi R16,204
	xcall _ds1820_write_byte
	.dbline 235
; 	ds1820_write_byte(0xBE);	//读取温度
	ldi R16,190
	xcall _ds1820_write_byte
	.dbline 236
; 	for (i = 0; i < 9; i++) 
	clr R20
	clr R21
	xjmp L47
L44:
	.dbline 237
	.dbline 238
	xcall _DS18B20_Read_byte
	movw R24,R28
	movw R30,R20
	add R30,R24
	adc R31,R25
	std z+0,R16
	.dbline 239
L45:
	.dbline 236
	subi R20,255  ; offset = 1
	sbci R21,255
L47:
	.dbline 236
	cpi R20,9
	ldi R30,0
	cpc R21,R30
	brlo L44
	.dbline 240
;      {
;  	  buf[i] = DS18B20_Read_byte();	
;      }
; 	i = buf[1];
	ldd R20,y+1
	clr R21
	.dbline 241
; 	i <<= 8;
	mov R21,R20
	clr R20
	.dbline 242
; 	i |= buf[0];
	ldd R2,y+0
	clr R3
	or R20,R2
	or R21,R3
	.dbline 243
; 	temp_value=i;
	sts _temp_value+1,R21
	sts _temp_value,R20
	.dbline 244
;     temp_value=temp_value*0.625; //不是乘以0.0625的原因是为了把小数点后一位数据也转化为可以显示的数据
	ldi R16,<L51
	ldi R17,>L51
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	ldi R16,<L52
	ldi R17,>L52
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	lds R16,_temp_value
	lds R17,_temp_value+1
	lsr R17
	ror R16
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall empy32fs
	lds R16,_temp_value
	lds R17,_temp_value+1
	andi R16,1
	andi R17,0
	xcall int2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32fs
	xcall empy32f
	movw R30,R28
	std z+9,R16
	std z+10,R17
	std z+11,R18
	std z+12,R19
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L53
	ldi R17,>L53
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L49
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L53
	ldi R17,>L53
	xcall lpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R22,R16
	subi R22,0  ; offset = 32768
	sbci R23,128
	xjmp L50
L49:
	movw R30,R28
	ldd R16,z+9
	ldd R17,z+10
	ldd R18,z+11
	ldd R19,z+12
	xcall fp2int
	movw R22,R16
L50:
	sts _temp_value+1,R23
	sts _temp_value,R22
	.dbline 247
; 		                        //比如温度本身为27.5度，为了在后续的数据处理程序中得到BCD码，我们先放大到275
;                                 //然后在显示的时候确定小数点的位置即可，就能显示出27.5度了
; 	return i;
	movw R16,R20
	.dbline -2
L43:
	adiw R28,13
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym l buf 0 A[9:9]c
	.dbsym r i 20 i
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R20,R21
;         temp_d -> R20,R21
	.even
_data_do::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 256
; }
; 
; 
; 
; //*************************************************************************
; //		温度数据处理函数
; //*************************************************************************
;  void data_do(uint temp_d)
;  {
	.dbline 258
;      uint A2t;
;      A1=temp_d/100;                       //分出百，十，和个位
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall div16u
	sts _A1+1,R17
	sts _A1,R16
	.dbline 259
;      A2t=temp_d%100;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	movw R20,R16
	.dbline 260
;      A2=A2t/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A2+1,R17
	sts _A2,R16
	.dbline 261
;      A3=A2t%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L54:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r A2t 20 i
	.dbsym r temp_d 20 i
	.dbend
	.dbfunc e main _main fV
;              j -> R20,R21
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 269
; }
; 
; //*************************************************************************
; //			主程序
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 271
;     uint j;
; 	DS18B20_Reset();			        //复位D18B20
	xcall _DS18B20_Reset
	xjmp L57
L56:
	.dbline 273
; while (1)
;     {
	.dbline 274
; 		ds1820_start();		           //启动一次转换
	xcall _ds1820_start
	.dbline 275
; 		DS18B20_Read_temp();		   //读取温度数值
	xcall _DS18B20_Read_temp
	.dbline 276
;         data_do(temp_value);       	   //处理数据，得到要显示的值
	lds R16,_temp_value
	lds R17,_temp_value+1
	xcall _data_do
	.dbline 277
; for(j=0;j<200;j++)
	clr R20
	clr R21
	xjmp L62
L59:
	.dbline 278
	.dbline 279
	lds R2,_A3
	lds R3,_A3+1
	std y+1,R3
	std y+0,R2
	lds R18,_A2
	lds R19,_A2+1
	lds R16,_A1
	lds R17,_A1+1
	xcall _Display_DS18B20
	.dbline 280
L60:
	.dbline 277
	subi R20,255  ; offset = 1
	sbci R21,255
L62:
	.dbline 277
	cpi R20,200
	ldi R30,0
	cpc R21,R30
	brlo L59
	.dbline 283
L57:
	.dbline 272
	xjmp L56
X1:
	.dbline -2
L55:
	adiw R28,2
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\16.DS18B20温度传感器实验\DS18B20\DS18B20.C
_flag1::
	.blkb 1
	.dbsym e flag1 _flag1 c
_A3::
	.blkb 2
	.dbsym e A3 _A3 i
_A2::
	.blkb 2
	.dbsym e A2 _A2 i
_A1::
	.blkb 2
	.dbsym e A1 _A1 i
_temp::
	.blkb 2
	.dbsym e temp _temp i
_temp_value::
	.blkb 2
	.dbsym e temp_value _temp_value i
_key::
	.blkb 1
	.dbsym e key _key c
	.area lit(rom, con, rel)
L53:
	.word 0x0,0x4700
L52:
	.word 0x0,0x4000
L51:
	.word 0x0,0x3f20
