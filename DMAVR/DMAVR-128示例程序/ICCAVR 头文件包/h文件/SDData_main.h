//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
#include <mmc.h>
#include "libtypes.h"		// include our global settings
#include "spi.h"		// include spi bus support
#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>
//#include "user/rprintf.h"


/*������������*/
#define Data_IO	        PORTA                			//��������ݿ�
#define Data_DDR        DDRA                 			//���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) 			//����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  			//����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) 			//�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  			//�����λ����λΪ1

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD�õ�
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD�ø�

void McuInit(void);

extern void UART_Init(void);
u32 mmcCapacity(void);

