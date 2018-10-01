//******************************************************************************
//MMC/SD卡驱动，SPI模式下MMC/SD卡驱动，可识别MMC/SD卡类型
//版本号：Ver1.0
//编译环境：ICCAVR 7.22A
//作者：www.avrgcc.com
//时间：2010.08.01
//******************************************************************************  

#include <SD.h>           //配置头文件，配置CS片选信号等，根据硬件调整相关IO口
#include <math.h>

/***********************************************************************
函数功能：MMC/SD卡初始化
操作内容：1、拉高CS片选和MOSI至少74个时钟周期
          2、SPI发送10个FF
***********************************************************************/
uint8 initMMC (void)
{
  int i;
  spiInit();                          //初始化SPI接口，准备与MMC/SD卡通信
 
  MMC_CS_DDR |= (1<<MMC_CS_PIN);      //MMC/SD卡片选IO设置输出模式
  CS_HIGH();                          //MMC/SD卡片选IO设置为1，拉高   
 for(i=0;i<=9;i++)
  spiSendByte(0xff);                  //上电后进行一个延时，至少74个时钟周期
  return (mmcGoIdle());
}

/***********************************************************************
函数功能：MMC/SD卡空闲模式及初始化
操作内容：1、初始化MMC/SD卡工作在SPI模式，无论MMC还是SD卡都发送CMD0进行复位
          2、判断MMC卡还是SD卡
          3、SD卡循环10次发送CMD55+ACMD41，MMC卡发送CMD1
***********************************************************************/
uint8 mmcGoIdle()
{
  uint8 response=0x01;
  uint8 i;
  uint8 sdcard=0x00;                               //SD卡标志位，为0表示SD卡，为1表示为MMC卡
  CS_LOW();                                        //选中MMC/SD卡，拉低片选，进入SPI模式，默认为MMC/SD模式
  mmcSendCmd(MMC_GO_IDLE_STATE,0,0x95);            //发送CMD0，复位MMC/SD卡，0x95为CRC值

  if(mmcGetResponse()!=0x01)                       //CMD0命令的返回值为0x01则继续下一个命令
    return MMC_INIT_ERROR;

  while(response==0x01)
  {
    CS_HIGH();
    spiSendByte(0xff);
    CS_LOW();
  if(sdcard==0x00)                                //先识别是否为SD卡，发送SD卡命令CMD55+ACMD41
  {
   for(i=0;i<10;i++)                              //循环10次，如果为SD卡，一般2次即可正确返回0x00
   {
    mmcSendCmd(SD_APP_COND,0x00,0xff);            //发送SD卡CMD55命令，接下来应用激活初始化命令ACMD41
    while(mmcGetResponse()!=0x01);                //返回值为0x01，则表示处于空闲状态，再发ACMD41命令
    
    mmcSendCmd(SD_APP_OP_COND,0x00,0xff);         //发送ACMD41命令，激活初始化
    if(mmcGetResponse()==0x00)                    //返回值为0x00，则初始化成功，否则使用MMC命令CMD1继续初始化
     {
      CS_HIGH();
      spiSendByte(0xff);
      return (MMC_SUCCESS);                       //返回初始化成功代码
     }
   }
   sdcard=0x01;                                   //为1表示SD卡命令无效，卡为MMC卡，准备下面发送CMD1命令
  }
    response=0x01;                                //准备发送MMC卡命令CMD1
    mmcSendCmd(MMC_SEND_OP_COND,0x00,0xff);       //发送MMC卡CMD1命令，成功则返回0x00
    response=mmcGetResponse();                    //返回值为0x00，则表示MMC卡初始化成功
  }
  
  CS_HIGH();                                      //MMC/SD卡片选无效
  spiSendByte(0xff);
  return (MMC_SUCCESS);                           //返回初始化成功代码
}

/***********************************************************************
函数功能：MMC/SD卡发送命令后返回的响应值
操作内容：1、SPI模式下响应值长度1~8bytes，参考SD卡手册关于响应值的描述
          2、响应值最高位总是为0，紧跟着为错误代码
          3、如果响应值为FF，则表示命令无效或超时
***********************************************************************/
uint8 mmcGetResponse(void)
{
  int i=0;
  uint8 response;

  while(i<=64)
  {
    response=spiSendByte(0xff);
    if(response==0x00)break;
    if(response==0x01)break;
    i++;
  }
  return response;
}

/***********************************************************************
函数功能：MMC/SD卡发送读写数据命令后返回的响应值
操作内容：1、SPI模式下响应值长度1~8bytes，参考SD卡手册关于响应值的描述
          2、响应值最高位总是为0，紧跟着为错误代码
          3、响应之前，数据一直为0xff
***********************************************************************/

uint8 mmcGetXXResponse(uint8 resp)
{
  int i=0;
  uint8 response;

  while(i<=1000)
  {
    response=spiSendByte(0xff);
    if(response==resp)break;
    i++;
  }
  return response;
}

/***********************************************************************
函数功能：MMC/SD卡判忙程序
操作内容：1、SPI模式下响应值长度1~8bytes，参考SD卡手册关于响应值的描述
          2、响应值最高位总是为0，紧跟着为错误代码
          3、如果响应值为FF，则表示命令无效或超时
          4、进行数据块写入的时候，写入数据后都会有响应值，定义了错误代码
***********************************************************************/

uint8 mmcCheckBusy(void)
{

  int i=0;

  uint8 response;
  uint8 rvalue;
  while(i<=64)
  {
    response=spiSendByte(0xff);
    response &= 0x1f;
    switch(response)
    {
      case 0xe5: rvalue=MMC_SUCCESS;break;      //表示MMC/SD卡正确成功接收数据
      case 0xeb: return(MMC_CRC_ERROR);         //表示CRC校验错误，数据被拒绝
      case 0xed: return(MMC_WRITE_ERROR);       //表示MMC/SD卡写错误，数据被拒绝
      default:
        rvalue = MMC_OTHER_ERROR;               //其他错误
        break;
    }
    if(rvalue==MMC_SUCCESS)break;
    i++;
  }
  i=0;
  do
  {
    response=spiSendByte(0xff);
    i++;
  }while(response==0);
  return response;
}

/***********************************************************************
函数功能：MMC/SD卡数据擦除函数
操作内容：1、包括读取的地址、长度以及存入的缓冲区
		  2、数据擦除需要设定块区间，没有直接全盘擦除命令
          3、数据后面是16位CRC值
		  4、块大小要大于512个字节，擦除后数据可能是0x00或0xff
***********************************************************************/
uint8 mmcEreaseBlock(uint32 Sector)
{
	uint8 response=0x01;

    CS_LOW ();
	
	mmcSendCmd(MMC_TAG_SECTOR_START,Sector*512,0xff);         //需要擦除的起始地址

	mmcSendCmd(MMC_TAG_SECTOR_END,(Sector+1)*512,0xff);       //需要擦除的结束地址

	mmcSendCmd(MMC_EREASE,0x00,0xff);                         //发送块擦除命令，使用CMD38命令    
 
  while(mmcGetResponse()!=0);

    response=0;
  
	CS_HIGH();
	
	return response;
}


/***********************************************************************
函数功能：MMC/SD卡单块数据读取
操作内容：1、包括读取的地址、长度以及存入的缓冲区
		  2、块大小可以设置，若为512，可以认为是一个标准扇区大小
          3、数据后面是16位CRC值
***********************************************************************/

uint8 mmcReadBlock(uint32 address, uint16 count, uint8 *pBuffer)
{
  unsigned long i = 0;
  uint8 rvalue = MMC_RESPONSE_ERROR;

  if (mmcSetBlockLength (count) == MMC_SUCCESS)  //设置MMC/SD卡块长度,全局变量BlockLength
  {

    CS_LOW ();

    mmcSendCmd (MMC_READ_SINGLE_BLOCK,address*512, 0xFF); //发送读单块操作命令CMD17，实际地址是扇区号numSector*512
    if (mmcGetResponse() == 0x00)                         //返回值为00，表示发送命令被成功接收
    {
      if (mmcGetXXResponse(MMC_START_DATA_BLOCK_TOKEN) == MMC_START_DATA_BLOCK_TOKEN) //接收数据包开始标志，为0xfe
      {
        for (i = 0; i < count; i++)
          pBuffer[i] = spiSendByte(0xff);   // 接收读出的数据

        spiSendByte(0xff);                  //16位CRC值
        spiSendByte(0xff);                  //16位CRC值，不是真正的CRC值，这里忽略，但是实际数据后面跟16位CRC值
        rvalue = MMC_SUCCESS;               //接收成功，返回成功代码
      }
      else
      {
        rvalue = MMC_DATA_TOKEN_ERROR;      // 如果没有收到数据包的开始标志，则返回错误代码
      }
    }
    else
    {
      rvalue = MMC_RESPONSE_ERROR;          //返回命令未成功接收错误代码
    }
  }
  else
  {
    rvalue = MMC_BLOCK_SET_ERROR;           //返回卡块长度设置失败错误代码
  }
  CS_HIGH ();
  spiSendByte(0xff);
  return rvalue;                            //返回读取函数代码
}



/***********************************************************************
函数功能：MMC/SD卡单块数据写入
操作内容：1、包括读取的地址、长度以及存入的缓冲区
		  2、块大小可以设置，若为512，可以认为是一个标准扇区大小
          3、数据后面是16位CRC值
***********************************************************************/

uint8 mmcWriteBlock(uint32 address, uint16 count, uint8 *pBuffer)
{
  unsigned long i = 0;
  uint8 rvalue = MMC_RESPONSE_ERROR;         

  if (mmcSetBlockLength (count) == MMC_SUCCESS)    //设置MMC/SD块的长度，全局变量BlockLength
  {
    CS_LOW ();									   //拉低片选信号，多个卡，选择需要操作的片选拉低
    mmcSendCmd (MMC_WRITE_BLOCK,address*512, 0xFF);//发送单块写数据命令CMD24，地址为扇区numSector*512

    if (mmcGetXXResponse(MMC_R1_RESPONSE) == MMC_R1_RESPONSE) //收到返回值，检查MMC/SD卡是否正确接收命令
    {
      spiSendByte(0xff);
      spiSendByte(0xfe);                           //发送数据起始标志0xfe，表示接下来是数据包，一个块长度的数据

      for (i = 0; i < count; i++)                  //写一个块长度的数据到MMC/SD卡
        spiSendByte(pBuffer[i]);            

      spiSendByte(0xff);                           //传送16位CRC值，不是必须的，可以不用些真实CRC值
      spiSendByte(0xff);
      mmcCheckBusy();                              //MMC/SD卡判忙，返回参数参考对应函数，这里不存取
      rvalue = MMC_SUCCESS;                        //操作成功
    }
    else
    {
      rvalue = MMC_RESPONSE_ERROR;   			   //接收命令失败，返回错误代码
    }
  }
  else
  {
    rvalue = MMC_BLOCK_SET_ERROR;                  //设置块长度失败，返回错误代码
  }

  CS_HIGH ();                                      //拉高片选，释放SD卡
  spiSendByte(0xff);                               //小延时
  return rvalue;                                   //函数状态返回值
} 

/***********************************************************************
函数功能：MMC/SD卡命令发送函数
操作内容：1、发送整个长度为48位的MMC/SD卡命令
		  2、实际命令长度是6位，48位中还包括命令的参数，不同命令参数不同
***********************************************************************/

void mmcSendCmd (uint8 cmd, uint32 data, uint8 crc)
{
  uint8 frame[6];                                  //MMC/SD卡命令长度为48位,6个字节
  uint8 temp;
  int i;
  frame[0]=(cmd|0x40);                             //命令格式中最高的两位为01，对于单字节来说，"或"上0x40
  for(i=3;i>=0;i--)                                //4个字节长度的参数，或没有，或为地址，不同命令下参数不同
  	{
    	temp=(uint8)(data>>(8*i));
    	frame[4-i]=(temp);
  	}
  frame[5]=(crc);                                  //1个字节的CRC值
  for(i=0;i<6;i++)
    	spiSendByte(frame[i]);                     //传送命令
}

/**********************************************************************
函数功能：MMC/SD卡块长度设置
操作内容：1、设置块长度，必须为2^n大小，一般为512
		  2、对于RAM小的单片机，可以定义小的块长度，这样节省数据空间
***********************************************************************/

uint8 mmcSetBlockLength (uint16 blocklength)
{

  CS_LOW ();                                       //选中SD卡片选信号
  mmcSendCmd(MMC_SET_BLOCKLEN, blocklength, 0xFF); //传送设置块长度命令CMD16
  if(mmcGetResponse()!=0x00)                       //命令传送不成功，则重新复位MMC/SD卡，然后重新设置
  	{ 
  		initMMC();
    	mmcSendCmd(MMC_SET_BLOCKLEN, blocklength, 0xFF);
    	mmcGetResponse();
  	}

  CS_HIGH ();                                      //释放MMC/SD卡
 
  spiSendByte(0xff);                               //8个时钟的延时

  return MMC_SUCCESS;                              //返回操作成功命令
} 

/**********************************************************************
函数功能：读CSD或者CID寄存器值
操作内容：1、CSD和CID寄存器记录了卡的相关信息
		  2、可以通过CSD卡获取卡的容量
***********************************************************************/

uint8 mmcReadRegister (uint8 cmd_register, uint8 length, uint8 *pBuffer)
{
  uint8 i = 0;
  uint8 rvalue = MMC_TIMEOUT_ERROR;

  if (mmcSetBlockLength (length) == MMC_SUCCESS)   //设置块长度
  {
    CS_LOW ();

    mmcSendCmd(cmd_register, 0x00, 0xff);          //发送对寄存器操作命令

    if (mmcGetResponse() == 0x00)                  //返回成功代码
    {
      if (mmcGetXXResponse(MMC_START_DATA_BLOCK_TOKEN)==MMC_START_DATA_BLOCK_TOKEN) //数据起始标志位，0xfe
        for (i = 0; i < length; i++)
          pBuffer[i] = spiSendByte(0xff);          //读取数据，即寄存器的值
      spiSendByte(0xff);                           //16位CRC值，不是必须的
      spiSendByte(0xff);
      rvalue = MMC_SUCCESS;                        //返回成功代码
    }
    else
      rvalue = MMC_RESPONSE_ERROR;                 //操作命令不成功，返回错误代码

    CS_HIGH ();                                    //释放MMC/SD卡

    spiSendByte(0xff);							   //延时8个时钟周期
  }
  CS_HIGH ();                                      //释放MMC/SD卡
  return rvalue;                                   //返回状态值
} 

/**********************************************************************
函数功能：MMC/SD卡容量读取
操作内容：1、先获取CSD寄存器数据
		  2、根据容量计算公式获取容量大小
		  3、容量大小为用户使用空间大小，不包括保护区
***********************************************************************/

uint32 MMC_ReadCardSize(void)
{

  uint32 MMC_CardSize;
  uint16 i, j,b,response,mmc_C_SIZE=0;     

  uint8 mmc_READ_BL_LEN=0;         				  //块大小
  uint8 mmc_C_SIZE_MULT=0;         				  //乘数大小

  CS_LOW ();
  
  mmcSendCmd(MMC_READ_CSD, 0x00, 0xff);			  //发送读取CSD寄存器命令CMD9

  response = mmcGetResponse();

  b = spiSendByte(0xFF);                          //读取返回值，数据开始标志总是0xfe

  if( !response )
  {
    while (b != 0xfe) b = spiSendByte(0xff);      //等待接收到数据起始标志位

    for(j=5; j>0; j--)                            //前5个字节的数据不用，Bit[127:88]
      b = spiSendByte(0xff);

    b =spiSendByte(0xff);                         
    mmc_READ_BL_LEN = b & 0x0F;                   //Bit[83:80]记录了块大小，参考CSD寄存器相关说明

    b = spiSendByte(0xff);

    mmc_C_SIZE = (b & 0x03) << 10;               //Bit[73:62]记录了C_SIZE的大小，参考CSD寄存器说明
    b = spiSendByte(0xff);
    mmc_C_SIZE += b << 2;
    b = spiSendByte(0xff);
    mmc_C_SIZE += b >> 6;

    b = spiSendByte(0xff);


    mmc_C_SIZE_MULT = (b & 0x03) << 1;           //Bit[49:47]记录了乘数的大小
    b = spiSendByte(0xff);
    mmc_C_SIZE_MULT += b >> 7;


    b = spiSendByte(0xff);                       //之后的数据与容量无关

    b = spiSendByte(0xff);

    b = spiSendByte(0xff);

    b = spiSendByte(0xff);

    b = spiSendByte(0xff);

  }

  for(j=4; j>0; j--)          					// 主机至少保持32个时钟周期的SCK
    b = spiSendByte(0xff);  					 
                               					
  b = spiSendByte(0xff);
  CS_LOW ();

  MMC_CardSize = (mmc_C_SIZE + 1);              //卡容量计算，参考容量计算公式

  for(i = 2,j=mmc_C_SIZE_MULT+2; j>1; j--)      //容量大小：块长度×块数量，不含保护区，一般保护区为总大小的1%
    i <<= 1;
  MMC_CardSize *= i;

  for(i = 2,j=mmc_READ_BL_LEN; j>1; j--)
    i <<= 1;
  MMC_CardSize *= i;

  return MMC_CardSize;                        //返回容量值大小，单位为字节

}


