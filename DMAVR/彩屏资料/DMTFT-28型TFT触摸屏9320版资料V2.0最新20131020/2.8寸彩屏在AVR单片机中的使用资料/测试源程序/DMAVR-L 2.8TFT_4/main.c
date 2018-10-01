/********************************************************************
//DMAVR-L型最小系统板控制2.8寸TFT彩屏显示SD卡中BMP图片测试程序
//可以同步移植到DMAVR-128开发板，更换对应的硬件接口配置
//直接将TFT显示接口插入12864接口，液晶接口第16脚NC,需要飞线至PE3
//支持FAT/FAT32文件系统，图片支持32位、24位BMP图片，图片大小320x240
//图片可以由Image2LCD软件去转换，也可以用PS做图保存为BMP图片
//注意选择液晶的电源，位于电位器附近，可选5V或3.3V，根据液晶电压进行选择，默认设置为5V
//调试环境：AVR Studio 4.17 + WinAVR 优化度-0S
//作者：www.avrgcc.com
//时间：2013.03.09
********************************************************************/
#include <stdio.h>
#include <math.h>
#include "rprintf.h"
#include <avr/io.h>
#include <avr/iom128.h>
#define	 F_CPU	7372800					//单片机主频为7.3728MHz,用于延时子程序，建议更换为16M晶振，速度更快
#include <util/delay.h>
#include  <avr/pgmspace.h>  			//须增加的头文件，用来将数据存放在flash中
#include "Config.h"                     //配置头文件，与硬件相关的配置在这里更改
#include "spi.h"						//SPI头文件	
#include "spi.c"						//SPI配置函数文件
#include "mmc.h"						//SD卡头文件
#include "mmc.c"						//SD卡操作相关函数
#include "fat.h"						//文件系统头文件
#include "fat.c"						//文件系统操作函数
#include "Ascii_8x16.h"                 //8x16大小字符
#include "GB2424.h"                     //24x24像素大小的汉字
#include "Chinese.h"                    //16x16像素大小的汉字
#include "Touch.h"                      //TFT触摸操作头文件
#include "Touch.c"                      //TFT触摸操作初始化及函数
#include "TFT28.h"                      //TFT头文件
#include "TFT28.c"                      //TFT操作初始化及函数

//**************声明外部函数和变量*******************************
uint Device_code;               		//TFT控制IC型号，2.8寸为ILI9328
extern void delayms(unsigned int count);

int i;
uint image_count = 0 ,image_all = 0 ;

//***********************************************************************
//	显示图片函数，每张图片轮流显示，文件位于根目录下，24位色或32位色
//***********************************************************************
void disp_image(void)
  {
    WORD count= 1 ,i =0   ;
	uchar *buffer ;
	uchar type ,x , rgb,first ,color_byte,byte1,byte2,byte3 ;
	uint y ,color,tmp_color ;
    ulong p;												//簇指示值			
	type = 1 ;	
	struct FileInfoStruct FileInfo;							//文件信息

    struct direntry BMPInfo;								//要显示的BMP文件信息		
	
	
	
	if( image_all == 0 )    								//读取总图片数
	  {
         image_count =  0 ;
	     byte1 = Search(&BMPInfo,&image_count,&type) ;
		 image_all = image_count ;
 		 LCD_PutChar(66,80,image_all/10+'0',Red,Black);  	//BMP图片数量显示
		 LCD_PutChar(74,80,image_all%10+'0',Red,Black);  	//BMP图片数量显示
		 LCD_PutString(82,80,"        ",Black,Black);  		//BMP图片数量，最大显示99张，可以更改算法
		 delay_ms(1000);
		 image_count = 1 ;
		 		 
	  }
	else  
      {		
          byte1 = Search(&BMPInfo,&image_count,&type) ;
      }	
	 
	 
	 
	p = BMPInfo.deStartCluster+(((ulong)BMPInfo.deHighClust)<<16);//读文件首簇
	
	x = 0 ;
	y = 319 ;
	rgb = 0 ;
	count = 0 ;
	first = 0 ;
	buffer=malloc(512);	
	while(1)
	 {
		i = 0 ;
	
	    for( ; i < SectorsPerClust ; i++ )      //簇
	     {
	 
	        FAT_LoadPartCluster(p,i,buffer);	//读一个扇区	
	   
	        if(i==0 && first==0) { count= buffer[0x0a] ; color_byte = buffer[0x1c] / 8  ;  first = 1 ; } 
	        else { count=0 ; }
	   
	        
			
			while(count<512)  					//读取一簇512扇区 (SectorsPerClust 每簇扇区数)
	          {
		   
		        if(color_byte == 3)   			//24位颜色图
		          {
                      switch ( rgb ) 
                        {
			               case 0 : tmp_color = buffer[count]>>3 ;
			                        color |= tmp_color;
					                break ;
					  
			               case 1 : tmp_color = buffer[count]>>2 ;
			                        tmp_color <<= 5 ;
			                        color |= tmp_color ;
					                break ;
					   
       			           case 2 : tmp_color = buffer[count]>>3 ;
			                        tmp_color <<= 11 ;
			                        color |= tmp_color ;
					                 break ;			
			            }
			
                      rgb ++ ;
			      }
		        else
		          {
			          if(color_byte==2)  //16位颜色图
				        {
				          switch ( rgb )
					        {
					          case 0 : byte1 = buffer[count] ;
								       break ; 
								   
						      case 1 :    
								       color = buffer[count] ;
								       color<<=8 ;
								       color |= byte1 ;
								       break ;
					     
					        }
					      rgb ++ ;
				    
				        }
				      else 
				        {
				          if(color_byte==4) //32位颜色图
				            {
				              switch ( rgb )
					            {
					              case 0 :  byte1 = buffer[count] ;
								            break ; 
								   
						          case 1 :  byte2 = buffer[count] ;
                                            break ;
									   
							      case 2 :  byte3 = buffer[count] ;
							                break ;
									   
							      case 3 :  tmp_color = byte1 >> 3 ;
			                                color |= tmp_color;
									        tmp_color = byte2 >>2 ;
			                                tmp_color <<= 5 ;
			                                color |= tmp_color ;
									        tmp_color = byte3 >>3 ;
			                                tmp_color <<= 11 ;
			                                color |= tmp_color ;
									        break ;
					     
					            }
					           rgb ++ ;
				    
				            }
				     
				        }   
			 
			       }
           
		   count ++ ;
		   
		   if(rgb == color_byte)        //读取1像素数数据后显示
		     {
			    Put_pixel(x, y,color) ;
				color = 0x00 ;
			    x++ ;
			    if(x>=240)
				  {
				    y-- ;
					
					if( y<0 )
		              {
					    
						free(buffer) ;
			            return ;
			          }
					x = 0 ;
				  }
		        
				rgb = 0 ;
			 }
			 
			
		}
	   
	 }  // 读取完一簇数据
	 
	 free(buffer) ;
	 p=FAT_NextCluster(p);//读下一簇数据			
	 buffer=malloc(512);	
	
	if(p == 0x0fffffff || p == 0x0ffffff8 || (FAT32_Enable == 0 && p == 0xffff))//如果无后续簇则结束
		{
		        free(buffer) ;
				return ;
		}
	 
  }
		
	free(buffer) ;
  
 }

/********************************************************************
			初始化IO口子程序
********************************************************************/
void Port_Init()
{
	DDRF = 0xFF;
	PORTF = 0x00;

	DDRE = 0xFF;
	PORTE = 0xFF;

	DDRC = 0xFF;
	PORTC = 0x00;

	DDRA = 0xFC;
	PORTA = 0x00;

}

/********************************************************************
	LED闪烁一次，可在需要查看程序执行位置时灵活设置，类似断点
********************************************************************/
void LED_Light()
{
    LED8=0x00;                    //点亮LED
    delay_ms(500);
    LED8=0xFF;                    //熄灭LED
    delay_ms(500);
}

/********************************************************************
                      主函数
********************************************************************/
int main(void)
{
  uchar retry=0;
  uchar ok,er ;

  Port_Init();                       //系统初始化，设置IO口属性
  LED_Light();                       //LED点亮一次，如有现象，说明单片机初始化成功   
  Device_code=0x9320;                //TFT控制IC型号
  TFT_Initial();                     //初始化LCD	
      
  CLR_Screen(Magenta);               //用背景色清屏
  LCD_PutString24(60,140,"欣世纪电子",Yellow,Magenta); //欢迎界面，24x24大小汉字，字模软件隶书小二号
  delay_ms(500);    
  LCD_PutString24(83,170,"欢",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(107,170,"迎",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(131,170,"您",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString(69,300,"www.avrgcc.com",White,Magenta);   	//字符显示官方网站
  delay_ms(300);
  
  CLR_Screen(Black);                                       	//清屏				

  ok = 0 ;
  er = 0 ;
  LCD_PutString(0,0,"Starting Init SD",White,Black);  		//字符串显示调用
  LCD_PutString(0,16,"Waiting...",White,Black);  			//字符串显示调用
  mmcInit();
  delay_ms(1);

 while(mmcReset())											//初始化SD卡					
	{
		retry++;
		if(retry>20)
		{
			while(1)   													//初始化失败显示
			{
				LCD_PutString(0,32,"Init Failure",White,Black);  		//字符串显示调用
	            LCD_PutString(0,48,"Please Check SD",White,Black);  	//字符串显示调用
			}
		}
	} 
	  	  
	LCD_PutString(0,32,"Init SD Success!",White,Black);  				//字符串显示调用
	 
	
	if(FAT_Init())														//初始化文件系统 支持FAT16和FAT32	
	{
		while(1)
		{
			while(1)
			{
				LCD_PutString(0,48,"Init FAT Failure",White,Black);  	//字符串显示调用
			}
		}

	}
	SearchInit();  														//搜索文件初始化

	
  while(1)                               								//轮流显示SD卡中的图片
	 {
	    disp_image() ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		                              			
		if(image_count<image_all)										//轮流显示SD卡中的BMP图片
		    {
		      image_count ++ ;
		    }
		 else 
		    {
			  image_count = 1 ;
			} 
		
		
	 }

    
}
