//12864型LCD显示图形驱动程序
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
#include  <avr/pgmspace.h>  //须增加的头文件，用来将数据存放在flash中

//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

#define delay_us(x)     _delay_us(x)        //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC延时函数 x(ms)

#define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
#define RS_SET	PORTF |= (1 << PF1)                  //RS置高

#define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
#define RW_SET	PORTF |= (1 << PF2)                  //RW置高

#define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
#define EN_SET	PORTF |= (1 << PF3)                  //E置高


#define PSB_CLR	PORTF &= ~(1 << PE2)                 //PSB置低，串口方式
#define PSB_SET	PORTF |= (1 << PE2)                  //PSB置高，并口方式

#define LOW		    0
#define HIGH		1
#define FIRST_ADDR  0       //定义字符/汉字显示起始位置

//12864相关初始化指令
#define CLEAR_SCREEN	0x01		//清屏指令：清屏且AC值为00H
#define AC_INIT		    0x02		//将AC设置为00H。且游标移到原点位置
#define CURSE_ADD	    0x06		//设定游标移到方向及图像整体移动方向（默认游标右移，图像整体不动）
#define FUN_MODE	    0x30		//工作模式：8位基本指令集
#define DISPLAY_ON	    0x0c		//显示开,显示游标，且游标位置反白
#define DISPLAY_OFF	    0x08		//显示关
#define CURSE_DIR  	    0x14		//游标向右移动:AC=AC+1
#define SET_CG_AC	    0x40		//设置AC，范围为：00H~3FH
#define SET_DD_AC	    0x80
#define FUN_MODEK	    0x36		//工作模式：8位扩展指令集

#define X1address       0x80        //12864上半屏X轴起始地址
#define X2address       0x88        //12864下半屏X轴起始地址
#define Yaddress        0x80        //Y轴起始地址
const prog_uchar FlashConst = 3;        //定义uchar型的常量n定义在flash里(flash常量)
unsigned char RamVar_1[512];            //定义无符号整型变量(Ram变量)

#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

//图形数据<成功从欣开始图片>

const prog_uchar photo1[]={
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x38,0x01,
0x80,0x00,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x00,0x00,0x00,0x00,0x38,0x01,
0x80,0x00,0x0C,0x00,0x00,0x80,0x0C,0x10,0x01,0x1E,0x00,0x00,0x00,0x70,0x78,0x01,
0x80,0x00,0x1D,0x00,0x01,0x80,0x1C,0x38,0x1F,0x9E,0x07,0xFE,0x00,0x70,0x68,0x01,
0x80,0x00,0x1D,0x81,0xC7,0xF0,0x1E,0x78,0x1F,0xBE,0x07,0xFF,0x00,0xF0,0xDC,0x01,
0x80,0x1F,0xFC,0x01,0xE3,0xF0,0x1E,0x78,0x1C,0x3C,0x01,0xF8,0x03,0xF9,0x98,0x01,
0x80,0x1F,0xF8,0x01,0xE6,0xC0,0x3C,0xF0,0x38,0x6C,0x03,0xB8,0x03,0xF1,0xB8,0x01,
0x80,0x1E,0x30,0x01,0xC6,0x80,0x3C,0xF0,0x3F,0x68,0x1B,0x78,0x03,0xBB,0xF0,0x01,
0x80,0x1C,0x30,0x01,0x85,0x80,0x78,0xE0,0x3F,0x78,0x1F,0xF0,0x03,0xF3,0xB0,0x01,
0x80,0x3F,0xF6,0x01,0x8D,0x80,0x79,0xE0,0x3C,0x78,0x0F,0xC0,0x01,0xE1,0x90,0x01,
0x80,0x3C,0xFB,0x0F,0xDD,0x80,0xF1,0xE0,0x3C,0xF0,0x0C,0xC0,0x00,0xC3,0x80,0x01,
0x80,0x3C,0xFB,0x07,0x39,0x40,0xF1,0xF0,0x3C,0xE0,0x0C,0xC0,0x01,0xE3,0x80,0x01,
0x80,0x38,0xF2,0x00,0x69,0x61,0xF3,0xF0,0x3C,0xA0,0x0C,0xC0,0x03,0x66,0x80,0x01,
0x80,0x39,0xF2,0x00,0x52,0x39,0xB3,0x30,0x34,0xB0,0x08,0x80,0x06,0x06,0x80,0x01,
0x80,0x10,0x76,0x00,0x10,0x03,0x9E,0x38,0x11,0x18,0x08,0x80,0x18,0x07,0x80,0x01,
0x80,0x00,0x7C,0x00,0x00,0x03,0x08,0x18,0x00,0x0C,0x08,0xC0,0x00,0x0D,0x00,0x01,
0x80,0x00,0x60,0x00,0x00,0x03,0x00,0x0C,0x00,0x00,0x00,0x40,0x00,0x0F,0x00,0x01,
0x80,0x00,0x60,0x00,0x00,0x02,0x00,0x04,0x00,0x00,0x00,0x20,0x00,0x06,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01

}; 

const prog_uchar photo2[]={
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x03,0x5E,0xBD,0x60,0x0E,0x77,0xEC,0x78,0xF1,0xE0,0x07,0x8E,0x7C,0x00,0x01,
0x80,0x01,0x52,0xA5,0x40,0x11,0x22,0x30,0x91,0x12,0x20,0x08,0x91,0x2A,0x00,0x01,
0x80,0x01,0x52,0xA5,0x40,0x07,0x14,0x20,0x91,0x02,0x00,0x08,0x11,0x2A,0x00,0x01,
0x80,0x01,0x52,0xA5,0x40,0x09,0x14,0x20,0x61,0x02,0x00,0x08,0x11,0x2A,0x00,0x01,
0x80,0x00,0xA1,0x42,0x8C,0x11,0x14,0x20,0x81,0x12,0x26,0x08,0x91,0x2A,0x00,0x01,
0x80,0x00,0xA1,0x42,0x8C,0x0F,0x88,0xF8,0xF0,0xE1,0xC6,0x07,0x0E,0x6B,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x88,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x70,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF

};

//图形数据<欣世纪电子>
const prog_uchar photo3[]={
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x06,0x00,0x00,0x0C,0x00,0x30,0x00,0x00,0x18,0x00,0x00,0x1F,0x80,0x38,
0x1C,0x00,0x76,0x00,0x00,0xC6,0x00,0x30,0x0C,0x00,0x18,0x00,0x07,0xF3,0x00,0x38,
0x1C,0x07,0xC6,0x00,0x0C,0xC6,0x00,0x30,0xFC,0x00,0x18,0x00,0x00,0x06,0x00,0x38,
0x1C,0x07,0x06,0x00,0x0C,0xCC,0x00,0x61,0x8C,0x03,0x1F,0xE0,0x00,0x0C,0x00,0x38,
0x1C,0x06,0x0C,0x00,0x0C,0xCC,0x00,0xCC,0x18,0x03,0xFC,0xC0,0x00,0x38,0x00,0x38,
0x1C,0x06,0x0C,0xE0,0x0C,0xCC,0x00,0xCC,0x18,0x03,0x18,0xC0,0x00,0x30,0x00,0x38,
0x1C,0x06,0x7F,0xE0,0x0C,0xCC,0xC1,0xF8,0x18,0x03,0x18,0xC0,0x00,0x18,0xF0,0x38,
0x1C,0x07,0xDE,0xC0,0x0F,0xFF,0xE1,0xF3,0xF8,0x03,0xFF,0xC0,0x03,0xFF,0x80,0x38,
0x1C,0x06,0xDB,0x00,0x7C,0xCC,0x00,0x33,0x00,0x03,0x18,0xC0,0x1E,0x18,0x00,0x38,
0x1C,0x06,0xF6,0x00,0x0C,0xCC,0x00,0x63,0x00,0x03,0x18,0xC0,0x00,0x18,0x00,0x38,
0x1C,0x06,0xF6,0x00,0x0C,0xCC,0x00,0xFF,0x00,0x03,0x1B,0x80,0x00,0x18,0x00,0x38,
0x1C,0x0C,0xC6,0x00,0x0C,0xFC,0x01,0xE3,0x00,0x03,0xFE,0x00,0x00,0x18,0x00,0x38,
0x1C,0x0C,0xCF,0x00,0x0C,0xC0,0x00,0x03,0x03,0x03,0x18,0x00,0x00,0x18,0x00,0x38,
0x1C,0x0C,0xCF,0x00,0x0C,0xC0,0x00,0x0F,0x03,0x00,0x18,0x30,0x00,0x18,0x00,0x38


};
const prog_uchar  photo4[]={
0x1C,0x18,0xD9,0x80,0x0C,0x00,0x00,0x7B,0x03,0x00,0x18,0x30,0x01,0x98,0x00,0x38,
0x1C,0x18,0xD9,0x80,0x0C,0x00,0x03,0xC3,0x03,0x00,0x18,0x30,0x00,0xF8,0x00,0x38,
0x1C,0x30,0xF0,0xE0,0x0F,0xFF,0xC0,0x01,0xFF,0x80,0x0F,0xF8,0x00,0x70,0x00,0x38,
0x1C,0x60,0xE0,0x30,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x38,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x1F,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xF8,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
};

//*************************************************************************
//			初始化子程序
//*************************************************************************
void system_init()
{

	Data_IO = 0xFF;				        //电平设置
	Data_DDR = 0xFF;				        //方向输出
	PORTF = 0xFF;                       //电平设置
	DDRF = 0xFF;                        //方向输出
    PORTD=0xFF;
	DDRD=0xFF;
	PORTE=0xFF;                        //PSB对应于PE2
	DDRE=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 

	PSB_SET;						   //液晶并口方式
}

//***********************************************************************
//	显示屏命令写入函数
//***********************************************************************


void LCD_write_com(unsigned char com) 
{	
	RS_CLR;
	RW_CLR;
	EN_SET;
	Data_IO = com;
	delay_ms(5);
	EN_CLR;
}
//***********************************************************************
//	显示屏数据写入函数
//***********************************************************************

void LCD_write_data(unsigned char data) 
{
	RS_SET;
	RW_CLR;
	EN_SET;
	Data_IO = data;
	delay_ms(5);
	EN_CLR;
}

//***********************************************************************
//	显示屏清空显示
//***********************************************************************

void LCD_clear(void) 
{
	LCD_write_com(0x01);
	delay_ms(5);
}

//***********************************************************************
//函数名称：DisplayCgrom(uchar hz)显示CGROM里的汉字
//入口参数：无
//返回参数：无
//***********************************************************************

void DisplayCgrom(uchar addr,uchar *hz)
{

	LCD_write_com(addr);
    delay_ms(5);
	while(*hz != '\0')
	{
		LCD_write_data(*hz);
		hz++;
        delay_ms(5);
	}

} 

//***********************************************************************
//	显示屏初始化函数
//***********************************************************************

void LCD_init(void) 
{
	LCD_write_com(FUN_MODE);			//显示模式设置
	delay_ms(1);
	LCD_write_com(FUN_MODE);			//显示模式设置
	delay_ms(1);
    LCD_write_com(DISPLAY_ON);			//显示开
	delay_ms(1);
    LCD_write_com(CLEAR_SCREEN);        //清屏
	delay_ms(1);
}

//****************************************************************
//函数名称：Display_photo(uchar *hz)显示自定义图形，分上下半屏来写
//****************************************************************

void Display_photo1(uchar *img1)                      //写上半屏图形数据函数
{
   int i,j;     

   for(i=0;i<32;i++)                                 //上半屏32行
    {  
		LCD_write_com(FUN_MODEK);                     //扩展指令，开绘图显示
        delay_ms(1);
     
 		LCD_write_com(Yaddress+i);                   //先写垂直地址，即Y地址，不能自动加一
        delay_ms(1);

        LCD_write_com(X1address);                    //再写水平地址，即X地址
        delay_ms(1);
      
 	for(j=0;j<8;j++)                       //连续写入2个字节的数据，一共8次，为一行，即16*8位数据
        {  			                                     
		LCD_write_data(img1[i*16+j*2]);
		delay_ms(2);                       //这个延时是必须的，因为没有对液晶进行判忙操作，所以进行延时
		LCD_write_data(img1[i*16+j*2+1]); 
		delay_ms(2);          
        }

    }
}

void Display_photo2(uchar *img2)                   //写下半屏图形数据
{
	int i,j;

	for(i=0;i<32;i++)                         //下半屏32行
	{  

	 	LCD_write_com(Yaddress+i);                //先写垂直地址，即Y地址，不能自动加一
	    delay_ms(1);
		LCD_write_com(X2address);                 //再写水平地址，即X地址
	    delay_ms(1);
	 	 for(j=0;j<8;j++)                        //连续写入2个字节的数据，一共8次，为一行，即16*8位数据
	    {
			
			LCD_write_data(img2[i*16+j*2]);
			delay_ms(2);                    
			LCD_write_data(img2[i*16+j*2+1]);  
			delay_ms(2);  
      
		}

	}

}

//****************************************************************
//函数名称：主函数，调用相关子程序，显示图形
//****************************************************************

int main(void)
{
	int m;
    system_init();                      //系统初始化，设置IO口属性
	delay_ms(1);                        //延时1ms
	LCD_init();                        //液晶参数初始化设置
    LCD_clear(); 
  while(1)
	{
	for(m=0;m<512;m++)                //从flash中读取上半屏数据
	   {
		RamVar_1[m]=pgm_read_byte( &photo1[m] );
       }
		

    	Display_photo1(RamVar_1);     //显示上半屏数据
			
	for(m=0;m<512;m++)                //从flash中读取下半屏数据
	   {

		RamVar_1[m]=pgm_read_byte( &photo2[m] );     
	   }	
		Display_photo2(RamVar_1);     //显示下半屏数据
		delay_ms(1000);
		delay_ms(1000);

	for(m=0;m<512;m++)                //从flash中读取上半屏数据
	   {
		RamVar_1[m]=pgm_read_byte( &photo3[m] );
       }
		

    	Display_photo1(RamVar_1);     //显示上半屏数据
			
	for(m=0;m<512;m++)                //从flash中读取下半屏数据
	   {

		RamVar_1[m]=pgm_read_byte( &photo4[m] );     
	   }	
		Display_photo2(RamVar_1);     //显示下半屏数据
		delay_ms(1000);
		delay_ms(1000);
	}
}
