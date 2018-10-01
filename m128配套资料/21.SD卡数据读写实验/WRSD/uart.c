//串口发送接收驱动程序
//采用标准输入输出格式进行打印，与单独发送接收字符不同
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//忠兴电子元件店编辑
//日期：2010.06.24
//***********************************************************************
//			包含文件
//***********************************************************************

#include <stdio.h>
#include <string.h>
#include <iom128v.h>

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long
#define	F_CPU		   7372800		 						    // 单片机主频为7.3728MHz
#define baud           9600                                     //设置波特率的大小
#define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
#define baud_h         (uchar)(baud_setting>>8)                 //提取高位
#define baud_l         (uchar)(baud_setting)                    //低位

//***********************************************************************
// 用于输出的标准格式函数，用printf输出到UART1
//***********************************************************************

extern int _textmode;

int putchar(char c)
    {
    if (_textmode && c == '\n')
        putchar('\r');
    while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
        ;
    UDR1 = c;
    return c;
    }
//***********************************************************************
// 用于输入的标准格式函数，用getchar通过UART1输入到单片机，代替C中的scanf
//***********************************************************************

int getchar(void)
    {
    while ((UCSR1A & 0x80) == 0)
        ;
    return UDR1;
    } 
//***********************************************************************
// 串口1初始化接口函数
// 初始化uart,查询方式读写
//***********************************************************************
void UART_Init(void)
{
 
  UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//发送接收使能
  UBRR1H=baud_h;                                	//写波特率的值
  UBRR1L=baud_l; 
}
