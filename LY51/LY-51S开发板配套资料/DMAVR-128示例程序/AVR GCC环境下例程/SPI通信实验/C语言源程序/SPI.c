//DMAVR-128的SPI应用示例程序，采用SPI接口的DAC芯片TLC5615，连续进行电压转换
//DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615,SPI接口连接方式
//驱通过SPI接口，动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换
//LED指示灯DS3对应从暗到亮，表示电压逐渐增大
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
#include <avr/signal.h>     //中断信号头文件
//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define delay_us(x)     _delay_us(x)        //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC延时函数 x(ms)

#define cs0   PORTB &= ~(1 << PB0)          //片选信号置低
#define cs1   PORTB |= (1 << PB0)           //片选信号置高

uint da_data;
uchar count=0;
uint da_data2;
//*************************************************************************
//			初始化子程序
//*************************************************************************
void system_init()
{

	PORTB = 0x00;		         //电平设置
	DDRB = 0xFF;		         //方向输出

}
void SPI_init()
{
  SPCR=(1<<SPE)|(1<<MSTR);              //主机方式，SPI模式为0，SCK频率为Fosc/4
  
}


//*************************************************************************
//			主程序
//*************************************************************************

void main()
{ 
  system_init();                               //系统IO口初始化
  SPI_init();                                  //SPI初始化
  while(1)
  {
    for(da_data=0;da_data<0x03ff;da_data++)
    {
	  da_data = da_data<<2;
      cs0;                                    //使能DAC
      da_data2=(da_data&0xff00);               //提取数据的高8位
      da_data2>>=8;                            //高8位移到低8位，便于赋值
      SPDR=da_data2;                           //写数据的高8位到SPI数据寄存器
	   delay_ms(1);
      SPDR=da_data&0x00ff;                    //写数据的低8位到SPI数据寄存器
      delay_ms(1);
      cs1;
	  da_data = da_data>>2; 
	        delay_ms(1);                             //关闭使能
    }
  }
}
