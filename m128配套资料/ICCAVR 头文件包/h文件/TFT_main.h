#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>

#define uchar unsigned char
#define uint  unsigned int

#define LCD_RD0		PORTG &= ~(1 << PG4)                 //RDÖÃµÍ
#define LCD_RD1		PORTG |= (1 << PG4)                  //RDÖÃ¸ß

uchar postion_x,postion_y;
								


void MUC_Init(void);
void LCD_Init(void);
void LCD_WR_REG(uchar index);
void LCD_WR_CMD(uchar index,uint val);
void LCD_WR_Data(uint val);
void LCD_test(void);
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
void McuInit(void);
uint LCD_RD_REG16(uchar index);
void LCD_MM(void);
void LCD_ph(void);

