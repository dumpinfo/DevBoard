//MMC/SD卡驱动程序，来源于AVR第三方库
//编译环境 AVR Studio 4.17/AVR GCC
//优化等级-0s，注意需设定为此等优化度
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14

/*! \file mmc.c \brief MultiMedia and SD Flash Card Interface. */
//*****************************************************************************
//
// File Name	: 'mmc.c'
// Title		: MultiMedia and SD Flash Card Interface
// Author		: Pascal Stang - Copyright (C) 2004
// Created		: 2004.09.22
// Revised		: 2006.06.12
// Version		: 0.1
// Target MCU	: Atmel AVR Series
// Editor Tabs	: 4
//
// NOTE: This code is currently below version 1.0, and therefore is considered
// to be lacking in some functionality or documentation, or may not be fully
// tested.  Nonetheless, you can expect most functions to work.
//
// This code is distributed under the GNU Public License
//		which can be found at http://www.gnu.org/licenses/gpl.txt
//
//*****************************************************************************

//***********************************************************************
//			包含文件
//***********************************************************************
#include <avr/io.h>			// include I/O definitions (port names, pin names, etc)
#include <avr/interrupt.h>	// include interrupt support

#include "user/global.h"		// include our global settings
#include "user/spi.h"		// include spi bus support

#include "user/rprintf.h"

#include "user/mmc.h"

// include project-specific hardware configuration
#include "user/mmcconf.h"

// Global variables

// Functions

//***********************************************************************
//			SD卡接口初始化
//***********************************************************************

void mmcInit(void)
{
	// initialize SPI interface
	spiInit();
	// release chip select
	sbi(MMC_CS_DDR, MMC_CS_PIN);
	sbi(MMC_CS_PORT,MMC_CS_PIN);
}
//***********************************************************************
//			SD卡初始化
//***********************************************************************
u08 mmcReset(void)
{
	u08 i;
	u08 retry;
	u08 r1=0;

	retry = 0;
	do
	{
		// send dummy bytes with CS high before accessing
		for(i=0;i<10;i++) spiTransferByte(0xFF);
		// resetting card, go to SPI mode
		r1 = mmcSendCommand(MMC_GO_IDLE_STATE, 0);
		#ifdef MMC_DEBUG
		rprintf("MMC_GO_IDLE_STATE: R1=0x%x\r\n", r1);
		#endif
		// do retry counter
		retry++;
		if(retry>10) return -1;
	} while(r1 != 0x01);

	// TODO: check card parameters for voltage compliance
	// before issuing initialize command

	retry = 0;
	do
	{
		// initializing card for operation
		r1 = mmcSendCommand(MMC_SEND_OP_COND, 0);
		#ifdef MMC_DEBUG
		rprintf("MMC_SEND_OP_COND: R1=0x%x\r\n", r1);
		#endif
		// do retry counter
		retry++;
		if(retry>100) return -1;
	} while(r1);
		
	// turn off CRC checking to simplify communication
	r1 = mmcSendCommand(MMC_CRC_ON_OFF, 0);
	#ifdef MMC_DEBUG
	rprintf("MMC_CRC_ON_OFF: R1=0x%x\r\n", r1);
	#endif

	// set block length to 512 bytes
	r1 = mmcSendCommand(MMC_SET_BLOCKLEN, 512);
	#ifdef MMC_DEBUG
	rprintf("MMC_SET_BLOCKLEN: R1=0x%x\r\n", r1);
	#endif

	// return success
	return 0;
}
//***********************************************************************
//			SD卡命令传送
//***********************************************************************
u08 mmcSendCommand(u08 cmd, u32 arg)
{
	u08 r1;


/*	// assert chip select
	cbi(MMC_CS_PORT,MMC_CS_PIN);
	// issue the command
	r1 = mmcCommand(cmd, arg);
	// release chip select
	sbi(MMC_CS_PORT,MMC_CS_PIN);  */
// release chip select
   sbi(MMC_CS_PORT,MMC_CS_PIN);
   //extra 8 CLK
   spiTransferByte(0xFF);
   // assert chip select
   cbi(MMC_CS_PORT,MMC_CS_PIN);
   // issue the command
   r1 = mmcCommand(cmd, arg);

	return r1;
}
//***********************************************************************
//			读SD卡一个扇区
//***********************************************************************
u08 mmcRead(u32 sector, u08* buffer)
{
	u08 r1;
	u16 i;

	// assert chip select
	cbi(MMC_CS_PORT,MMC_CS_PIN);
	for(i=0;i<10;i++) spiTransferByte(0xFF);
	// issue command
	r1 = mmcCommand(MMC_READ_SINGLE_BLOCK, sector<<9);
	#ifdef MMC_DEBUG
	rprintf("MMC Read Block R1=0x%x\r\n", r1);
	#endif
	// check for valid response
	if(r1 != 0x00)
		return r1;
	// wait for block start
	while(spiTransferByte(0xFF) != MMC_STARTBLOCK_READ);
	// read in data
	for(i=0; i<0x200; i++)
	{
		*buffer++ =spiTransferByte(0xFF);
	}
	// read 16-bit CRC
	spiTransferByte(0xFF);
	spiTransferByte(0xFF);
	// release chip select
	sbi(MMC_CS_PORT,MMC_CS_PIN);
	// return success
	return 0;
}
//***********************************************************************
//			写SD卡一个扇区
//***********************************************************************
u08 mmcWrite(u32 sector, u08* buffer)
{
	u08 r1;
	u16 i;

	// assert chip select
	cbi(MMC_CS_PORT,MMC_CS_PIN);
	// issue command
	r1 = mmcCommand(MMC_WRITE_BLOCK, sector<<9);
	#ifdef MMC_DEBUG
	rprintf("MMC Write Block R1=0x%x\r\n", r1);
	#endif
	// check for valid response
	if(r1 != 0x00)
		return r1;
	// send dummy
	spiTransferByte(0xFF);
	// send data start token
	spiTransferByte(MMC_STARTBLOCK_WRITE);
	// write data
	for(i=0; i<0x200; i++)
	{
		spiTransferByte(*buffer++);
	}
	// write 16-bit CRC (dummy values)
	spiTransferByte(0xFF);
	spiTransferByte(0xFF);
	// read data response token
	r1 = spiTransferByte(0xFF);
	if( (r1&MMC_DR_MASK) != MMC_DR_ACCEPT)
		return r1;
	#ifdef MMC_DEBUG
	rprintf("Data Response Token=0x%x\r\n", r1);
	#endif
	// wait until card not busy
	while(!spiTransferByte(0xFF));
	// release chip select
	sbi(MMC_CS_PORT,MMC_CS_PIN);
	// return success
	return 0;
}
//***********************************************************************
//			单个SD卡命令传送
//***********************************************************************
u08 mmcCommand(u08 cmd, u32 arg)
{
	u08 r1;
	u08 retry=0;
	// send command
	spiTransferByte(cmd | 0x40);
	spiTransferByte(arg>>24);
	spiTransferByte(arg>>16);
	spiTransferByte(arg>>8);
	spiTransferByte(arg);
	spiTransferByte(0x95);	// crc valid only for MMC_GO_IDLE_STATE
	// end command
	// wait for response
	// if more than 8 retries, card has timed-out
	// return the received 0xFF
	while((r1 = spiTransferByte(0xFF)) == 0xFF)
		if(retry++ > 8) break;
	// return response
	return r1;
}
//***********************************************************************
//			SD卡容量读取
//***********************************************************************

u32 MMC_SD_ReadCapacity()
{
	u08 r1;
	u16 i;
	u16 temp;
	u08 buffer[16];
	u32 Capacity;
	u16 retry =0;
	//uint8 retry=0;

	r1 = mmcSendCommand(9, 0);//写命令	//send command  //READ CSD
	if(r1 != 0x00)
		return r1;

	cbi(MMC_CS_PORT,MMC_CS_PIN);
	while(spiTransferByte(0xff) != 0xfe)if(retry++ > 0xfffe){sbi(MMC_CS_PORT,MMC_CS_PIN);return 1;}

	
	for(i=0;i<16;i++)
	{
		buffer[i]=spiTransferByte(0xff);
	}	

	spiTransferByte(0xff);
	spiTransferByte(0xff);
	
	spiTransferByte(0xff);
	
	sbi(MMC_CS_PORT,MMC_CS_PIN);

	spiTransferByte(0xff);// extra 8 CLK

/*********************************/
//	C_SIZE
	i = buffer[6]&0x03;
	i<<=8;
	i += buffer[7];
	i<<=2;
	i += ((buffer[8]&0xc0)>>6);

/**********************************/
//  C_SIZE_MULT

	r1 = buffer[9]&0x03;
	r1<<=1;
	r1 += ((buffer[10]&0x80)>>7);


/**********************************/
// BLOCKNR

	r1+=2;

	temp = 1;
	while(r1)
	{
		temp*=2;
		r1--;
	}
	
	Capacity = ((u32)(i+1))*((u32)temp);

/////////////////////////
// READ_BL_LEN

	i = buffer[5]&0x0f;

/*************************/
//BLOCK_LEN

	temp = 1;
	while(i)
	{
		temp*=2;
		i--;
	}
/************************/


/************** formula of the capacity ******************/
//
//  memory capacity = BLOCKNR * BLOCK_LEN
//	
//	BLOCKNR = (C_SIZE + 1)* MULT
//
//           C_SIZE_MULT+2
//	MULT = 2
//
//               READ_BL_LEN
//	BLOCK_LEN = 2
/**********************************************/

//The final result
	
	Capacity *= (u32)temp;	 
	return Capacity;		
}
