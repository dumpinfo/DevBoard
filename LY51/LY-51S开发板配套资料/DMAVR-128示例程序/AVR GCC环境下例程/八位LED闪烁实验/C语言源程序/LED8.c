//DMAVR-128的8位独发光二极管闪烁示例程序
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>

#define delay_us(x)     _delay_us(x)    //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC延时函数 x(ms)

#define LED8            PORTB


//*************************************************************************
//			系统初始化子程序
//*************************************************************************
void system_init()
{
  DDRB=0xff;                                  //设置PD口为输出
  LED8=0xff;
}


//*************************************************************************
//			主程序
//*************************************************************************
void main()
{
  system_init();                             //系统初始化
  while(1)
  {
    LED8=0x00;
    delay_ms(500);                          //延时500ms
    LED8=0xff;
    delay_ms(500);
  }
}
