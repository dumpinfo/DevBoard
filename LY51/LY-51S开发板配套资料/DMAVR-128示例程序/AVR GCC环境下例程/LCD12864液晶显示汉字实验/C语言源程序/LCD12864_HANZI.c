//12864型LCD显示驱动程序，显示的是welcome信息和欣世纪电子网站地址，是简单的显示汉字和字符
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

#define PSB_CLR	PORTF &= ~(1 << PE2)                 //PSB置低，串口方式
#define PSB_SET	PORTF |= (1 << PE2)                  //PSB置高，并口方式

#define LOW		0
#define HIGH    1

//初始化指令
#define CLEAR_SCREEN	0x01		//清屏指令：清屏且AC值为00H
#define AC_INIT		    0x02		//将AC设置为00H。且游标移到原点位置
#define CURSE_ADD		0x06		//设定游标移到方向及图像整体移动方向（默认游标右移，图像整体不动）
#define FUN_MODE		0x30		//工作模式：8位基本指令集
#define DISPLAY_ON		0x0c		//显示开,显示游标，且游标位置反白
#define DISPLAY_OFF		0x08		//显示关
#define CURSE_DIR		0x14		//游标向右移动:AC=AC+1
#define SET_CG_AC		0x40		//设置AC，范围为：00H~3FH
#define SET_DD_AC		0x80

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
	PORTE=0xFF;                        //PSB对应于PE2
	DDRE=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 

	PSB_SET;						   //液晶并口方式
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
//函数名称：DisplayCgrom(uchar hz)显示CGROM里的汉字
//入口参数：无
//返回参数：无
//***********************************************************************
void DisplayCgrom(uchar addr,uchar *hz)
{
	LCD_write_com(addr);
    delay_ms(5);
	while(*hz != '\0')
	{
		LCD_write_data(*hz);
		hz++;
        delay_ms(5);
	}

} 
//****************************************************************
//函数名称：Display()显示测试结果
//入口参数：无
//返回参数：无
//****************************************************************
void Display(void)
{
	DisplayCgrom(0x80,"欣世纪电子欢迎你");
	DisplayCgrom(0x88,"旺:jingyehanxing");
	DisplayCgrom(0x90,"www.avrgcc.com  ");
	DisplayCgrom(0x98,"电话:13946060471");

}

//***********************************************************************
//	显示屏初始化函数
//***********************************************************************

void LCD_init(void) 
{
	DDRA = 0xFF;				        //I/O口方向设置
	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	LCD_write_com(FUN_MODE);			//显示模式设置
	delay_ms(5);
	LCD_write_com(FUN_MODE);			//显示模式设置
	delay_ms(5);
    LCD_write_com(DISPLAY_ON);			//显示开
	delay_ms(5);
    LCD_write_com(CLEAR_SCREEN);			//清屏
	delay_ms(5);
}
//***********************************************************************
//			主程序
//***********************************************************************
int main(void)
{

    system_init();                                //系统初始化，设置IO口属性
	delay_ms(100);                                //延时100ms
	LCD_init();                                   //液晶参数初始化设置
	LCD_clear();                                  //清屏
	while(1)
	{
	Display();                                    //显示汉字
	}
}

