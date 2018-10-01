//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
#include <util/delay.h>
#include <avr/io.h>
#include <user/mmc.h>
#include <avr/interrupt.h>	// include interrupt support
#include "user/global.h"		// include our global settings
#include "user/spi.h"		// include spi bus support

#include "user/rprintf.h"

#define delay_us(x)     _delay_us(x)    //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC��ʱ���� x(ms)


/*������������*/
#define Data_IO	        PORTA                			//��������ݿ�
#define Data_DDR        DDRA                 			//���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) 			//����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  			//����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) 			//�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  			//�����λ����λΪ1

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD�õ�
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD�ø�

void McuInit();

extern void UART_Init(void);
u32 mmcCapacity();

