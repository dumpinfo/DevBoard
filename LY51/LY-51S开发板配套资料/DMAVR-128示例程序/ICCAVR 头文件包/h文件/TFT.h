//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
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
//	���������
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int


/*TFTҺ��Ӳ���������*/

#define LCD_RS0		PORTF &= ~(1 << PF1)                 //RS�õ�
#define LCD_RS1		PORTF |= (1 << PF1)                  //RS�ø�

#define LCD_WR0		PORTF &= ~(1 << PF2)                 //RW�õ�
#define LCD_WR1		PORTF |= (1 << PF2)                  //RW�ø�

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD�õ�
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD�ø�

#define LCD_EC0		PORTF &= ~(1 << PF3)                 //EC�õ�
#define LCD_EC1		PORTF |= (1 << PF3)                  //EC�ø�

#define LCD_BL0		PORTG &= ~(1 << PG2)                 //�����õͣ�������
#define LCD_BL1		PORTG |= (1 << PG2)                  //�����øߣ�������

#define LCD_RST0	PORTD &= ~(1 << PD7)                 //RSTҺ����λ���õ�
#define LCD_RST1	PORTD |= (1 << PD7)                  //RSTҺ����λ���ø�

#define LCD_Data    PORTA                                //TFTҺ�����ݿ�
#define DDR_Data    DDRA                                 //���ݷ������
#define DDR_IN      DDRA=0x00;                           //�������룬��������
#define DDR_OUT     DDRA=0xFF;                           //���������д������

/*������������*/
#define D_LE0	        PORTD &= ~(1 << PD4) 			//����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  			//����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) 			//�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  			//�����λ����λΪ1
