//DMAVR-128的读写SD卡数据实验，给指定地址写入指定数据，采取扇区读写的模式，一次512字节
//要写入SD卡的数据通过串口写入，使用串口调试助手，波特率9600，8位数据，1位停止位，无校验方式
//初始化SD卡成功后，将出现Please Input the Data Want to Write to SD字符样，此时通过串口调试助手发送任意字符即可
//数据写入SD卡后，又读出来显示到串口调试助手，通过对比可以判断写入是否成功
//由于存在长整型数据，因此，要设定ICCAVR环境支持long型数据，设置project->options->Target，选中long
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <SDData_main.h>


u32 sectorwr=200;	//向SD卡中写入数据的地址，为扇区数，对于一个扇区为512字节的SD卡实际地址为sectorwr*512字节
u08 buffer1[1]={0x08};  //向SD卡中写入的数据，这里只定义了一个字节的长度，可以定义为512个字节长度	
u08 buffer2[512];   	//读取数据存放区
u32 SD_Size;            //SD卡容量读取存储变量
int i;
//***********************************************************************
//		关闭数码管函数，为了数码管不显示乱码，属于初始化函数
//***********************************************************************

void LED_Off()
{
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //关掉数码管，以免显示乱码                   
    W_LE1;                     
    Data_IO=0xFF;                      //关数码管            
    W_LE0; 
}

//***********************************************************************
//			主函数，调用SD卡读写函数
//***********************************************************************

void main(void)
{

 u16 i,retry;
 u08 a;
 McuInit();					  							  //IO楼初始化
 //delay_nms(500);
 //LED_Off(); 
 UART_Init();                 							  //串口初始化
 LED_Off();               							  //关数码管
 printf("DMAVR-128读写SD卡数据实验\r\n");
 printf("DMAVR-M128 Initialize Success!\r\n");
 printf("Waiting Initialize SD……\r\n");
 delay_nms(500);
 mmcInit();
 mmcInit();
 delay_nms(50);
 while(mmcReset())			 							  //初始化SD卡					
	{
		retry++;
		if(retry>20)
		{
			printf("DMAVR-M128 Initialize SD Failure!\r\n");//初始化失败显示
			printf("Please Checking the SD or Reset the System!\r\n");

			while(1)   		
			{
				
			}
		}
	} 
 printf("DMAVR-M128 Initialize SD Success!\r\n");         //初始化成功显示提示信息
 SD_Size=mmcCapacity();
 printf ("Size=%ld\r\n",SD_Size);							//输出SD卡容量，单位字节
while(1)
 {
 printf("Please Input the Data Want to Write to SD!\r\n");
 //printf("The Data is:");
 //scanf("%c",&a);                                        //将从串口输入的数据写入SD卡，数据为单个字符，如a
 a=getchar();
 //printf("\n");
 printf("The Data Write to SD is %c\r\n",a) ;
 buffer1[0]=a;                                          //将串口输入的数据赋予buffer1，准备写入SD卡
 printf("DMAVR-M128 Starting Read and Write SD!\r\n");

 mmcWrite(sectorwr,buffer1);         					//向指定地址(sectorwr*512)写入数据
 delay_nms(1000);
 mmcRead(sectorwr,buffer2);								//读取刚才写入空间的数据，判断是否写入成功
 for(i=0;i<512;i++)
   {
   		printf ("Data=%c \r",buffer2[i]);				//输出读出的数据
   }
 printf ("\r\n");
 if(buffer1[1]=buffer2[1])
 {
 	printf("Write Data Success!\r\n");
//	printf("Please Take Out the SD!\n");
 }
 else
 {
 	printf("Write Data Failure!\n");

 }
 
 }

}

