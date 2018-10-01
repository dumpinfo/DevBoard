//DMAVR-128�ķ���������ʾ�������Ż��ȼ�-00�����򲿷ֳ���ᱻ�Ż���
//���뻷�� AVR Studio 4.17/AVR GCC
//ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
//���ߣ����� www.avrgcc.com
//���ڣ�2010.01.14
//***********************************************************************
//			�����ļ�
//***********************************************************************

#include <string.h>
#include <stdio.h>
#define	 F_CPU	7372800		/* ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ��� */
#include <util/delay.h>
#include <avr/io.h>
#include <avr/iom128.h>
//***********************************************************************
//			���������
//			CH451������������ֵ��������Ҫд��
//***********************************************************************

#define delay_us(x)     _delay_us(x)    //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)    //AVR GCC��ʱ���� x(ms)

#define uchar           unsigned char
#define uint            unsigned int
#define ulong           unsigned long

#define beep0             PORTD &= ~(1 << PD6)    //����������IO��PD6
#define beep1             PORTD |= (1 << PD6)
#define led8              PORTB                  //LED���ƿ�PB

#define Data_IO	        PORTA                //Һ�����ݿ�
#define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1

                                      


//*************************************************************************
//			��ʼ���ӳ���
//*************************************************************************
void system_init()
{
    Data_IO = 0xFF;				        //��ƽ����
	Data_DDR = 0xFF;				        //�������
	PORTF = 0xFF;                       //��ƽ����
	DDRF = 0xFF;                        //�������
    PORTD=0xFF;
	DDRD=0xFF;
	D_LE1;                             //�ص�����ܣ�������ʾ����                   
    W_LE1;                     
    Data_IO=0xFF;                      //�������            
    W_LE0; 
  
  PORTB=0xff;                                       //PB����Ϊ���
  DDRB=0xff;                                        //����������Ч
}

left_shift(uchar dat,uchar count)                   //����
{
  dat=dat<<count;
}
//********************************************************************
//			������
//********************************************************************


main()
{
  uint i; 
  uint  a,b,c,k,j;  
  system_init();  
  k=0x01;             //�ȸ�kһ����ֵ00000001�ȴ���λ
  while(1)
  {
       for(i=8;i>0;i--)
       {     
        delay_ms(200);
        beep1;             //�򿪷�����
        delay_ms(300);    //������
        beep0;            //�رշ����� 
        a=k;              //�������ֵ���͸�j  
		c=~a;     
        led8=c;          //ͬʱ��ֵ�͵�PD�ڵ������������        
        a=left_shift(k,1);     //��kѭ������һλ        
        k=a;             ////�������ֵ���͸�k
      }
      k=0x01;
   }

}
