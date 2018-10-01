//DMAVR-128的DS1302实时时钟芯片驱动程序，若使用备用电池，则在第一次写入初始数据后就不再写初始数据
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>

//***********************************************************************
//	定义变量区
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

/*复位脚*/
#define RST_CLR	PORTE &= ~(1 << PE7)              //电平置低
#define RST_SET	PORTE |= (1 << PE7)               //电平置高
#define RST_IN	DDRE &= ~(1 << PE7)               //方向输入
#define RST_OUT	DDRE |= (1 << PE7)                //方向输出

/*双向数据*/
#define IO_CLR	PORTE &= ~(1 << PE6)              //电平置低
#define IO_SET	PORTE |= (1 << PE6)               //电平置高
#define IO_R	PINE & (1 << PE6)                 //电平读取
#define IO_IN	DDRE &= ~(1 << PE6)               //方向输入
#define IO_OUT	DDRE |= (1 << PE6)                //方向输出

/*时钟信号*/
#define SCK_CLR	PORTE &= ~(1 << PE5)              //时钟信号
#define SCK_SET	PORTE |= (1 << PE5)               //电平置高
#define SCK_IN	DDRE &= ~(1 << PE5)               //方向输入
#define SCK_OUT	DDRE |= (1 << PE5)                //方向输出

/*ds1302命令与相关地址*/
#define ds1302_sec_add			0x80		//秒数据地址
#define ds1302_min_add			0x82		//分数据地址
#define ds1302_hr_add			0x84		//时数据地址
#define ds1302_date_add			0x86		//日数据地址
#define ds1302_month_add		0x88		//月数据地址
#define ds1302_day_add			0x8a		//星期数据地址
#define ds1302_year_add			0x8c		//年数据地址
#define ds1302_control_add		0x8e		//控制数据地址
#define ds1302_charger_add		0x90 					 
#define ds1302_clkburst_add		0xbe

#define RS_CLR	PORTF &= ~(1 << PF1)       //RS置低
#define RS_SET	PORTF |= (1 << PF1)        //RS置高

#define RW_CLR	PORTF &= ~(1 << PF2)       //RW置低
#define RW_SET	PORTF |= (1 << PF2)        //RW置高

#define EN_CLR	PORTF &= ~(1 << PF3)       //E置低
#define EN_SET	PORTF |= (1 << PF3)        //E置高

#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

uchar time_buf[8] = {0x20,0x10,0x01,0x14,0x09,0x55,0x00,0x02};//DS1302初始值

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
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 
}

//***********************************************************************
//向DS1302写入一字节数据
//***********************************************************************
void ds1302_write_byte(unsigned char addr, unsigned char d) 
{

	unsigned char i;
	RST_SET;					//启动DS1302总线
	
	                                                //写入目标地址：addr
	IO_OUT;
	addr = addr & 0xFE;                            //最低位置零
	for (i = 0; i < 8; i ++) {
		if (addr & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		addr = addr >> 1;
		}
	
	                                              //写入数据：d
	IO_OUT;
	for (i = 0; i < 8; i ++) {
		if (d & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		d = d >> 1;
		}
	RST_CLR;					//停止DS1302总线
}
//***********************************************************************
//                   从DS1302读出一字节数据
//***********************************************************************
unsigned char ds1302_read_byte(unsigned char addr)
 {

	unsigned char i;
	unsigned char temp;
	RST_SET;					//启动DS1302总线

	                                                //写入目标地址：addr
	IO_OUT;
	addr = addr | 0x01;                             //最低位置高
	for (i = 0; i < 8; i ++) {
		if (addr & 0x01) {
			IO_SET;
			}
		else {
			IO_CLR;
			}
		SCK_SET;
		SCK_CLR;
		addr = addr >> 1;
		}
	
	/*输出数据：temp*/
	IO_IN;
	for (i = 0; i < 8; i ++) {
		temp = temp >> 1;
		if (IO_R) {
			temp |= 0x80;
			}
		else {
			temp &= 0x7F;
			}
		SCK_SET;
		SCK_CLR;
		}
	
	RST_CLR;					//停止DS1302总线
	return temp;
}

//***********************************************************************
//                   向DS302写入时钟数据
//***********************************************************************

void ds1302_write_time(void)
 {

	ds1302_write_byte(ds1302_control_add,0x00);		//关闭写保护 
	ds1302_write_byte(ds1302_sec_add,0x80);			//暂停 
	//ds1302_write_byte(ds1302_charger_add,0xa9);		//涓流充电 
	ds1302_write_byte(ds1302_year_add,time_buf[1]);		//年 
	ds1302_write_byte(ds1302_month_add,time_buf[2]);	//月 
	ds1302_write_byte(ds1302_date_add,time_buf[3]);		//日 
	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//周 
	ds1302_write_byte(ds1302_hr_add,time_buf[4]);		//时 
	ds1302_write_byte(ds1302_min_add,time_buf[5]);		//分
	ds1302_write_byte(ds1302_sec_add,time_buf[6]);		//秒
	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//周 
	ds1302_write_byte(ds1302_control_add,0x80);		//打开写保护 
}

//***********************************************************************
//                     从DS302读出时钟数据
//***********************************************************************

void ds1302_read_time(void)  
{ 

	time_buf[1]=ds1302_read_byte(ds1302_year_add);		//年 
	time_buf[2]=ds1302_read_byte(ds1302_month_add);		//月 
	time_buf[3]=ds1302_read_byte(ds1302_date_add);		//日 
	time_buf[4]=ds1302_read_byte(ds1302_hr_add);		//时 
	time_buf[5]=ds1302_read_byte(ds1302_min_add);		//分 
	time_buf[6]=(ds1302_read_byte(ds1302_sec_add))&0x7F;//秒 
	time_buf[7]=ds1302_read_byte(ds1302_day_add);		//周 
}

//***********************************************************************
//               DS302初始化函数
//***********************************************************************

void ds1302_init(void) 
{
	
	RST_CLR;			//RST脚置低
	SCK_CLR;			//SCK脚置低
	RST_OUT;			//RST脚设置为输出
	SCK_OUT;			//SCK脚设置为输出
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
	delay_nms(5);
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
	delay_nms(5);
	EN_CLR;
}
//***********************************************************************
//	显示屏清空显示
//***********************************************************************

void LCD_clear(void) 
{
	LCD_write_com(0x01);
	delay_nms(5);
}
//***********************************************************************
//	显示屏字符串写入函数
//***********************************************************************

void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    while (*s) 
    {
    	LCD_write_data( *s);
    	s ++;
    }
}
//***********************************************************************
//	显示屏单字符写入函数
//***********************************************************************

void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
{
	
    if (y == 0) 
    {
    	LCD_write_com(0x80 + x);
    }
    else 
    {
    	LCD_write_com(0xC0 + x);
    }
    
    LCD_write_data( data);  
}
//***********************************************************************
//	显示屏初始化函数
//***********************************************************************

void LCD_init(void) 
{
	system_init();
	LCD_write_com(0x38);				//显示模式设置
	delay_nms(5);
	LCD_write_com(0x08);				//显示关闭
	delay_nms(5);
    LCD_write_com(0x01);				//显示清屏
	delay_nms(5);
    LCD_write_com(0x06);				//显示光标移动设置
	delay_nms(5);
	LCD_write_com(0x0C);				//显示开及光标设置
    delay_nms(5);
}

//***********************************************************************
//	主函数
//***********************************************************************

void main(void) 

{

	unsigned char temp;
 	delay_nms(200);
	LCD_init();                           //1602液晶初始化
	ds1302_init();                        //DS1302初始化
	delay_nms(10);
	ds1302_write_time();                 //向DS1302写初始数据，如年月和时间等

	while (1) 
	{
		delay_nms(200);
		ds1302_read_time();                //读DS1302数据
			
		temp = (time_buf[0] >> 4) + '0';   //在LCD上写要显示的数据
		LCD_write_char(0, 0, temp);/*年*/
		temp = (time_buf[0] & 0x0F) + '0';
		LCD_write_char(1, 0, temp);
		temp = (time_buf[1] >> 4) + '0';
		LCD_write_char(2, 0, temp);
		temp = (time_buf[1] & 0x0F) + '0';
		LCD_write_char(3, 0, temp);
		LCD_write_char(4, 0, '-');
		
		temp = (time_buf[2] >> 4) + '0';
		LCD_write_char(5, 0, temp);/*月*/
		temp = (time_buf[2] & 0x0F) + '0';
		LCD_write_char(6, 0, temp);
		LCD_write_char(7, 0, '-');
		
		temp = (time_buf[3] >> 4) + '0';
		LCD_write_char(8, 0, temp);/*日*/
		temp = (time_buf[3] & 0x0F) + '0';
		LCD_write_char(9, 0, temp);
		
		temp = (time_buf[4] >> 4) + '0';
		LCD_write_char(8, 1, temp);/*时*/
		temp = (time_buf[4] & 0x0F) + '0';
		LCD_write_char(9, 1, temp);
		LCD_write_char(10, 1, ':');
		
		temp = (time_buf[5] >> 4) + '0';
		LCD_write_char(11, 1, temp);/*分*/
		temp = (time_buf[5] & 0x0F) + '0';
		LCD_write_char(12, 1, temp);
		LCD_write_char(13, 1, ':');
		
		temp = (time_buf[6] >> 4) + '0';
		LCD_write_char(14, 1, temp);/*秒*/
		temp = (time_buf[6] & 0x0F) + '0';
		LCD_write_char(15, 1, temp);
	}
}
