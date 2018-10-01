

#include <string.h>
#include <stdio.h>
#include <math.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>

//***********************************************************************
//	定义变量区
//***********************************************************************



/*复位脚*/
#define RST_CLR	PORTE &= ~(1 << PE7)              //电平置低
#define RST_SET	PORTE |= (1 << PE7)               //电平置高
#define RST_IN	DDRE &= ~(1 << PE7)               //方向输入
#define RST_OUT	DDRE |= (1 << PE7)                //方向输出

/*双向数据*/
#define IO_CLR	PORTE &= ~(1 << PE6)              //电平置低
#define IO_SET	PORTE |= (1 << PE6)               //电平置高
#define IO_R	PINE & (1 << PE6)                 //电平读取
#define IO_IN	DDRE &= ~(1 << PE6)               //方向输入
#define IO_OUT	DDRE |= (1 << PE6)                //方向输出

/*时钟信号*/
#define SCK_CLR	PORTE &= ~(1 << PE5)              //时钟信号
#define SCK_SET	PORTE |= (1 << PE5)               //电平置高
#define SCK_IN	DDRE &= ~(1 << PE5)               //方向输入
#define SCK_OUT	DDRE |= (1 << PE5)                //方向输出

/*ds1302命令与相关地址*/
#define ds1302_sec_add			0x80		//秒数据地址
#define ds1302_min_add			0x82		//分数据地址
#define ds1302_hr_add			0x84		//时数据地址
#define ds1302_date_add			0x86		//日数据地址
#define ds1302_month_add		0x88		//月数据地址
#define ds1302_day_add			0x8a		//星期数据地址
#define ds1302_year_add			0x8c		//年数据地址
#define ds1302_control_add		0x8e		//控制数据地址
#define ds1302_charger_add		0x90 					 
#define ds1302_clkburst_add		0xbe

#define RS_CLR	PORTF &= ~(1 << PF1)       //RS置低
#define RS_SET	PORTF |= (1 << PF1)        //RS置高

#define RW_CLR	PORTF &= ~(1 << PF2)       //RW置低
#define RW_SET	PORTF |= (1 << PF2)        //RW置高

#define EN_CLR	PORTF &= ~(1 << PF3)       //E置低
#define EN_SET	PORTF |= (1 << PF3)        //E置高

#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器











