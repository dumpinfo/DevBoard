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

#define DataPort        PORTC                     		//PC��Ϊ���ݿ�

#define LED8            PORTE                      		//PE�ڽ�8��LED�����ڲ���




