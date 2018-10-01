
/*===================================================================================================  
工程名称：  Ex1
功能描述：  控制TFT实现汉字，字符显示，和画点功能。
硬件连接：  查看和修改接口定义在NBCTFT.C中,请仔细检查接口连线。
      ----------------------------------------
     |     --------TFT控制接线----------      |
     |	                                      |
     |	    D10~D17   接   RB0~RB7            |
     |      RS        接   RD5	              |
     |		RW   	  接   RD4                |
     |		RD        接   RD3                |
     |		CS        接   RD2	   		      |
     |		RES       接   RD1                |
     |	                                      |
     |		LE        接   RD0                |
     |                                        |
     |     --------电源供电接线---------      |
     |	    GND       接   电源负极           |
     |	    VIN       接   电源正极(5V)       |
     |----------------------------------------|
     | 如果在NBC开发板上使用，以上线不需用飞  |
     | 线连接，直接插接在开发板上的12864接口  |
      ----------------------------------------
维护记录：  2012-3-30
====================================================================================================*/

//******************包含头文件***************************

#include <pic.h> //头文件在HI-TECH安装目录下\HI-TECH Software\PICC\std\9.60\include
#include"NBCTFT.h"   //包含TFT驱动头文件

//******************全局变量***************************

#define White          0xFFFF   //LCD color
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

unsigned int Device_code;      //TFT控制IC型号

unsigned char tab[]={"北方蓝芯科技开发有限公司"};         
bank1 unsigned char tab1[]={"   蓝芯科技  与您同行"};       
bank1 unsigned char tab2[]={"0123456789"};       
bank1 unsigned char tab3[]={")(`,./<>';:[]{}|?-=+*&^%$"};

//**************声明外部函数和变量********************

extern void delayms(unsigned int count);


//***********************************************************************************
//IO初始化操作
//***********************************************************************************
void IO_init(void)
{
	TRISD=0x00;       //RD设置为输出
	PORTD=0xff;       //初始化为高
	
	TRISB=0x00;       //RB设置为输出
	PORTB=0xff;       //初始化为高
}

//================================================================================================
//	函数名称：	主函数
//	实现功能：	控制TFT实现汉字，字符显示.
//	参数：		无
//	返回值：	无
//================================================================================================
main()
{
  unsigned int i;
    
  __CONFIG(XT&WDTDIS&LVPDIS);//配置，设置为晶振XT方式振荡，禁看门狗，禁低电压编程
  IO_init();                 //IO初始化 
  Device_code=0x9320;        //TFT控制IC型号 
  TFT_Initial();             //初始化LCD	 

  while(1)                   //循环
      {
	   //5种颜色将屏分为5个区域
	   Show_RGB(0,240,0,64,Blue);
	   Show_RGB(0,240,64,128,Green);
	   Show_RGB(0,240,128,192,Magenta);
	   Show_RGB(0,240,192,256,Red);
	   Show_RGB(0,240,256,320,Yellow);

       //第1个区域显示16x16汉字
	   LCD_PutString(24,16,tab,White,Blue);
       LCD_PutString(24,40,tab1,White,Blue);
       
       //第2个区域显示ascii字符中的数字和符号
	   LCD_PutString(80,72,tab2,Black,Green);
	   LCD_PutString(16,96,tab3,Black,Green);

	   //第5个区域打点实现画线
       for(i=312;i>264;i--){ Put_pixel(68,i,Blue);}
	   for(i=68;i<172;i++) { Put_pixel(i,264,Blue);}
       for(i=264;i<312;i++){ Put_pixel(172,i,Blue);} 
	   for(i=172;i>68;i--) { Put_pixel(i,312,Blue);}

	   delayms(10000);  //显示一段时间
	   CLR_Screen(Red); //用背景色清屏
	  }
  }



