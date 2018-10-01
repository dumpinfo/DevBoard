//DMAVR-M16的adc单通道转换示例程序，采取结束触发中断的方式
//数据位数为10位精度，可以实现8位精度，显示结果为ADC输出的数字量
//编译环境 AVR Studio 4.17/AVR GCC
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		// 单片机主频为7.3728MHz,用于延时子程序
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
#include <avr/signal.h>     //中断信号头文件


#define delay_us(x)     _delay_us(x)    //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC延时函数 x(ms)

#define Data_IO	        PORTA                //数码管数据口
#define Data_DDR        DDRA                 //数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1

#define uchar           unsigned char
#define uint            unsigned int

uchar adc_datah,adc_datal,A1,A2,A3,A4;                       //定义变量
uchar flag,j;                                               //标志变量

//***********************************************************************
//			共阴数码管显示的断码表0～F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

//*************************************************************************
//			初始化子程序
//*************************************************************************
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
//			74HC573控制数码管动态扫描显示函数，显示采集到的温度
//*************************************************************************

void Display_ADC(uint data_q,uint data_b,uint data_s,uint data_g)
{
	 uchar i,j;
	 system_init();
     j=0x01;                    //此数据用来控制位选
 for(i=0;i<4;i++)               //用后4位数码管来显示
  {
     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=0x00;           
     D_LE0;                      
     delay_ms(1);                
  }
     D_LE1;                    
     W_LE1;                    
     Data_IO=~j;               
     W_LE0;                    
	 j=(j<<1);
     Data_IO=table[A1];         
     D_LE0;                    
     delay_ms(1);              

     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A2];            
     D_LE0;                      
     delay_ms(1);                

	 D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A3];           
     D_LE0;                      
     delay_ms(1);   
	 
	  D_LE1;                    
     W_LE1;                    
     Data_IO=~j;               
     W_LE0;                    
	 j=(j<<1);
     Data_IO=table[A4];         
     D_LE0;                    
     delay_ms(1);             

	 

}

void adc_init()
{
  ADMUX=0x40;                              //选择通道0，数据右对齐，AVCC为电压基准
  ADCSRA=0xF8;                             //adc使能，连续转换
  SFIOR=0x00;                              //控制和状态寄存器初始化
}

//*************************************************************************
//		数据处理函数
//*************************************************************************
 void data_do(uint temp_dh,uint temp_dl)
 {
     uint temp_1,temp_2,temp_3;
     temp_1=temp_dh*16*16;
     temp_3=temp_1+temp_dl;
     A1=temp_3/1000;                       //分出千，百，十，和个位
     temp_1=temp_3%1000;
     A2=temp_1/100;
     temp_2=temp_1%100;
     A3=temp_2/10;
     A4=temp_2%10;
}

//*************************************************************************
//		中断服务子程序
//*************************************************************************

SIGNAL(SIG_ADC)                           //ADC中断服务程序
{
  adc_datal=ADCL;
  adc_datah=ADCH;                         //读取adc数据寄存器的值，8位精度
  data_do(adc_datah,adc_datal);           //数据处理，得到BCD码
  flag=0x01;                              //标志位置1
 for(j=0;j<50;j++)
 {
  Display_ADC(A1,A2,A3,A4);              //显示adc的数据
 }
}



//*************************************************************************
//			主程序
//*************************************************************************
void main()
{
  system_init();                             //系统初始化
  adc_init();                               //adc初始化配置
  SREG|=0x80;                                //开启全局中断
  while(1)
  {
    
  }
}
