

#include <string.h>
#include <stdio.h>
#include <math.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
//#include <delay.h>
#include <iom128v.h>

//***********************************************************************
//	���������
//***********************************************************************



/*��λ��*/
#define RST_CLR	PORTE &= ~(1 << PE7)              //��ƽ�õ�
#define RST_SET	PORTE |= (1 << PE7)               //��ƽ�ø�
#define RST_IN	DDRE &= ~(1 << PE7)               //��������
#define RST_OUT	DDRE |= (1 << PE7)                //�������

/*˫������*/
#define IO_CLR	PORTE &= ~(1 << PE6)              //��ƽ�õ�
#define IO_SET	PORTE |= (1 << PE6)               //��ƽ�ø�
#define IO_R	PINE & (1 << PE6)                 //��ƽ��ȡ
#define IO_IN	DDRE &= ~(1 << PE6)               //��������
#define IO_OUT	DDRE |= (1 << PE6)                //�������

/*ʱ���ź�*/
#define SCK_CLR	PORTE &= ~(1 << PE5)              //ʱ���ź�
#define SCK_SET	PORTE |= (1 << PE5)               //��ƽ�ø�
#define SCK_IN	DDRE &= ~(1 << PE5)               //��������
#define SCK_OUT	DDRE |= (1 << PE5)                //�������

/*ds1302��������ص�ַ*/
#define ds1302_sec_add			0x80		//�����ݵ�ַ
#define ds1302_min_add			0x82		//�����ݵ�ַ
#define ds1302_hr_add			0x84		//ʱ���ݵ�ַ
#define ds1302_date_add			0x86		//�����ݵ�ַ
#define ds1302_month_add		0x88		//�����ݵ�ַ
#define ds1302_day_add			0x8a		//�������ݵ�ַ
#define ds1302_year_add			0x8c		//�����ݵ�ַ
#define ds1302_control_add		0x8e		//�������ݵ�ַ
#define ds1302_charger_add		0x90 					 
#define ds1302_clkburst_add		0xbe

#define RS_CLR	PORTF &= ~(1 << PF1)       //RS�õ�
#define RS_SET	PORTF |= (1 << PF1)        //RS�ø�

#define RW_CLR	PORTF &= ~(1 << PF2)       //RW�õ�
#define RW_SET	PORTF |= (1 << PF2)        //RW�ø�

#define EN_CLR	PORTF &= ~(1 << PF3)       //E�õ�
#define EN_SET	PORTF |= (1 << PF3)        //E�ø�

#define Data_IO	        PORTA                //Һ�����ݿ�
#define Data_DDR        DDRA                 //���ݿڷ���Ĵ���











