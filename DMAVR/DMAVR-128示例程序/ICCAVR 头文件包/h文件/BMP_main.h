//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
//#include <util/delay.h>
//#include <avr/io.h>
#include <mmc.h>
//#include <avr/interrupt.h>	// include interrupt support
//#include <avr/signal.h>     //�ж��ź�ͷ�ļ�
#include "libtypes.h"		// include our global settings
#include "DM_spi.h"		// include spi bus support

//#include "user/rprintf.h"

#include <iom128v.h>
#include <delay.h> 


//#include "avr/tft.h"

#include "FAT.h"



/*������������*/
#define Data_IO	        PORTA                			//��������ݿ�
#define Data_DDR        DDRA                 			//���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) 			//����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  			//����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) 			//�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  			//�����λ����λΪ1

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD�õ�
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD�ø�

void 	McuInit(void);
void 	LCD_Init(void);
void 	LCD_clear(u16 p);
void  	GUI_sprintf_chartobit(u16 x, u16 y,u16 bin_data, u16 color);
void  	GUI_sprintf_chartohex(u16 x, u16 y,u16 hex_data, u16 color);
void  	GUIpoint(u08 x,u08 y,u16 point_color);
void  	GUI_sprintf_nu(u16 x, u16 y,u16 nu, u16 color);
void 	DisplayGB2312(u08 gb,u08 postion_x,u08 postion_y,u16 gb_color);
void 	GUIline(u08 x0,u08 y0,u08 x1,u08 y1,u16 line_color);
void 	DisplayChar(u08 casc,u08 postion_x,u08 postion_y,u16 char_color);
void 	UART_Init(void);
void 	DisplayString(u08 *s,u08 x,u08 y,u16 s_color);
eeprom_read_byte(unsigned int addr);
void eeprom_write_byte(unsigned int addr, unsigned char p_buff);
void delay_1us(void);
void delay_3us(void);
void delay_10us(void);
void delay_50us(void);
void delay_100us(void);
void delay_n100us(unsigned char n100us);
void delay_1ms(void);
void delay_nms(unsigned int nms);
void delay_ns(unsigned char ns);

