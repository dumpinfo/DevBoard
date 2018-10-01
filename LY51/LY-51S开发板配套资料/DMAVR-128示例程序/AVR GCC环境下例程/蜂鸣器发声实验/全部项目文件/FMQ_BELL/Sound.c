//DMAVR-128的蜂鸣器发声示例程序，优化等级-00，否则部分程序会被优化掉
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
//			CH451各个功能命令值，根据需要写入
//***********************************************************************

#define delay_us(x)     _delay_us(x)    //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC延时函数 x(ms)

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

#define beep0             PORTD &= ~(1 << PD6)    //蜂鸣器所在IO口PD6
#define beep1             PORTD |= (1 << PD6)
#define led8              PORTB                  //LED控制口PB

#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

                                      


//*************************************************************************
//			初始化子程序
//*************************************************************************
void system_init()
{
    Data_IO = 0xFF;				        //电平设置
	Data_DDR = 0xFF;				        //方向输出
	PORTF = 0xFF;                       //电平设置
	DDRF = 0xFF;                        //方向输出
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 
  
  PORTB=0xff;                                       //PB设置为输出
  DDRB=0xff;                                        //上拉电阻无效
}

left_shift(uchar dat,uchar count)                   //左移
{
  dat=dat<<count;
}
//********************************************************************
//			主函数
//********************************************************************


main()
{
  uint i; 
  uint  a,b,c,k,j;  
  system_init();  
  k=0x01;             //先给k一个初值00000001等待移位
  while(1)
  {
       for(i=8;i>0;i--)
       {     
        delay_ms(200);
        beep1;             //打开蜂鸣器
        delay_ms(300);    //让它响
        beep0;            //关闭蜂鸣器 
        a=k;              //把移完的值再送给j  
		c=~a;     
        led8=c;          //同时把值送到PD口点亮发光二极管        
        a=left_shift(k,1);     //把k循环左移一位        
        k=a;             ////把移完的值再送给k
      }
      k=0x01;
   }

}
