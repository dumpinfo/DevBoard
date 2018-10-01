/********************************************************************
//DM430-L����Сϵͳ�����2.8��TFT����������ʾ���Գ���
//��TFT����12864�ӿڣ�������������Ҫ�öŰ������ӣ�������ο�ͼ��
//ע��ѡ��Һ���ĵ�Դ��λ�ڵ�λ����������ѡ5V��3.3V������Һ����ѹ����ѡ��Ĭ������Ϊ5V
//���Ի�����EW430 V5.30
//���ߣ�www.avrgcc.com
//ʱ�䣺2013.09.07
********************************************************************/
#include <msp430x14x.h>
#include "Config.h"                     //����ͷ�ļ�����Ӳ����ص��������������
#include "GUI.h"
#include "Ascii_8x16.h"                 //8x16��С�ַ�
#include "GB2424.h"                     //24x24���ش�С�ĺ���
#include "Chinese.h"                    //16x16���ش�С�ĺ���
#include "Touch.h"                      //TFT��������ͷ�ļ�
#include "Touch.c"                      //TFT����������ʼ��������
#include "TFT28.h"                      //TFT��ʾͷ�ļ�
#include "TFT28.c"                      //TFT��ʾ������ʼ��������
#include "GUI.c"

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

uint Device_code;      //TFT����IC�ͺţ��°�2.8��ΪILI9320

//**************�����ⲿ�����ͱ���********************
extern void delayms(uint count);

/********************************************************************
			��ʼ��IO���ӳ���
********************************************************************/
void Port_Init()
{
  P4SEL = 0x00;
  P4DIR = 0xFF;                                     //TFT���ݿ�
  P5SEL = 0x00;
  P5DIR|= BIT0 + BIT1 + BIT3 + BIT5 + BIT6 + BIT7;  //TFT��ʾ������
  
  P3SEL=0x00;                               //����IO��Ϊ��ͨI/Oģʽ
  P3DIR = 0xff;                             //����IO�ڷ���Ϊ���
  P3OUT = 0x00;                             //��ʼ����Ϊ00,LED������IO��
  
  P6SEL = 0x00;
  P6DIR |= BIT2 + BIT3 + BIT4 + BIT5;       //���������ߣ�P60~P64��2�������ߣ�4�������
}

/********************************************************************
	LED��˸һ�Σ�������Ҫ�鿴����ִ��λ��ʱ������ã����ƶϵ�
********************************************************************/
void LED_Light()
{
    LED8=0x00;                              //����LED
    delay_ms(500);
    LED8=0xff;                              //Ϩ��LED
    delay_ms(500);
}
/********************************************************************
                      ������
********************************************************************/
main()
{
  uint y;
  
  WDT_Init();                        //���Ź�����
  Clock_Init();                      //ϵͳʱ������
  Port_Init();                       //ϵͳ��ʼ��������IO������
  LED_Light();                       //LED����һ�Σ���������˵����Ƭ����ʼ���ɹ�   
  Device_code=0x9320;                //TFT����IC�ͺ�
  TFT_Initial();                     //��ʼ��LCD	
    
   while(1)                           //ѭ��ִ�г���
   {
    CLR_Screen(Black);               //�ñ���ɫ����
    LCD_PutString24(75,85,"�����͵��ӿƼ�",Yellow,Black); //��ӭ���棬24x24��С���֣���ģ�������С����
    delay_ms(500); 
    LCD_PutString24(115,119,"��",Yellow,Black);
    delay_ms(300);
    LCD_PutString24(145,119,"ӭ",Yellow,Black);
    delay_ms(300);
    LCD_PutString24(175,119,"��",Yellow,Black);
    delay_ms(300);
    LCD_PutString(102,222,"www.avrgcc.com",White,Black);  	//�ַ���ʾ�ٷ���վ
    delay_ms(800);  
    CLR_Screen(Black);                                       //�ñ���ɫ����
    for(y=0;y<10;y++)
    {
      LCD_PutString(32,24*y,"�����������ӿƼ����޹�˾����ͬ��",White,Black);   //������ʾ
      delay_ms(30);
    }
    delay_ms(300);

    Show_RGB(0,319,0,39,Blue);                          //6����ɫ������Ϊ6������
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Magenta);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
    Show_RGB(0,319,200,239,Red);
    delay_ms(300);
    delay_ms(300);
    Show_RGB(0,319,0,39,White);                         //6����ɫ������Ϊ6������
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Red);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
    Show_RGB(0,319,200,239,Magenta);
		

    LCD_PutString(108,12,"�ַ���ʾ����",Blue,White);									//��1��������ʾ16x16����
    
    LCD_PutString(80,40,"0123456789876543210",Black,Green);         //��2��������ʾascii�ַ��е����ֺͷ���
    LCD_PutString(40,60,"+-+-**,,`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

    LCD_PutString(40,80,"abcdefghijklmnopqrstuvwxyz",White,Red);    //��3��������ʾascii�ַ�����ĸ
    LCD_PutString(40,100,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",White,Red);

    LCD_PutString(30,132,"The Device IC Of TFT Is:",Yellow,Black);  //��4��������ʾTFT������IC�ͺ�
    LCD_PutString(222,132,"ILI",Red,Black);

    LCD_PutSingleChar(246, 132, 0x30+(Device_code>>12), Red, Black);
    LCD_PutSingleChar(254, 132, 0x30+((Device_code>>8)&0x000f), Red, Black);
    LCD_PutSingleChar(262, 132, 0x30+((Device_code>>4)&0x000f), Red, Black);
    LCD_PutSingleChar(270, 132, 0x30+(Device_code&0x000f), Red, Black);
    
    LCD_PutString(102,222,"www.avrgcc.com",White,Magenta);  	//�ַ���ʾ�ٷ���վ
    delay_ms(400);                                              //��ʾһ��ʱ��

    CLR_Screen(Black);               																	//�ñ���ɫ����

    GUIline(0,0,319,239,Yellow);																			  //���⻭�ߣ���������Ļ�Խ���
    GUIline(319,0,0,239,Yellow);
    delay_ms(400);                                              //��ʾһ��ʱ��

    CLR_Screen(Black);
				
    GUIfull(0,0,159,119,Red);
    GUIfull(160,0,319,119,Green);
    GUIfull(0,120,159,239,Yellow);
    GUIfull(160,120,319,239,Magenta);
    delay_ms(400);                                              //��ʾһ��ʱ��

    CLR_Screen(Black);
		
    GUIDotline(0,0,319,0,Yellow);		                //�����߱߿�																	  //���⻭���ߣ���������Ļ�߿�
    GUIDotline(319,0,319,239,Yellow);																		//���⻭���ߣ���������Ļ�߿�
    GUIDotline(0,239,319,239,Yellow);																		//���⻭���ߣ���������Ļ�߿�
    GUIDotline(0,0,0,239,Yellow);																			  //���⻭���ߣ���������Ļ�߿�

    GUIcircle(50,50,20,Magenta);	                        //��3����С��ͬ��Բ																			//���⻭Բ��
    GUIcircle(159,119,70,Magenta);
    GUIcircle(270,150,30,Magenta);

    delay_ms(2000);                                             //��ʾһ��ʱ��
   }  
}