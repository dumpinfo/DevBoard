//DS1302ʵʱʱ��оƬ��������
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
#define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1

unsigned char time_buf[8] = {0x20,0x10,0x01,0x14,0x09,0x55,0x00,0x02};

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
//��DS1302д��һ�ֽ�����
//***********************************************************************
void ds1302_write_byte(unsigned char addr, unsigned char d) 
{

	unsigned char i;
	RST_SET;					//����DS1302����
	
	                                                //д��Ŀ���ַ��addr
	IO_OUT;
	addr = addr & 0xFE;                            //���λ����
	for (i = 0; i < 8; i ++) {
		if (addr & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		addr = addr >> 1;
		}
	
	                                              //д�����ݣ�d
	IO_OUT;
	for (i = 0; i < 8; i ++) {
		if (d & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		d = d >> 1;
		}
	RST_CLR;					//ֹͣDS1302����
}
//***********************************************************************
//                   ��DS1302����һ�ֽ�����
//***********************************************************************
unsigned char ds1302_read_byte(unsigned char addr)
 {

	unsigned char i;
	unsigned char temp;
	RST_SET;					//����DS1302����

	                                                //д��Ŀ���ַ��addr
	IO_OUT;
	addr = addr | 0x01;                             //���λ�ø�
	for (i = 0; i < 8; i ++) {
		if (addr & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		addr = addr >> 1;
		}
	
	/*������ݣ�temp*/
	IO_IN;
	for (i = 0; i < 8; i ++) {
		temp = temp >> 1;
		if (IO_R) {
			temp |= 0x80;
			}
		else {
			temp &= 0x7F;
			}
		SCK_SET;
		SCK_CLR;
		}
	
	RST_CLR;					//ֹͣDS1302����
	return temp;
}

//***********************************************************************
//                   ��DS302д��ʱ������
//***********************************************************************

void ds1302_write_time(void)
 {

	ds1302_write_byte(ds1302_control_add,0x00);		//�ر�д���� 
	ds1302_write_byte(ds1302_sec_add,0x80);			//��ͣ 
	//ds1302_write_byte(ds1302_charger_add,0xa9);		//������ 
	ds1302_write_byte(ds1302_year_add,time_buf[1]);		//�� 
	ds1302_write_byte(ds1302_month_add,time_buf[2]);	//�� 
	ds1302_write_byte(ds1302_date_add,time_buf[3]);		//�� 
	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	ds1302_write_byte(ds1302_hr_add,time_buf[4]);		//ʱ 
	ds1302_write_byte(ds1302_min_add,time_buf[5]);		//��
	ds1302_write_byte(ds1302_sec_add,time_buf[6]);		//��
	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	ds1302_write_byte(ds1302_control_add,0x80);		//��д���� 
}

//***********************************************************************
//                     ��DS302����ʱ������
//***********************************************************************

void ds1302_read_time(void)  
{ 

	time_buf[1]=ds1302_read_byte(ds1302_year_add);		//�� 
	time_buf[2]=ds1302_read_byte(ds1302_month_add);		//�� 
	time_buf[3]=ds1302_read_byte(ds1302_date_add);		//�� 
	time_buf[4]=ds1302_read_byte(ds1302_hr_add);		//ʱ 
	time_buf[5]=ds1302_read_byte(ds1302_min_add);		//�� 
	time_buf[6]=(ds1302_read_byte(ds1302_sec_add))&0x7F;//�� 
	time_buf[7]=ds1302_read_byte(ds1302_day_add);		//�� 
}

//***********************************************************************
//               DS302��ʼ������
//***********************************************************************

void ds1302_init(void) 
{
	
	RST_CLR;			//RST���õ�
	SCK_CLR;			//SCK���õ�
	RST_OUT;			//RST������Ϊ���
	SCK_OUT;			//SCK������Ϊ���
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
	system_init();
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

//***********************************************************************
//	������
//***********************************************************************

void main(void) 

{

	unsigned char temp;
 	delay_ms(200);
	LCD_init();                           //1602Һ����ʼ��
	ds1302_init();                        //DS1302��ʼ��
	delay_ms(10);
	ds1302_write_time();                 //��DS1302д��ʼ���ݣ������º�ʱ���

	while (1) 
	{
		delay_ms(200);
		ds1302_read_time();                //��DS1302����
			
		temp = (time_buf[0] >> 4) + '0';   //��LCD��дҪ��ʾ������
		LCD_write_char(0, 0, temp);/*��*/
		temp = (time_buf[0] & 0x0F) + '0';
		LCD_write_char(1, 0, temp);
		temp = (time_buf[1] >> 4) + '0';
		LCD_write_char(2, 0, temp);
		temp = (time_buf[1] & 0x0F) + '0';
		LCD_write_char(3, 0, temp);
		LCD_write_char(4, 0, '-');
		
		temp = (time_buf[2] >> 4) + '0';
		LCD_write_char(5, 0, temp);/*��*/
		temp = (time_buf[2] & 0x0F) + '0';
		LCD_write_char(6, 0, temp);
		LCD_write_char(7, 0, '-');
		
		temp = (time_buf[3] >> 4) + '0';
		LCD_write_char(8, 0, temp);/*��*/
		temp = (time_buf[3] & 0x0F) + '0';
		LCD_write_char(9, 0, temp);
		
		temp = (time_buf[4] >> 4) + '0';
		LCD_write_char(8, 1, temp);/*ʱ*/
		temp = (time_buf[4] & 0x0F) + '0';
		LCD_write_char(9, 1, temp);
		LCD_write_char(10, 1, ':');
		
		temp = (time_buf[5] >> 4) + '0';
		LCD_write_char(11, 1, temp);/*��*/
		temp = (time_buf[5] & 0x0F) + '0';
		LCD_write_char(12, 1, temp);
		LCD_write_char(13, 1, ':');
		
		temp = (time_buf[6] >> 4) + '0';
		LCD_write_char(14, 1, temp);/*��*/
		temp = (time_buf[6] & 0x0F) + '0';
		LCD_write_char(15, 1, temp);
	}
}
