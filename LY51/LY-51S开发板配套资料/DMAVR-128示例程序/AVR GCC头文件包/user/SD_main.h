//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>
#include <user/mmc.h>
#include <avr/interrupt.h>	// include interrupt support
//#include <avr/signal.h>     //中断信号头文件
#include "user/global.h"		// include our global settings
#include "user/spi.h"		// include spi bus support

#include "user/rprintf.h"

//#include <avr/io.h>
//#include <util/delay.h> 


//#include "avr/tft.h"

#include "user/FAT.h"

#define delay_us(x)     _delay_us(x)    //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC延时函数 x(ms)


/*数码管连接情况*/
#define Data_IO	        PORTA                			//数码管数据口
#define Data_DDR        DDRA                 			//数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD置低
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD置高

void 	McuInit();
void 	LCD_Init();
void 	LCD_clear(u16 p);
void  	GUI_sprintf_chartobit(u16 x, u16 y,u16 bin_data, u16 color);
void  	GUI_sprintf_chartohex(u16 x, u16 y,u16 hex_data, u16 color);
void  	GUIpoint(u08 x,u08 y,u16 point_color);
void  	GUI_sprintf_nu(u16 x, u16 y,u16 nu, u16 color);
void 	DisplayGB2312(u08 gb,u08 postion_x,u08 postion_y,u16 gb_color);
void 	GUIline(u08 x0,u08 y0,u08 x1,u08 y1,u16 line_color);

