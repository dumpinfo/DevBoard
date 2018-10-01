#include <stdio.h>
#include <math.h>
#include <iom128v.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <delay.h>


#define uchar unsigned char
#define uint  unsigned int

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RD置低
#define LCD_RD1		PORTG |= (1 << PG4)                  //RD置高



#define PI				3.1415926                        //计算坐标用到的PI

uchar postion_x,postion_y;

uchar sxi,syi,mxi,myi,hxi,hyi;

uchar time_hour,time_min,time_sec;
uchar data_yearq,data_yearb,data_years,data_yearg,data_months,data_monthg,data_days,data_dayg;
uchar week,time_h;  									//time_h是上午还是下午标志位，2为下午，0为上午

extern uchar time_buf[8];                       //外部变量

void MUC_Init();
void LCD_Init();
void LCD_WR_REG(uchar index);
void LCD_WR_CMD(uchar index,uint val);
void LCD_WR_Data(uint val);
void LCD_test();
void LCD_clear(uint p);
void GUIback(uint back_color);
void GUIpoint(uchar x,uchar y,uint point_color);
void GUIline(uchar x0,uchar y0,uchar x1,uchar y1,uint line_color);
void GUIfull(uchar x0,uchar y0,uchar x1,uchar y1,uint full_colour); 
void plotC(uchar x,uchar y,uchar xc,uint yc,uint yc_colour);
void GUIcircle(uchar xc,uchar yc,uchar r,uint circle_colour); 
void DisplayChar(uchar casc,uchar postion_x,uchar postion_y,uint char_color);
void DisplayGB2312(uchar gb,uchar postion_x,uchar postion_y,uint gb_color);
void DisplayString(uchar *s,uchar x,uchar y,uint s_color);
void ds1302_write_byte(uchar addr, uchar d);
uchar ds1302_read_byte(uchar addr);
void ds1302_write_time(void);
void ds1302_read_time(void) ;
void ds1302_init(void); 
void McuInit();
uint LCD_RD_REG16(uchar index);
