	.module USART.c
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的串口通信实验，通过getchar与printf输入和输出字符
; //编译环境 ICCAVR
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑																	
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
	.dbline 21
; #define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
	nop
	.dbline 22
; #define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
	nop
	.dbline 23
; #define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
	nop
	.dbline 24
; #define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1
	nop
	.dbline 25
; 
	nop
	.dbline 26
; #define	F_CPU		   7372800		 						    // 单片机主频为7.3728MHz
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
; #define baud           9600                                     //设置波特率的大小
; #define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
; #define baud_h         (uchar)(baud_setting>>8)                 //提取高位
; #define baud_l         (uchar)(baud_setting)                    //低位
	.dbline 32
; 
; 
	nop
	.dbline 33
; extern int _textmode;
	nop
	.dbline 34
; //***********************************************************************
	nop
	.dbline 35
; // 用于输出的标准格式函数，用printf输出到UART1
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; int putchar(char c)
	nop
	.dbline 38
;     {
	nop
	.dbline 39
;     if (_textmode && c == '\n')
	nop
	.dbline 40
;         putchar('\r');
	nop
	.dbline 41
;     while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
	nop
	.dbline 42
;         ;
	nop
	.dbline 43
;     UDR1 = c;
	nop
	.dbline 44
;     return c;
	nop
	.dbline 45
;     }
	nop
	.dbline 46
; //***********************************************************************
	nop
	.dbline 47
; // 用于输入的标准格式函数，用getchar通过UART1输入到单片机，代替C中的scanf
	nop
	.dbline 48
; //***********************************************************************
	nop
	.dbline 49
; 
	nop
	.dbline 50
; int getchar(void)
	nop
	.dbline 51
;     {
	nop
	.dbline 52
;     while ((UCSR1A & 0x80) == 0)
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
;         ;
;     return UDR1;
;     } 
; //***********************************************************************
	.dbline 57
; // 串口1初始化接口函数
	xcall _delay_3us
	.dbline 58
; // 初始化uart,查询方式读写
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
; void UART_Init(void)
; {
;  
;   UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//发送接收使能
	.dbline 64
;   UBRR1H=baud_h;                                	//写波特率的值
	xcall _delay_10us
	.dbline 65
;   UBRR1L=baud_l; 
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
; //***********************************************************************
; //		关闭数码管函数，为了数码管不显示乱码，属于初始化函数
; //***********************************************************************
	.dbline 71
; 
	xcall _delay_50us
	.dbline 72
; void LED_Off()
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
;     PORTD=0xFF;
; 	DDRD=0xFF;
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
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
;     W_LE1;                     
;     Data_IO=0xFF;                      //关数码管            
;     W_LE0; 
; }
; 
; //***********************************************************************
; //			主函数，调用SD卡读写函数
; //***********************************************************************
; 
; void main(void)
; {
;  unsigned char a;
;  
	.dbline 90
;  UART_Init();                 							  //串口初始化
	xcall _delay_100us
	.dbline 91
;  LED_Off();               							      //关数码管
	xcall _delay_100us
	.dbline 92
;  while(1)
	xcall _delay_100us
	.dbline 93
;  {
	xcall _delay_100us
	.dbline 94
;   printf("M128_ZZX2串口通信实验\r\n");
	xcall _delay_100us
	.dbline 95
;   printf("请通过串口调试助手发送字符\r\n");
	xcall _delay_100us
	.dbline 96
;   a=getchar();
	xcall _delay_100us
	.dbline 97
;   printf("接收到的字符是：%c\r\n",a);
	xcall _delay_100us
	.dbline 98
;  }
	xcall _delay_100us
	.dbline 99
; }
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
; 
;  
; 
; 
; 
; 
; 
; 
; 
; 
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 
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
; 
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\26.UART串口通信实验\USART\USART.c
	.dbfunc e putchar _putchar fI
;              c -> R20
	.even
_putchar::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 38
	.dbline 39
	lds R2,__textmode
	lds R3,__textmode+1
	tst R2
	brne X1
	tst R3
	breq L23
X1:
	cpi R20,10
	brne L23
	.dbline 40
	ldi R16,13
	xcall _putchar
L22:
	.dbline 42
L23:
	.dbline 41
	lds R2,155
	sbrs R2,5
	rjmp L22
	.dbline 43
	sts 156,R20
	.dbline 44
	mov R16,R20
	clr R17
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r c 20 c
	.dbend
	.dbfunc e getchar _getchar fI
	.even
_getchar::
	.dbline -1
	.dbline 51
L26:
	.dbline 53
L27:
	.dbline 52
	lds R2,155
	sbrs R2,7
	rjmp L26
	.dbline 54
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
	.dbline 63
	ldi R24,24
	sts 154,R24
	.dbline 64
	clr R2
	sts 152,R2
	.dbline 65
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
	.dbline 74
	ldi R24,255
	out 0x12,R24
	.dbline 75
	out 0x11,R24
	.dbline 76
	sbi 0x12,4
	.dbline 77
	sbi 0x12,5
	.dbline 78
	out 0x1b,R24
	.dbline 79
	cbi 0x12,5
	.dbline -2
L30:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              a -> R20
	.even
_main::
	.dbline -1
	.dbline 87
	.dbline 90
	xcall _UART_Init
	.dbline 91
	xcall _LED_Off
	xjmp L33
L32:
	.dbline 93
	.dbline 94
	ldi R16,<L35
	ldi R17,>L35
	xcall _printf
	.dbline 95
	ldi R16,<L36
	ldi R17,>L36
	xcall _printf
	.dbline 96
	xcall _getchar
	mov R20,R16
	.dbline 97
	mov R18,R20
	clr R19
	ldi R16,<L37
	ldi R17,>L37
	xcall _printf
	.dbline 98
L33:
	.dbline 92
	xjmp L32
X2:
	.dbline -2
L31:
	.dbline 0 ; func end
	ret
	.dbsym r a 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\26.UART串口通信实验\USART\USART.c
L37:
	.blkb 21
	.area idata
	.byte 189,211,202,213,181,189,181,196,215,214,183,251,202,199,163,186
	.byte 37,'c,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\26.UART串口通信实验\USART\USART.c
L36:
	.blkb 29
	.area idata
	.byte 199,235,205,168,185,253,180,174,191,218,181,247,202,212,214,250
	.byte 202,214,183,162,203,205,215,214,183,251,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\26.UART串口通信实验\USART\USART.c
L35:
	.blkb 24
	.area idata
	.byte 'M,49,50,56,95,'Z,'Z,'X,50,180,174,191,218,205,168,208
	.byte 197,202,181,209,233,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\26.UART串口通信实验\USART\USART.c
