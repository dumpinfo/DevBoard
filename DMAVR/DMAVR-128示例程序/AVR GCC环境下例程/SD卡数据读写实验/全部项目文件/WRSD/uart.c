//串口发送接收驱动程序
//采用标准输入输出格式进行打印，与单独发送接收字符不同
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************
#include <avr/io.h>
#include <avr/iom128.h>
#include <stdio.h>
#define	 F_CPU	7372800											// 单片机主频为7.3728MHz,用于计算波特率 

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

#define baud           9600                                     //设置波特率的大小
#define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
#define baud_h         (uchar)(baud_setting>>8)                 //提取高位
#define baud_l         (uchar)(baud_setting)                    //低位

static int uart_putchar(char c, FILE *stream);
static int uart_getchar(FILE *stream);

// 声明I/O指针并初始化
static FILE mystd = FDEV_SETUP_STREAM(uart_putchar, uart_getchar, _FDEV_SETUP_RW);

// 用于输出的标准格式函数
static int uart_putchar(char c, FILE *stream)
{
 if(c == '\n')
  uart_putchar('\r', stream);
 loop_until_bit_is_set(UCSR1A, UDRE1);  //实际是查询方式发送数据
 UDR1 = c;
 return 0;
}

// 用于输入的标准格式函数
static int uart_getchar(FILE *stream)
{
 loop_until_bit_is_set(UCSR1A, RXC1);  //实际是查询方式接收数据
 return UDR1;
}
//***********************************************************************
// 串口初始化接口函数
// 初始化uart,查询方式读写
//***********************************************************************
void UART_Init(void)
{
 
  UCSR1B = _BV(RXEN1) | _BV(TXEN1);             		//发送接收使能，等价于(1<<RXEN1)|(1<<TXEN1)
  UBRR1H=baud_h;                                		//写波特率的值
  UBRR1L=baud_l; 

  stdout = &mystd;
  stdin = &mystd;
  stderr = &mystd;
}
