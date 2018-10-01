/********************************************************************
//DMAVR-L����Сϵͳ�����2.8��TFT������ʾSD����BMPͼƬ���Գ���
//����ͬ����ֲ��DMAVR-128�����壬������Ӧ��Ӳ���ӿ�����
//ֱ�ӽ�TFT��ʾ�ӿڲ���12864�ӿڣ�Һ���ӿڵ�16��NC,��Ҫ������PE3
//֧��FAT/FAT32�ļ�ϵͳ��ͼƬ֧��32λ��24λBMPͼƬ��ͼƬ��С320x240
//ͼƬ������Image2LCD���ȥת����Ҳ������PS��ͼ����ΪBMPͼƬ
//ע��ѡ��Һ���ĵ�Դ��λ�ڵ�λ����������ѡ5V��3.3V������Һ����ѹ����ѡ��Ĭ������Ϊ5V
//���Ի�����AVR Studio 4.17 + WinAVR �Ż���-0S
//���ߣ�www.avrgcc.com
//ʱ�䣺2013.03.09
********************************************************************/
#include <stdio.h>
#include <math.h>
#include "rprintf.h"
#include <avr/io.h>
#include <avr/iom128.h>
#define	 F_CPU	7372800					//��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��򣬽������Ϊ16M�����ٶȸ���
#include <util/delay.h>
#include  <avr/pgmspace.h>  			//�����ӵ�ͷ�ļ������������ݴ����flash��
#include "Config.h"                     //����ͷ�ļ�����Ӳ����ص��������������
#include "spi.h"						//SPIͷ�ļ�	
#include "spi.c"						//SPI���ú����ļ�
#include "mmc.h"						//SD��ͷ�ļ�
#include "mmc.c"						//SD��������غ���
#include "fat.h"						//�ļ�ϵͳͷ�ļ�
#include "fat.c"						//�ļ�ϵͳ��������
#include "Ascii_8x16.h"                 //8x16��С�ַ�
#include "GB2424.h"                     //24x24���ش�С�ĺ���
#include "Chinese.h"                    //16x16���ش�С�ĺ���
#include "Touch.h"                      //TFT��������ͷ�ļ�
#include "Touch.c"                      //TFT����������ʼ��������
#include "TFT28.h"                      //TFTͷ�ļ�
#include "TFT28.c"                      //TFT������ʼ��������

//**************�����ⲿ�����ͱ���*******************************
uint Device_code;               		//TFT����IC�ͺţ�2.8��ΪILI9328
extern void delayms(unsigned int count);

int i;
uint image_count = 0 ,image_all = 0 ;

//***********************************************************************
//	��ʾͼƬ������ÿ��ͼƬ������ʾ���ļ�λ�ڸ�Ŀ¼�£�24λɫ��32λɫ
//***********************************************************************
void disp_image(void)
  {
    WORD count= 1 ,i =0   ;
	uchar *buffer ;
	uchar type ,x , rgb,first ,color_byte,byte1,byte2,byte3 ;
	uint y ,color,tmp_color ;
    ulong p;												//��ָʾֵ			
	type = 1 ;	
	struct FileInfoStruct FileInfo;							//�ļ���Ϣ

    struct direntry BMPInfo;								//Ҫ��ʾ��BMP�ļ���Ϣ		
	
	
	
	if( image_all == 0 )    								//��ȡ��ͼƬ��
	  {
         image_count =  0 ;
	     byte1 = Search(&BMPInfo,&image_count,&type) ;
		 image_all = image_count ;
 		 LCD_PutChar(66,80,image_all/10+'0',Red,Black);  	//BMPͼƬ������ʾ
		 LCD_PutChar(74,80,image_all%10+'0',Red,Black);  	//BMPͼƬ������ʾ
		 LCD_PutString(82,80,"        ",Black,Black);  		//BMPͼƬ�����������ʾ99�ţ����Ը����㷨
		 delay_ms(1000);
		 image_count = 1 ;
		 		 
	  }
	else  
      {		
          byte1 = Search(&BMPInfo,&image_count,&type) ;
      }	
	 
	 
	 
	p = BMPInfo.deStartCluster+(((ulong)BMPInfo.deHighClust)<<16);//���ļ��״�
	
	x = 0 ;
	y = 319 ;
	rgb = 0 ;
	count = 0 ;
	first = 0 ;
	buffer=malloc(512);	
	while(1)
	 {
		i = 0 ;
	
	    for( ; i < SectorsPerClust ; i++ )      //��
	     {
	 
	        FAT_LoadPartCluster(p,i,buffer);	//��һ������	
	   
	        if(i==0 && first==0) { count= buffer[0x0a] ; color_byte = buffer[0x1c] / 8  ;  first = 1 ; } 
	        else { count=0 ; }
	   
	        
			
			while(count<512)  					//��ȡһ��512���� (SectorsPerClust ÿ��������)
	          {
		   
		        if(color_byte == 3)   			//24λ��ɫͼ
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
			          if(color_byte==2)  //16λ��ɫͼ
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
				          if(color_byte==4) //32λ��ɫͼ
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
		   
		   if(rgb == color_byte)        //��ȡ1���������ݺ���ʾ
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
	   
	 }  // ��ȡ��һ������
	 
	 free(buffer) ;
	 p=FAT_NextCluster(p);//����һ������			
	 buffer=malloc(512);	
	
	if(p == 0x0fffffff || p == 0x0ffffff8 || (FAT32_Enable == 0 && p == 0xffff))//����޺����������
		{
		        free(buffer) ;
				return ;
		}
	 
  }
		
	free(buffer) ;
  
 }

/********************************************************************
			��ʼ��IO���ӳ���
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
	LED��˸һ�Σ�������Ҫ�鿴����ִ��λ��ʱ������ã����ƶϵ�
********************************************************************/
void LED_Light()
{
    LED8=0x00;                    //����LED
    delay_ms(500);
    LED8=0xFF;                    //Ϩ��LED
    delay_ms(500);
}

/********************************************************************
                      ������
********************************************************************/
int main(void)
{
  uchar retry=0;
  uchar ok,er ;

  Port_Init();                       //ϵͳ��ʼ��������IO������
  LED_Light();                       //LED����һ�Σ���������˵����Ƭ����ʼ���ɹ�   
  Device_code=0x9320;                //TFT����IC�ͺ�
  TFT_Initial();                     //��ʼ��LCD	
      
  CLR_Screen(Magenta);               //�ñ���ɫ����
  LCD_PutString24(60,140,"�����͵���",Yellow,Magenta); //��ӭ���棬24x24��С���֣���ģ�������С����
  delay_ms(500);    
  LCD_PutString24(83,170,"��",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(107,170,"ӭ",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString24(131,170,"��",Yellow,Magenta);
  delay_ms(300);
  LCD_PutString(69,300,"www.avrgcc.com",White,Magenta);   	//�ַ���ʾ�ٷ���վ
  delay_ms(300);
  
  CLR_Screen(Black);                                       	//����				

  ok = 0 ;
  er = 0 ;
  LCD_PutString(0,0,"Starting Init SD",White,Black);  		//�ַ�����ʾ����
  LCD_PutString(0,16,"Waiting...",White,Black);  			//�ַ�����ʾ����
  mmcInit();
  delay_ms(1);

 while(mmcReset())											//��ʼ��SD��					
	{
		retry++;
		if(retry>20)
		{
			while(1)   													//��ʼ��ʧ����ʾ
			{
				LCD_PutString(0,32,"Init Failure",White,Black);  		//�ַ�����ʾ����
	            LCD_PutString(0,48,"Please Check SD",White,Black);  	//�ַ�����ʾ����
			}
		}
	} 
	  	  
	LCD_PutString(0,32,"Init SD Success!",White,Black);  				//�ַ�����ʾ����
	 
	
	if(FAT_Init())														//��ʼ���ļ�ϵͳ ֧��FAT16��FAT32	
	{
		while(1)
		{
			while(1)
			{
				LCD_PutString(0,48,"Init FAT Failure",White,Black);  	//�ַ�����ʾ����
			}
		}

	}
	SearchInit();  														//�����ļ���ʼ��

	
  while(1)                               								//������ʾSD���е�ͼƬ
	 {
	    disp_image() ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		delay_ms(1000) ;
		                              			
		if(image_count<image_all)										//������ʾSD���е�BMPͼƬ
		    {
		      image_count ++ ;
		    }
		 else 
		    {
			  image_count = 1 ;
			} 
		
		
	 }

    
}
