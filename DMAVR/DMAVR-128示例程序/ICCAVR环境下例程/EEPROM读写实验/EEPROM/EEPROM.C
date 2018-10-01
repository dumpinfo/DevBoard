//DMAVR-128的读写EEPROM示例程序，记录CPU启动的次数到EEPROM中
//在LED数码管上显示读出的数据,可用复位键刷新显示
//编译环境 ICCAVR 7.16A
//系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
//作者：阿迪 www.avrgcc.com
//日期：2010.01.14
//***********************************************************************
//			包含文件
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800							// 单片机主频为7.3728MHz,用于延时子程序
#include <delay.h>
#include <iom128v.h>


//***********************************************************************
//			定义变量区
//***********************************************************************

#define Data_IO	        PORTA                	//数码管数据口
#define Data_DDR        DDRA                 	//数码管数据口方向寄存器
#define D_LE0	        PORTD &= ~(1 << PD4) 	//数码管段控制位为0，锁存端口数据
#define D_LE1           PORTD |= (1 << PD4)  	//数码管段控制位为1，锁存器输出与端口一致
#define W_LE0	        PORTD &= ~(1 << PD5) 	//数码管位控制位为0
#define W_LE1           PORTD |= (1 << PD5)  	//数码管位控制位为1

#define uchar           unsigned char
#define uint            unsigned int

//***********************************************************************
//			共阴数码管显示的断码表0～F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
	           0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
uint A1,A2,A3;             		      			//定义的变量,显示数据处理



//***********************************************************************
//			IO端口初始化
//***********************************************************************

void system_init()
{
    Data_IO=0xFF;             						//数据口为输出
    Data_DDR=0xFF;

    PORTD=0xFF;               						//74HC573的控制口，设置为输出
    DDRD=0xFF;
	PORTB=0XFF;
	DDRB=0XFF;
}

//*************************************************************************
//			74HC573控制数码管动态扫描显示函数，显示采集到的温度
//*************************************************************************

void Display_EEPROM(void)
{
	 uchar i,j;
	 system_init();
     j=0x01;                    			//此数据用来控制位选
 for(i=0;i<5;i++)               			//用后3位数码管来显示
  {
     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=0x00;           
     D_LE0;                      
     delay_nms(1);                
  }
     D_LE1;                    
     W_LE1;                    
     Data_IO=~j;               
     W_LE0;                    
	 j=(j<<1);
     Data_IO=table[A1];         
     D_LE0;                    
     delay_nms(1);              

     D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A2];             
     D_LE0;                      
     delay_nms(1);                

	 D_LE1;                     
     W_LE1;                     
     Data_IO=~j;                
     W_LE0;                      
	 j=(j<<1);
     Data_IO=table[A3];           
     D_LE0;                      
     delay_nms(1);                

	 D_LE1;                     
     W_LE1;                     
     Data_IO=0xff;                
     W_LE0;                      

}


//*************************************************************************
//		数据处理函数
//*************************************************************************
 void data_do(uchar temp_d)
 {
     uint A2t;
     A1=temp_d/100;                       //分出百，十，和个位
     A2t=temp_d%100;
     A2=A2t/10;
     A3=A2t%10;
}


//***********************************************************************
//                EEPROM读取函数*/
//            addr：地址；number：长度；p_buff：读出数据存放指针
//***********************************************************************
void eprom_read(unsigned int addr, unsigned char number, unsigned char *p_buff) {

	while(EECR & (1 << EEWE));               //等待前面的写完成

	EEARH = 0x00;                           //写高字节地址
	
	while(number --) {
		EEARL = addr ++;                 	//写地址低字节
		EECR |= (1 << EERE);            	//读允许位置1
		*p_buff++ = EEDR;               	//读出EEDR中的数据
		}
}
//***********************************************************************
//              EEPROM写入函数
//          addr：地址；number：长度；p_buff：写入数据存放指针
//***********************************************************************
void eprom_write(unsigned int addr, unsigned char number, unsigned char *p_buff) {

	EEARH = 0x00;
	
	while(number --) {
		while(EECR & (1 << EEWE));       //等待前面的写完成
		EEARL = addr ++;                 //写地址
		EEDR = *p_buff ++;               //写数据到EEDR
		EECR |= (1 << EEMWE);            //主机写入允许位
		EECR&=~(1<<EEWE);
		EECR |= (1 << EEWE);             //EEWE为1，执行写操作
		}
}


//***********************************************************************
//                       主函数
//***********************************************************************
void main(void) 
{

	unsigned char temp;
    system_init();                      //系统初始化
    eprom_read(0x10, 0x01, &temp);		//读出记录
    delay_nms(10);
	temp ++;                            //计数值加1
    eprom_write(0x10, 0x01, &temp);		//写入记录	
    delay_nms(10);              
				             	
	while (1)
	 {
	data_do(temp);                      //每启动一次temp加1，记录到EEPROM中
	Display_EEPROM();					//显示计数值
	 }
}
