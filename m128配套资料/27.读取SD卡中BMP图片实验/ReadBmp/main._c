//DMAVR-M128读取SD卡中BMP图片实验，基于FAT16/32文件系统
//SD卡中图片文件为BMP形式，用Img2LCD将JPG图片转换为24位BMP图形式即可
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <BMP_main.h>

int i;
WORD image_count = 0 ,image_all = 0 ;

extern u16 SectorsPerClust;//每簇扇区数

extern u08  FAT32_Enable;
 extern char _bss_end;

//***********************************************************************
//			显示图片函数，每张图片轮流显示，文件位于根目录下，24位色
//***********************************************************************
void disp_image(void)
  {
    WORD count= 1 ,i =0   ;
	u08 *buffer ;
	u08 type ,x , rgb,first ,color_byte,byte1,byte2,byte3 ;
	u16 y ,color,tmp_color ;
    u32 p;							//簇指示值		
	struct FileInfoStruct FileInfo;	//文件信息	
	struct direntry BMPInfo;		//要显示的BMP文件信息	
	type = 1 ;
	
	
	
	
	if( image_all == 0 )    		//读取总图片数
	  {
         image_count =  0 ;
	     byte1 = Search(&BMPInfo,&image_count,&type) ;
		 image_all = image_count ;
 		 DisplayChar(image_all/10+'0',8,9,0xffff);  //BMP图片数量显示
		 DisplayChar(image_all%10+'0',9,9,0xffff);  //BMP图片数量显示
		 DisplayString("       ",10,9,0xffff);  	//BMP图片数量，最大显示99张，可以更改算法
		 delay_nms(1000);
		 image_count = 1 ;
		 		 
	  }
	else  
      {		
          byte1 = Search(&BMPInfo,&image_count,&type) ;
      }	
	 
	 
	 
	p = BMPInfo.deStartCluster+(((u32)BMPInfo.deHighClust)<<16);//读文件首簇
	
	x = 0 ;
	y = 159 ;
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
	   
	        
			
			while(count<512)  //读取一簇512扇区 (SectorsPerClust 每簇扇区数)
	          {
		   
		        if(color_byte == 3)   //24位颜色图
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
			    GUIpoint(x, y,color) ;
				color = 0x00 ;
			    x++ ;
			    if(x>=128)
				  {
				    y-- ;
					
					if( (y+1)<=0 )
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
//***********************************************************************
//			关闭数码管，防止显示乱码
//***********************************************************************
void LED_Off()
{
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             				//关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      				//关数码管            
    W_LE0; 
}
//***********************************************************************
//			主函数，初始化及函数调用
//***********************************************************************
void main(void)
{
  unsigned char i, x,retry=0;
  u08 ok,er ;
  unsigned int y ;
  delay_nms(10);
  McuInit();
  UART_Init();
  LCD_RD1; 
  LCD_Init();     									//LCD初始化
  x = 1 ;
  y = 0 ;
  LCD_clear(0) ;
  	
  for(i=0; i<5 ;i++)
   {
	DisplayGB2312(i+18,i+1,0,0x07E0) ;    			//显示欣世纪电子
   }
	DisplayString("DMAVR-128 Board",0,1,0xf800);  	//字符串显示调用
	DisplayString("Show BMP from SD",0,2,0xeee);  	//字符串显示调用
	GUIline(0,49,127,49,0xe387);
	GUIline(0,51,127,51,0xfef);
		
 	ok = 0 ;
 	er = 0 ;
	DisplayString("Starting Init SD",0,4,0xffff);  //字符串显示调用
	DisplayString("Waiting...",0,5,0xffff);  		//字符串显示调用
  	mmcInit();
  	delay_nms(1);
  
	  
  while(mmcReset())									//初始化SD卡					
	{
		retry++;
		if(retry>20)
		{
			while(1)   											//初始化失败显示
			{
				DisplayString("Init Failure",0,7,0xf800);  		//字符串显示调用
	            DisplayString("Please Check SD",0,8,0xf800);  	//字符串显示调用
			}
		}
	} 
	  	  
	DisplayString("Init SD Success!",0,6,0xffff);  				//字符串显示调用
	 
	
	if(FAT_Init())												//初始化文件系统 支持FAT16和FAT32	
	{
		while(1)
		{
			while(1)
			{
				DisplayString("Init FAT Failure",0,7,0xf800);  //字符串显示调用
			}
		}

	}
	printf("Begin initing\r\n");
	_NewHeap(&_bss_end+1, &_bss_end + 550);                     //动态分配内存(malloc(512))需要初始化，空间比需要分配的要大才行
	SearchInit();  												//搜索文件初始化

	
	while(1)                               						//轮流显示SD卡中的图片
	 {
	    disp_image() ;
		delay_nms(1000) ;
		delay_nms(1000) ;
		delay_nms(1000) ;
		                              			
		if(image_count<image_all)								//轮流显示SD卡中的BMP图片
		    {
		      image_count ++ ;
		    }
		 else 
		    {
			  image_count = 1 ;
			} 
		
		
	 }

}

