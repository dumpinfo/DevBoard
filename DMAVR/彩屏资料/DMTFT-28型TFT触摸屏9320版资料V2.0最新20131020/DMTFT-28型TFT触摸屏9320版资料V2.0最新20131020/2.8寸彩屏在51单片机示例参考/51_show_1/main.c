
/*===================================================================================================  
�������ƣ�  Ex1
����������	����TFTʵ�ֺ��֣��ַ���ʾ���ͻ��㹦�ܡ�
Ӳ�����ӣ�  �鿴���޸Ľӿڶ�����NBCTFT.C��,����ϸ���ӿ����ߡ�
      ----------------------------------------
     |     --------TFT���ƽ���----------      |
     |	                                      |
     |	        D10~D17   ��   P0             |
     |          RS        ��   P2^5;	      |
     |			RW   	  ��   P2^4;          |
     |			RD        ��   P2^3;          |
     |		    CS        ��   P2^2;	      |
     |			RES       ��   P2^1;	      |
     |	                                      |
     |			LE        ��   P2^0;          |
     |                                        |
     |     --------��Դ�������---------      |
     |	        GND       ��   ��Դ����       |
     |	        VIN       ��   ��Դ����(5V)   |
     |----------------------------------------|
     | �����NBC��������ʹ�ã������߲����÷�  |
     | �����ӣ�ֱ�Ӳ���ڿ������ϵ�12864�ӿ�  |
      ----------------------------------------
ά����¼��  2012-3-14
====================================================================================================*/

//******************����ͷ�ļ�***************************

#include<reg52.h>    //������Ƭ��ͷ�ļ�
#include"NBCTFT.h"   //����TFT����ͷ�ļ�

//******************ȫ�ֱ���***************************

#define White          0xFFFF   //LCD color
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

unsigned int Device_code;      //TFT����IC�ͺ�

//**************�����ⲿ�����ͱ���********************

extern void delayms(unsigned int count);

//================================================================================================
//	�������ƣ�	������
//	ʵ�ֹ��ܣ�	����TFTʵ�ֺ��֣��ַ���ʾ.
//	������		��
//	����ֵ��	��
//================================================================================================
main()
{
       unsigned int i;
	   Device_code=0x9320;                //TFT����IC�ͺ�
       
       TFT_Initial();                     //��ʼ��LCD	 

  while(1)                                //ѭ��
      {
	   //5����ɫ������Ϊ5������
	   Show_RGB(0,240,0,64,Blue);
	   Show_RGB(0,240,64,128,Green);
	   Show_RGB(0,240,128,192,Magenta);
	   Show_RGB(0,240,192,256,Red);
	   Show_RGB(0,240,256,320,Yellow);

       //��1��������ʾ16x16����
	   LCD_PutString(24,16,"������о�Ƽ��������޹�˾",White,Blue);
       LCD_PutString(24,40,"   ��о�Ƽ�  ����ͬ��",White,Blue);

	   //��2��������ʾascii�ַ��е����ֺͷ���
	   LCD_PutString(80,72,"0123456789",Black,Green);
	   LCD_PutString(16,96,")(`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

	   //��3��������ʾascii�ַ�����ĸ
	   LCD_PutString(16,136,"abcdefghijklmnopqrstuvwxyz",Blue,Magenta);
	   LCD_PutString(16,156,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",Blue,Magenta);

	   //��4��������ʾTFT������IC�ͺ�
	   LCD_PutString(16,200,"The Device IC Of TFT Is:",Black,Red);
	   LCD_PutString(96,224,"ILI",Black,Red);
	   LCD_PutChar(120, 224, 0x30+(Device_code>>12), Black, Red);
	   LCD_PutChar(128, 224, 0x30+((Device_code>>8)&0x000f), Black, Red);
	   LCD_PutChar(136, 224, 0x30+((Device_code>>4)&0x000f), Black, Red);
	   LCD_PutChar(144, 224, 0x30+(Device_code&0x000f), Black, Red);
       
	   //��5��������ʵ�ֻ���
       for(i=312;i>264;i--){ Put_pixel(68,i,Blue);}
	   for(i=68;i<172;i++) { Put_pixel(i,264,Blue);}
       for(i=264;i<312;i++){ Put_pixel(172,i,Blue);} 
	   for(i=172;i>68;i--) { Put_pixel(i,312,Blue);}
 
	   delayms(20000);  //��ʾһ��ʱ��
	   CLR_Screen(Red); //�ñ���ɫ����
	  }
 
  }



