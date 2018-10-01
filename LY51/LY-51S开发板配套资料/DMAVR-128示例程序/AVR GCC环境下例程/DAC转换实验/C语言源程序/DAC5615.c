//DMAVR-M16��DACת����������DACΪTI��˾��10λ���е�ѹ�������DACоƬTLC5615
//����DACоƬ��ʹ�����000-FFC(TLC5615����λ��ֵһֱΪ0)�����ת����LEDָʾ�ƶ�Ӧ�Ӱ�����
//���뻷�� AVR Studio 4.13/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.xin-ic.com
//���ڣ�2008.09.26
//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		// ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ���
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>

//***********************************************************************
//	���������
//***********************************************************************
#define uchar unsigned char
#define uint  unsigned int

uchar dis1[]={"jingyehanxing "};            //��������
uchar dis2[]={"TEL:15967087131 "};          //�����͵��ӹ�������

#define delay_us(x)     _delay_us(x)        //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)        //AVR GCC��ʱ���� x(ms)

#define cs0   PORTB &= ~(1 << PB0)
#define cs1   PORTB |= (1 << PB0)
#define din0   PORTB &= ~(1 << PB2)
#define din1   PORTB |= (1 << PB2)
#define dout0   PORTB &= ~(1 << PB3)
#define dout1   PORTB |= (1 << PB3)
#define sclk0   PORTB &= ~(1 << PB1)
#define sclk1   PORTB |= (1 << PB1)


uint da_data;
//*************************************************************************
//			��ʼ���ӳ���
//*************************************************************************
void system_init()
{

	PORTB = 0xFF;				        //��ƽ����
	DDRB = 0xFF;				        //�������

}
//*************************************************************************
//			DACת������
//*************************************************************************
void dac_ser(uint data)
{
  uchar i;
  uint da_data2;

  cs0;                       //ƬѡDAC���õ���Ч
  sclk0;        

  for (i=0;i<16;i++)         //������10λDAC��������Ĵ���Ϊ16λ��ֻ��10λ������Ч
  {
   da_data2=data&0x8000;    //��λȡ��
   if(da_data2>>15)
   din1;
   else
   din0;
   sclk1;                  //��������������
   data<<=1;                //��λ
   sclk0;
   
  }
  delay_us(10);
   cs1;
   sclk0;

}


//*************************************************************************
//			������
//*************************************************************************
int main(void)
{
  system_init();              //ϵͳ��ʼ��
  while(1)
  {
   for(da_data=0x000;da_data<0x3ff;da_data++)    //����ת���������ѹ��С����
   {
     da_data=da_data<<2;
     dac_ser(da_data);
	 da_data=da_data>>2;
      delay_ms(2);
  }
  } 
}
