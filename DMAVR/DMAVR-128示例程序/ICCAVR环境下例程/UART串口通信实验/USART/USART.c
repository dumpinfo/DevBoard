//DMAVR-128的串口通信实验，通过getchar与printf输入和输出字符
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************
#include <stdio.h>
#include <string.h>
#include <iom128v.h>
#include <delay.h>

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

/*数码管连接情况*/
#define Data_IO	        PORTA                			//数码管数据口
#define Data_DDR        DDRA                 			//数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1

#define	F_CPU		   7372800		 						    // 单片机主频为7.3728MHz
#define baud           9600                                     //设置波特率的大小
#define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
#define baud_h         (uchar)(baud_setting>>8)                 //提取高位
#define baud_l         (uchar)(baud_setting)                    //低位


extern int _textmode;
//***********************************************************************
// 用于输出的标准格式函数，用printf输出到UART1
//***********************************************************************
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

//***********************************************************************
//		关闭数码管函数，为了数码管不显示乱码，属于初始化函数
//***********************************************************************

void LED_Off()
{
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 
}

//***********************************************************************
//			主函数，调用SD卡读写函数
//***********************************************************************

void main(void)
{
 unsigned char a;
 
 UART_Init();                 							  //串口初始化
 LED_Off();               							      //关数码管
 while(1)
 {
  printf("DMAVR-128串口通信实验\r\n");
  printf("请通过串口调试助手发送字符\r\n");
  a=getchar();
  printf("接收到的字符是：%c\r\n",a);
 }
}

 

