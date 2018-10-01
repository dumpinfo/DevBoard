//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <math.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
#include <user/ascii8x16.h>
#include <user/GB2312.h>
#include  <avr/pgmspace.h>  //须增加的头文件，用来将数据存放在flash中

extern const prog_uchar gImage_ph1[];
extern const prog_uchar gImage_ph2[];
extern const prog_uchar gImage_qqp[];
extern const prog_uchar gImage_mmp[];


//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define delay_us(x)     _delay_us(x)        			 //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        			 //AVR GCC延时函数 x(ms)

/*TFT液晶硬件连接情况*/

#define LCD_RS0		PORTF &= ~(1 << PF1)                 //RS置低
#define LCD_RS1		PORTF |= (1 << PF1)                  //RS置高

#define LCD_WR0		PORTF &= ~(1 << PF2)                 //RW置低
#define LCD_WR1		PORTF |= (1 << PF2)                  //RW置高

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD置低
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD置高

#define LCD_EC0		PORTF &= ~(1 << PF3)                 //EC置低
#define LCD_EC1		PORTF |= (1 << PF3)                  //EC置高

#define LCD_BL0		PORTG &= ~(1 << PG2)                 //背光置低，背光亮
#define LCD_BL1		PORTG |= (1 << PG2)                  //背光置高，背光灭

#define LCD_RST0	PORTD &= ~(1 << PD7)                 //RST液晶复位脚置低
#define LCD_RST1	PORTD |= (1 << PD7)                  //RST液晶复位脚置高

#define LCD_Data    PORTA                                //TFT液晶数据口
#define DDR_Data    DDRA                                 //数据方向控制
#define DDR_IN      DDRA=0x00;                           //数据输入，读数据用
#define DDR_OUT     DDRA=0xFF;                           //数据输出，写数据用

/*数码管连接情况*/
#define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1
