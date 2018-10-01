/****************************************************************************
                  配置头文件config.h
功能：主要配置硬件连接，根据不同的单片机连接去做调整
注意：如果是AVR或者430等单片机，配置后还需要在main.c中对PORT端口初始化设置
****************************************************************************/

#define delay_us(x)     _delay_us(x)        			 //AVR GCC延时函数 x(us)
#define delay_ms(x)     _delay_ms(x)        			 //AVR GCC延时函数 x(ms)

#define uchar unsigned char
#define uint  unsigned int
#define ulong unsigned long

#define RS_CLR	        PORTF &= ~(1<<PF2)           	//RS置低
#define RS_SET	        PORTF |=  (1<<PF2)           	//RS置高

#define RW_CLR	        PORTF &= ~(1<<PF1)           	//RW置低
#define RW_SET	        PORTF |=  (1<<PF1)          	//RW置高

#define RD_CLR	        PORTF &= ~(1<<PF0)           	//E置低
#define RD_SET	        PORTF |=  (1<<PF0)           	//E置高

#define CS_CLR	        PORTE &= ~(1<<PE2)            	//CS置低
#define CS_SET	        PORTE |=  (1<<PE2)            	//CS置高

#define RST_CLR	        PORTE &= ~(1<<PE3)            	//RST置低
#define RST_SET	        PORTE |=  (1<<PE3)            	//RST置高

#define LE_CLR	        PORTF &= ~(1<<PF3)            	//LE置低
#define LE_SET	        PORTF |=  (1<<PF3)            	//LE置高

#define DataPort        PORTC                     		//PC口为数据口

#define LED8            PORTE                      		//PE口接8个LED灯用于测试




