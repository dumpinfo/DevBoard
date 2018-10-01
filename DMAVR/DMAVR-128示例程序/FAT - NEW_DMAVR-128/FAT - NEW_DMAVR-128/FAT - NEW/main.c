//******************************************************************************
//基于DMAVR-128系统的MMC/SD卡的FAT16文件系统，支持建立TXT文件，写入数据,不支持FAT32
//采用SPI控制方式，MMC/SD卡作为存储器，进行读写，研究文件系统前需要掌握
//由于存在长整型数据，因此，要设定ICCAVR环境支持long型数据，设置project->options->Target，选中long
//SD卡仅仅支持2GB以下的卡，所以一定要注意，包括2GB，格式化时簇大小为16K
//读写完成后，蜂鸣器会响
//版本号：Ver2.0
//编译环境：ICCAVR 7.22A
//作者：www.avrgcc.com
//时间：2012.06.01
//版权：欣世纪电子版权所有，转载请注明出处
//******************************************************************************

#include <string.h>
#include <stdio.h>
#include <iom128v.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <SD.h>
#include "libtypes.h"		// include our global settings
#include <delay.h>
#include <fat16.h>

#define SoundON             PORTD &= ~(1 << PD6)    		//蜂鸣器所在IO口PD6
#define SoundOFF            PORTD |= (1 << PD6)



uint16 BlockLength=512; //MMC/SD卡块大小，CSD寄存器记录了卡本身允许的大小，一般为512
uint32 cardSize = 0;    //初始化MMC/SD卡容量为0
uint8 status = 1;       //状态变量
uint16 timeout = 0;        
uint8 buffer1[512];     //写入数据缓冲区，由于空间足够，因此分别开辟写入和读出缓冲区
uint8 buffer2[512];     //读出数据缓冲区，由于空间足够，因此分别开辟写入和读出缓冲区
uint8 BUFFER[512];
uint32 numSector=200;	//向SD卡中写入数据的地址，为扇区数，对于一个扇区为512字节的SD卡实际地址为numSector*512字节
void uartInit();
int putchar(char c);
int getchar(void);
uint32 MMC_ReadCardSize(void);

void SoundSuccess(void)
{
   SoundON;
   delay_nms(500);
   SoundOFF;
   SoundON;
   delay_nms(500);
   SoundOFF;
   SoundON;
   delay_nms(500);
   SoundOFF;
}

/*************************************************
函数功能：主函数
操作内容：1、初始化系统时钟,内部或者外部时钟皆可
          2、调用函数,启动MMC/SD控制和FAT文件系统
*************************************************/
int main( void )
{
  uint16 i;
  uint8 getchar,success=0;

  uartInit();                 //串口初始化
  printf("DMAVR-128读写MMC/SD卡数据实验\r\n");
  printf("DMAVR-M128 初始化成功!\r\n");
  printf("等待初始化MMC/SD卡……\r\n");

  PORTD=0xff;                                       //PD设置为输出
  DDRD=0xff;

  while (status != 0)         // 如果返回非零值，则表示出错，SD卡继续重新初始化                                           
  {
    status = initMMC();
    timeout++;
    if (timeout == 50)       //初始化50次MMC/SD卡，如果依然返回错误代码，则初始化失败，可能是没有SD卡或损坏
    {
      printf("MMC/SD卡初始化失败!\r\n");   //初始化失败显示
	  printf("请检查SD卡是否存在或者复位系统!\r\n");
	  while(1);   		
      break;                                          //50次满则退出
    }
  }
 
  printf("初始化MMC/SD卡成功!\r\n");                  //初始化成功显示提示信息
 
  cardSize =  MMC_ReadCardSize();                     //从CSD寄存器读取MMC/SD卡容量大小，返回长整型
  printf("卡容量=%ld\r\n",cardSize);				  //输出SD卡容量，单位:字节
  ReadBPB();
  FormatCard();                //格式化MMC/SD卡，需要时使用，建议在此处打开，可以每次上电时格式化一次，格式化时间会比较长
  CreateFile("TEST0009TXT");                          //创建文件TEST0009.TXT，文件名长度8位，后缀名3位，必须大写
  for (i = 0; i <= 512; i++) buffer1[i] = 'A';        //以下函数为向建立的文件中写入数据，可以根据需要更改
  OperateFile(1,"TEST0009TXT",0,512,buffer1);
  for (i = 0; i <= 512; i++) buffer1[i] = 'B';  
  OperateFile(1,"TEST0009TXT",512,512,buffer1);
  for (i = 0; i <= 512; i++) buffer1[i] = 'C';  
  OperateFile(1,"TEST0009TXT",1024,512,buffer1);
  for (i = 0; i <= 512; i++) buffer1[i] = 'D';  
  OperateFile(1,"TEST0009TXT",1536,512,buffer1); 
  for (i = 0; i <= 512; i++) buffer1[i] = 'E';  
  OperateFile(1,"TEST0009TXT",2048,512,buffer1); 
  
  SoundSuccess();                  //完成提示音，响三声
  
/*以下部分不执行，实际功能是向SD卡中读写数据测试功能，SD卡数据读写实验就是这样的，如有疑问，请看SD卡视频教程*/
/*去掉while(1);语句可以启用，要借助串口，在电脑上可以看到数据，通过串口调试助手显示*/
while(1);
while(1)
 {
  printf("请输入要写入MMC/SD卡的字符数据!\n");
 
  scanf("%c",&getchar);                               //将从串口输入的数据写入SD卡，数据为单个字符，如a
 
  printf("要写入的字符是： %c\n",getchar) ;

  buffer1[0]=getchar;                                 //将串口输入的数据赋予buffer1，准备写入SD卡

  printf("DMAVR-M128开始读写MMC/SD卡，请查看结果!\n");

  for(i=1;i<512;i++)
   {
    	buffer1[i]=buffer1[0];   	                  //将输入的数据填充在整个数据缓冲区buffer1
    }

  mmcWriteBlock (numSector, BlockLength, buffer1);    //向指定扇区地址(numSector*512)写入数据    			  

  mmcReadBlock(numSector, BlockLength, buffer2);	  //读取刚才写入空间的数据，判断是否写入成功

 for(i=0;i<BlockLength;i++)
   {
    	printf ("Data=%c \r",buffer2[i]);			  //输出从MMC/SD卡读出的数据
   }
  printf ("\n");

 for(i=0;i<BlockLength;i++)                                   //判断读写是否成功，读出和写入数据是否一致
 	{

 		if(buffer1[i]!=buffer2[i])                    //数据读写失败
 			{
				printf("读写数据失败!\n");
				success=0;
				break;
 			 }
 		else success=1;
 	}
 if(success==1)  printf("读写数据成功!\n");           //数据读写成功
 
 }

}
