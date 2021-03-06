//ATMEGA128的DAC转换驱动程序
//DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615
//驱动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换，LED指示灯对应从暗到亮
//编译环境 ICCAVR 
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//忠兴电子元件店编辑
//日期：2010.06.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>

//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define cs0     PORTB &= ~(1 << PB0)
#define cs1   	PORTB |= (1 << PB0)
#define din0    PORTB &= ~(1 << PB2)
#define din1   	PORTB |= (1 << PB2)
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
void DAC_SER(uint data)
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
   data<<=1;               //移位
   sclk0;
   
  }
  delay_10us();				//延时10us
   cs1;
   sclk0;

}


//*************************************************************************
//			主程序
//*************************************************************************
void main(void)
{
  system_init();              					  //系统初始化
  while(1)
  {
   for(da_data=0x000;da_data<0xffc;da_data++)    //连续转换，输出电压从小到大
   {
     DAC_SER(da_data);
     delay_nms(1);
  }
  } 
}
