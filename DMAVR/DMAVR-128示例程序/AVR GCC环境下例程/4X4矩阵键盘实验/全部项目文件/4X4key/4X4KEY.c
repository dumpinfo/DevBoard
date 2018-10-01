//DMAVR-128的4X4位矩阵键盘控制程序，显示键值
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* 单片机主频为7.3728MHz,用于延时子程序 */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>

//***********************************************************************
//			定义变量区
//***********************************************************************

#define delay_us(x)     _delay_us(x)         //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)         //AVR GCC延时函数 x(ms)

#define uchar           unsigned char
#define uint            unsigned int

#define key_io          PORTC               //独立键盘与PC4和PC5连接
#define key_ior         PINC                //读取IO口值为PINC的值
uchar key;

#define Data_IO	        PORTA                //数码管数据口
#define Data_DDR        DDRA                 //数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1


//***********************************************************************
//			共阴数码管显示的断码表0～F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

//***********************************************************************
//			IO端口初始化
//***********************************************************************

void system_init()
{
    Data_IO=0xFF;             //数据口为输出
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573的控制口，设置为输出
    DDRD=0xFF;
}

//*************************************************************************
//			74HC573控制数码管动态扫描显示函数
//*************************************************************************

void Display_Key(uchar num)
{
	 uchar i,j;
	 system_init();
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
    delay_ms(1);              //显示一个时间片刻，会影响亮度和闪烁性

  }

}

//**********************************************************************
//	键盘扫描子程序，采用逐键扫描的方式
//**********************************************************************
uchar keyboardscan(void) 
{
  uchar statevalue,key_checkin,key_check;
  key_io=0xf0;                    //在IO口由输出方式变为输入方式时要延迟一个周期
  key_io=0xf0;                    //采取写两次的方法延时
  key_checkin=key_ior;            //读取IO口状态，判断是否有键按下
  if(key_checkin!=0xf0)           //IO口值发生变化则表示有键按下
  {
    delay_ms(20);                 //键盘消抖，延时20MS
    key_checkin=key_ior;
    if(key_checkin!=0xf0)
    {
     key_io=0xfe;                 //逐行扫描开始
     key_io=0xfe;                 //写两次延时，下同
     key_check=key_ior;
     switch (key_check)           //根据读到的IO口值判断按键的按下情况
     {
     case 0xee:key=15;break;
     case 0xde:key=11;break;
     case 0xbe:key=8;break;
     case 0x7e:key=4;break;
     }
     
     key_io=0xfd;
     key_io=0xfd;
     key_check=key_ior;
     switch (key_check)
     {
     case 0xed:key=14;break;
     case 0xdd:key=10;break;
     case 0xbd:key=7;break;
     case 0x7d:key=3;break;
     }
     
     key_io=0xfb;
     key_io=0xfb;
    key_check=key_ior;
     switch (key_check)
     {
     case 0xeb:key=13;break;
     case 0xdb:key=0;break;
     case 0xbb:key=6;break;
     case 0x7b:key=2;break;
     }
     
      key_io=0xf7;
      key_io=0xf7;
     key_check=key_ior;
     switch (key_check)
     {
     case 0xe7:key=12;break;
     case 0xd7:key=9;break;
     case 0xb7:key=5;break;
     case 0x77:key=1;break;
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
	  uint key_store=0x01;
	  DDRC=0x0f;                        //PC口上拉电阻使能
      PORTC=0xf0;                       //PC高四位输入低四位输出


while(1)
  {

  keyboardscan();                         //键盘扫描，看是否有按键按下
    if(key!=0xff)                        //如果有按键按下，则显示该按键键值0~15
      {
	      { switch(key)
		   {  
		     case 1: Display_Key(0x01);key_store=0x01;break;   //根据键值显示到数码管上
		     case 2: Display_Key(0x02);key_store=0x02;break;
		     case 3: Display_Key(0x03);key_store=0x03;break;
		     case 4: Display_Key(0x04);key_store=0x04;break;
		     case 5: Display_Key(0x05);key_store=0x05;break;
		     case 6: Display_Key(0x06);key_store=0x06;break;
		     case 7: Display_Key(0x07);key_store=0x07;break;
		     case 8: Display_Key(0x08);key_store=0x08;break;
		     case 9: Display_Key(0x09);key_store=0x09;break;
		     case 0: Display_Key(0x00);key_store=0x00;break;
		     case 10: Display_Key(0x0a);key_store=0x0a;break;
		     case 11: Display_Key(0x0b);key_store=0x0b;break;
		     case 12: Display_Key(0x0c);key_store=0x0c;break;
		     case 13: Display_Key(0x0d);key_store=0x0d;break;
	         case 14: Display_Key(0x0e);key_store=0x0e;break;
             case 15: Display_Key(0x0f);key_store=0x0f;break;
           }

          }
	
       }
  else
	 {
	 Display_Key(key_store);              //没有按键的时候显示上次的键值
	 }

  }

}
