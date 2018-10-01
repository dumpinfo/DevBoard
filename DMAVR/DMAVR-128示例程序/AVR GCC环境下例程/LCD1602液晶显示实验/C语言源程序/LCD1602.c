//DMAVR-128的1602型LCD显示驱动程序，显示的是welcome和欣世纪电子网站地址
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
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define delay_us(x)     _delay_us(x)        //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC延时函数 x(ms)

#define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
#define RS_SET	PORTF |= (1 << PF1)                  //RS置高

#define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
#define RW_SET	PORTF |= (1 << PF2)                  //RW置高

#define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
#define EN_SET	PORTF |= (1 << PF3)                  //E置高

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
}

//***********************************************************************
//	显示屏命令写入函数
//***********************************************************************


void LCD_write_com(unsigned char com) 
{	
	RS_CLR;
	RW_CLR;
	EN_SET;
	Data_IO = com;
	delay_ms(5);
	EN_CLR;
}
//***********************************************************************
//	显示屏数据写入函数
//***********************************************************************

void LCD_write_data(unsigned char data) 
{
	RS_SET;
	RW_CLR;
	EN_SET;
	Data_IO = data;
	delay_ms(5);
	EN_CLR;
}
//***********************************************************************
//	显示屏清空显示
//***********************************************************************

void LCD_clear(void) 
{
	LCD_write_com(0x01);
	delay_ms(5);
}
//***********************************************************************
//	显示屏字符串写入函数
//***********************************************************************

void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    while (*s) 
    {
    	LCD_write_data( *s);
    	s ++;
    }
}
//***********************************************************************
//	显示屏单字符写入函数
//***********************************************************************

void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    LCD_write_data( data);  
}
//***********************************************************************
//	显示屏初始化函数
//***********************************************************************

void LCD_init(void) 
{
	DDRA = 0xFF;				        //I/O口方向设置
	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	LCD_write_com(0x38);				//显示模式设置
	delay_ms(5);
	LCD_write_com(0x08);				//显示关闭
	delay_ms(5);
    LCD_write_com(0x01);				//显示清屏
	delay_ms(5);
    LCD_write_com(0x06);				//显示光标移动设置
	delay_ms(5);
	LCD_write_com(0x0C);				//显示开及光标设置
    delay_ms(5);
}

//*************************************************************************
//			主程序
//*************************************************************************
void main(void) 
{

	unsigned char i;
	unsigned char *p;
    system_init();                                //系统初始化，设置IO口属性
	delay_ms(100);                                //延时100ms
	LCD_init();                                   //液晶参数初始化设置

 while (1) 
   {
		i = 1;
		p = "www.avrgcc.com";                    //字符串输出显示
		LCD_clear();
		LCD_write_str(0,0,"Welcome");
		delay_ms(250);
		
		while (*p) {
			LCD_write_char(i,1,*p);          //单个字符输出显示
			i ++;
			p ++;
			delay_ms(250);                   //延时250ms
			}
		delay_ms(250);
  }
}
