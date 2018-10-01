/********************************************************************
//DMSTM-L����Сϵͳ������2.8��TFT��������ʾ���ֲ��Գ���
//��ʾ���֡��ַ��������Լ�GUI��ͼ�ȹ���
//��ʾֻ��Ҫ������ʾ���ֵĿ����ߺ������ߣ�������user_Config.h�ļ���
//�������ST�ٷ�����̼�����ʽ���汾ΪV3.50���ⲿ����8.000MHZ
//���Ի�����Keil MDK V4.60
//���ߣ�www.avrgcc.com
//ʱ�䣺2013.04.19
********************************************************************/

/********************************************************************
				����ͷ�ļ�
********************************************************************/
#include "stm32f10x.h"                   //STM32�����Ĵ�������ͷ�ļ����������
#include "user_Config.h"                 //�û�����ͷ�ļ�����������Ӳ��������Դ,λ����Ŀ�ļ�����
#include "TFT28.h"											 //TFT��صĺ�������ͷ�ļ�
#include "GUI.h"											   //TFTҺ��GUI��ͼ��������ͷ�ļ�

unsigned int Device_code;                //TFT����IC�ͺţ�2.8��ΪILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //����һ���ṹ�����GPIO_InitStructure�����ڳ�ʼ��GPIO����
ErrorStatus HSEStartUpStatus;

/********************************************************************
				��ͨ��ʱ����
********************************************************************/
void Delay(vu32 nCount)
{
  for(; nCount != 0; nCount--);
}

void delay_ms(unsigned int nCount)
{
      int i,j;                                                                                
    for(i=0;i<nCount;i++)                                                                    
       {
	     for(j=0;j<0x3000;j++);
       }
}

/********************************************************************
				GPIO��ʼ������
********************************************************************/
void GPIO_Config(void)
{
	/* �������ݿڵ�GPIO�ܽ�ģʽ�����ģʽ*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_TFT, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN; //ʹ��PC0~PC7
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TFT_DATA, &GPIO_InitStructure);  				//��ص�GPIO�ڳ�ʼ��
	
	/* ���ÿ��ƿ�A��GPIO�ܽ�ģʽ�����ģʽ*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRA, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;  //ʹ��PA0��PA1
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRA, &GPIO_InitStructure);  						//��ص�GPIO�ڳ�ʼ��
		
		/* ����LED��ʹ�õ�GPIO�ܽ�ģʽ�����ģʽ*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRB, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 |GPIO_Pin_2 |GPIO_Pin_8 ; //ʹ��PB0.1.2.8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRB, &GPIO_InitStructure);  						//��ص�GPIO�ڳ�ʼ��
		
		GPIO_ResetBits(GPIO_CTRB,GPIO_Pin_8);
}


/********************************************************************
                      ������
********************************************************************/
int main(void)
{
  u16 y;
	GPIO_Config();															//GPIO��ʼ�����ã����LED�ƽӿ�����
  Device_code=0x9320;                					//TFT����IC�ͺţ�����ʵ�������ͺţ�Ŀǰ��9320��9328����
  TFT_Initial();                     					//��ʼ��LCD	 

  while(1)                           					//ѭ��ִ�г���
   {
    CLR_Screen(Black);               					//�ñ���ɫ����
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
      LCD_PutString(32,24*y,"�����������ӿƼ����޹�˾����ͬ��",White,Black);      //������ʾ
      delay_ms(30);
    }
    delay_ms(300);

    Show_RGB(0,319,0,39,Blue);                              				//6����ɫ������Ϊ6������
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Magenta);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
		Show_RGB(0,319,200,239,Red);
	  delay_ms(300);
		delay_ms(300);
		Show_RGB(0,319,0,39,White);                              				//6����ɫ������Ϊ6������
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Red);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
		Show_RGB(0,319,200,239,Magenta);
		

    LCD_PutString(108,12,"�ַ���ʾ����",Blue,White);									//��1��������ʾ16x16����
    
    LCD_PutString(80,40,"0123456789876543210",Black,Green);         //��2��������ʾascii�ַ��е����ֺͷ���
    LCD_PutString(40,60,"+-+-**,,`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

    LCD_PutString(40,80,"abcdefghijklmnopqrstuvwxyz",White,Red);		//��3��������ʾascii�ַ�����ĸ
    LCD_PutString(40,100,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",White,Red);

    LCD_PutString(30,132,"The Device IC Of TFT Is:",Yellow,Black);  //��4��������ʾTFT������IC�ͺ�
    LCD_PutString(222,132,"ILI",Red,Black);

		LCD_PutSingleChar(246, 132, 0x30+(Device_code>>12), Red, Black);
    LCD_PutSingleChar(254, 132, 0x30+((Device_code>>8)&0x000f), Red, Black);
    LCD_PutSingleChar(262, 132, 0x30+((Device_code>>4)&0x000f), Red, Black);
    LCD_PutSingleChar(270, 132, 0x30+(Device_code&0x000f), Red, Black);
    
		LCD_PutString(102,222,"www.avrgcc.com",White,Magenta);  					//�ַ���ʾ�ٷ���վ
    delay_ms(400);                                               			//��ʾһ��ʱ��

    CLR_Screen(Black);               																	//�ñ���ɫ����

		GUIline(0,0,319,239,Yellow);																			  //���⻭�ߣ���������Ļ�Խ���
		GUIline(319,0,0,239,Yellow);
    delay_ms(400);                                               			//��ʾһ��ʱ��

    CLR_Screen(Black);
				
		GUIfull(0,0,159,119,Red);
		GUIfull(160,0,319,119,Green);
		GUIfull(0,120,159,239,Yellow);
		GUIfull(160,120,319,239,Magenta);
		delay_ms(400);                                               			 //��ʾһ��ʱ��

    CLR_Screen(Black);
		
		GUIDotline(0,0,319,0,Yellow);																			  //���⻭���ߣ���������Ļ�߿�
		GUIDotline(319,0,319,239,Yellow);																		//���⻭���ߣ���������Ļ�߿�
    GUIDotline(0,239,319,239,Yellow);																		//���⻭���ߣ���������Ļ�߿�
		GUIDotline(0,0,0,239,Yellow);																			  //���⻭���ߣ���������Ļ�߿�

		GUIcircle(50,50,20,Magenta);																				//���⻭Բ��
		GUIcircle(159,119,70,Magenta);
		GUIcircle(270,150,30,Magenta);

    delay_ms(2000);                                               			//��ʾһ��ʱ��
   }  
}


