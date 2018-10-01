/********************************************************************
//DMSTM-L型最小系统板驱动2.8寸TFT触摸屏触摸部分测试程序
//在触摸屏上绘图画线等功能，同时在触摸屏下方会显示触点坐标，原点坐标在左上角为（0,0）
//硬件上需要配置触摸控制线，一共是6条，对应的程序配置在user_Config.h文件中
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
#include "TOUCH.h"											 //触摸功能相关头文件

unsigned int Device_code;                //TFT控制IC型号，2.8寸为ILI9328

GPIO_InitTypeDef GPIO_InitStructure;     //定义一个结构体变量GPIO_InitStructure，用于初始化GPIO操作
ErrorStatus HSEStartUpStatus;
uint xm,ym;

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
  	GPIO_InitStructure.GPIO_Pin = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | TCLK | TCS | BUSY;  //使用PC0~PC7 PC8\9\10
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TFT_DATA, &GPIO_InitStructure);  				//相关的GPIO口初始化
	
	/* 配置控制口A的GPIO管脚模式，输出模式，灌电流驱动*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRA, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_8;  //使用PA0、PA1、PA8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRA, &GPIO_InitStructure);  						//相关的GPIO口初始化
		
		/* 配置控制口B的GPIO管脚模式，输出模式，灌电流驱动*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_CTRB, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 |GPIO_Pin_2 |GPIO_Pin_8 ; //使用PB0.1.2.8
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;				//GPIO工作在输出模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_CTRB, &GPIO_InitStructure);  						//相关的GPIO口初始化
	
	  /* 配置控制口C的GPIO管脚模式，输出模式，灌电流驱动*/
  	RCC_APB2PeriphClockCmd(RCC_GPIO_TOUCHC, ENABLE); 					//使能GPIO时钟
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_12;  //使用PC11\12
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		  //GPIO工作在输入模式
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  	GPIO_Init(GPIO_TOUCHC, &GPIO_InitStructure);  					  //相关的GPIO口初始化
		
		GPIO_ResetBits(GPIO_CTRB,GPIO_Pin_8);											//RD管脚置低
}


/********************************************************************
                      主函数
********************************************************************/
int main(void)
{
	GPIO_Config();															//GPIO初始化配置，针对LED灯接口配置
  Device_code=0x9320;                					//TFT控制IC型号
  TFT_Initial();                     					//初始化LCD

  start_7843();                      					//打开触摸功能	
	
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
    LCD_PutString(102,222,"www.avrgcc.com",White,Black);  		//字符显示官方网站
    delay_ms(800);  
    CLR_Screen(Black);                                       	//用背景色清屏
    
		CLR_Screen(Red);                                       		//清屏				
    LCD_PutString(0,5,"Please write on the board!",White,Red);
  
		while(1)
			{ 	
				if(Getpix()==1)  
				{
					drawpoint(lx,ly,Green);             								//写（x，y）点为绿色，可以绘图
					Display_Coordinate(lx,ly,Red);											//显示触摸点坐标
					//Display_Coordinate(xm,ym,Red);
					
				}
			}
   }  
}


