//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <mmc.h>
#include "libtypes.h"		// include our global settings
#include "spi.h"		// include spi bus support
#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>
//#include "user/rprintf.h"


/*数码管连接情况*/
#define Data_IO	        PORTA                			//数码管数据口
#define Data_DDR        DDRA                 			//数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) 			//数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  			//数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) 			//数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  			//数码管位控制位为1

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD置低
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD置高

void McuInit(void);

extern void UART_Init(void);
u32 mmcCapacity(void);

