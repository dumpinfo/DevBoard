/********************************************************************
//DMSTM-L����Сϵͳ������2.8��TFT�������������ֲ��Գ���
//�ڴ������ϻ�ͼ���ߵȹ��ܣ�ͬʱ�ڴ������·�����ʾ�������꣬ԭ�����������Ͻ�Ϊ��0,0��
//Ӳ������Ҫ���ô��������ߣ�һ����6������Ӧ�ĳ���������user_Config.h�ļ���
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
#include "TOUCH.h"											 //�����������ͷ�ļ�

unsigned int Device_code;                //TFT����IC�ͺţ�2.8��ΪILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //����һ���ṹ�����GPIO_InitStructure�����ڳ�ʼ��GPIO����
ErrorStatus HSEStartUpStatus;
uint xm,ym;

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
  	GPIO_InitStructure.GPIO_Pin = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | TCLK | TCS | BUSY;  //ʹ��PC0~PC7 PC8\9\10
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TFT_DATA, &GPIO_InitStructure);  				//��ص�GPIO�ڳ�ʼ��
	
	/* ���ÿ��ƿ�A��GPIO�ܽ�ģʽ�����ģʽ�����������*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRA, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_8;  //ʹ��PA0��PA1��PA8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRA, &GPIO_InitStructure);  						//��ص�GPIO�ڳ�ʼ��
		
		/* ���ÿ��ƿ�B��GPIO�ܽ�ģʽ�����ģʽ�����������*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRB, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 |GPIO_Pin_2 |GPIO_Pin_8 ; //ʹ��PB0.1.2.8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRB, &GPIO_InitStructure);  						//��ص�GPIO�ڳ�ʼ��
	
	  /* ���ÿ��ƿ�C��GPIO�ܽ�ģʽ�����ģʽ�����������*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_TOUCHC, ENABLE); 					//ʹ��GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12;  //ʹ��PC11\12
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		  //GPIO����������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TOUCHC, &GPIO_InitStructure);  					  //��ص�GPIO�ڳ�ʼ��
		
		GPIO_ResetBits(GPIO_CTRB,GPIO_Pin_8);											//RD�ܽ��õ�
}


/********************************************************************
                      ������
********************************************************************/
int main(void)
{
	GPIO_Config();															//GPIO��ʼ�����ã����LED�ƽӿ�����
  Device_code=0x9320;                					//TFT����IC�ͺ�
  TFT_Initial();                     					//��ʼ��LCD

  start_7843();                      					//�򿪴�������	
	
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
    LCD_PutString(102,222,"www.avrgcc.com",White,Black);  		//�ַ���ʾ�ٷ���վ
    delay_ms(800);  
    CLR_Screen(Black);                                       	//�ñ���ɫ����
    
		CLR_Screen(Red);                                       		//����				
    LCD_PutString(0,5,"Please write on the board!",White,Red);
  
		while(1)
			{ 	
				if(Getpix()==1)  
				{
					drawpoint(lx,ly,Green);             								//д��x��y����Ϊ��ɫ�����Ի�ͼ
					Display_Coordinate(lx,ly,Red);											//��ʾ����������
					//Display_Coordinate(xm,ym,Red);
					
				}
			}
   }  
}


