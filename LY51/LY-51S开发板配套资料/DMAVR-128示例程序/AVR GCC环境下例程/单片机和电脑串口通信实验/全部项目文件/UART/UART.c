//DMAVR-128的USART串口发送与接收数据示例程序，采用串口1，发送和接收都是中断的方式
//先发送200个FF，然后单片机处于接收状态，接收数据显示在数码管上，电脑发送的数据格式如09，16进制形式
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		// 单片机主频为7.3728MHz,用于延时子程序 
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
#include <avr/interrupt.h>   //中断信号头文件

//***********************************************************************
//			定义变量区
//***********************************************************************

#define Data_IO	        PORTA                //数码管数据口
#define Data_DDR        DDRA                 //数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1


#define delay_us(x)     _delay_us(x)    //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC延时函数 x(ms)


#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

#define baud           9600                                     //设置波特率的大小
#define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //波特率计算公式
#define baud_h         (uchar)(baud_setting>>8)                 //提取高位
#define baud_l         (uchar)(baud_setting)                    //低位


uint   tx_count=200,tx_flag=0xff;
static uchar A1,A2,A3;                                  
uchar usart_tx_data;
uchar usart_rx_data;

//***********************************************************************
//			共阴数码管显示的断码表0～F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

//***********************************************************************
//			IO端口初始化
//***********************************************************************

void system_init()
{
    Data_IO=0xFF;             //数据口为输出
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573的控制口，设置为输出
    DDRD=0xFF;
}

//*************************************************************************
//			74HC573控制数码管动态扫描显示函数，显示采集到的温度
//*************************************************************************

void Display_Uart(uint data_b,uint data_s,uint data_g)
{
	 uchar i,j;
	 system_init();
     j=0x01;                    //此数据用来控制位选
 for(i=0;i<5;i++)               //用后3位数码管来显示
  {
     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=0x00;           
     D_LE0;                      
     delay_ms(1);                
  }
     D_LE1;                    
     W_LE1;                    
     Data_IO=~j;               
     W_LE0;                    
	 j=(j<<1);
     Data_IO=table[A1];         
     D_LE0;                    
     delay_ms(1);              

     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A2];             
     D_LE0;                      
     delay_ms(1);   
	 
	 D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A3];             
     D_LE0;                      
     delay_ms(1);                                      

}


void usart_init()
{
  UCSR1A=0x00;                                 //单倍速模式
  UCSR1B=0xF8;                                 //接收中断和发送中断允许                               
  UCSR1C=(1<<UCSZ11)|(1<<UCSZ10);              //写UCSRC寄存器,异步通信无校验，8位数据1位停止位
  UBRR1H=baud_h;                               //写波特率的值
  UBRR1L=baud_l; 
}

//*************************************************************************
//		数据处理函数
//*************************************************************************
 void data_do(uchar temp_d)
 {
     uchar A2t;
     A1=temp_d/100;                       //分出百，十，和个位
     A2t=temp_d%100;
     A2=A2t/10;
     A3=A2t%10;
}

//*************************************************************************
//		串口相关中断服务子程序
//*************************************************************************
                                     //数据发送结束中断向量
SIGNAL(SIG_USART1_TRANS)             //中断服务程序
{
   delay_ms(10);                   //相关操作
}

                                   //数据接收结束中断向量
SIGNAL(SIG_USART1_RECV)            //中断服务程序
{
    usart_rx_data=UDR1;            //将接收到的数据取出
    data_do(usart_rx_data);                   //数据处理，得到个位十位百位
	
}
                                  //数据寄存器空中断向量
SIGNAL(SIG_USART1_DATA)           //中断服务程序
{
                            
   UDR1=usart_tx_data;           //发送数据到数据寄存器
   tx_count--;
   if(tx_count==0x00)
   {
   tx_flag=0x01;
   UCSR1B=0xF0;                 //禁止发送
   }
}


//*************************************************************************
//			主程序
//*************************************************************************
void main()
{
  system_init();                             //系统初始化
  usart_init();                              //usart串口初始化配置
  usart_tx_data=0xff; 
  SREG|=0x80;                                //开启全局中断
  while(1)
  {  
     SREG=0x00;                               //关中断，PD口做IO口用，才能正常显示数码管
	 Display_Uart(A1,A2,A3);                  //显示接收到的数据   
	 SREG|=0x80;                              //开中断，用于下次接收中断
  }
}
