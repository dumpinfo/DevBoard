/****************************************************************************
                  ����ͷ�ļ�config.h
���ܣ���Ҫ����Ӳ�����ӣ����ݲ�ͬ�ĵ�Ƭ������ȥ������
ע�⣺�����AVR����430�ȵ�Ƭ�������ú���Ҫ��main.c�ж�PORT�˿ڳ�ʼ������
****************************************************************************/

#define delay_us(x)     _delay_us(x)        			 //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)        			 //AVR GCC��ʱ���� x(ms)

#define uchar unsigned char
#define uint  unsigned int
#define ulong unsigned long

//������TFT����ʾ�������Ӳ������
#define RS_CLR	        PORTF &= ~(1<<PF2)           	//RS�õ�
#define RS_SET	        PORTF |=  (1<<PF2)           	//RS�ø�

#define RW_CLR	        PORTF &= ~(1<<PF1)           	//RW�õ�
#define RW_SET	        PORTF |=  (1<<PF1)          	//RW�ø�

#define RD_CLR	        PORTF &= ~(1<<PF0)           	//E�õ�
#define RD_SET	        PORTF |=  (1<<PF0)           	//E�ø�

#define CS_CLR	        PORTE &= ~(1<<PE2)            	//CS�õ�
#define CS_SET	        PORTE |=  (1<<PE2)            	//CS�ø�

#define RST_CLR	        PORTE &= ~(1<<PE3)            	//RST�õ�
#define RST_SET	        PORTE |=  (1<<PE3)            	//RST�ø�

#define LE_CLR	        PORTF &= ~(1<<PF3)            	//LE�õ�
#define LE_SET	        PORTF |=  (1<<PF3)            	//LE�ø�

//������TFT�������������Ӳ������
#define PEN_CLR	        PORTA &= ~(1<<PA0)           	//PEN�õ�,����������ʱ��ADS7843Penirq������δ����ʱ�ĸߵ�ƽ��Ϊ�͵�ƽ
#define PEN_SET	        PORTA |=  (1<<PA0)           	//PEN�ø�
#define PEN             (PINA & 0x01)            		//PA0�����ֵ

#define TPDO_CLR		PORTA &= ~(1<<PA1)           	//TPDO�õ�
#define TPDO_SET		PORTA |=  (1<<PA1)           	//TPDO�ø�
#define TPDOUT          ((PINA>>1)&0x01)         		//PA1�����ֵ

#define BUSY_CLR		PORTA &= ~(1<<PA2)           	//BUSY�õ�
#define BUSY_SET		PORTA |=  (1<<PA2)           	//BUSY�ø�

#define TPDI_CLR		PORTA &= ~(1<<PA3)            	//TPDI�õ�
#define TPDI_SET		PORTA |=  (1<<PA3)            	//TPDI�ø�

#define TPCS_CLR		PORTA &= ~(1<<PA4)            	//TPCS�õ�
#define TPCS_SET		PORTA |=  (1<<PA4)            	//TPCS�ø�

#define TPCLK_CLR		PORTA &= ~(1<<PA5)            	//TPCLK�õ�
#define TPCLK_SET		PORTA |=  (1<<PA5)            	//TPCLK�ø�

#define DataPort        PORTC                     		//PC��Ϊ���ݿ�

#define LED8            PORTE                      		//PE�ڽ�8��LED�����ڲ���

//SD��CS�ܽſ�����
#define MMC_CS_PORT			PORTG
#define MMC_CS_DDR			DDRG
#define MMC_CS_PIN			3

//��ʾ��ɫ����
#define White          0xFFFF           
#define Black          0x0000
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0




