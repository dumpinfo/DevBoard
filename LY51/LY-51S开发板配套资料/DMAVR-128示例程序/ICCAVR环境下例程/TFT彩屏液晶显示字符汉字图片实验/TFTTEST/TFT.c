//TFT液晶读写相关函数及初始化函数等
//相关头文件 TFT.h


#include  <TFTtest.h>
//#include  <delay.h>

uint color[]={0xf800,0x07e0,0x001f,0xffe0,0x0000,0xffff,0x07ff,0xf81f}; //八种颜色代码
unsigned char RamVar_1[512];            				//定义无符号整型变量(Ram变量)

//***********************************************************************
//	  IO口初始化
//***********************************************************************

void McuInit()
{
	LCD_Data=0xFF;                     //各相关IO口初始化
	DDR_Data=0xFF;

	PORTF=0xFF;
	DDRF=0xFF;

	PORTG=0x0F;                        
	DDRG=0x0F;

	PORTD=0xFF;
	DDRD=0xFF;
  	
	D_LE1;                             //关掉数码管，以免显示乱码，因为共用PA口                   
    W_LE1;                     
    LCD_Data=0xFF;                      //关所有数码管            
    W_LE0; 

    PORTB=0xFF;
	DDRB=0xFF;

	LCD_BL0;
}


//***********************************************************************
//	   写寻址寄存器地址，厂家规定0x22
//***********************************************************************

void LCD_WR_REG(uchar index)           
{
	LCD_RS0;                            //根据控制器datasheet，RS为0时，为写寄存器地址
	LCD_EC0;
	LCD_Data = 0x00;
	LCD_WR0;
	LCD_WR1;
	LCD_Data = index;
	LCD_WR0;
	LCD_WR1;
	LCD_EC1;
	LCD_RS0;
}

//***********************************************************************
//	   读数据，从GRAM中读取，第一个字节无效，从第二个字节开始读取
//***********************************************************************

unsigned int LCD_RD_REG16(uchar index)
{
	unsigned int pd;

	LCD_RS0;
	LCD_EC0;
	
	delay_3us();
	
	LCD_Data = 0x00;
	delay_3us();

	LCD_WR0;
	delay_3us();

	LCD_WR1;
	delay_3us();

	LCD_Data = index;
	delay_3us();

	LCD_WR0;
	delay_3us();

	LCD_WR1;
	delay_3us();

	LCD_RS1;
	delay_3us();

	LCD_Data = 0xFF;
	delay_3us();

	LCD_RD0;
	delay_3us();

    //DDR_IN;  //数据输入
	delay_3us();

	LCD_RD1;
	pd = LCD_Data;
	delay_3us();

	LCD_Data = 0xFF;
	LCD_RD0;
	delay_3us();

	LCD_RD1;
	pd = pd + LCD_Data*256;
	LCD_EC1;
	LCD_RS0;
	return pd;
}

//***********************************************************************
//	   写控制命令，index为寄存器地址，val为控制命令，16位长度
//***********************************************************************

void LCD_WR_CMD(uchar index,uint val)
{
	LCD_RS0;
	LCD_EC0;
	LCD_Data = 0x00;
	LCD_WR0;
	LCD_WR1;
	LCD_Data = index;
	LCD_WR0;
	LCD_WR1;
	LCD_EC1;
	LCD_RS0;

	LCD_RS1;                             //根据控制器datasheet，RS为1时，为写控制命令或者数据到GRAM
	LCD_EC0;
	LCD_Data = (uchar)(val>>8);
	LCD_WR0;
	LCD_WR1;
	LCD_EC1;
	LCD_RS0;
	LCD_RS1;
	LCD_EC0;
	LCD_Data = (uchar)val;
	LCD_WR0;
	LCD_WR1;
	LCD_EC1;
	LCD_RS0;
}

//***********************************************************************
//	   向GRAM存储器写数据，用来显示，定义为16位指针调用
//***********************************************************************

void LCD_WR_Data(uint val)
{

	LCD_Data = (uchar)(val>>8);
	LCD_WR0;
	LCD_WR1;
	//LCD_RS1;
	LCD_Data = (uchar)val;
	LCD_WR0;
	LCD_WR1;

}

//***********************************************************************
//	   向GRAM存储器写数据，用来显示，定义为8位指针调用
//***********************************************************************
void LCD_WR_DataP(uint val)
{

	LCD_Data = (uchar)val;
	LCD_WR0;
	LCD_WR1;
}

void LCD_Init()
{
	LCD_RST0;                      //复位有效，至少2ms
	delay_nms(2);
	LCD_RST1;                      //复位结束
	delay_nms(2);

    LCD_WR_CMD(0x00,0x0001);		//启动晶振，必须有至少10ms的延时，保证稳定
    delay_nms(10);
    LCD_WR_CMD(0x03,0x0030);        //设置数据扫描方向，由左至右，水平扫描
    //LCD_WR_CMD(0x03,0x0230);      //HWM=1为高速数据模式
    LCD_WR_CMD(0x01,0x011D);
    //delay_us(1000);
    LCD_WR_CMD(0x0a,0x0106); 
    //delay_us(1000);
    LCD_WR_CMD(0x07,0x0037);        //非8位模式,开显示

    LCD_WR_CMD(0x08,0x0707);        //光栅周期数为7，若为0，则无显示，是为了保证足够的时间让光栅回到行左边
    LCD_WR_CMD(0x0c,0x01);
    LCD_WR_CMD(0x02,0x0400);        //驱动波形控制指令
    //delay_us(1000);
    LCD_WR_CMD(0x0a,0x0107);        //门驱动和电源控制IC指令，后面要紧跟需要的指令
 //   delay_us(1000);

    LCD_WR_CMD(0x12,0x0001);        //VciOUT = 3V × 0.83 = 2.49V
    // only 100(=VCI), 000(.92 VCI),001(.83),010(.73VCI) is valid. other is inhibited
  //  delay_us(1000);
    LCD_WR_CMD(0x0a,0x0101); 
   // delay_us(1000);
   
   // LCD_WR_CMD(0x13,0x404);
   // delay_us(1);LCD_WR_CMD(0x0a,0x0101); delay_us(1);

    LCD_WR_CMD(0x11,0x0505);   //CAD=0
   // delay_us(1);LCD_WR_CMD(0x0a,0x0101); delay_us(1);



    LCD_WR_CMD(0x14,0x2c0f); // last 4 bit must be 1!!! vcomg = 1, 
    // VDV4-0 == 09-0e,10-12 // other is inhibited.!!! 
    delay_3us();
    LCD_WR_CMD(0x0a,0x0102); 
   // delay_us(1);

    LCD_WR_CMD(0x10,0x1a10);// if Vci > 3.0V, use 0x1a10.
    delay_3us();
    LCD_WR_CMD(0x0a,0x0100); 
  //  delay_us(1);

    LCD_WR_CMD(0x13,0x0616); //////////!!!!!!!!!!!!! VERY IMPORTANT!!!
    //set VRH3-0 to fit REG1out= 3 to DDVDH-0.5
    delay_3us();
    LCD_WR_CMD(0x0a,0x0101); 
  //  delay_nms(1);

    LCD_WR_CMD(0x30,0x0003);
    LCD_WR_CMD(0x31,0x0404);
    LCD_WR_CMD(0x32,0x0303);
    LCD_WR_CMD(0x33,0x0406);
    LCD_WR_CMD(0x34,0x0404);
    LCD_WR_CMD(0x35,0x0303);
    LCD_WR_CMD(0x36,0x0407);
    LCD_WR_CMD(0x37,0x0604);
    
    delay_3us();
  //  LCD_WR_CMD(0x0a,0x0100);
   // delay_nms(1); 
    
    //*********** SAP, AP set****************	
    LCD_WR_CMD(0x10,0x1a10);//BT2-0 Ok,and...
    delay_3us();
    LCD_WR_CMD(0x0a,0x0100); 
  //  delay_us(100);	
	//*********** PON  set********************
	LCD_WR_CMD(0x13,0x0616); //////////
    
 //   delay_us(1);
  //  LCD_WR_CMD(0x0a,0x0101); 
   // delay_us(100);
    
    //***********Display ON set*****************
 //   LCD_WR_CMD(0x07,0x0037);
  //  delay_us(1);
  //  LCD_WR_CMD(0x0a,0x0100); 
   // delay_us(100); 
     
}


//***********************************************************************
//	   TFT显示测试子程序，彩条，单色显示等
//***********************************************************************

void LCD_test()
{
	uint temp,num;
	uchar n;

	LCD_WR_CMD(0x44,127*256+0);               //显示区域水平起始和结束地址
	LCD_WR_CMD(0x45,239*256+80);              //显示区域垂直起始和结束地址
	LCD_WR_CMD(0x21,80*256+0);	              //RAM地址设置，即AC初始化设置,大屏是0x5000
	LCD_WR_REG(0x22);                         //写或读数据到GRAM，这里是写数据
	LCD_EC0;
	LCD_RS1;
	for(n=0;n<8;n++)						  //八个彩条，128X20大小
	{
	    temp=color[n];
		for(num=20*128;num>0;num--)
		  LCD_WR_Data(temp);
	}
	LCD_EC1;
	delay_nms(200);
	
	
	LCD_WR_CMD(0x44,95*256+0); 					//小屏显示区域水平起始和结束地址
	LCD_WR_CMD(0x45,79*256+16);					//小屏显示区域垂直起始和结束地址
	LCD_WR_CMD(0x21,16*256+0);					//RAM地址设置，即AC初始化设置,大屏是0x5000
	LCD_WR_REG(0x22);							//写或读数据到GRAM，这里是写数据
	LCD_EC0;
	LCD_RS1;
	for(n=0;n<8;n++)							//八个彩条
	{
	    temp=color[n];
		for(num=8*96;num>0;num--)               //96X8大小彩带
		{
			LCD_WR_Data(temp);
		}
	}
	LCD_EC1;
	delay_nms(200);

	
	
	for(n=0;n<8;n++)                 			//大屏显示纯色，8种颜色
	{
		LCD_WR_CMD(0x44,127*256+0);
		LCD_WR_CMD(0x45,239*256+80);
		LCD_WR_CMD(0x21,0x5000+127);	
		LCD_WR_REG(0x22);
		LCD_EC0;
		LCD_RS1;
	    temp=color[n];
		for(num=128*160;num>0;num--)
		{
			LCD_WR_Data(temp);
		}
		delay_nms(100);
	}
	LCD_EC1;
	
	

	for(n=0;n<8;n++)                           //小屏显示纯色，8种颜色
	{
		LCD_WR_CMD(0x44,95*256+0);
		LCD_WR_CMD(0x45,79*256+16);
		LCD_WR_CMD(0x21,16*256+0);	
		LCD_WR_REG(0x22);
		LCD_EC0;
		LCD_RS1;
	    temp=color[n];
		for(num=64*96;num>0;num--)
		{
			LCD_WR_Data(temp);
		}
		delay_nms(50);
	}
	LCD_EC1;
}


//***********************************************************************
//	   小屏显示满幅96x64大小图片子程序，头像图片
//***********************************************************************

void LCD_MM()
{
	uint num,count;
	const unsigned char *p; 
	LCD_WR_CMD(0x44,95*256+0);
	LCD_WR_CMD(0x45,79*256+16);
	LCD_WR_CMD(0x21,16*256+0);	
	LCD_WR_REG(0x22);
	LCD_EC0;
	LCD_RS1;
	p = gImage_mmp;
  for(count=0;count<12288;count++)		
   		{			
		  LCD_WR_DataP(*p++);
		}	
	LCD_EC1;
}


//***********************************************************************
//	   显示满幅128X160大小图片子程序，由于数据量大注意数据的存储
//***********************************************************************

void LCD_ph()
{
	uint num,count;
	const unsigned char *p; 

	LCD_WR_CMD(0x44,127*256+0);              //水平显示区域
	LCD_WR_CMD(0x45,239*256+80);			 //垂直显示区域
	LCD_WR_CMD(0x21,80*256);				 //显示RAM起始位置，大屏起始点为0x5000
	LCD_WR_REG(0x22);                     	 //执行写数据到GRAM操作
	LCD_EC0;
	LCD_RS1;
	p = gImage_ph1;
	for(count=0;count<20480;count++)		
   		{					
			LCD_WR_DataP(*p++);
		 }
           
    p = gImage_ph2;	
	for(count=0;count<20480;count++)		
   		{
			
			LCD_WR_DataP(*p++);
		 }
		 
		 	

}


//***********************************************************************
//	   清屏子程序
//***********************************************************************


void LCD_clear(uint p)
{
	uint num;
	
	LCD_WR_CMD(0x44,127*256+0);
	LCD_WR_CMD(0x45,239*256+80);
	LCD_WR_CMD(0x21,80*256+0);	
	LCD_WR_REG(0x22);
	LCD_EC0;
	LCD_RS1;
	for(num=160*128;num>0;num--)
	{
		LCD_WR_Data(p);
	}
	LCD_WR_CMD(0x44,95*256+0);
	LCD_WR_CMD(0x45,79*256+16);
	LCD_WR_CMD(0x21,16*256+0);	
	LCD_WR_REG(0x22);
	LCD_EC0;
	LCD_RS1;
	for(num=64*96;num>0;num--)
	{
		LCD_WR_Data(p);
	}
	LCD_EC1;
}

//***********************************************************************
//	   8X16点阵的字符显示函数
//	   casc:字符对应字模中的位置
//     x:显示位置第几列,每行是128/8 ==16列
//     y:显示位置第几行,整屏是160/16==10行
//     char_color:字体颜色
//***********************************************************************

void DisplayChar(uchar casc,uchar postion_x,uchar postion_y,uint char_color)
{

	uchar i,j,b;
	uchar *p;
	
	LCD_WR_CMD(0x44,(postion_x*8+7)*256+(postion_x*8));	            //x end point
	LCD_WR_CMD(0x45,(postion_y*16+15+80)*256+(postion_y*16+80));	//y end point
	LCD_WR_CMD(0x21,(postion_y*16+80)*256+(postion_x*8));	
	LCD_WR_REG(0x22);
	LCD_EC0;
	LCD_RS1;
	p=ascii;
	p+=casc*16;
	for(j=0;j<16;j++)
	{
		b=*(p+j);
		for(i=0;i<8;i++)
		{
			if(b&0x80)
			{
				LCD_WR_Data(char_color);                //字体颜色
			}
			else
			{
				LCD_WR_Data(0x0000);       				//背景颜色
			}
			b=b<<1;
			
		}	
	}
	LCD_EC1;
}
//***********************************************************************
//        16X16点阵的汉字显示函数，字库可以自己提取
//		  gb:汉字对应字模中的位置
//         x:显示位置第几列
//         y:显示位置第几行
//		  color:字体颜色
//***********************************************************************

void DisplayGB2312(uchar gb,uchar postion_x,uchar postion_y,uint gb_color)
{

	uchar i,j,b;
	uchar *p;
	
	LCD_WR_CMD(0x44,(postion_x*16+15)*256+(postion_x*16));	        //x end point
	LCD_WR_CMD(0x45,(postion_y*16+15+80)*256+(postion_y*16+80));	//y end point
	LCD_WR_CMD(0x21,(postion_y*16+80)*256+(postion_x*16));	
	LCD_WR_REG(0x22);
	LCD_EC0;
	LCD_RS1;
	p=GB2312;
	p+=gb*32;
	for(j=0;j<32;j++)
	{
		b=*(p+j);
		for(i=0;i<8;i++)
		{
			if(b&0x80)
			{
				LCD_WR_Data(gb_color);          //字体颜色
			}
			else
			{
				LCD_WR_Data(0x0000);         //背景颜色
			}
			b=b<<1;
			
		}	
	}
	LCD_EC1;
}

//***********************************************************************
//         英文字符显示函数
//		   s:ASCII码对应字模中的位置
//         x:显示位置第几列
//         y:显示位置第几行
//***********************************************************************

void DisplayString(uchar *s,uchar x,uchar y,uint s_color)                      //英文字符串显示.
{
	while (*s) 
	{ 
		DisplayChar(*s,x,y,s_color);
		if(++x>=16)
		{
			x=0;
			if(++y>=10)
			{
				y=0;
			}
		}
		s++;
    }
}

//***********************************************************************
//          打点绘图背景颜色函数，可先调用,相当于清屏函数
//***********************************************************************

void GUIback(uint back_color)                 //背景函数
  {
  	uint num;
	LCD_WR_CMD(0x44,127*256+0);              //水平显示区域
	LCD_WR_CMD(0x45,239*256+80);			 //垂直显示区域
	LCD_WR_CMD(0x21,80*256);				 //显示RAM起始位置，大屏起始点为0x5000
	LCD_WR_REG(0x22);                     	 //执行写数据到GRAM操作
    LCD_EC0;
	LCD_RS1;
	for(num=160*128;num>0;num--)
	{
		LCD_WR_Data(back_color);
	}
	LCD_EC1;
  }

//***********************************************************************
//         大屏GUI打点函数，（x,y）为坐标
//***********************************************************************

void GUIpoint(uchar x,uchar y,uint point_color)                      //打点函数
{
	
	LCD_WR_CMD(0x44,127*256+0);              //水平显示区域
	LCD_WR_CMD(0x45,239*256+80);			 //垂直显示区域
	LCD_WR_CMD(0x21,(y+80)*256+x);			 //显示RAM起始位置，大屏起始点为0x5000
	LCD_WR_REG(0x22);                     	 //执行写数据到GRAM操作
	LCD_EC0;
	LCD_RS1;
	
	LCD_WR_Data(point_color);               //打点颜色	
	
	LCD_EC1;	
}



//***********************************************************************
//         大屏GUI画线函数，（x0,y0）为起始坐标,（x1,y1）为终点坐标
//		   line_color 线的颜色
//***********************************************************************

void GUIline(uchar x0,uchar y0,uchar x1,uchar y1,uint line_color)   //画线函数
{
  	int temp; 
    int dx,dy;               	//定义起点到终点的横、纵坐标增加值 
    int s1,s2,status,i; 
    int Dx,Dy,sub; 
	
	dx = x1 - x0; 
    if(dx >= 0)                 //X的方向是增加的 
        s1 = 1; 
    else                     	//X的方向是降低的 
        s1 = -1;      
    dy = y1 - y0;                 //判断Y的方向是增加还是降到的 
    if(dy >= 0) 
        s2 = 1; 
    else 
        s2 =- 1; 
   
    Dx = abs(x1-x0);             //计算横、纵标志增加值的绝对值 
    Dy = abs(y1-y0); 
        
    if(Dy > Dx)                               
    {                     		//以45度角为分界线，靠进Y轴是status=1,靠近X轴是status=0  
        temp = Dx; 
        Dx = Dy; 
        Dy = temp; 
    status = 1; 
    }  
    else 
        status = 0; 

/*********Bresenham算法画任意两点间的直线********/  
    sub = Dy + Dy - Dx;                 //第1次判断下个点的位置 
    for(i = 0;i < Dx;i ++) 
    {  
        GUIpoint(x0,y0,line_color);           //画点  
        if(sub >= 0)                                
        {  
            if(status == 1)               //在靠近Y轴区，x值加1 
                x0 += s1;  
            else                     //在靠近X轴区，y值加1                
                y0 += s2;  
            sub -= (Dx + Dx);                 //判断下下个点的位置  
        }  
        if(status == 1) 
            y0 += s2;  
        else        
            x0 += s1;  
        sub += Dy + Dy;  
         
    }  
} 

/**************************************************************************** 
* 名称：GUI_Full(unsigned char x0,unsigned char y0,unsigned char x1,unsigned char y1,unsigned char full_colour) 
* 功能：用绘图的方法填充一个矩形 
* 入口参数：x0 			起始点横坐标 
*           y0    		起始点纵坐标 
*           x1 			终止点横坐标 
*           y1      	终止点纵坐标 
*          full_color      	显示颜色 
* 出口参数：无 
****************************************************************************/ 
void GUIfull(uchar x0,uchar y0,uchar x1,uchar y1,uint full_colour) 
{ 
    unsigned char i,j; 
for(j = y0;j <= y1;j ++) 
    for(i = x0;i <= x1;i ++) 
    GUIpoint(i,j,full_colour); 
} 


/**************************************************************************** 
* 名称：plotC(int x,int y,int xc,int yc,unsigned char yc_colour) 
* 功能：八分点画圆函数 
* 入口参数：x    		指定线起点所在行的位置 
*           y    		指定线起点所在列的位置 
*          yc_color 	显示颜色,根据彩色代码设定 
* 出口参数：无 
****************************************************************************/ 
void plotC(uchar x,uchar y,uchar xc,int yc,uint yc_colour) 
{ 
    GUIpoint(xc+x,yc+y,yc_colour); 
    GUIpoint(xc+x,yc-y,yc_colour); 
    GUIpoint(xc-x,yc+y,yc_colour); 
    GUIpoint(xc-x,yc-y,yc_colour); 
    GUIpoint(xc+y,yc+x,yc_colour); 
    GUIpoint(xc+y,yc-x,yc_colour); 
    GUIpoint(xc-y,yc+x,yc_colour); 
    GUIpoint(xc-y,yc-x,yc_colour); 
} 

/**************************************************************************** 
* 名称：GUI_Circle(int xc,int yc,int r,unsigned char circle_colour) 
* 功能：画圆 
* 入口参数：xc 				圆心的行坐标 
*           yc    			圆心的列坐标 
*           r 				半径 
*          circle_color     显示颜色 
* 出口参数：无 
****************************************************************************/ 
void GUIcircle(uchar xc,uchar yc,uchar r,uint circle_colour) 
{ 
    int x,y,d; 
    y = r; 
    d = 3 - (r + r); 
    x = 0; 
    while(x <= y) 
    { 
        plotC(x,y,xc,yc,circle_colour); 
        if(d < 0) 
            d += (x + x + x + x) + 6; 
        else 
        { 
            d+=((x - y) + (x - y) + (x - y) + (x - y)) + 10; 
            y = y - 1; 
        } 
        x = x + 1; 
    } 
}
