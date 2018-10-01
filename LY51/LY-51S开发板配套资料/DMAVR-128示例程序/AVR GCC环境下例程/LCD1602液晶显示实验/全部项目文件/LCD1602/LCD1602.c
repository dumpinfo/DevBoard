//1602��LCD��ʾ����������ʾ����welcome�������͵�����վ��ַ
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.01.14

//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
//***********************************************************************
//	���������
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define delay_us(x)     _delay_us(x)        //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC��ʱ���� x(ms)

#define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
#define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�

#define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
#define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�

#define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
#define EN_SET	PORTF |= (1 << PF3)                  //E�ø�

#define Data_IO	        PORTA                //Һ�����ݿ�
#define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1

//*************************************************************************
//			��ʼ���ӳ���
//*************************************************************************
void system_init()
{

	Data_IO = 0xFF;				        //��ƽ����
	Data_DDR = 0xFF;				        //�������
	PORTF = 0xFF;                       //��ƽ����
	DDRF = 0xFF;                        //�������
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //�ص�����ܣ�������ʾ����                   
    W_LE1;                     
    Data_IO=0xFF;                      //�������            
    W_LE0; 
}

//***********************************************************************
//	��ʾ������д�뺯��
//***********************************************************************


void LCD_write_com(unsigned char com) 
{	
	RS_CLR;
	RW_CLR;
	EN_SET;
	Data_IO = com;
	delay_ms(5);
	EN_CLR;
}
//***********************************************************************
//	��ʾ������д�뺯��
//***********************************************************************

void LCD_write_data(unsigned char data) 
{
	RS_SET;
	RW_CLR;
	EN_SET;
	Data_IO = data;
	delay_ms(5);
	EN_CLR;
}
//***********************************************************************
//	��ʾ�������ʾ
//***********************************************************************

void LCD_clear(void) 
{
	LCD_write_com(0x01);
	delay_ms(5);
}
//***********************************************************************
//	��ʾ���ַ���д�뺯��
//***********************************************************************

void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    while (*s) 
    {
    	LCD_write_data( *s);
    	s ++;
    }
}
//***********************************************************************
//	��ʾ�����ַ�д�뺯��
//***********************************************************************

void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    LCD_write_data( data);  
}
//***********************************************************************
//	��ʾ����ʼ������
//***********************************************************************

void LCD_init(void) 
{
	DDRA = 0xFF;				        //I/O�ڷ�������
	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	LCD_write_com(0x38);				//��ʾģʽ����
	delay_ms(5);
	LCD_write_com(0x08);				//��ʾ�ر�
	delay_ms(5);
    LCD_write_com(0x01);				//��ʾ����
	delay_ms(5);
    LCD_write_com(0x06);				//��ʾ����ƶ�����
	delay_ms(5);
	LCD_write_com(0x0C);				//��ʾ�����������
    delay_ms(5);
}

//*************************************************************************
//			������
//*************************************************************************
void main(void) 
{

	unsigned char i;
	unsigned char *p;
    system_init();                                //ϵͳ��ʼ��������IO������
	delay_ms(100);                                //��ʱ100ms
	LCD_init();                                   //Һ��������ʼ������

 while (1) 
   {
		i = 1;
		p = "www.avrgcc.com";                    //�ַ��������ʾ
		LCD_clear();
		LCD_write_str(0,0,"Welcome");
		delay_ms(250);
		
		while (*p) {
			LCD_write_char(i,1,*p);          //�����ַ������ʾ
			i ++;
			p ++;
			delay_ms(250);                   //��ʱ250ms
			}
		delay_ms(250);
  }
}
