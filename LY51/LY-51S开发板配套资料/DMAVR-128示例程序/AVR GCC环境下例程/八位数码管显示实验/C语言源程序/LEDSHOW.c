//DMAVR-128的8位数码管动态显示程序，显示01234567
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
#include <avr/iom128.h>
//***********************************************************************
//			定义变量区
//***********************************************************************

#define delay_us(x)     _delay_us(x)         //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)         //AVR GCC延时函数 x(ms)

#define uchar           unsigned char
#define uint            unsigned int

#define Data_IO	        PORTA                //数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

#define W0 				0xfe                 //数码管各位单独选中时应送的位数据
#define W1              0xfd
#define W2 				0xfb
#define W3              0xf7
#define W4 				0xef
#define W5              0xdf
#define W6 				0xbf
#define W7              0x7f

//***********************************************************************
//			共阴数码管显示的断码表
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

//***********************************************************************
//			74HC573控制数码管动态扫描
//***********************************************************************

void Write_LED()
{
   uchar i,j;
   j=0x01;                    //此数据用来控制位选
  for(i=0;i<8;i++)
  {
    D_LE1;                    //控制数码管段数据的74HC573的LE管脚置高
    W_LE1;                    //控制数码管位的74HC573的LE管脚置高
    Data_IO=~j;               //设置要显示的位，也就是哪一个数码管亮
    W_LE0;                    //锁存位数据，下面送上段数据以后，就显示出来了
	j=(j<<1);
    Data_IO=table[i];         //送要显示的数据，就是段数据，如显示0送的是0x3f
    D_LE0;                    //锁存段数据，数码管亮一个时间片刻
    delay_ms(1);              //显示一个时间片刻，会影响亮度和闪烁性

  }
}

//***********************************************************************
//			主程序
//***********************************************************************

void main(void)
{

     system_init();             //初始化

 while(1)
   {
     Write_LED();               //调用函数，显示
   }

}
