/********************************************************************
//DMSTM-L型最小系统板驱动2.8寸TFT触摸屏显示部分测试程序
//显示汉字、字符、清屏等通用功能
//显示只需要配置显示部分的控制线和数据线，配置在user_Config.h文件中
//程序采用ST官方外设固件库形式，版本为V3.50，外部晶振8.000MHZ
//调试环境：Keil MDK V4.60
//作者：www.avrgcc.com
//时间：2013.04.19
********************************************************************/

/********************************************************************
				包含头文件
********************************************************************/
#include "stm32f10x.h"                   //STM32器件寄存器定义头文件，必须包含
#include "user_Config.h"                 //用户配置头文件，用于配置硬件连接资源,位于项目文件夹下
#include "TFT28.h"											 //TFT相关的函数声明头文件

unsigned int Device_code;                //TFT控制IC型号，2.8寸为ILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //定义一个结构体变量GPIO_InitStructure，用于初始化GPIO操作
ErrorStatus HSEStartUpStatus;

/********************************************************************
				LED流水显示函数
********************************************************************/
void LED_Runing(u8 LED_NUM)
{
	switch(LED_NUM)
	{
        case 0:
          GPIO_ResetBits(GPIO_LED8,DS1_PIN);  //点亮DS1灯
          break;
        case 1:
          GPIO_ResetBits(GPIO_LED8,DS2_PIN);  //点亮DS2灯
          break;
        case 2:
          GPIO_ResetBits(GPIO_LED8,DS3_PIN);  //点亮DS3灯
          break;
        case 3:
          GPIO_ResetBits(GPIO_LED8,DS4_PIN);  //点亮DS4灯
          break; 
        case 4:
          GPIO_ResetBits(GPIO_LED8,DS5_PIN);  //点亮DS1灯
          break;
        case 5:
          GPIO_ResetBits(GPIO_LED8,DS6_PIN);  //点亮DS2灯
          break;
        case 6:
          GPIO_ResetBits(GPIO_LED8,DS7_PIN);  //点亮DS3灯
          break;
        case 7:
          GPIO_ResetBits(GPIO_LED8,DS8_PIN);  //点亮DS4灯
          break;				
        default:
		      GPIO_ResetBits(GPIO_LED8,DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN); //点亮所有的LED灯
          break;
	}
}


/********************************************************************
				普通延时函数
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
				GPIO初始化函数
********************************************************************/
void GPIO_Config(void)
{
	/*变量定义区*/
		
	
	  /* 配置LED灯使用的GPIO管脚模式，输出模式，灌电流驱动*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_LED8, ENABLE); 					//使能LED灯使用的GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN; //使用PC0~PC7
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(GPIO_LED8, &GPIO_InitStructure);  						//相关的GPIO口初始化
  	GPIO_SetBits(GPIO_LED8,DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN);//关闭所有的LED指示灯
	
	/* 配置数据口的GPIO管脚模式，输出模式*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_TFT, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = DS1_PIN|DS2_PIN|DS3_PIN|DS4_PIN|DS5_PIN|DS6_PIN|DS7_PIN|DS8_PIN; //使用PC0~PC7
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TFT_DATA, &GPIO_InitStructure);  				//相关的GPIO口初始化
	
	/* 配置控制口A的GPIO管脚模式，输出模式*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRA, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;  //使用PA0、PA1
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRA, &GPIO_InitStructure);  						//相关的GPIO口初始化
		
		/* 配置LED灯使用的GPIO管脚模式*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRB, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 |GPIO_Pin_2 |GPIO_Pin_8 ; //使用PB0.1.2.8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRB, &GPIO_InitStructure);  						//相关的GPIO口初始化
		
		GPIO_ResetBits(GPIO_CTRB,GPIO_Pin_8);
}


/********************************************************************
                      主函数
********************************************************************/
int main(void)
{
  u16 i,y;
	GPIO_Config();															//GPIO初始化配置，针对LED灯接口配置
  LED_Runing(1);                       				//LED点亮一次，如有现象，说明单片机初始化成功   
  Device_code=0x9320;                					//TFT控制IC型号，根据实物设置型号，有9320和9328两种
  TFT_Initial();                     					//初始化LCD	 

  while(1)                           					//循环执行程序
   {
        
    CLR_Screen(Magenta);                      //用背景色清屏
    LCD_PutString24(35,140,"欣世纪电子科技",Yellow,Magenta); //欢迎界面，24x24大小汉字，字模软件隶书小二号
    delay_ms(500);    
    LCD_PutString24(83,170,"欢",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString24(107,170,"迎",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString24(131,170,"您",Yellow,Magenta);
    delay_ms(300);
    LCD_PutString(69,300,"www.avrgcc.com",White,Magenta);  //字符显示官方网站
    delay_ms(300);
    
    CLR_Screen(Black);                                     //用背景色清屏
    
    for(y=0;y<10;y++)
    {
      LCD_PutString(52,y*32,"欣创电子,与您同行",White,Black); //汉字显示
      delay_ms(30);
    }
    delay_ms(300);
    
    CLR_Screen(Black);                                       //用背景色清屏
    for(y=0;y<10;y++)
    {
      LCD_PutString(24,y*32,"宁波欣创电子科技有限公司",White,Black);      //汉字显示
      delay_ms(30);
    }
    delay_ms(300);
        
    Show_RGB(0,240,0,64,Blue);                              //5种颜色将屏分为5个区域
    Show_RGB(0,240,64,128,Green);
    Show_RGB(0,240,128,192,Magenta);
    Show_RGB(0,240,192,256,Red);
    Show_RGB(0,240,256,320,Yellow);

    LCD_PutString(24,16,"宁波欣创电子科技有限公司",White,Blue);//第1个区域显示16x16汉字
    LCD_PutString(24,40,"   欣创科技,与您同行",White,Blue);
    
    LCD_PutString(80,72,"0123456789",Black,Green);            //第2个区域显示ascii字符中的数字和符号
    LCD_PutString(16,96,",,`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

    LCD_PutString(16,136,"abcdefghijklmnopqrstuvwxyz",Blue,Magenta);//第3个区域显示ascii字符中字母
    LCD_PutString(16,156,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",Blue,Magenta);
    
    LCD_PutString(16,200,"The Device IC Of TFT Is:",Black,Red);    //第4个区域显示TFT控制器IC型号
    LCD_PutString(96,224,"ILI",Black,Red);
    LCD_PutChar(120, 224, 0x30+(Device_code>>12), Black, Red);
    LCD_PutChar(128, 224, 0x30+((Device_code>>8)&0x000f), Black, Red);
    LCD_PutChar(136, 224, 0x30+((Device_code>>4)&0x000f), Black, Red);
    LCD_PutChar(144, 224, 0x30+(Device_code&0x000f), Black, Red);
    
    for(i=312;i>264;i--){ Put_pixel(68,i,Blue);}                   //第5个区域打点实现画线
    for(i=68;i<172;i++) { Put_pixel(i,264,Blue);}
    for(i=264;i<312;i++){ Put_pixel(172,i,Blue);} 
    for(i=172;i>68;i--) { Put_pixel(i,312,Blue);}
    
    delay_ms(2000);                                               //显示一段时间
    CLR_Screen(Red);                                              //用背景色清屏
   }
 
    
}


