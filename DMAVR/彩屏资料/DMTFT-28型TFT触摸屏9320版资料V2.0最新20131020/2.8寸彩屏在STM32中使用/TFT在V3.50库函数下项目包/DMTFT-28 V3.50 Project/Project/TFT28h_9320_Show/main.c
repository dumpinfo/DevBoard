/********************************************************************
//DMSTM-L型最小系统板驱动2.8寸TFT触摸屏显示部分测试程序
//显示汉字、字符、清屏以及GUI绘图等功能
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
#include "GUI.h"											   //TFT液晶GUI绘图函数声明头文件

unsigned int Device_code;                //TFT控制IC型号，2.8寸为ILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //定义一个结构体变量GPIO_InitStructure，用于初始化GPIO操作
ErrorStatus HSEStartUpStatus;

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
		
		/* 配置LED灯使用的GPIO管脚模式，输出模式*/
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
  u16 y;
	GPIO_Config();															//GPIO初始化配置，针对LED灯接口配置
  Device_code=0x9320;                					//TFT控制IC型号，根据实物设置型号，目前有9320和9328两种
  TFT_Initial();                     					//初始化LCD	 

  while(1)                           					//循环执行程序
   {
    CLR_Screen(Black);               					//用背景色清屏
    LCD_PutString24(75,85,"欣世纪电子科技",Yellow,Black); //欢迎界面，24x24大小汉字，字模软件隶书小二号
    delay_ms(500); 
    LCD_PutString24(115,119,"欢",Yellow,Black);
    delay_ms(300);
    LCD_PutString24(145,119,"迎",Yellow,Black);
    delay_ms(300);
    LCD_PutString24(175,119,"您",Yellow,Black);
    delay_ms(300);
    LCD_PutString(102,222,"www.avrgcc.com",White,Black);  	//字符显示官方网站
    delay_ms(800);  
    CLR_Screen(Black);                                       //用背景色清屏
    for(y=0;y<10;y++)
    {
      LCD_PutString(32,24*y,"宁波欣创电子科技有限公司与您同行",White,Black);      //汉字显示
      delay_ms(30);
    }
    delay_ms(300);

    Show_RGB(0,319,0,39,Blue);                              				//6种颜色将屏分为6个区域
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Magenta);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
		Show_RGB(0,319,200,239,Red);
	  delay_ms(300);
		delay_ms(300);
		Show_RGB(0,319,0,39,White);                              				//6种颜色将屏分为6个区域
    Show_RGB(0,319,40,79,Green);
    Show_RGB(0,319,80,119,Red);
    Show_RGB(0,319,120,159,Black);
    Show_RGB(0,319,160,199,Yellow);
		Show_RGB(0,319,200,239,Magenta);
		

    LCD_PutString(108,12,"字符显示测试",Blue,White);									//第1个区域显示16x16汉字
    
    LCD_PutString(80,40,"0123456789876543210",Black,Green);         //第2个区域显示ascii字符中的数字和符号
    LCD_PutString(40,60,"+-+-**,,`,./<>';:[]{}\|?-=+*&^%$",Black,Green);

    LCD_PutString(40,80,"abcdefghijklmnopqrstuvwxyz",White,Red);		//第3个区域显示ascii字符中字母
    LCD_PutString(40,100,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",White,Red);

    LCD_PutString(30,132,"The Device IC Of TFT Is:",Yellow,Black);  //第4个区域显示TFT控制器IC型号
    LCD_PutString(222,132,"ILI",Red,Black);

		LCD_PutSingleChar(246, 132, 0x30+(Device_code>>12), Red, Black);
    LCD_PutSingleChar(254, 132, 0x30+((Device_code>>8)&0x000f), Red, Black);
    LCD_PutSingleChar(262, 132, 0x30+((Device_code>>4)&0x000f), Red, Black);
    LCD_PutSingleChar(270, 132, 0x30+(Device_code&0x000f), Red, Black);
    
		LCD_PutString(102,222,"www.avrgcc.com",White,Magenta);  					//字符显示官方网站
    delay_ms(400);                                               			//显示一段时间

    CLR_Screen(Black);               																	//用背景色清屏

		GUIline(0,0,319,239,Yellow);																			  //任意画线，这里是屏幕对角线
		GUIline(319,0,0,239,Yellow);
    delay_ms(400);                                               			//显示一段时间

    CLR_Screen(Black);
				
		GUIfull(0,0,159,119,Red);
		GUIfull(160,0,319,119,Green);
		GUIfull(0,120,159,239,Yellow);
		GUIfull(160,120,319,239,Magenta);
		delay_ms(400);                                               			 //显示一段时间

    CLR_Screen(Black);
		
		GUIDotline(0,0,319,0,Yellow);																			  //任意画虚线，这里是屏幕边框
		GUIDotline(319,0,319,239,Yellow);																		//任意画虚线，这里是屏幕边框
    GUIDotline(0,239,319,239,Yellow);																		//任意画虚线，这里是屏幕边框
		GUIDotline(0,0,0,239,Yellow);																			  //任意画虚线，这里是屏幕边框

		GUIcircle(50,50,20,Magenta);																				//任意画圆形
		GUIcircle(159,119,70,Magenta);
		GUIcircle(270,150,30,Magenta);

    delay_ms(2000);                                               			//显示一段时间
   }  
}


