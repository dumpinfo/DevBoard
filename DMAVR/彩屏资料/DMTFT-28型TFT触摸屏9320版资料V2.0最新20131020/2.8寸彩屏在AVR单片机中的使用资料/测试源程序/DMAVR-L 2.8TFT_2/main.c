/********************************************************************
//DMAVR-L����Сϵͳ�����2.8��TFT����������ʾ���Գ���
//ֱ�ӽ�TFT��ʾ�ӿڲ���12864�ӿڣ����������ߣ�������ο�ͼ��
//ע��ѡ��Һ���ĵ�Դ��λ�ڵ�λ����������ѡ5V��3.3V������Һ����ѹ����ѡ��Ĭ������Ϊ5V
//���Ի�����AVR Studio 4.17 + WinAVR �Ż���-01
//���ߣ����� www.avrgcc.com
//ʱ�䣺2013.03.09
********************************************************************/

#include <stdio.h>
#include <math.h>
#include <avr/io.h>
#include <avr/iom128.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
#include <util/delay.h>
#include  <avr/pgmspace.h>  //�����ӵ�ͷ�ļ������������ݴ����flash��

#include "Config.h"                     //����ͷ�ļ�����Ӳ����ص��������������
#include "Ascii_8x16.h"                 //8x16��С�ַ�
#include "GB2424.h"                     //24x24���ش�С�ĺ���
#include "Chinese.h"                    //16x16���ش�С�ĺ���
#include "Touch.h"                      //TFT��������ͷ�ļ�
#include "Touch.c"                      //TFT����������ʼ��������
#include "TFT28.h"                      //TFTͷ�ļ�
#include "TFT28.c"                      //TFT������ʼ��������

//******************ȫ�ֱ���***************************

#define White          0xFFFF           //��ʾ��ɫ����
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

unsigned int Device_code;               //TFT����IC�ͺţ�2.8��ΪILI9328

//**************�����ⲿ�����ͱ���********************

extern void delayms(unsigned int count);


/********************************************************************
			��ʼ��IO���ӳ���
********************************************************************/
void Port_Init()
{
	DDRF = 0xFF;
	PORTF = 0x00;

	DDRE = 0xFF;
	PORTE = 0xFF;

	DDRC = 0xFF;
	PORTC = 0x00;

	DDRA = 0xFC;
	PORTA = 0x00;

}

/********************************************************************
	LED��˸һ�Σ�������Ҫ�鿴����ִ��λ��ʱ������ã����ƶϵ�
********************************************************************/
void LED_Light()
{
    LED8=0x00;                    //����LED
    delay_ms(500);
    LED8=0xFF;                    //Ϩ��LED
    delay_ms(500);
}

/********************************************************************
     	      �ڴ�����λ�û���
********************************************************************/
void drawpoint(unsigned int x,unsigned int y,unsigned int color)
{
    LCD_SetPos(x,x+1,y,y+1);
    Write_Data_U16(color);
    Write_Data_U16(color);
    Write_Data_U16(color);
    Write_Data_U16(color);
} 

/********************************************************************
                      ������
********************************************************************/
int main(void)
{
   uint i,y;

  Port_Init();                       //ϵͳ��ʼ��������IO������
  LED_Light();                       //LED����һ�Σ���������˵����Ƭ����ʼ���ɹ�   
  Device_code=0x9320;                //TFT����IC�ͺ�
  TFT_Initial();                     //��ʼ��LCD	
  start_7843();                      //�򿪴�������
    
  CLR_Screen(Magenta);               //�ñ���ɫ����
  LCD_PutString24(35,140,"�����͵��ӿƼ�",Yellow,Magenta); //��ӭ���棬24x24��С���֣���ģ�������С����
  delay_ms(500);    
  LCD_PutString24(83,170,"��",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(107,170,"ӭ",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(131,170,"��",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString(69,300,"www.avrgcc.com",White,Magenta);   //�ַ���ʾ�ٷ���վ
  delay_ms(300);

  CLR_Screen(Blue);                                       //����				
  LCD_PutString(16,5,"Please write on the board!",Magenta,Blue);
  
  while(1)
  {	
    if(Getpix()==1)   drawpoint(lx,ly,White);             //д��x��y����Ϊ��ɫ
  }
   
    
}
