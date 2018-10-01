/********************************************************************
//DMSTM-L����Сϵͳ������2.8��TFT��������ʾ���ֲ��Գ���
//��ʾ���֡��ַ���������ͨ�ù���
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

unsigned int Device_code;                //TFT����IC�ͺţ�2.8��ΪILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //����һ���ṹ�����GPIO_InitStructure�����ڳ�ʼ��GPIO����
ErrorStatus HSEStartUpStatus;

/********************************************************************
				LED��ˮ��ʾ����
********************************************************************/
void LED_Runing(u8 LED_NUM)
{
	switch(LED_NUM)
	{
        case 0:
          GPIO_ResetBits(GPIO_LED8,DS1_PIN);  //����DS1��
          break;
        case 1:
          GPIO_ResetBits(GPIO_LED8,DS2_PIN);  //����DS2��
          break;
        case 2:
          GPIO_ResetBits(GPIO_LED8,DS3_PIN);  //����DS3��
          break;
        case 3:
          GPIO_ResetBits(GPIO_LED8,DS4_PIN);  //����DS4��
          break; 
        case 4:
          GPIO_ResetBits(GPIO_LED8,DS5_PIN);  //����DS1��
          break;
        case 5:
          GPIO_ResetBits(GPIO_LED8,DS6_PIN);  //����DS2��
          break;
        case 6:
          GPIO_ResetBits(GPIO_LED8,DS7_PIN);  //����DS3��
          break;
        case 7:
          GPIO_ResetBits(GPIO_LED8,DS8_PIN);  //����DS4��
          break;				
        default:
		      GPIO_ResetBits(GPIO_LED8,DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN); //�������е�LED��
          break;
	}
}


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
	/*����������*/
		
	
	  /* ����LED��ʹ�õ�GPIO�ܽ�ģʽ�����ģʽ�����������*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_LED8, ENABLE); 					//ʹ��LED��ʹ�õ�GPIOʱ��
  	GPIO_InitStructure.GPIO_Pin = DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN; //ʹ��PC0~PC7
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO���������ģʽ
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(GPIO_LED8, &GPIO_InitStructure);  						//��ص�GPIO�ڳ�ʼ��
  	GPIO_SetBits(GPIO_LED8,DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN);//�ر����е�LEDָʾ��
	
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
		
		/* ����LED��ʹ�õ�GPIO�ܽ�ģʽ*/
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
  u16 i,y;
	GPIO_Config();															//GPIO��ʼ�����ã����LED�ƽӿ�����
  LED_Runing(1);                       				//LED����һ�Σ���������˵����Ƭ����ʼ���ɹ�   
  Device_code=0x9320;                					//TFT����IC�ͺţ�����ʵ�������ͺţ���9320��9328����
  TFT_Initial();                     					//��ʼ��LCD	 

  while(1)                           					//ѭ��ִ�г���
   {
        
    CLR_Screen(Magenta);                      //�ñ���ɫ����
    LCD_PutString24(35,140,"�����͵��ӿƼ�",Yellow,Magenta); //��ӭ���棬24x24��С���֣���ģ�������С����
    delay_ms(500);    
    LCD_PutString24(83,170,"��",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString24(107,170,"ӭ",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString24(131,170,"��",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString(69,300,"www.avrgcc.com",White,Magenta);  //�ַ���ʾ�ٷ���վ
    delay_ms(300);
    
    CLR_Screen(Black);                                     //�ñ���ɫ����
    
    for(y=0;y<10;y++)
    {
      LCD_PutString(52,y*32,"��������,����ͬ��",White,Black); //������ʾ
      delay_ms(30);
    }
    delay_ms(300);
    
    CLR_Screen(Black);                                       //�ñ���ɫ����
    for(y=0;y<10;y++)
    {
      LCD_PutString(24,y*32,"�����������ӿƼ����޹�˾",White,Black);      //������ʾ
      delay_ms(30);
    }
    delay_ms(300);
        
    Show_RGB(0,240,0,64,Blue);                              //5����ɫ������Ϊ5������
    Show_RGB(0,240,64,128,Green);
    Show_RGB(0,240,128,192,Magenta);
    Show_RGB(0,240,192,256,Red);
    Show_RGB(0,240,256,320,Yellow);

    LCD_PutString(24,16,"�����������ӿƼ����޹�˾",White,Blue);//��1��������ʾ16x16����
    LCD_PutString(24,40,"   �����Ƽ�,����ͬ��",White,Blue);
    
    LCD_PutString(80,72,"0123456789",Black,Green);            //��2��������ʾascii�ַ��е����ֺͷ���
    LCD_PutString(16,96,",,`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

    LCD_PutString(16,136,"abcdefghijklmnopqrstuvwxyz",Blue,Magenta);//��3��������ʾascii�ַ�����ĸ
    LCD_PutString(16,156,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",Blue,Magenta);
    
    LCD_PutString(16,200,"The Device IC Of TFT Is:",Black,Red);    //��4��������ʾTFT������IC�ͺ�
    LCD_PutString(96,224,"ILI",Black,Red);
    LCD_PutChar(120, 224, 0x30+(Device_code>>12), Black, Red);
    LCD_PutChar(128, 224, 0x30+((Device_code>>8)&0x000f), Black, Red);
    LCD_PutChar(136, 224, 0x30+((Device_code>>4)&0x000f), Black, Red);
    LCD_PutChar(144, 224, 0x30+(Device_code&0x000f), Black, Red);
    
    for(i=312;i>264;i--){ Put_pixel(68,i,Blue);}                   //��5��������ʵ�ֻ���
    for(i=68;i<172;i++) { Put_pixel(i,264,Blue);}
    for(i=264;i<312;i++){ Put_pixel(172,i,Blue);} 
    for(i=172;i>68;i--) { Put_pixel(i,312,Blue);}
    
    delay_ms(2000);                                               //��ʾһ��ʱ��
    CLR_Screen(Red);                                              //�ñ���ɫ����
   }
 
    
}


