	.module _1602.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\1602\1602.c
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
	.dbfile E:\DMAVR-~3\1602\1602.c
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 39
; //DMAVR-128的1602型LCD显示驱动程序，显示的是welcome和欣世纪电子网站地址
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
; #define uchar unsigned char
; #define uint  unsigned int
; 
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
; #define RS_SET	PORTF |= (1 << PF1)                  //RS置高
; 
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
; #define RW_SET	PORTF |= (1 << PF2)                  //RW置高
; 
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
; #define EN_SET	PORTF |= (1 << PF3)                  //E置高
; 
; #define Data_IO	        PORTA                //液晶数据口
; #define Data_DDR        DDRA                 //数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()
; {
	.dbline 41
; 
; 	Data_IO = 0xFF;				        //电平设置
	ldi R24,255
	out 0x1b,R24
	.dbline 42
; 	Data_DDR = 0xFF;				        //方向输出
	out 0x1a,R24
	.dbline 43
; 	PORTF = 0xFF;                       //电平设置
	sts 98,R24
	.dbline 44
; 	DDRF = 0xFF;                        //方向输出
	sts 97,R24
	.dbline 45
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 46
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 47
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 48
;     W_LE1;                     
	sbi 0x12,5
	.dbline 49
;     Data_IO=0xFF;                      //关数码管            
	out 0x1b,R24
	.dbline 50
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R10
	.even
_LCD_write_com::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 59
; }
; 
; //***********************************************************************
; //	显示屏命令写入函数
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 60
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 61
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 62
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 63
; 	Data_IO = com;
	out 0x1b,R10
	.dbline 64
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 65
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r com 10 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R10
	.even
_LCD_write_data::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 72
; }
; //***********************************************************************
; //	显示屏数据写入函数
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 73
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 74
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 75
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 76
; 	Data_IO = data;
	out 0x1b,R10
	.dbline 77
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 78
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r data 10 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 85
; }
; //***********************************************************************
; //	显示屏清空显示
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 86
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 87
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L22:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_xgsetF00C
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 94
; }
; //***********************************************************************
; //	显示屏字符串写入函数
; //***********************************************************************
; 
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
; {
	.dbline 96
; 	
;     if (y == 0) 
	tst R10
	brne L24
X3:
	.dbline 97
;     {
	.dbline 98
;     	LCD_write_com(0x80 + x);
	mov R16,R22
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 99
;     }
	xjmp L27
L24:
	.dbline 101
;     else 
;     {
	.dbline 102
;     	LCD_write_com(0xC0 + x);
	mov R16,R22
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 103
;     }
	xjmp L27
L26:
	.dbline 106
;     
;     while (*s) 
;     {
	.dbline 107
;     	LCD_write_data( *s);
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 108
;     	s ++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 109
;     }
L27:
	.dbline 105
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L26
X4:
	.dbline -2
L23:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+2
;              y -> R10
;              x -> R20
	.even
_LCD_write_char::
	st -y,R10
	st -y,R20
	mov R10,R18
	mov R20,R16
	.dbline -1
	.dbline 116
; }
; //***********************************************************************
; //	显示屏单字符写入函数
; //***********************************************************************
; 
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
; {
	.dbline 118
; 	
;     if (y == 0) 
	tst R10
	brne L30
X5:
	.dbline 119
;     {
	.dbline 120
;     	LCD_write_com(0x80 + x);
	mov R16,R20
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 121
;     }
	xjmp L31
L30:
	.dbline 123
;     else 
;     {
	.dbline 124
;     	LCD_write_com(0xC0 + x);
	mov R16,R20
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 125
;     }
L31:
	.dbline 127
;     
;     LCD_write_data( data);  
	ldd R16,y+2
	xcall _LCD_write_data
	.dbline -2
L29:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbsym l data 2 c
	.dbsym r y 10 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 134
; }
; //***********************************************************************
; //	显示屏初始化函数
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 135
; 	DDRA = 0xFF;				        //I/O口方向设置
	ldi R24,255
	out 0x1a,R24
	.dbline 136
; 	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	in R24,0x1a
	ori R24,224
	out 0x1a,R24
	.dbline 137
; 	LCD_write_com(0x38);				//显示模式设置
	ldi R16,56
	xcall _LCD_write_com
	.dbline 138
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 139
; 	LCD_write_com(0x08);				//显示关闭
	ldi R16,8
	xcall _LCD_write_com
	.dbline 140
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 141
;     LCD_write_com(0x01);				//显示清屏
	ldi R16,1
	xcall _LCD_write_com
	.dbline 142
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 143
;     LCD_write_com(0x06);				//显示光标移动设置
	ldi R16,6
	xcall _LCD_write_com
	.dbline 144
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 145
; 	LCD_write_com(0x0C);				//显示开及光标设置
	ldi R16,12
	xcall _LCD_write_com
	.dbline 146
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L32:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e main _main fV
;              i -> R22
;              p -> R20,R21
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 153
; }
; 
; //*************************************************************************
; //			主程序
; //*************************************************************************
; void main(void) 
; {
	.dbline 157
; 
; 	unsigned char i;
; 	unsigned char *p;
;     system_init();                                //系统初始化，设置IO口属性
	xcall _system_init
	.dbline 158
; 	delay_nms(100);                                //延时100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 159
; 	LCD_init();                                   //液晶参数初始化设置
	xcall _LCD_init
	xjmp L35
L34:
	.dbline 162
; 
;  while (1) 
;    {
	.dbline 163
; 		i = 1;
	ldi R22,1
	.dbline 164
; 		p = "www.avrgcc.com";                    //字符串输出显示
	ldi R20,<L37
	ldi R21,>L37
	.dbline 165
; 		LCD_clear();
	xcall _LCD_clear
	.dbline 166
; 		LCD_write_str(0,0,"Welcome");
	ldi R24,<L38
	ldi R25,>L38
	std y+1,R25
	std y+0,R24
	clr R18
	clr R16
	xcall _LCD_write_str
	.dbline 167
; 		delay_nms(250);
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	xjmp L40
L39:
	.dbline 169
; 		
; 		while (*p) {
	.dbline 170
; 			LCD_write_char(i,1,*p);          //单个字符输出显示
	movw R30,R20
	ldd R2,z+0
	std y+0,R2
	ldi R18,1
	mov R16,R22
	xcall _LCD_write_char
	.dbline 171
; 			i ++;
	inc R22
	.dbline 172
; 			p ++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 173
; 			delay_nms(250);                   //延时250ms
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	.dbline 174
; 			}
L40:
	.dbline 169
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L39
X6:
	.dbline 175
; 		delay_nms(250);
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	.dbline 176
;   }
L35:
	.dbline 161
	xjmp L34
X7:
	.dbline -2
L33:
	.dbline 0 ; func end
	adiw R28,2
	ret
	.dbsym r i 22 c
	.dbsym r p 20 pc
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\1602\1602.c
L38:
	.blkb 8
	.area idata
	.byte 'W,'e,'l,'c,'o,'m,'e,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\1602\1602.c
L37:
	.blkb 15
	.area idata
	.byte 'w,'w,'w,46,'a,'v,'r,'g,'c,'c,46,'c,'o,'m,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\1602\1602.c
; }
