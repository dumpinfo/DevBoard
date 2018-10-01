//DMAVR-128的基于TFT彩屏液晶测试程序，用来显示字符汉字和图片
//相关外部头文件：main.h tft.h GB2312.h ascii8x16.h 使用前请将相关头文件加入编译器安装路径下的avr文件夹
//图片数据文件picture-xin.c mmp.c ，存储在Flash中
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <iom128v.h>
#include <TFT_main.h>

     
//***********************************************************************
//         调用显示字符和汉字示例
//***********************************************************************
void DisplayData()
 {
    DisplayChar(2+'0',0,4,0x0eee);
	DisplayChar(0+'0',1,4,0x0eee);
	DisplayChar(1+'0',2,4,0x0eee);
	DisplayChar(0+'0',3,4,0x0eee);
    
	DisplayChar('/',4,4,0x0eee);  					// "/"符号

	DisplayChar(0+'0',5,4,0x0eee);
	DisplayChar(1+'0',6,4,0x0eee);
	DisplayChar('/',7,4,0x0eee);  					// "/"符号


	DisplayChar(2+'0',8,4,0x0eee);
	DisplayChar(9+'0',9,4,0x0eee);
    
	DisplayGB2312(6,5,4,0xa000);   					//星
	DisplayGB2312(7,6,4,0xa000);   					//期
	DisplayGB2312(5+7,7,4,0xa000);  			 	//星期几
 }



//***********************************************************************
//         主函数
//***********************************************************************

void main(void)
{
  uchar i;
  //delay_ms(100);
  McuInit();                                         //单片机初始化
  LCD_RD1; 
  LCD_Init();
  LCD_clear(0);
	
  while(1)
    {
		DisplayString("DMAVR-128 Board",0,1,0xeee);  //字符串显示调用
		DisplayString("TFT Testing",2,2,0xeee);		 //字符串显示调用
		DisplayData();								 //字符汉字调用
		delay_nms(1000);								 //延时
		delay_nms(1000);
		delay_nms(1000);
		delay_nms(1000);
		LCD_ph();									 //大屏显示图片128X160
		delay_nms(1000);
		delay_nms(1000);
	    LCD_MM();									 //小屏显示图片96X64
		delay_nms(1000);
		delay_nms(1000);
		LCD_test();									 //显示彩条和纯色
		LCD_clear(0);								 //清屏

		
    }
}


