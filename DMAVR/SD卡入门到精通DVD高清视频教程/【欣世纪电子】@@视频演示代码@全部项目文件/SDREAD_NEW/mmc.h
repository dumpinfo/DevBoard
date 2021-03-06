//*************************************************************************************
//MMC/SD卡读写头文件mmc.h
//定义了SD卡的硬件连接、宏定义了MMC/SD卡常用命令、卡读写函数声明、返回代码(成功代码、错误代码)
//根据硬件连接不同，可以更改端口
//版本号：Ver1.0
//编译环境：AVR Studio 4.17 + WinAVR20100110
//作者：阿迪 www.avrgcc.com
//时间：2010.08.01
// *************************************************************************************

#include <avr/io.h>
#include <avr/iom128.h>


typedef unsigned char uint8;
typedef unsigned int uint16;
typedef unsigned long uint32;

/**********************************************************************
              MMC/SD卡硬件连接IO口分配情况
***********************************************************************/
#define MMC_CS_PORT			PORTG                  //CS片选信号端口
#define MMC_CS_DDR			DDRG                   //片选端口方向寄存器
#define MMC_Detect			PING                   //若有卡检测信号，则设置
#define MMC_CS_PIN			3                      //具体端口号，这里是PG3

#define CS_LOW()    MMC_CS_PORT &= ~(1<<MMC_CS_PIN)//拉低片选信号，选择对应的卡
#define CS_HIGH()   MMC_CS_PORT |=(1<<MMC_CS_PIN)  //释放选择的卡  
#define SPI_RXC     (IFG1 & URXIFG0)
#define SPI_TXC     (IFG1 & UTXIFG0)

#define SPI_RX_COMPLETE (SPSR & (1<<SPIF))
#define SPI_TX_READY    (SPSR & (1<<SPIF))
#define SPI_TX_DONE     while((SPSR & (1<<WCOL))==0)

#define DUMMY 0xff

/**********************************************************************
             数据传输开始标志，需要在读数据和写数据前进行检测
***********************************************************************/

#define MMC_START_DATA_BLOCK_TOKEN          0xfe   //数据传输开始标志位，开始单块读操作
#define MMC_START_DATA_MULTIPLE_BLOCK_READ  0xfe   //数据传输开始标志位，开始多块读操作
#define MMC_START_DATA_BLOCK_WRITE          0xfe   //数据传输开始标志位，开始单块写操作
#define MMC_START_DATA_MULTIPLE_BLOCK_WRITE 0xfc   //数据传输开始标志位，开始多块写操作
#define MMC_STOP_DATA_MULTIPLE_BLOCK_WRITE  0xfd   //数据传输停止标志位，停止多块写操作

// an affirmative R1 response (no errors)
#define MMC_R1_RESPONSE       0x00

/**********************************************************************
             返回成功或错误代码
***********************************************************************/

#define MMC_SUCCESS           0x00           //执行成功代码
#define MMC_BLOCK_SET_ERROR   0x01           //卡没有完全插入到卡座中
#define MMC_RESPONSE_ERROR    0x02
#define MMC_DATA_TOKEN_ERROR  0x03
#define MMC_INIT_ERROR        0x04
#define MMC_CRC_ERROR         0x10
#define MMC_WRITE_ERROR       0x11
#define MMC_OTHER_ERROR       0x12
#define MMC_TIMEOUT_ERROR     0xFF

/**********************************************************************
              MMC/SD卡命令
***********************************************************************/

#define MMC_GO_IDLE_STATE          0x40     //CMD0 MMC/SD卡上电后进入空闲模式
#define MMC_SEND_OP_COND           0x41     //CMD1 MMC卡初始化使用CMD1，可以用来判定SD卡还是MMC卡
#define MMC_CID                    0x48     //CMD8 SD卡版本判断信息，Ver1.x或者Ver2.x，如果对CMD8响应错误，则为Ver1.x
#define MMC_READ_CSD               0x49     //CMD9 读取扇区信息，Ver1.x只支持最大2GB，Ver2.x支持更大容量
#define MMC_SEND_CID               0x4a     //CMD10 MMC/SD卡鉴别信息，厂商ID、生产日期等等，不是必须
#define MMC_STOP_TRANSMISSION      0x4c     //CMD12 多块操作时停止命令
#define MMC_SEND_STATUS            0x4d     //CMD13 发送状态读取命令
#define MMC_SET_BLOCKLEN           0x50     //CMD16 设置读写块的长度
#define MMC_READ_SINGLE_BLOCK      0x51     //CMD17 读单块命令
#define MMC_READ_MULTIPLE_BLOCK    0x52     //CMD18 读多块
#define MMC_CMD_WRITEBLOCK         0x54     //CMD20 
#define MMC_WRITE_BLOCK            0x58     //CMD24 写单块
#define MMC_WRITE_MULTIPLE_BLOCK   0x59     //CMD25
#define MMC_WRITE_CSD              0x5b     //CMD27 写CSD寄存器
#define MMC_SET_WRITE_PROT         0x5c     //CMD28
#define MMC_CLR_WRITE_PROT         0x5d     //CMD29
#define MMC_SEND_WRITE_PROT        0x5e     //CMD30
#define MMC_TAG_SECTOR_START       0x60     //CMD32 擦除起始地址
#define MMC_TAG_SECTOR_END         0x61     //CMD33 擦除结束地址
#define MMC_UNTAG_SECTOR           0x62     //CMD34
#define MMC_TAG_EREASE_GROUP_START 0x63     //CMD35
#define MMC_TAG_EREASE_GROUP_END   0x64     //CMD36
#define MMC_UNTAG_EREASE_GROUP     0x65     //CMD37
#define MMC_EREASE                 0x66     //CMD38 擦除命令
#define MMC_READ_OCR               0x67     //CMD39 读OCR寄存器
#define MMC_CRC_ON_OFF             0x68     //CMD40 关闭CRC校验

#define SD_APP_COND                0x77     //CMD55  SD卡初始化，先写CMD55命令，再写AMD41命令
#define SD_APP_OP_COND             0x69     //ACMD41 初始化SD卡，MMC卡用CMD1

/********************************************************************************
                    函数声明区
********************************************************************************/
uint8 mmcGetResponse(void);
uint8 mmcGetXXResponse(uint8 resp);
uint8 mmcCheckBusy(void);
void spiInit(void);
uint8 spiSendByte(uint8 data);
uint8 mmcGoIdle();
uint8 initMMC (void);
uint8 mmcEreaseBlock(uint32 Sector);
void mmcSendCmd (uint8 cmd, uint32 data, uint8 crc);
uint8 mmcSetBlockLength (uint16 blocklength);
uint8 mmcReadBlock(uint32 address, uint16 count, uint8 *pBuffer);
#define mmcReadSector(sector, pBuffer) mmcReadBlock(sector*512ul, 512, pBuffer)  //读扇区函数，参数为扇区号与存放数据地址
uint8 mmcWriteBlock(uint32 address, uint16 count, uint8 *pBuffer);
#define mmcWriteSector(sector, pBuffer) mmcWriteBlock(sector*512ul, 512, pBuffer) //写扇区函数，参数为扇区号与需写入数据地址
uint8 mmcReadRegister(uint8 cmd_register, uint8 length, uint8 *pBuffer);
uint32 MMC_ReadCardSize(void);
