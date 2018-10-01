//DMAVR-128��4X4λ������̿��Ƴ�����ʾ��ֵ
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
//***********************************************************************

#define delay_us(x)     _delay_us(x)         //AVR GCC��ʱ���� x(us)
#define delay_ms(x)     _delay_ms(x)         //AVR GCC��ʱ���� x(ms)

#define uchar           unsigned char
#define uint            unsigned int

#define key_io          PORTC               //����������PC4��PC5����
#define key_ior         PINC                //��ȡIO��ֵΪPINC��ֵ
uchar key;

#define Data_IO	        PORTA                //��������ݿ�
#define Data_DDR        DDRA                 //��������ݿڷ���Ĵ���
#define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
#define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
#define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
#define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1


//***********************************************************************
//			�����������ʾ�Ķ����0��F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};

//***********************************************************************
//			IO�˿ڳ�ʼ��
//***********************************************************************

void system_init()
{
    Data_IO=0xFF;             //���ݿ�Ϊ���
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573�Ŀ��ƿڣ�����Ϊ���
    DDRD=0xFF;
}

//*************************************************************************
//			74HC573��������ܶ�̬ɨ����ʾ����
//*************************************************************************

void Display_Key(uchar num)
{
	 uchar i,j;
	 system_init();
   j=0x01;                    //��������������λѡ
  for(i=0;i<8;i++)
  {
    D_LE1;                    //��������ܶ����ݵ�74HC573��LE�ܽ��ø�
    W_LE1;                    //���������λ��74HC573��LE�ܽ��ø�
    Data_IO=0x00;               //����Ҫ��ʾ��λ��Ҳ������һ����������������ǰ˸�һ����ʾ
    W_LE0;                    //����λ���ݣ��������϶������Ժ󣬾���ʾ������
	j=(j<<1);
    Data_IO=table[num];         //��Ҫ��ʾ�����ݣ����Ƕ����ݣ�����ʾ0�͵���0x3f
    D_LE0;                    //��������ݣ��������һ��ʱ��Ƭ��
    delay_ms(1);              //��ʾһ��ʱ��Ƭ�̣���Ӱ�����Ⱥ���˸��

  }

}

//**********************************************************************
//	����ɨ���ӳ��򣬲������ɨ��ķ�ʽ
//**********************************************************************
uchar keyboardscan(void) 
{
  uchar statevalue,key_checkin,key_check;
  key_io=0xf0;                    //��IO���������ʽ��Ϊ���뷽ʽʱҪ�ӳ�һ������
  key_io=0xf0;                    //��ȡд���εķ�����ʱ
  key_checkin=key_ior;            //��ȡIO��״̬���ж��Ƿ��м�����
  if(key_checkin!=0xf0)           //IO��ֵ�����仯���ʾ�м�����
  {
    delay_ms(20);                 //������������ʱ20MS
    key_checkin=key_ior;
    if(key_checkin!=0xf0)
    {
     key_io=0xfe;                 //����ɨ�迪ʼ
     key_io=0xfe;                 //д������ʱ����ͬ
     key_check=key_ior;
     switch (key_check)           //���ݶ�����IO��ֵ�жϰ����İ������
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
  statevalue=0xff;                      //�ް���ʱ����ֵ
  key=statevalue;
  return(key);
  }
}

//*************************************************************************
//			������
//*************************************************************************

void main()

{         
	  uint key_store=0x01;
	  DDRC=0x0f;                        //PC����������ʹ��
      PORTC=0xf0;                       //PC����λ�������λ���


while(1)
  {

  keyboardscan();                         //����ɨ�裬���Ƿ��а�������
    if(key!=0xff)                        //����а������£�����ʾ�ð�����ֵ0~15
      {
	      { switch(key)
		   {  
		     case 1: Display_Key(0x01);key_store=0x01;break;   //���ݼ�ֵ��ʾ���������
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
	 Display_Key(key_store);              //û�а�����ʱ����ʾ�ϴεļ�ֵ
	 }

  }

}
