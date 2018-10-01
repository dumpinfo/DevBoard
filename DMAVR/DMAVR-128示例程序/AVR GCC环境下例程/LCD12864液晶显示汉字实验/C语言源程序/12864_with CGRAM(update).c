//12864��LCD��ʾ����������ʾ����welcome��Ϣ�������͵�����վ��ַ���Ǽ򵥵���ʾ���ֺ��ַ�
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.09.30

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

#define PSB_CLR	PORTF &= ~(1 << PE2)                 //PSB�õͣ����ڷ�ʽ
#define PSB_SET	PORTF |= (1 << PE2)                  //PSB�øߣ����ڷ�ʽ

#define LOW		0
#define HIGH    1

//��ʼ��ָ��
#define CLEAR_SCREEN	0x01		//����ָ�������ACֵΪ00H
#define AC_INIT		    0x02		//��AC����Ϊ00H�����α��Ƶ�ԭ��λ��
#define CURSE_ADD		0x06		//�趨�α��Ƶ�����ͼ�������ƶ�����Ĭ���α����ƣ�ͼ�����岻����
#define FUN_MODE		0x30		//����ģʽ��8λ����ָ�
#define DISPLAY_ON		0x0c		//��ʾ��,��ʾ�α꣬���α�λ�÷���
#define DISPLAY_OFF		0x08		//��ʾ��
#define CURSE_DIR		0x14		//�α������ƶ�:AC=AC+1
#define SET_CG_AC		0x40		//����AC����ΧΪ��00H~3FH
#define SET_DD_AC		0x80

#define Data_IO	        PORTA                //Һ�����ݿ�
#define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1

//*************************************************************************
//			CGRAM�Զ����ַ���������,16*16��С
//*************************************************************************

uchar dz0[32]={0x02,0x40,0x07,0x40,0x38,0x40,0x20,      /*��*/
			   0x40,0x20,0x7E,0x20,0x82,0x3F,0x24,
			   0x24,0x20,0x24,0x20,0x24,0x20,0x24,
			   0x50,0x24,0x50,0x44,0x88,0x44,0x88,
			   0x85,0x06,0x02,0x04};
			
uchar dz1[32]={0x01,0x10,0x11,0x10,0x11,0x10,0x11,      /*��*/  
			   0x10,0x11,0x14,0xFF,0xFE,0x11,0x10,
			   0x11,0x10,0x11,0x10,0x11,0x10,0x11,
			   0xF0,0x11,0x10,0x10,0x00,0x10,0x08,
			   0x1F,0xFC,0x00,0x00};
			
uchar dz2[32]={0x08,0x00,0x08,0x04,0x13,0xFE,0x10,      /*��*/
			   0x04,0x24,0x04,0xFC,0x04,0x08,0x04,
   			   0x11,0xFC,0x21,0x04,0xFD,0x00,0x41,
			   0x00,0x01,0x00,0x1D,0x02,0xE1,0x02,
			   0x40,0xFE,0x00,0x00};

uchar dz3[32]={0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,      
			   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
   			   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
			   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
			   0xFF,0xFF,0xFF,0xFF};
			

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
	PORTE=0xFF;                        //PSB��Ӧ��PE2
	DDRE=0xFF;
	D_LE1;                             //�ص�����ܣ�������ʾ����                   
    W_LE1;                     
    Data_IO=0xFF;                      //�������            
    W_LE0; 

	PSB_SET;						   //Һ�����ڷ�ʽ
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
//�������ƣ�DisplayCgrom(uchar hz)��ʾCGROM��ĺ���
//��ڲ�������
//���ز�������
//***********************************************************************
void DisplayCgrom(uchar addr,uchar *hz)
{
	LCD_write_com(addr);
    delay_ms(5);
	while(*hz != '\0')
	{
		LCD_write_data(*hz);
		hz++;
        delay_ms(5);
	}

} 
//****************************************************************
//�������ƣ�Display()��ʾ���Խ��
//��ڲ�������
//���ز�������
//****************************************************************
void Display(void)
{
	DisplayCgrom(0x80,"�����͵��ӻ�ӭ��");
	DisplayCgrom(0x88,"��:jingyehanxing");
	DisplayCgrom(0x90,"www.avrgcc.com  ");
	DisplayCgrom(0x98,"�绰:13946060471");

}


//****************************************************************
//�������ƣ�WriteSingleCgram()д����CGRAM���Զ���������ݣ�16X16��С
//��ڲ�����CGRAM��ʼ�ĵ�ַ��Ϊ00��02��04��06������������ʼ��ַ
//���ز�������
//****************************************************************
void WriteSingleCgram(uchar cgramaddr,uchar *dz)
{
    uchar i;
	
	LCD_write_com(AC_INIT);
	delay_ms(5);
	LCD_write_com((cgramaddr<<4)|0x40);
    delay_ms(5);
	for(i=0;i<16;i++)                                //һ��32���ֽڣ���д���ֽڣ���д���ֽ�����
		{
			LCD_write_com(((cgramaddr<<4)+i)|0x40);  //CGRAM��ַ
			delay_ms(5);
			LCD_write_data(* (dz+2*i));              //��д���ֽ�����
			delay_ms(5);
			LCD_write_data(* (dz+2*i+1));            //��д���ֽ�����
			delay_ms(5);
		}

}

//****************************************************************
//�������ƣ�WriteCgram()дȫ��CGRAM���Զ���������ݣ�4��16��16����
//��ڲ�������
//���ز�������
//****************************************************************

void WriteCgram(void)          //����д���ĸ��Զ����ַ����ɸ�����Ҫ����������ĸ�
{
	WriteSingleCgram(00,dz0);  //����CGRAM�ĸ�������ʼ��ַ���ο�˵����          
	WriteSingleCgram(01,dz1);
	WriteSingleCgram(02,dz2);
	WriteSingleCgram(03,dz3);
}



//****************************************************************
//�������ƣ�DisplayCgram()��ʾCGRAM���Զ����ַ�
//��ڲ�������ʾ��ַ���Զ����ַ�������(0000,0002,0004,0006)
//���ز�������
//****************************************************************
void DisplayCgram(uchar addr,uchar cg)
{
	LCD_write_com(addr);
    delay_ms(5);
	LCD_write_data(00);
    delay_ms(5);
	LCD_write_data(cg);                  //0,2,4,6
    delay_ms(5);

}

//***********************************************************************
//	��ʾ����ʼ������
//***********************************************************************

void LCD_init(void) 
{
	DDRA = 0xFF;				        //I/O�ڷ�������
	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	delay_ms(5);
	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	delay_ms(5);
    LCD_write_com(DISPLAY_ON);			//��ʾ��
	delay_ms(5);
    LCD_write_com(CLEAR_SCREEN);			//����
	delay_ms(5);
}
//***********************************************************************
//			������
//***********************************************************************
int main(void)
{

    system_init();                                //ϵͳ��ʼ��������IO������
	delay_ms(100);                                //��ʱ100ms
	LCD_init();                                   //Һ��������ʼ������
	LCD_clear();                                  //����

	WriteCgram();                                 //дCGRAM���ݣ�CGRAM�ܹ���4��16*16�Ŀռ䣬�����Զ���
 while(1)
	{
	Display();                                    //��ʾ����

    delay_ms(500);
	delay_ms(500);
	delay_ms(500);

    LCD_write_com(CLEAR_SCREEN);			     //����
	delay_ms(5);

    DisplayCgram(0x83,00);                       //��ʾ�Զ��庺�ֻ��ַ�����CGRAM��
	DisplayCgram(0x93,02);                       //��ʾ�Զ��庺�ֻ��ַ�����CGRAM��
	DisplayCgram(0x8B,04);                       //��ʾ�Զ��庺�ֻ��ַ�����CGRAM��
	DisplayCgram(0x9B,06);                       //��ʾ�Զ��庺�ֻ��ַ�����CGRAM��

    delay_ms(500);
	delay_ms(500);
	delay_ms(500);

    LCD_write_com(CLEAR_SCREEN);			     //����
	delay_ms(5);
	}
}

