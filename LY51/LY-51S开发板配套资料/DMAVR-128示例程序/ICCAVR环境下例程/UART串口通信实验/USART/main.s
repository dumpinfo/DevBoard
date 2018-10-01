	.module main.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\USART\main.c
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
	.dbfile E:\DMAVR-~3\USART\main.c
	.dbfunc e putchar _putchar$device_specific$ fI
;              c -> R20
	.even
_putchar$device_specific$::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 38
; //DMAVR-128的串口通信实验，通过getchar与printf输入和输出字符
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; #include <stdio.h>
; #include <string.h>
; #include <iom128v.h>
; #include <delay.h>
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define ulong           unsigned long
; 
; /*数码管连接情况*/
; #define Data_IO	        PORTA                			//数码管数据口
; #define Data_DDR        DDRA                 			//数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1
; 
; #define	F_CPU		   7372800		 						    // 单片机主频为7.3728MHz
; #define baud           9600                                     //设置波特率的大小
; #define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
; #define baud_h         (uchar)(baud_setting>>8)                 //提取高位
; #define baud_l         (uchar)(baud_setting)                    //低位
; 
; 
; extern int _textmode;
; //***********************************************************************
; // 用于输出的标准格式函数，用printf输出到UART1
; //***********************************************************************
; int putchar(char c)
;     {
	.dbline 39
;     if (_textmode && c == '\n')
	lds R2,__textmode
	lds R3,__textmode+1
	tst R2
	brne X3
	tst R3
	breq L23
X3:
	cpi R20,10
	brne L23
X4:
	.dbline 40
;         putchar('\r');
	ldi R16,13
	xcall _putchar$device_specific$
L22:
	.dbline 42
;     while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
;         ;
L23:
	.dbline 41
	lds R2,155
	sbrs R2,5
	rjmp L22
X5:
	.dbline 43
;     UDR1 = c;
	sts 156,R20
	.dbline 44
;     return c;
	mov R16,R20
	clr R17
	.dbline -2
L19:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r c 20 c
	.dbend
	.dbfunc e getchar _getchar$device_specific$ fI
	.even
_getchar$device_specific$::
	.dbline -1
	.dbline 51
;     }
; //***********************************************************************
; // 用于输入的标准格式函数，用getchar通过UART1输入到单片机，代替C中的scanf
; //***********************************************************************
; 
; int getchar(void)
;     {
L26:
	.dbline 53
;     while ((UCSR1A & 0x80) == 0)
;         ;
L27:
	.dbline 52
	lds R2,155
	sbrs R2,7
	rjmp L26
X6:
	.dbline 54
;     return UDR1;
	lds R16,156
	clr R17
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e UART_Init _UART_Init fV
	.even
_UART_Init::
	.dbline -1
	.dbline 61
;     } 
; //***********************************************************************
; // 串口1初始化接口函数
; // 初始化uart,查询方式读写
; //***********************************************************************
; void UART_Init(void)
; {
	.dbline 63
;  
;   UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//发送接收使能
	ldi R24,24
	sts 154,R24
	.dbline 64
;   UBRR1H=baud_h;                                	//写波特率的值
	clr R2
	sts 152,R2
	.dbline 65
;   UBRR1L=baud_l; 
	ldi R24,47
	sts 153,R24
	.dbline -2
L29:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LED_Off _LED_Off fV
	.even
_LED_Off::
	.dbline -1
	.dbline 73
; }
; 
; //***********************************************************************
; //		关闭数码管函数，为了数码管不显示乱码，属于初始化函数
; //***********************************************************************
; 
; void LED_Off()
; {
	.dbline 74
;     PORTD=0xFF;
	ldi R24,255
	out 0x12,R24
	.dbline 75
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 76
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 77
;     W_LE1;                     
	sbi 0x12,5
	.dbline 78
;     Data_IO=0xFF;                      //关数码管            
	out 0x1b,R24
	.dbline 79
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L30:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              a -> R10
	.even
_main::
	.dbline -1
	.dbline 87
; }
; 
; //***********************************************************************
; //			主函数，调用SD卡读写函数
; //***********************************************************************
; 
; void main(void)
; {
	.dbline 90
;  unsigned char a;
;  
;  UART_Init();                 							  //串口初始化
	xcall _UART_Init
	.dbline 91
;  LED_Off();               							      //关数码管
	xcall _LED_Off
	xjmp L33
L32:
	.dbline 93
;  while(1)
;  {
	.dbline 94
;   printf("DMAVR-128串口通信实验\r\n");
	ldi R16,<L35
	ldi R17,>L35
	xcall _printf
	.dbline 95
;   printf("请通过串口调试助手发送字符\r\n");
	ldi R16,<L36
	ldi R17,>L36
	xcall _printf
	.dbline 96
;   a=getchar();
	xcall _getchar$device_specific$
	mov R10,R16
	.dbline 97
;   printf("接收到的字符是：%c\r\n",a);
	mov R18,R10
	clr R19
	ldi R16,<L37
	ldi R17,>L37
	xcall _printf
	.dbline 98
;  }
L33:
	.dbline 92
	xjmp L32
X7:
	.dbline -2
L31:
	.dbline 0 ; func end
	ret
	.dbsym r a 10 c
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\USART\main.c
L37:
	.blkb 21
	.area idata
	.byte 189,211,202,213,181,189,181,196,215,214,183,251,202,199,163,186
	.byte 37,'c,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\USART\main.c
L36:
	.blkb 29
	.area idata
	.byte 199,235,205,168,185,253,180,174,191,218,181,247,202,212,214,250
	.byte 202,214,183,162,203,205,215,214,183,251,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\USART\main.c
L35:
	.blkb 24
	.area idata
	.byte 'D,'M,'A,'V,'R,45,49,50,56,180,174,191,218,205,168,208
	.byte 197,202,181,209,233,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\USART\main.c
; }
; 
;  
; 
