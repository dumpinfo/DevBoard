//DMAVR-128的步进电机驱动程序
//步进电机为四相八拍驱动方式，额定电压5V,ABCD对应PB1~PB4
//初始设置为12小时制，下午时间
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

//***********************************************************************
//			定义变量区
//***********************************************************************


#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

#define delay_us(x)     _delay_us(x)    	 //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    	 //AVR GCC延时函数 x(ms)

#define uchar           unsigned char
#define uint            unsigned int

uchar  F_Rotation[8]={0xE2,0xE6,0xE4,0xEC,0xE8,0xF8,0xF0,0xF2};//正转表格， 0111，0011 1011，1001 1101，1100 ，1110，0110
uchar  B_Rotation[8]={0xF2,0xF0,0xF8,0xE8,0xEC,0xE4,0xE6,0xE2};//反转表格

//***********************************************************************
//			主程序
//***********************************************************************
int main(void)
{
 uint i,j;
 	DDRB=0xFF;
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 
  while(1)
   {
   for(j=0;j<64*8;j++)   			   //步距角5.625/64 减速比1/64，8拍，这个循环为反转一圈
   {
    for(i=0;i<8;i++)
	{
    PORTB=B_Rotation[i];
	delay_ms(10);
    }
   }
   for(j=0;j<64*8;j++)				   //步距角5.625/64 减速比1/64，8拍，这个循环为正转一圈
   {
    for(i=0;i<8;i++)
	{
    PORTB=F_Rotation[i];
	delay_ms(10);
    }
   }
   
   }
}
