/********************************************************************
//DMAVR-L型最小系统板控制2.8寸TFT彩屏显示图片测试程序
//将TFT显示接口插入12864接口，硬件更改与其他相同，可参考说明书
//注意选择液晶的电源，位于电位器附近，可选5V或3.3V，根据液晶电压进行选择，默认设置为5V
//调试环境：AVR Studio 4.17 + WinAVR 优化度-01
//作者：www.avrgcc.com
//时间：2013.03.09
********************************************************************/
#include <stdio.h>
#include <math.h>
#include <avr/io.h>
#include <avr/iom128.h>					//128单片机头文件，软件自带
#define	 F_CPU	7372800					//单片机主频为7.3728MHz,用于延时子程序 
#include <util/delay.h>					//AVR GCC下延时函数必须调用此文件
#include  <avr/pgmspace.h>  			//须增加的头文件，用来将数据存放在flash中
#include "Config.h"                     //配置头文件，与硬件相关的配置在这里更改
#include "qqpic.h"						//80x80图形文件点阵，由Image2LCD软件生成
#include "Ascii_8x16.h"                 //8x16大小字符
#include "GB2424.h"                     //24x24像素大小的汉字
#include "Chinese.h"                    //16x16像素大小的汉字
#include "Touch.h"                      //TFT触摸操作头文件
#include "Touch.c"                      //TFT触摸操作初始化及函数
#include "TFT28.h"                      //TFT头文件
#include "TFT28.c"                      //TFT操作初始化及函数

//******************全局变量**************************************
#define White          0xFFFF           //显示颜色代码
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

unsigned int Device_code;               //TFT控制IC型号，2.8寸为ILI9328

//**************声明外部函数和变量*******************************

extern void delayms(unsigned int count);


/********************************************************************
			初始化IO口子程序
********************************************************************/
void Port_Init()
{
	DDRF = 0xFF;					//显示控制线在PF口
	PORTF = 0x00;

	DDRE = 0xFF;					//8个LED灯接在PE口
	PORTE = 0xFF;

	DDRC = 0xFF;					//数据口为PC口
	PORTC = 0x00;

	DDRA = 0xFC;					//触摸屏控制线为PA口
	PORTA = 0x00;

}

/********************************************************************
	LED闪烁一次，可在需要查看程序执行位置时灵活设置，类似断点
********************************************************************/
void LED_Light()
{
    LED8=0x00;                    	//点亮LED
    delay_ms(500);
    LED8=0xFF;                    	//熄灭LED
    delay_ms(500);
}

/***************************************************************************************************
//	实现功能：	任意位置显示任意大小图片，前提是单片机可以装下数据
//  输入参数：  x0，y0 起始坐标
//              x1，y1 结束坐标
//  注意事项：	1、图片大小建议不要太大，最好是小图，比如40x40、80x80，太大单片机装不下
				2、图片数据是放在单片机FLASH中的，所以要用pgm_read_byte函数读取出来再送入GRAM中
				3、显示前LCD_SetPos用来设置图片显示区域，从0开始，结束坐标要减1
				4、获取数据的位置函数见具体操作函数
				5、Imag2LCD软件提取用16彩色，高字节在高位，低字节在低位，即小端数据存储格式
***************************************************************************************************/
void Show_Image(unsigned int x0,unsigned int x1,unsigned int y0,unsigned int y1)
{
	unsigned int i,j;
	LCD_SetPos(x0,x1-1,y0,y1-1);      //设置显示位置
	for (i=y0-y0;i<y1-y0;i++)         //起始位置应该从0开始，便于提取数据
	{
	   for (j=x0-x0;j<x1-x0;j++)      //起始位置应该从0开始，便于提取数据
	    //小端数据格式，用pgm_read_byte函数从FLASH中读取图像数据，图像数据用Image2LCD软件提取，16位彩色
	    Write_Data(pgm_read_byte( &gImage_qqp[i*(x1-x0)*2+j*2+1]),pgm_read_byte( &gImage_qqp[i*(x1-x0)*2+j*2] ));//注意算法
	}
}

/***************************************************************************************************
//	实现功能：	图片动态显示效果
//  输入参数：  x0，y0 起始坐标
//              x1，y1 结束坐标
//				xm, ym x,y方向移动的像素
//				bColor为背景色，移动后清除原先的图像数据
//  注意事项：	1、图片大小建议不要太大，最好是小图，比如40x40、80x80，太大单片机装不下
				2、图片数据是放在单片机FLASH中的，所以要用pgm_read_byte函数读取出来再送入GRAM中
				3、显示前LCD_SetPos用来设置图片显示区域，从0开始，结束坐标要减1
				4、获取数据的位置函数见具体操作函数
				5、Imag2LCD软件提取用16彩色，高字节在高位，低字节在低位，即小端数据存储格式
***************************************************************************************************/
void Image_Move(unsigned int x0,unsigned int x1,unsigned int y0,unsigned int y1,uchar xm,uchar ym,uint bColor)
{
	uint i,j,k;
	
  for(k=0;k<7;k++)
  {
   //m=k*xm;
   //n=k*ym;
   LCD_SetPos(x0+k*xm,x1+k*xm-1,y0+k*ym,y1+k*ym-1);      //设置显示位置
	for (i=y0-y0;i<y1-y0;i++)         //起始位置应该从0开始，便于提取数据
	{
	   for (j=x0-x0;j<x1-x0;j++)      //起始位置应该从0开始，便于提取数据
	    //小端数据格式，用pgm_read_byte函数从FLASH中读取图像数据，图像数据用Image2LCD软件提取，16位彩色
	    Write_Data(pgm_read_byte( &gImage_qqp[i*(x1-x0)*2+j*2+1]),pgm_read_byte( &gImage_qqp[i*(x1-x0)*2+j*2] ));//注意算法
	}

	delay_ms(500);
	delay_ms(500);

	for (i=y0-y0;i<y1-y0;i++)         //起始位置应该从0开始，便于提取数据
	{
	   for (j=x0-x0;j<x1-x0;j++)      //起始位置应该从0开始，便于提取数据
	    //小端数据格式，用pgm_read_byte函数从FLASH中读取图像数据，图像数据用Image2LCD软件提取，16位彩色
	    Write_Data_U16(bColor);//注意算法
	}
  }
}

/********************************************************************
                      主函数
********************************************************************/
int main(void)
{
   uint i,j;

  Port_Init();                       //系统初始化，设置IO口属性
  LED_Light();                       //LED点亮一次，如有现象，说明单片机初始化成功   
  Device_code=0x9320;                //TFT控制IC型号
  TFT_Initial();                     //初始化LCD	
  
  while(1)
  {

  CLR_Screen(White);
  Show_Image(80,160,50,130);

  LCD_PutString24(35,140,"欣世纪电子科技",Blue,White); //欢迎界面，24x24大小汉字，字模软件隶书小二号
  delay_ms(500);    
  LCD_PutString24(83,170,"欢",Blue,White);
  delay_ms(300);
  LCD_PutString24(107,170,"迎",Blue,White);
  delay_ms(300);
  LCD_PutString24(131,170,"您",Blue,White);
  delay_ms(300);
  LCD_PutString(69,300,"www.avrgcc.com",Blue,White);    //字符显示官方网站
  delay_ms(500);
   
  CLR_Screen(White);									//清背景色

  for(i=0;i<4;i++)										//显示12个甲壳虫图标，每个80x80
   {
  	for(j=0;j<3;j++)
		{
			Show_Image(j*80,j*80+80,i*80,i*80+80);
		}
   }

  CLR_Screen(White);									//清背景色

  for(j=0;j<3;j++)            							//图形移动显示
  {
    Image_Move(0,80,0,80,15,15,White);					//每次移动15个像素，单方向移动
  }
   
  }  
}
