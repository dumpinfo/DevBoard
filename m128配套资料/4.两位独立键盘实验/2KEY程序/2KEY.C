//ATMEGA128的2位独立键盘控制程序，显示键值1和2
//编译环境 ICCAVR 
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡
//作者：忠兴电子元件店
//日期：2010.05.24
//***********************************************************************
//			包含文件
//***********************************************************************
#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>
#define uchar           unsigned char
#define uint            unsigned int

#define key_io          PORTC               //独立键盘与PC4和PC5连接
#define key_ior         PINC                //读取IO口值为PINC的值
#define Data_IO	        PORTA                //数据口
#define Data_DDR        DDRA                 //数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1


//***********************************************************************
//			共阴数码管显示的断码表
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
	  		   0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
uchar key;

//***********************************************************************
//			IO端口初始化
//***********************************************************************

void System_Init()
{
    Data_IO=0xFF;             //数据口为输出
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573的控制口，设置为输出
    DDRD=0xFF;
	
	PORTB=0xFF;
	DDRB=0xFF; 				  //关闭发光二极管
}

//*************************************************************************
//			74HC573控制数码管动态扫描显示函数
//*************************************************************************

void Display_Key(uchar num)
{
 uchar i,j;
 System_Init();
 j=0x01;                    //此数据用来控制位选
  for(i=0;i<8;i++)
  {
    D_LE1;                    //控制数码管段数据的74HC573的LE管脚置高
    W_LE1;                    //控制数码管位的74HC573的LE管脚置高
    Data_IO=0x00;               //设置要显示的位，也就是哪一个数码管亮，这里是八个一起显示
    W_LE0;                    //锁存位数据，下面送上段数据以后，就显示出来了
	j=(j<<1);
    Data_IO=table[num];         //送要显示的数据，就是段数据，如显示0送的是0x3f
    D_LE0;                    //锁存段数据，数码管亮一个时间片刻
    delay_nms(1);              //显示一个时间片刻，会影响亮度和闪烁性

  }

}

//**********************************************************************
//	键盘扫描子程序，采用逐键扫描的方式
//**********************************************************************

uchar KeyboardScan() 
{
  uchar statevalue,key_checkin,key_check;
  key_io=0xf0;                    //在IO口由输出方式变为输入方式时要延迟一个周期
  key_io=0xf0;                    //采取写两次的方法延时
  key_checkin=key_ior;            //读取IO口状态，判断是否有键按下
  if(key_checkin!=0xf0)           //IO口值发生变化则表示有键按下
  {
    delay_nms(20);                 //键盘消抖，延时20MS
    key_checkin=key_ior;
    if(key_checkin!=0xf0)
    {
     
     key_check=key_ior;
     switch (key_check)
     {
     case 0xd0:key=2;break;
     case 0xe0:key=1;break;
     }
          
    }
  }
  else
  {
  statevalue=0xff;                      //无按键时返回值
  key=statevalue;
  return(key);
  }
}

//*************************************************************************
//			主程序
//*************************************************************************

void main()

{         
     
	  uint key_store;
	  DDRC=0x0f;                        //PC口上拉电阻使能
      PORTC=0xf0;                       //PC高四位输入低四位输出
      key_store=0;

while(1)
  {

 KeyboardScan();                         //键盘扫描，看是否有按键按下
    if(key!=0xff)                        //如果有按键按下，则显示该按键键值0~15
      {
	      { switch(key)
		   { case 1: Display_Key(0x01);key_store=0x01;break;   //给不同的键赋键值
		     case 2: Display_Key(0x02);key_store=0x02;break;
           }

          }
	
       }
     else
	 {
	 Display_Key(key_store);              //没有按键的时候显示上次的键值
	 }

  }

}




