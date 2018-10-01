	.module uart.c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\uart.c
	.dbfunc e putchar _putchar fI
;              c -> R20
	.even
_putchar::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 31
; //串口发送接收驱动程序
; //采用标准输入输出格式进行打印，与单独发送接收字符不同
; //编译环境 AVR Studio 4.17/AVR GCC
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.06.24
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <stdio.h>
; #include <string.h>
; #include <iom128v.h>
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define ulong           unsigned long
; #define	F_CPU		   7372800		 						    // 单片机主频为7.3728MHz
; #define baud           9600                                     //设置波特率的大小
; #define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
; #define baud_h         (uchar)(baud_setting>>8)                 //提取高位
; #define baud_l         (uchar)(baud_setting)                    //低位
; 
; //***********************************************************************
; // 用于输出的标准格式函数，用printf输出到UART1
; //***********************************************************************
; 
; extern int _textmode;
; 
; int putchar(char c)
;     {
	.dbline 32
;     if (_textmode && c == '\n')
	lds R2,__textmode
	lds R3,__textmode+1
	tst R2
	brne X0
	tst R3
	breq L5
X0:
	cpi R20,10
	brne L5
	.dbline 33
;         putchar('\r');
	ldi R16,13
	xcall _putchar
L4:
	.dbline 35
L5:
	.dbline 34
;     while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
	lds R2,155
	sbrs R2,5
	rjmp L4
	.dbline 36
;         ;
;     UDR1 = c;
	sts 156,R20
	.dbline 37
;     return c;
	mov R16,R20
	clr R17
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r c 20 c
	.dbend
	.dbfunc e getchar _getchar fI
	.even
_getchar::
	.dbline -1
	.dbline 44
;     }
; //***********************************************************************
; // 用于输入的标准格式函数，用getchar通过UART1输入到单片机，代替C中的scanf
; //***********************************************************************
; 
; int getchar(void)
;     {
L8:
	.dbline 46
L9:
	.dbline 45
;     while ((UCSR1A & 0x80) == 0)
	lds R2,155
	sbrs R2,7
	rjmp L8
	.dbline 47
;         ;
;     return UDR1;
	lds R16,156
	clr R17
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e UART_Init _UART_Init fV
	.even
_UART_Init::
	.dbline -1
	.dbline 54
;     } 
; //***********************************************************************
; // 串口1初始化接口函数
; // 初始化uart,查询方式读写
; //***********************************************************************
; void UART_Init(void)
; {
	.dbline 56
;  
;   UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//发送接收使能
	ldi R24,24
	sts 154,R24
	.dbline 57
;   UBRR1H=baud_h;                                	//写波特率的值
	clr R2
	sts 152,R2
	.dbline 58
;   UBRR1L=baud_l; 
	ldi R24,47
	sts 153,R24
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
