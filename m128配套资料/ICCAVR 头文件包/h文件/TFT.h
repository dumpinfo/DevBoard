//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <iom128v.h>
#include <ascii8x16.h>
#include <GB2312.h>

//extern const prog_uchar gImage_ph1[];
//extern const prog_uchar gImage_ph2[];
//extern const prog_uchar gImage_qqp[];
//extern const prog_uchar gImage_mmp[];

void delay_1us(void);
void delay_3us(void);
void delay_10us(void);
void delay_50us(void);
void delay_100us(void);
void delay_n100us(unsigned char n100us);
void delay_1ms(void);
void delay_nms(unsigned int nms);
void delay_ns(unsigned char ns);

//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int


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
