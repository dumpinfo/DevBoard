//DMAVR-128的SPI应用示例程序，采用SPI接口的DAC芯片TLC5615，连续进行电压转换
//DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615,SPI接口连接方式
//驱通过SPI接口，动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换
//LED指示灯DS3对应从暗到亮，表示电压逐渐增大
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

#define cs0   PORTB &= ~(1 << PB0)          //片选信号置低
#define cs1   PORTB |= (1 << PB0)           //片选信号置高

#define Data_IO	        PORTA                //数码管数据口
#define Data_DDR        DDRA                 //数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

uint da_data;
uchar count=0;
uint da_data2;
//*************************************************************************
//			初始化子程序
//*************************************************************************
void system_init()
{
 	 D_LE1;                             //关掉数码管，以免显示乱码                   
     W_LE1;                     
     Data_IO=0xFF;                      //关数码管            
     W_LE0; 

	PORTB = 0x00;		         		//电平设置
	DDRB = 0xFF;		         		//方向输出

}
void SPI_init()
{
  SPCR=(1<<SPE)|(1<<MSTR);              //主机方式，SPI模式为0，SCK频率为Fosc/4
  
}


//*************************************************************************
//			主程序
//*************************************************************************

void main(void)
{ 
  system_init();                               //系统IO口初始化
  SPI_init();                                  //SPI初始化
  while(1)
  {
    for(da_data=0x0000;da_data<0x03ff;da_data++)
    {
	  da_data = da_data<<2;
      cs0;                                    //使能DAC
      da_data2=(da_data&0xff00);               //提取数据的高8位
      da_data2>>=8;                            //高8位移到低8位，便于赋值
      SPDR=da_data2;                           //写数据的高8位到SPI数据寄存器
      delay_nms(1);
      SPDR=da_data&0x00ff;                    //写数据的低8位到SPI数据寄存器
      delay_nms(1);
      cs1;
      da_data = da_data>>2; 
	       // delay_ms(1);                             //关闭使能
    }
  }
}
