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

//以下是TFT屏显示控制相关硬件配置
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

//以下是TFT触摸屏控制相关硬件配置
#define PEN_CLR	        PORTA &= ~(1<<PA0)           	//PEN置低,触碰触摸屏时，ADS7843Penirq引脚由未触摸时的高电平变为低电平
#define PEN_SET	        PORTA |=  (1<<PA0)           	//PEN置高
#define PEN             (PINA & 0x01)            		//PA0输入的值

#define TPDO_CLR		PORTA &= ~(1<<PA1)           	//TPDO置低
#define TPDO_SET		PORTA |=  (1<<PA1)           	//TPDO置高
#define TPDOUT          ((PINA>>1)&0x01)         		//PA1输入的值

#define BUSY_CLR		PORTA &= ~(1<<PA2)           	//BUSY置低
#define BUSY_SET		PORTA |=  (1<<PA2)           	//BUSY置高

#define TPDI_CLR		PORTA &= ~(1<<PA3)            	//TPDI置低
#define TPDI_SET		PORTA |=  (1<<PA3)            	//TPDI置高

#define TPCS_CLR		PORTA &= ~(1<<PA4)            	//TPCS置低
#define TPCS_SET		PORTA |=  (1<<PA4)            	//TPCS置高

#define TPCLK_CLR		PORTA &= ~(1<<PA5)            	//TPCLK置低
#define TPCLK_SET		PORTA |=  (1<<PA5)            	//TPCLK置高

#define DataPort        PORTC                     		//PC口为数据口

#define LED8            PORTE                      		//PE口接8个LED灯用于测试

//SD卡CS管脚控制线
#define MMC_CS_PORT			PORTG
#define MMC_CS_DDR			DDRG
#define MMC_CS_PIN			3

//显示颜色代码
#define White          0xFFFF           
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0




