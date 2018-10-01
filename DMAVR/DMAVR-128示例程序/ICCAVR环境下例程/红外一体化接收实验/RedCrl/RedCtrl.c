//DMAVR-128的红外遥控器解码通信实验源程序,采用一体化红外接收头进行信号接收，查询方式
//数码管显示遥控器的键值
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
//			定义变量区
//***********************************************************************

#define uchar           unsigned char
#define uint            unsigned int

#define Data_IO	        PORTA                //数码管数据口
#define Data_DDR        DDRA                 //数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

#define Beep0           PORTD &= ~(1 << PD6)    //蜂鸣器所在IO口PD6
#define Beep1           PORTD |= (1 << PD6)

#define RED_IN	        DDRE &= ~(1 << PE3)		//设置输入，红外接收头接单片机PE3口
#define RED_OUT	        DDRE |= (1 << PE3)		//设置输出
#define RED_CLR	        PORTE &= ~(1 << PE3)	//置低电平
#define RED_SET	        PORTE |= (1 << PE3)		//置高电平
#define RED_R	        (PINE & (1 << PE3))		//读电平

uchar key;
uint temp_value;
uint temp,A;             		      //定义的变量,显示数据处理
uchar code_value=0;
uchar key_code[4]; 
uint l,p;

//***********************************************************************
//			共阴数码管显示的断码表0～F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

//***********************************************************************
//			遥控器键码，反码表
//***********************************************************************

#define KEY_0   0x03
#define KEY_1   0x07
#define KEY_2   0x0B
#define KEY_3   0x0F
#define KEY_4   0x13
#define KEY_5   0x17
#define KEY_6   0x1B
#define KEY_7   0x1F
#define KEY_8   0x23
#define KEY_9   0x27


//***********************************************************************
//			IO端口初始化
//***********************************************************************

void system_init(void)
{
    Data_IO=0xFF;             //数据口为输出
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573的控制口，设置为输出
    DDRD=0xFF;
 
	PORTB=0xFF;               //关LED
	DDRB=0xFF;

    DDRE=0xFF;

    RED_SET;
	RED_IN;
}

//*************************************************************************
//			74HC573控制数码管动态扫描显示函数，显示采集到的数据
//*************************************************************************

void Display_Key(uint data_KEY)
{
	 system_init();

     D_LE1;                    
     W_LE1;                    
     Data_IO=0x00;               
     W_LE0;                    
	 Data_IO=table[data_KEY];         
     D_LE0;                    
     delay_nms(1);                    
}

//*************************************************************************
//			遥控器键值赋功能值子程序
//*************************************************************************
 void Key_Icode(void)
 {
   switch(key_code[3])
   {
    case KEY_0:key=0;break;
	case KEY_1:key=1;break;
	case KEY_2:key=2;break;
	case KEY_3:key=3;break;
	case KEY_4:key=4;break;
	case KEY_5:key=5;break;
	case KEY_6:key=6;break;
	case KEY_7:key=7;break;
	case KEY_8:key=8;break;
	case KEY_9:key=9;break;
	default:key=10;break;
   }
 }

//*************************************************************************
//			遥控器解码子程序
//*************************************************************************

void Red_Code(void)
{
uchar i,j,k = 0;

 for(i = 0;i < 19;i++)
{
  delay_n100us(4);           //延时400us
  if(RED_R)                //9ms内有高电平，则判断为干扰，退出处理程序
  {
      return;
  }
}

while(!RED_R);            //等待9ms低电平过去



for(i=0;i<5;i++)          //是否连发码
{
  delay_n100us(4);
  delay_10us(); 
  delay_10us();
  delay_10us();
  if(!RED_R)
   {
     return;
   }
}


while(RED_R);               //等待4.5ms高电平过去

for(i = 0;i < 4;i++)        //接收4个字节的数据
{
  for(j = 0;j < 8;j++)      //每个字节的数据8位
  {
   

   while(!RED_R);         //等待变高电平
   while(RED_R)           //计算高电平时间
   {
    delay_100us();
    k++;
    if(k >= 22)           //高电平时间过长，则退出处理程序
    {
     return;              //
    }
    
   }

   code_value>>=1;        //接受一位数据
   if(k >= 8)
   {
    code_value|=0x80;   //高电平时间大于0.56，则为数据1
   }
   k = 0;                  //计时清零
  }
  key_code[i]=code_value;  //四个字节的数据
}

  Key_Icode();             //调用赋值函数

  Display_Key(key);        //显示按键值
  
  Beep0;                  //按键声音指示
  delay_nms(50);
  Beep1;
}


//*************************************************************************
//			主程序
//*************************************************************************
int main(void)
{
  system_init();         //系统初始化
  while(1)
 {
    Red_Code();          //调用遥控器解码子程序
   
 }

}
