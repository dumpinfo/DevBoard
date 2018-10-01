//DMAVR-M16的DAC转换驱动程序，DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615
//驱动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换，LED指示灯对应从暗到亮
//编译环境 AVR Studio 4.13/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.xin-ic.com
//日期：2008.09.26
//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		// 单片机主频为7.3728MHz,用于延时子程序
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>

//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

uchar dis1[]={"jingyehanxing "};            //旺旺名称
uchar dis2[]={"TEL:15967087131 "};          //欣世纪电子购买热线

#define delay_us(x)     _delay_us(x)        //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC延时函数 x(ms)

#define cs0   PORTB &= ~(1 << PB0)
#define cs1   PORTB |= (1 << PB0)
#define din0   PORTB &= ~(1 << PB2)
#define din1   PORTB |= (1 << PB2)
#define dout0   PORTB &= ~(1 << PB3)
#define dout1   PORTB |= (1 << PB3)
#define sclk0   PORTB &= ~(1 << PB1)
#define sclk1   PORTB |= (1 << PB1)


uint da_data;
//*************************************************************************
//			初始化子程序
//*************************************************************************
void system_init()
{

	PORTB = 0xFF;				        //电平设置
	DDRB = 0xFF;				        //方向输出

}
//*************************************************************************
//			DAC转换程序
//*************************************************************************
void dac_ser(uint data)
{
  uchar i;
  uint da_data2;

  cs0;                       //片选DAC，置低有效
  sclk0;        

  for (i=0;i<16;i++)         //尽管是10位DAC，但是其寄存器为16位，只有10位数据有效
  {
   da_data2=data&0x8000;    //逐位取出
   if(da_data2>>15)
   din1;
   else
   din0;
   sclk1;                  //上升沿数据锁存
   data<<=1;                //移位
   sclk0;
   
  }
  delay_us(10);
   cs1;
   sclk0;

}


//*************************************************************************
//			主程序
//*************************************************************************
int main(void)
{
  system_init();              //系统初始化
  while(1)
  {
   for(da_data=0x000;da_data<0x3ff;da_data++)    //连续转换，输出电压从小到大
   {
     da_data=da_data<<2;
     dac_ser(da_data);
	 da_data=da_data>>2;
      delay_ms(2);
  }
  } 
}
