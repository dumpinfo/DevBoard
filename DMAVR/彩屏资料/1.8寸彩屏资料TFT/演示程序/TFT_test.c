
#include "stc12c5410ad.h"
#include <intrins.h>
#include "ascii hex(8x16).h"
#include "GB2312.h"

#define uchar unsigned char
#define uint unsigned int

#define DATA P1

sbit LCD_CS		= P3^7;
sbit LCD_RS		= P2^6;
sbit LCD_RD		= P2^0;
sbit LCD_WR		= P2^7;
sbit LCD_RST	= P2^1;


void MUC_Init();
void LCD_Init();
void LCD_WR_REG(uchar index);
void LCD_WR_CMD(uchar index,uint val);

void LCD_WR_Data(uint val);
void LCD_test();
void LCD_clear(uint p);

uint color[]={0xf800,0x07e0,0x001f,0xffe0,0x0000,0xffff,0x07ff,0xf81f};

uchar postion_x,postion_y;
extern unsigned char code gImage_qqp[];
extern unsigned char code gImage_mmp[];

void delay_us(uint t)
{
	t*=2;
	while(--t);
}

void delay_ms(uint t)
{
	uchar i,j;
	while(--t)
	{
		j=8;
		while(--j)
			while(--i);
	}
}


 
void MUC_Init()
 {
//	P1M0 = 0x00;
//	P1M1 = 0xFF;
//	P2M0 = 0x00;
//	P2M1 = 0xFF;
//	P3M0 = 0x00;
//	P3M1 = 0xFF;
    P1=0xff;
   P2=0xff;
   P3=0xff;
}

void LCD_WR_REG(uchar index)
{
	LCD_RS = 0;
	LCD_CS = 0;
	DATA = 0x00;
	LCD_WR = 0;
	LCD_WR = 1;
	DATA = index;
	LCD_WR = 0;
	LCD_WR = 1;
	LCD_CS = 1;
	LCD_RS = 0;
}

void LCD_WR_CMD(uchar index,uint val)
{
	LCD_RS = 0;
	LCD_CS = 0;
	DATA = 0x00;
	LCD_WR = 0;
	LCD_WR = 1;
	DATA = index;
	LCD_WR = 0;
	LCD_WR = 1;
	LCD_CS = 1;
	LCD_RS = 0;

	LCD_RS = 1;
	LCD_CS = 0;
	DATA = (uchar)(val>>8);
	LCD_WR = 0;
	LCD_WR = 1;
	LCD_CS = 1;
	LCD_RS = 0;
	LCD_RS = 1;
	LCD_CS = 0;
	DATA = (uchar)val;
	LCD_WR = 0;
	LCD_WR = 1;
	LCD_CS = 1;
	LCD_RS = 0;
}

unsigned int LCD_RD_REG16(uchar index)
{
	unsigned int pd;

	LCD_RS = 0;
	LCD_CS = 0;
	_nop_();
	_nop_();

	DATA = 0x00;
	_nop_();
	_nop_();

	LCD_WR = 0;
	_nop_();
	_nop_();

	LCD_WR = 1;
	_nop_();
	_nop_();

	DATA = index;
	_nop_();
	_nop_();

	LCD_WR = 0;
	_nop_();
	_nop_();

	LCD_WR = 1;
	_nop_();
	_nop_();

	LCD_RS = 1;
	_nop_();
	_nop_();

	DATA = 0xFF;
	_nop_();
	_nop_();

	LCD_RD = 0;
	_nop_();
	_nop_();
	LCD_RD = 1;
	pd = DATA;

	_nop_();
	_nop_();
	DATA = 0xFF;
	LCD_RD = 0;
	_nop_();
	_nop_();
	LCD_RD = 1;
	pd = pd + DATA*256;
	LCD_CS = 1;
	LCD_RS = 0;
	return pd;
}

void LCD_WR_Data(uint val)
{
	//LCD_RS = 1;
	//LCD_CS = 0;
	DATA = (uchar)(val>>8);
	LCD_WR = 0;
	LCD_WR = 1;
	//LCD_RS = 1;
	DATA = (uchar)val;
	LCD_WR = 0;
	LCD_WR = 1;
	//LCD_CS = 1;
	//LCD_RS = 0;
}

sbit FLASH_RST=P0^3;
sbit FLASH_CS=P0^2;

void LCD_Init()
{
	LCD_RST = 0;
	FLASH_RST=0;
	delay_ms(200);
	FLASH_RST=1;
	FLASH_CS=1;
	LCD_RST = 1;
	delay_ms(200);

    LCD_WR_CMD(0x00,0x0001);		//Start_osc
    delay_us(1000);
    LCD_WR_CMD(0x03,0x0030);
    //LCD_WR_CMD(0x03,0x0230);
    LCD_WR_CMD(0x01,0x011D);
    delay_us(100);
    LCD_WR_CMD(0x0a,0x0106); 
    delay_us(1);


    LCD_WR_CMD(0x08,0x0707);
    LCD_WR_CMD(0x0c,0x01);
    LCD_WR_CMD(0x02,0x0400);
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0107); 
    delay_us(1);

    LCD_WR_CMD(0x12,0x0001); //VciOUT = 3V × 0.83 = 2.49V
    // only 100(=VCI), 000(.92 VCI),001(.83),010(.73VCI) is valid. other is inhibited
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0101); 
    delay_us(1);
   
   // LCD_WR_CMD(0x13,0x404);
   // delay_us(1);LCD_WR_CMD(0x0a,0x0101); delay_us(1);

    LCD_WR_CMD(0x11,0x0505);//CAD = 0;
   // delay_us(1);LCD_WR_CMD(0x0a,0x0101); delay_us(1);



    LCD_WR_CMD(0x14,0x2c0f); // last 4 bit must be 1!!! vcomg = 1, 
    // VDV4-0 == 09-0e,10-12 // other is inhibited.!!! 
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0102); 
    delay_us(1);

    LCD_WR_CMD(0x10,0x1a10);// if Vci > 3.0V, use 0x1a10.
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0100); 
    delay_us(1);

    LCD_WR_CMD(0x13,0x0616); //////////!!!!!!!!!!!!! VERY IMPORTANT!!!
    //set VRH3-0 to fit REG1out= 3 to DDVDH-0.5
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0101); 
    delay_us(1000);

    LCD_WR_CMD(0x30,0x0003);
    LCD_WR_CMD(0x31,0x0404);
    LCD_WR_CMD(0x32,0x0303);
    LCD_WR_CMD(0x33,0x0406);
    LCD_WR_CMD(0x34,0x0404);
    LCD_WR_CMD(0x35,0x0303);
    LCD_WR_CMD(0x36,0x0407);
    LCD_WR_CMD(0x37,0x0604);
    LCD_WR_CMD(0x07,0x0037);
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0100);
    delay_us(1000); 
    
    //*********** SAP, AP set****************	
    LCD_WR_CMD(0x10,0x1a10);//BT2-0 Ok,and...
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0100); 
    delay_us(100);	
	//*********** PON  set********************
	LCD_WR_CMD(0x13,0x0616); //////////
    
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0101); 
    delay_us(100);
    
    //***********Display ON set*****************
    LCD_WR_CMD(0x07,0x0037);
    delay_us(1);
    LCD_WR_CMD(0x0a,0x0100); 
    delay_us(100);   
}



void LCD_test()
{
	uint temp,num;
	uchar n;
	//大屏显示彩条128X160
	LCD_WR_CMD(0x44,127*256+0);
	LCD_WR_CMD(0x45,239*256+80);
	LCD_WR_CMD(0x21,80*256+0);	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	for(n=0;n<8;n++)
	{
	    temp=color[n];
		for(num=20*128;num>0;num--)
		  LCD_WR_Data(temp);
	}
	LCD_CS = 1;
	delay_ms(500);
	
	//小屏显示彩条96X64	
	LCD_WR_CMD(0x44,95*256+0);
	LCD_WR_CMD(0x45,79*256+16);
	LCD_WR_CMD(0x21,16*256+0);	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	for(n=0;n<8;n++)
	{
	    temp=color[n];
		for(num=8*96;num>0;num--)
		{
			LCD_WR_Data(temp);
		}
	}
	LCD_CS = 1;
	delay_ms(500);
	//大屏显示纯色
	for(n=0;n<8;n++)
	{
		LCD_WR_CMD(0x44,127*256+0);
		LCD_WR_CMD(0x45,239*256+80);
		LCD_WR_CMD(0x21,80*256+0);	
		LCD_WR_REG(0x22);
		LCD_CS = 0;
		LCD_RS = 1;
	    temp=color[n];
		for(num=160*128;num>0;num--)
		{
			LCD_WR_Data(temp);
		}
		//delay_ms(500);
	}
	LCD_CS = 1;
	
	//小屏显示纯色

	for(n=0;n<8;n++)
	{
		LCD_WR_CMD(0x44,95*256+0);
		LCD_WR_CMD(0x45,79*256+16);
		LCD_WR_CMD(0x21,16*256+0);	
		LCD_WR_REG(0x22);
		LCD_CS = 0;
		LCD_RS = 1;
	    temp=color[n];
		for(num=64*96;num>0;num--)
		{
			LCD_WR_Data(temp);
		}
		//delay_ms(500);
	}
	LCD_CS = 1;
}
void LCD_MM()
{
	uint num;
	unsigned int *p; 
	//显示小QQ图标
	LCD_WR_CMD(0x44,95*256+0);
	LCD_WR_CMD(0x45,79*256+16);
	LCD_WR_CMD(0x21,16*256+0);	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	p = gImage_mmp;
   	for(num=0;num<6144;num++)	//
	{		
		LCD_WR_Data(*p++);
	}
	LCD_CS = 1;
}
void LCD_QQ()
{
	uint temp,num;
	unsigned int *p; 
	uchar n,c,g;
	//显示小QQ图标
   	for(g=0;g<4;g++)
	{
		for(c=0;c<3;c++)
		{
			LCD_WR_CMD(0x44,(c*40+39)*256+c*40);
			LCD_WR_CMD(0x45,(g*40+39+80)*256+(g*40+80));
			LCD_WR_CMD(0x21,(g*40+80)*256+c*40);
			LCD_WR_REG(0x22);
			LCD_CS = 0;
			LCD_RS = 1;
			p = gImage_qqp;
   			for(num=0;num<1600;num++)	//
			{		
				LCD_WR_Data(*p++);
			}
			//delay_ms(500);	 	
		}
  	}
}

void LCD_clear(uint p)
{
	uint num;
	
	LCD_WR_CMD(0x44,127*256+0);
	LCD_WR_CMD(0x45,239*256+80);
	LCD_WR_CMD(0x21,80*256+0);	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	for(num=160*128;num>0;num--)
	{
		LCD_WR_Data(p);
	}
	LCD_WR_CMD(0x44,95*256+0);
	LCD_WR_CMD(0x45,79*256+16);
	LCD_WR_CMD(0x21,16*256+0);	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	for(num=64*96;num>0;num--)
	{
		LCD_WR_Data(p);
	}
	LCD_CS = 1;
}


//8X16点阵的字符显示函数
//参数说明：
//		  casc:字符对应字模中的位置
//         x:显示位置第几列,每行是240/8 ==30列
//         y:显示位置第几行,整屏是320/16==20行

void DisplayChar(uchar casc,uchar postion_x,uchar postion_y)
{
	uchar cTemp;
	uchar i,j,b;
	uchar *p;
	
	LCD_WR_CMD(0x44,(postion_x*8+7)*256+(postion_x*8));	//x end point
	LCD_WR_CMD(0x45,(postion_y*16+15+80)*256+(postion_y*16+80));	//y end point
	LCD_WR_CMD(0x21,(postion_y*16+80)*256+(postion_x*8));	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	p=ascii;
	p+=casc*16;
	for(j=0;j<16;j++)
	{
		b=*(p+j);
		for(i=0;i<8;i++)
		{
			if(b&0x80)
			{
				LCD_WR_Data(0xffff);
			}
			else
			{
				LCD_WR_Data(0x0000);
			}
			b=b<<1;
			
		}	
	}
	LCD_CS = 1;
}

//16X16点阵的汉字显示函数
//参数说明：
//		  gb:汉字对应字模中的位置
//         x:显示位置第几列
//         y:显示位置第几行
void DisplayGB2312(uchar gb,uchar postion_x,uchar postion_y)
{
	uchar cTemp;
	uchar i,j,b;
	uchar *p;
	
	LCD_WR_CMD(0x44,(postion_x*16+15)*256+(postion_x*16));	//x end point
	LCD_WR_CMD(0x45,(postion_y*16+15+80)*256+(postion_y*16+80));	//y end point
	LCD_WR_CMD(0x21,(postion_y*16+80)*256+(postion_x*16));	
	LCD_WR_REG(0x22);
	LCD_CS = 0;
	LCD_RS = 1;
	p=GB2312;
	p+=gb*32;
	for(j=0;j<32;j++)
	{
		b=*(p+j);
		for(i=0;i<8;i++)
		{
			if(b&0x80)
			{
				LCD_WR_Data(0xffff);
			}
			else
			{
				LCD_WR_Data(0x0000);
			}
			b=b<<1;
			
		}	
	}
	LCD_CS = 1;
}
void DisplayString(uchar *s,uchar x,uchar y)//英文字符串显示.
{
	while (*s) 
	{ 
		DisplayChar(*s,x,y);
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


void main(void)
{
  uchar x=0;
  uchar y=0;
  uchar i;
  MUC_Init();

  	while(1)
    {
	  	LCD_Init();
	  	//delay_ms(1000);
      	LCD_test();
	  	//delay_ms(2000);
		LCD_clear(0);
	  	LCD_QQ();
		LCD_MM();
	  	//delay_ms(2000);
		LCD_clear(0);
		//delay_ms(1000);

	  	for(i=0;i<128;i++)
	  	{
	  		DisplayChar(i,x,y);
			if(++x>=16)
			{
				x=0;
				if(++y>=10)
				{
					y=0;
				}
			}
		}
		//delay_ms(2000);
		LCD_clear(0);
		DisplayString("TX05D99 testing!",0,0);
		//delay_ms(2000);
		
		LCD_clear(0);
		for(i=0;i<6;i++)
		{
			DisplayGB2312(i,i,0);
		}
		delay_ms(2000);
	}
	{				


		DisplayString("2009",4,0);
		DisplayString(  "05",10,0);
		DisplayString(  "15",14,0);
		DisplayString(  "14",18,0);
		DisplayString(  "30",22,0);
		DisplayString(  "22",26,0);
		delay_ms(2000);
	 }
}