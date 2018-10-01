//**********************************************************************
//SD卡读写中SPI接口相关函数V1.0
//编译环境：AVR Studio 4.17 + WinAVR 20100110
//作者：欣世纪电子 阿迪 http://www.avrgcc.com
//时间：2010.08.01
//版权：版权所有，转载请注明
//**********************************************************************

//**********************************************************************
//              相关头文件
//**********************************************************************

#include <avr/io.h>
#include <avr/iom128.h>
#include <avr/interrupt.h>
//#include <user/spi.h">

typedef unsigned char uint8;
typedef unsigned int uint16;
typedef unsigned long uint32;

volatile uint8 spiTransferComplete;  //传输完成标志

//**********************************************************************
//              函数声明
//**********************************************************************

void   spiInit(void);
uint8  spiSendByte(uint8 data);
uint16 spiTransferWord(uint16 data);

/***********************************************************************
函数功能：SPI采用中断的中断函数
操作内容：传输完成标志置1
***********************************************************************/

#ifdef SPI_USEINT
SIGNAL(SIG_SPI)
{
	spiTransferComplete = 1;
}
#endif

/***********************************************************************
函数功能：SPI初始化
操作内容：1、设置端口输入输出属性
		  2、设置SPI接口相关寄存器
          3、支持常用AVR单片机接口，兼容性增强，可扩展
***********************************************************************/

void spiInit()
{
#ifdef __AVR_ATmega128__ /*ATmega128单片机SPI接口初始化*/     

	PORTB |= (1 << PB1);  //设置SCK为1
    DDRB |= (1<<DDB1);    //设置SCK为输出
	DDRB &= ~(1<<DDB3);   //设置MISO为输入
	DDRB |= (1<<DDB2);    //设置MOSI为输出
	DDRB |= (1<<DDB0);    //主机模式下，设置SS为输出，可以控制SPI外设的片选信号
    PORTB |= (1 << PB0);  //拉高SS信号

#elif __AVR_ATmega8__    /*ATmega8单片机SPI接口初始化*/

    PORTB |= (1 << PB5);  //设置SCK为1
    DDRB |= (1<<DDB5);    //设置SCK为输出
	DDRB &= ~(1<<DDB4);   //设置MISO为输入
	DDRB |= (1<<DDB3);    //设置MOSI为输出
	DDRB |= (1<<DDB2);    //主机模式下，设置SS为输出，可以控制SPI外设的片选信号
    PORTB |= (1 << PB5);  //拉高SS信号

#else                    /*AVR其他单片机SPI接口初始化，如ATmega16*/

    PORTB |= (1 << PB7);  //设置SCK为1
    DDRB |= (1<<DDB7);    //设置SCK为输出
	DDRB &= ~(1<<DDB6);   //设置MISO为输入
	DDRB |= (1<<DDB5);    //设置MOSI为输出
	DDRB |= (1<<DDB4);    //主机模式下，设置SS为输出，可以控制SPI外设的片选信号
    PORTB |= (1 << PB4);  //拉高SS信号


#endif

    SPCR = (1<<MSTR)| (1<<SPR1) | (1<<SPE);  //SPI允许，主机模式，数据MSB在前，16分频
	
	spiTransferComplete = 1;

#ifdef SPI_USEINT        //如果选择使用中断方式
	SPCR |=(1<<SPIE);    //打开中断允许     
#endif
}

/***********************************************************************
函数功能：SPI低速模式
操作内容：1、晶振64分频
		  2、非倍速模式
***********************************************************************/

void spiLow(void)
{
	 SPCR = (1<<MSTR)| (1<<SPR1) | (1<<SPE);  //SPI允许，主机模式，数据MSB在前，16分频
	 SPSR &= ~(1<<SPI2X);                     //SPI2X为0，非倍速模式
}

/***********************************************************************
函数功能：SPI倍速模式
操作内容：1、晶振8分频
		  2、倍速模式
***********************************************************************/

void spiHigh(void)
{
	SPCR = (1<<MSTR)| (1<<SPR0) | (1<<SPE);  //SPI允许，主机模式，数据MSB在前，8分频
	SPSR |= (1<<SPI2X);                      //SPI2X为1，倍速模式
}

/***********************************************************************
函数功能：SPI字节传输函数
操作内容：数据从SPDR读出或者读入
***********************************************************************/

uint8 spiSendByte(uint8 data)
{
#ifdef SPI_USEINT                    //如果启用中断模式
	while(!spiTransferComplete);
	SPDR=data;                      //数据输出到SPDR
	spiTransferComplete = 0;
#else
    SPDR=data;                      //数据输出到SPDR
	while(!(SPSR & (1<<SPIF)));     //等待上次传输完成
#endif
    return SPDR;                     //返回SPDR值
	
}

/***********************************************************************
函数功能：SPI双字节传输函数
操作内容：先传输高字节，再传输低字节
***********************************************************************/

uint16 spiTransferWord(uint16 data)
{
	uint16 rxData = 0;

	rxData = (spiSendByte((data>>8) & 0x00FF))<<8;   //先传输高字节
	rxData |= (spiSendByte(data & 0x00FF));          //再传输低字节
	return rxData;
}
