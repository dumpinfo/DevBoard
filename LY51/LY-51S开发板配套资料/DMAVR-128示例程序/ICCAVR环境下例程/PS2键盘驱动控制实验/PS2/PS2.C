//DMAVR-128的PS2键盘驱动程序，并在1602液晶上显示键值
//PS2键盘按键1次输出33个时钟脉冲，因此采用中断的方式读取33次，只提取最后一个字节中的数据位做键码
//按键1次，实际输出3个字节数据，每个字节为11位，一个起始位(0)，8个数据位，一个奇偶校验位，一个停止位(1)
//并且第1个字节与第3个字节数据相同，此程序提取第3个字节的数据位键值数据
//有的键盘在第一次按键会触发34次中断，因此在中断服务程序中多一个判断程序，默认使用33个中断
//学习前请阅读PS2键盘的相关资料，以充分的理解程序，译码表可以做成头文件的形式，为了直观，这里就全部放在一起
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define  F_CPU	7372800		               //单片机主频为7.3728MHz
#include <delay.h>
#include <iom128v.h>
#include <PS2.h>



//***********************************************************************
//			定义变量区
//***********************************************************************

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

extern  uchar unshifted[][2];
extern  uchar shifted[][2];

#define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
#define RS_SET	PORTF |= (1 << PF1)                  //RS置高

#define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
#define RW_SET	PORTF |= (1 << PF2)                  //RW置高

#define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
#define EN_SET	PORTF |= (1 << PF3)                  //E置高

#define Data_IO	        PORTA                //液晶数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1


uchar bitcount;
uchar data2,key_value=0x30;
ulong data;
uchar finish;
uchar up=0,shift=0;	//up为通、断码标志，shift为shift键按下标志 


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
//	显示屏初始化函数
//***********************************************************************

void LCD_init(void) 
{
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


//************************************************************** 
//                初始化PS2函数 
//************************************************************** 
void ps2_init(void) 
{ 
     
     EIMSK|=0x03;          //使能外部中断0
     EICRA=0x0A;          //下降沿触发方式
     MCUCSR=0x00;         //控制和状态寄存器初始化
     bitcount = 0;	     //每次11位数据，一个起始位(0)，8个数据位，一个奇偶校验位，一个停止位(1)  
     PORTD|=(1<<PD0);    //使能中断管脚的上拉
     DDRD&=~(1<<PD0);    //配置中断管脚为输入 
     PORTC|=(1<<PC7);    //使能数据管脚的上拉 
     DDRC&=~(1<<PC7);    //配置数据管脚为输入

} 

//************************************************************** 
//              译码函数，scancode--需要翻译的扫描码  
//************************************************************** 

void Decode(uchar scancode) 
{ 

uchar i; 
if (!up)	 //已接收的11位数据是通码（up为0） 
{ 
	switch (scancode)//开始翻译扫描码 
		{ 
			case 0xF0:	 //键盘释放标志（随后的一个字节是断码） 
						up=1;	        //设置up为断码标志 
						break; 
			case 0x12:	 //左shift键按下 
						shift=1;         //设置shift为按下标志 
						break; 
			case 0x59:	 //右shift键按下 
						shift=1;         //设置shift为按下标志 
						break; 
			default: 
if(!shift)	 //如果shift键没有按下 
	{ //查找unshifted表，表中左列是扫描码，右列是对应的ASCII码 
		for(i=0;unshifted[i][0]!=scancode;i++); 
			if(unshifted[i][0]==scancode) 
				{ 
					key_value=unshifted[i][1]; 
				} 
	} 
else //如果shift键按下 
	{	 //查找shifted表 
		for(i=0;shifted[i][0]!=scancode;i++); 
			if(shifted[i][0]==scancode) 
				{ 
					key_value=shifted[i][1];
					shift=0;
				} 
	} 
			break; 
		} 
} 
else                      //已接收的11位数据是断码（up为1） 
	{ 
		up = 0;                   //将断码标志复位 
		switch (scancode)	 //检测shift键释放 
			{ 
				case 0x12 :	         //左shift键 
							shift = 0; 
							break; 
				case 0x59 :	         //右shift键 
							shift = 0; 
							break; 
				default: 
							break; 
			} 
	} 
} 
//************************************************************************
//          中断读入的数据是先低位后高位，该函数将数据位重新排列
//************************************************************************
void get_code(uchar cdata)
{
  int i;
  for(i=0;i<8;i++)
  { data2<<=1 ;
    data2|=cdata&0x01;
    cdata>>=1;
  
  }
}
//*************************************************************************
//	        外部中断0服务子程序
//功 能: 外部中断0的中断服务函数，下降沿读取数据，数据位ULONG型，全部读取 
//*************************************************************************
#pragma interrupt_handler  INT0_ISR:iv_INT0 //int0_ISR：中断函数名，接着是中断向量号
void INT0_ISR() 	 				  		//中断0服务程序
   {
    bitcount++;                               //中断次数计数值，按一次键，中断33次
    data<<=1;                                 //但是键盘初始化后可能有一个中断，所以第一个是中断34次
    data|=((PINC&0x80)>>7);                   //读取每一个中断时的数据位
    //if((bitcount==0x22)&&(finish==0))        //有的键盘在初始化后会有一个下降沿中断
    //{
     // bitcount=0;
    //  finish=1;                              //只有在第一个键时调用此判断，多一个中断
     // data=data&0x03fc;
   //   data>>=2;
    //  get_code(data);                        //得到8位键码
    //   Decode(data2);	                     //将扫描码翻译成ASCII码
  //  }
    if(bitcount==0x21)//&&(finish==1))    //正常来说，都是33次中断
        {
      bitcount=0;
      finish=1;
      data=data&0x03fc;      //读取最后一个字节中的8位数据位，每次按键三个字节数据，第一个和第三个字节数据相同
      data>>=2;               //移位处理
      get_code(data);        //得到8位正常排序的数据位
       Decode(data2);	     //将扫描码翻译成ASCII码
    }
   
  }

//*************************************************************************
//                 主函数 
//*************************************************************************
void main(void) 
{ 
        system_init();                                //系统初始化，设置IO口属性
	    delay_nms(100);                                //延时100ms
  	    LCD_init();                                   //液晶参数初始化设置
        ps2_init();	                             //初始化PS2键盘接口 
        LCD_write_str(0,0,"The Keyvalue:");          //液晶初始界面
        delay_nms(2);
        SREG|=0x80;                                  //开全局中断
       while(1) 
   		{       
         LCD_write_char(4,1,key_value);             //单个字符输出显示，显示键值
  		} 
 
} 
