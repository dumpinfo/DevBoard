//SD卡驱动函数，采取网络上开源的第三方库文件
//忠兴电子元件店略作修改，由于部分SD卡并非标准SD卡命令，因此可能存在兼容性问题，建议使用金士顿SD卡
//SD卡片选信号SD_CS在mmcconf.h文件中修改，ATMEGA128为PG3脚控制SD_CS
//***********************************************************************
//			包含文件
//***********************************************************************
#include "libtypes.h"		// include our global settings
#include "DM_spi.h"			// include spi bus support
#include "mmc.h"
#include "mmcconf.h"	   // include project-specific hardware configuration
#include <stdio.h>
#include <iom128v.h>

#define   set(x)                (1<<(x))
#define   sbi(temp,x)    		temp|=(1<<(x))     //置位
#define   clr(x)                (~(1<<(x)))
#define   cbi(temp,x)     		temp&=~(1<<(x))    //清零
//***********************************************************************
//			IO口初始化
//***********************************************************************
void McuInit()
{
	PORTB=0XFF;
	DDRB=0XFF;
}

//***********************************************************************
//			SD卡初始化
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
//			识别SD卡是否存在
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
		//rprintf("MMC_GO_IDLE_STATE: R1=0x%x\r\n", r1);
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
		//rprintf("MMC_SEND_OP_COND: R1=0x%x\r\n", r1);
		#endif
		// do retry counter
		retry++;
		if(retry>100) return -1;
	} while(r1);
		
	// turn off CRC checking to simplify communication
	r1 = mmcSendCommand(MMC_CRC_ON_OFF, 0);
	#ifdef MMC_DEBUG
	//rprintf("MMC_CRC_ON_OFF: R1=0x%x\r\n", r1);
	#endif

	// set block length to 512 bytes
	r1 = mmcSendCommand(MMC_SET_BLOCKLEN, 512);
	#ifdef MMC_DEBUG
	//rprintf("MMC_SET_BLOCKLEN: R1=0x%x\r\n", r1);
	#endif

	// return success
	return 0;
}

//***********************************************************************
//			发送SD卡命令函数
//***********************************************************************

u08 mmcSendCommand(u08 cmd, u32 arg)
{
	u08 r1;

	// assert chip select
	cbi(MMC_CS_PORT,MMC_CS_PIN);
	// issue the command
	r1 = mmcCommand(cmd, arg);
	// release chip select
	sbi(MMC_CS_PORT,MMC_CS_PIN);

	return r1;
}

//***********************************************************************
//			读SD卡数据函数，扇区读，一次512个字节
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
	//rprintf("MMC Read Block R1=0x%x\r\n", r1);
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
//			向SD卡中指定地址写数据，扇区写，一次512个字节
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
	//rprintf("MMC Write Block R1=0x%x\r\n", r1);
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
		spiTransferByte(*buffer);   //为了节省空间，只写入buffer[0]的数据，若写入512个不同数据，改为*buffer++
	}
	// write 16-bit CRC (dummy values)
	spiTransferByte(0xFF);
	spiTransferByte(0xFF);
	// read data response token
	r1 = spiTransferByte(0xFF);
	if( (r1&MMC_DR_MASK) != MMC_DR_ACCEPT)
		return r1;
	#ifdef MMC_DEBUG
	//rprintf("Data Response Token=0x%x\r\n", r1);
	#endif
	// wait until card not busy
	while(!spiTransferByte(0xFF));
	// release chip select
	sbi(MMC_CS_PORT,MMC_CS_PIN);
	// return success
	return 0;
}

//***********************************************************************
//			单命令传送函数
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
//			SD卡容量读取函数，返回容量数
//***********************************************************************

u32 mmcCapacity()
{
	u08 r1;
	u16 i;
	u16 temp;
	u08 buffer[16];
	u32 Capacity;
	u16 retry =0;

	r1 = mmcSendCommand(9, 0);						//写命令	
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


// READ_BL_LEN

	i = buffer[5]&0x0f;


//BLOCK_LEN

	temp = 1;
	while(i)
	{
		temp*=2;
		i--;
	}


//The final result
	
	Capacity *= (u32)temp;	 
	return Capacity;		
}
