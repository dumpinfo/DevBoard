#ifndef __NBCTFT_H__
#define __NBCTFT_H__

#ifndef uchar
#define uchar unsigned char 
#endif

#ifndef uint
#define uint unsigned int 
#endif

//uchar pic[];

void TFT_Initial(void);
void show_colour_bar (void);
void Write_Cmd_Data(uchar x, uint y);
void Write_Cmd(uchar DH,uchar DL);
void Write_Data(uchar DH,uchar DL);
void delayms(uint tt);
void show_photo(void);
void Show_RGB (uint x0,uint x1,uint y0,uint y1,uint Color);

void  Write_Data_U16(uint y);
//Read_RegData(uchar Regaddr);
void CLR_Screen(uint bColor);
void PutGB3232(unsigned short x, unsigned short  y, uchar c[2], uint fColor,uint bColor);
void LCD_PutChar(unsigned short x, unsigned short y, char c, uint fColor, uint bColor);
void LCD_PutString(unsigned short x, unsigned short y, uchar *s, uint fColor, uint bColor);
void LCD_PutChar8x8(unsigned short x, unsigned short y, char c, uint fColor, uint bColor);
void Put16x16(unsigned short x, unsigned short  y, uchar g[2], uint fColor,uint bColor);
void Put_pixel(uint x,uint y,uint color);
void address_set(uint x1,uint y1,uint x2,uint y2);
void LCD_SetPos(uint x0,uint x1,uint y0,uint y1);
void line(int x1,int y1,int x2,int y2,int color);
void draw_circle(int x, int y, int r, int color);

void Line(	uchar X0,
			uchar Y0,
			uchar X1,
			uchar Y1,
			uint color);
void Rectangle( uchar left,
				uchar top,
				uchar right,
				uchar bottom,
				uint color);

void Bar(	uchar left,
			uchar top,
			uchar right,
			uchar bottom,
			uint color);	

#endif
