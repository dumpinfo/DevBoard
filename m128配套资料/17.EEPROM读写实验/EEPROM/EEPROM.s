	.module EEPROM.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的读写EEPROM示例程序
; //记录CPU启动的次数到EEPROM中
; //在LED数码管上显示读出的数据,可用复位键刷新显示
; //编译环境 ICCAVR 
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #define	 F_CPU	7372800							// 单片机主频为7.3728MHz,用于延时子程序
; #include <delay.h>
; #include <iom128v.h>
; 
; 
; //***********************************************************************
; //			定义变量区
	.dbline 21
; //***********************************************************************
	nop
	.dbline 22
; 
	nop
	.dbline 23
; #define Data_IO	        PORTA                	//数码管数据口
	nop
	.dbline 24
; #define Data_DDR        DDRA                 	//数码管数据口方向寄存器
	nop
	.dbline 25
; #define D_LE0	        PORTD &= ~(1 << PD4) 	//数码管段控制位为0，锁存端口数据
	nop
	.dbline 26
; #define D_LE1           PORTD |= (1 << PD4)  	//数码管段控制位为1，锁存器输出与端口一致
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
; #define W_LE0	        PORTD &= ~(1 << PD5) 	//数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  	//数码管位控制位为1
; 
; #define uchar           unsigned char
	.dbline 32
; #define uint            unsigned int
; 
	nop
	.dbline 33
; //***********************************************************************
	nop
	.dbline 34
; //			共阴数码管显示的断码表0～F
	nop
	.dbline 35
; //***********************************************************************
	nop
	.dbline 36
; 
	nop
	.dbline 37
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
	nop
	.dbline 38
; 	           0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 39
; uint A1,A2,A3;             		      			//定义的变量,显示数据处理
	nop
	.dbline 40
; 
	nop
	.dbline 41
; 
	nop
	.dbline 42
; 
	nop
	.dbline 43
; //***********************************************************************
	nop
	.dbline 44
; //			IO端口初始化
	nop
	.dbline 45
; //***********************************************************************
	nop
	.dbline 46
; 
	nop
	.dbline 47
; void system_init()
	nop
	.dbline 48
; {
	nop
	.dbline 49
;     Data_IO=0xFF;             						//数据口为输出
	nop
	.dbline 50
;     Data_DDR=0xFF;
	nop
	.dbline 51
; 
	nop
	.dbline 52
;     PORTD=0xFF;               						//74HC573的控制口，设置为输出
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
;     DDRD=0xFF;
; 	PORTB=0XFF;
; 	DDRB=0XFF;
; }
	.dbline 57
; 
	xcall _delay_3us
	.dbline 58
; //*************************************************************************
	xcall _delay_3us
	.dbline 59
; //			74HC573控制数码管动态扫描显示函数，显示采集到的温度
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
; 
; void Display_EEPROM(void)
; {
	.dbline 64
; 	 uchar i,j;
	xcall _delay_10us
	.dbline 65
; 	 system_init();
	xcall _delay_10us
	.dbline 66
;      j=0x01;                    			//此数据用来控制位选
	xcall _delay_10us
	.dbline 67
;  for(i=0;i<5;i++)               			//用后3位数码管来显示
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
;   {
;      D_LE1;                     
;      W_LE1;                     
	.dbline 71
;      Data_IO=~j;                
	xcall _delay_50us
	.dbline 72
;      W_LE0;                      
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
; 	 j=(j<<1);
;      Data_IO=0x00;           
;      D_LE0;                      
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;      delay_nms(1);                
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
;   }
;      D_LE1;                    
;      W_LE1;                    
;      Data_IO=~j;               
;      W_LE0;                    
; 	 j=(j<<1);
;      Data_IO=table[A1];         
;      D_LE0;                    
;      delay_nms(1);              
; 
;      D_LE1;                     
;      W_LE1;                     
;      Data_IO=~j;                
	.dbline 90
;      W_LE0;                      
	xcall _delay_100us
	.dbline 91
; 	 j=(j<<1);
	xcall _delay_100us
	.dbline 92
;      Data_IO=table[A2];             
	xcall _delay_100us
	.dbline 93
;      D_LE0;                      
	xcall _delay_100us
	.dbline 94
;      delay_nms(1);                
	xcall _delay_100us
	.dbline 95
; 
	xcall _delay_100us
	.dbline 96
; 	 D_LE1;                     
	xcall _delay_100us
	.dbline 97
;      W_LE1;                     
	xcall _delay_100us
	.dbline 98
;      Data_IO=~j;                
	xcall _delay_100us
	.dbline 99
;      W_LE0;                      
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
; 	 j=(j<<1);
;      Data_IO=table[A3];           
;      D_LE0;                      
;      delay_nms(1);                
; 
; 	 D_LE1;                     
;      W_LE1;                     
;      Data_IO=0xff;                
;      W_LE0;                      
; 
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
; 
; 
; //*************************************************************************
; //		数据处理函数
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; //*************************************************************************
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\17.EEPROM读写实验\EEPROM\EEPROM.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\17.EEPROM读写实验\EEPROM\EEPROM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 48
	.dbline 49
	ldi R24,255
	out 0x1b,R24
	.dbline 50
	out 0x1a,R24
	.dbline 52
	out 0x12,R24
	.dbline 53
	out 0x11,R24
	.dbline 54
	out 0x18,R24
	.dbline 55
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_EEPROM _Display_EEPROM fV
;              i -> R20
;              j -> R22
	.even
_Display_EEPROM::
	xcall push_gset2
	.dbline -1
	.dbline 63
	.dbline 65
	xcall _system_init
	.dbline 66
	ldi R22,1
	.dbline 67
	clr R20
	xjmp L24
L21:
	.dbline 68
	.dbline 69
	sbi 0x12,4
	.dbline 70
	sbi 0x12,5
	.dbline 71
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 72
	cbi 0x12,5
	.dbline 73
	lsl R22
	.dbline 74
	clr R2
	out 0x1b,R2
	.dbline 75
	cbi 0x12,4
	.dbline 76
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 77
L22:
	.dbline 67
	inc R20
L24:
	.dbline 67
	cpi R20,5
	brlo L21
	.dbline 78
	sbi 0x12,4
	.dbline 79
	sbi 0x12,5
	.dbline 80
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 81
	cbi 0x12,5
	.dbline 82
	lsl R22
	.dbline 83
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 84
	cbi 0x12,4
	.dbline 85
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 87
	sbi 0x12,4
	.dbline 88
	sbi 0x12,5
	.dbline 89
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 90
	cbi 0x12,5
	.dbline 91
	lsl R22
	.dbline 92
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 93
	cbi 0x12,4
	.dbline 94
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 96
	sbi 0x12,4
	.dbline 97
	sbi 0x12,5
	.dbline 98
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 99
	cbi 0x12,5
	.dbline 100
	lsl R22
	.dbline 101
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 102
	cbi 0x12,4
	.dbline 103
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 105
	sbi 0x12,4
	.dbline 106
	sbi 0x12,5
	.dbline 107
	ldi R24,255
	out 0x1b,R24
	.dbline 108
	cbi 0x12,5
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R20,R21
;         temp_d -> R20
	.even
_data_do::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 117
;  void data_do(uchar temp_d)
;  {
	.dbline 119
;      uint A2t;
;      A1=temp_d/100;                       //分出百，十，和个位
	ldi R18,100
	ldi R19,0
	mov R16,R20
	clr R17
	xcall div16s
	sts _A1+1,R17
	sts _A1,R16
	.dbline 120
;      A2t=temp_d%100;
	ldi R18,100
	ldi R19,0
	mov R16,R20
	clr R17
	xcall mod16s
	movw R20,R16
	.dbline 121
;      A2=A2t/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A2+1,R17
	sts _A2,R16
	.dbline 122
;      A3=A2t%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L25:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r A2t 20 i
	.dbsym r temp_d 20 c
	.dbend
	.dbfunc e eprom_read _eprom_read fV
;         p_buff -> R20,R21
;         number -> R18
;           addr -> R16,R17
	.even
_eprom_read::
	xcall push_gset1
	ldd R20,y+2
	ldd R21,y+3
	.dbline -1
	.dbline 130
; }
; 
; 
; //***********************************************************************
; //                EEPROM读取函数*/
; //            addr：地址；number：长度；p_buff：读出数据存放指针
; //***********************************************************************
; void eprom_read(unsigned int addr, unsigned char number, unsigned char *p_buff) {
L27:
	.dbline 132
L28:
	.dbline 132
; 
; 	while(EECR & (1 << EEWE));               //等待前面的写完成
	sbic 0x1c,1
	rjmp L27
	.dbline 134
; 
; 	EEARH = 0x00;                           //写高字节地址
	clr R2
	out 0x1f,R2
	xjmp L31
L30:
	.dbline 136
	.dbline 137
	movw R2,R16
	subi R16,255  ; offset = 1
	sbci R17,255
	out 0x1e,R2
	.dbline 138
	sbi 0x1c,0
	.dbline 139
	in R2,0x1d
	movw R30,R20
	st Z+,R2
	movw R20,R30
	.dbline 140
L31:
	.dbline 136
; 	
; 	while(number --) {
	mov R2,R18
	clr R3
	subi R18,1
	tst R2
	brne L30
	.dbline -2
L26:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r p_buff 20 pc
	.dbsym r number 18 c
	.dbsym r addr 16 i
	.dbend
	.dbfunc e eprom_write _eprom_write fV
;         p_buff -> R20,R21
;         number -> R18
;           addr -> R16,R17
	.even
_eprom_write::
	xcall push_gset1
	ldd R20,y+2
	ldd R21,y+3
	.dbline -1
	.dbline 146
; 		EEARL = addr ++;                 	//写地址低字节
; 		EECR |= (1 << EERE);            	//读允许位置1
; 		*p_buff++ = EEDR;               	//读出EEDR中的数据
; 		}
; }
; //***********************************************************************
; //              EEPROM写入函数
; //          addr：地址；number：长度；p_buff：写入数据存放指针
; //***********************************************************************
; void eprom_write(unsigned int addr, unsigned char number, unsigned char *p_buff) {
	.dbline 148
; 
; 	EEARH = 0x00;
	clr R2
	out 0x1f,R2
	xjmp L35
X1:
	.dbline 150
; 	
; 	while(number --) {
L37:
	.dbline 151
L38:
	.dbline 151
	sbic 0x1c,1
	rjmp L37
	.dbline 152
	movw R2,R16
	subi R16,255  ; offset = 1
	sbci R17,255
	out 0x1e,R2
	.dbline 153
	movw R30,R20
	ld R2,Z+
	movw R20,R30
	out 0x1d,R2
	.dbline 154
	sbi 0x1c,2
	.dbline 155
	cbi 0x1c,1
	.dbline 156
	sbi 0x1c,1
	.dbline 157
L35:
	.dbline 150
	mov R2,R18
	clr R3
	subi R18,1
	tst R2
	brne L38
	.dbline -2
L33:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r p_buff 20 pc
	.dbsym r number 18 c
	.dbsym r addr 16 i
	.dbend
	.dbfunc e main _main fV
;           temp -> y+2
	.even
_main::
	sbiw R28,3
	.dbline -1
	.dbline 165
; 		while(EECR & (1 << EEWE));       //等待前面的写完成
; 		EEARL = addr ++;                 //写地址
; 		EEDR = *p_buff ++;               //写数据到EEDR
; 		EECR |= (1 << EEMWE);            //主机写入允许位
; 		EECR&=~(1<<EEWE);
; 		EECR |= (1 << EEWE);             //EEWE为1，执行写操作
; 		}
; }
; 
; 
; //***********************************************************************
; //                       主函数
; //***********************************************************************
; void main(void) 
; {
	.dbline 168
; 
; 	unsigned char temp;
;     system_init();                      //系统初始化
	xcall _system_init
	.dbline 169
;     eprom_read(0x10, 0x01, &temp);		//读出记录
	movw R24,R28
	adiw R24,2
	std y+1,R25
	std y+0,R24
	ldi R18,1
	ldi R16,16
	ldi R17,0
	xcall _eprom_read
	.dbline 170
;     delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 171
; 	temp ++;                            //计数值加1
	ldd R24,y+2
	subi R24,255    ; addi 1
	std y+2,R24
	.dbline 172
;     eprom_write(0x10, 0x01, &temp);		//写入记录	
	movw R24,R28
	adiw R24,2
	std y+1,R25
	std y+0,R24
	ldi R18,1
	ldi R16,16
	ldi R17,0
	xcall _eprom_write
	.dbline 173
;     delay_nms(10);              
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	xjmp L42
L41:
	.dbline 176
	.dbline 177
	ldd R16,y+2
	xcall _data_do
	.dbline 178
	xcall _Display_EEPROM
	.dbline 179
L42:
	.dbline 175
	xjmp L41
X2:
	.dbline -2
L40:
	adiw R28,3
	.dbline 0 ; func end
	ret
	.dbsym l temp 2 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\17.EEPROM读写实验\EEPROM\EEPROM.C
_A3::
	.blkb 2
	.dbsym e A3 _A3 i
_A2::
	.blkb 2
	.dbsym e A2 _A2 i
_A1::
	.blkb 2
	.dbsym e A1 _A1 i
