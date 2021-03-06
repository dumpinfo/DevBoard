//DMAVR-128的DS1302实时时钟芯片驱动程序
//编译环境 AVR Studio 4.17/AVR GCC
//使用前请通过修改time_buf[8]来设置当前启动日期
//当前设置2010-01-29 10：48 上午 周五
//0xb0表示12小时制，下午，当前时间的小时数为10，具体位的意义参考DS1302的数据手册


#include  <user/DS1302.h>

unsigned char time_buf[8] = {0x20,0x10,0x02,0x01,0xa3,0x22,0x00,0x01};  //12小时制，要写下午还是上午

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
