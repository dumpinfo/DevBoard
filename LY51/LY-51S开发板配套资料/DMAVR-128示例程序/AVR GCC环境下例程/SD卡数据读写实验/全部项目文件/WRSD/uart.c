//���ڷ��ͽ�����������
//���ñ�׼���������ʽ���д�ӡ���뵥�����ͽ����ַ���ͬ
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.01.14
//***********************************************************************
//			�����ļ�
//***********************************************************************
#include <avr/io.h>
#include <avr/iom128.h>
#include <stdio.h>
#define	 F_CPU	7372800											// ��Ƭ����ƵΪ7.3728MHz,���ڼ��㲨���� 

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

#define baud           9600                                     //���ò����ʵĴ�С
#define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //�����ʼ��㹫ʽ
#define baud_h         (uchar)(baud_setting>>8)                 //��ȡ��λ
#define baud_l         (uchar)(baud_setting)                    //��λ

static int uart_putchar(char c, FILE *stream);
static int uart_getchar(FILE *stream);

// ����I/Oָ�벢��ʼ��
static FILE mystd = FDEV_SETUP_STREAM(uart_putchar, uart_getchar, _FDEV_SETUP_RW);

// ��������ı�׼��ʽ����
static int uart_putchar(char c, FILE *stream)
{
 if(c == '\n')
  uart_putchar('\r', stream);
 loop_until_bit_is_set(UCSR1A, UDRE1);  //ʵ���ǲ�ѯ��ʽ��������
 UDR1 = c;
 return 0;
}

// ��������ı�׼��ʽ����
static int uart_getchar(FILE *stream)
{
 loop_until_bit_is_set(UCSR1A, RXC1);  //ʵ���ǲ�ѯ��ʽ��������
 return UDR1;
}
//***********************************************************************
// ���ڳ�ʼ���ӿں���
// ��ʼ��uart,��ѯ��ʽ��д
//***********************************************************************
void UART_Init(void)
{
 
  UCSR1B = _BV(RXEN1) | _BV(TXEN1);             		//���ͽ���ʹ�ܣ��ȼ���(1<<RXEN1)|(1<<TXEN1)
  UBRR1H=baud_h;                                		//д�����ʵ�ֵ
  UBRR1L=baud_l; 

  stdout = &mystd;
  stdin = &mystd;
  stderr = &mystd;
}
