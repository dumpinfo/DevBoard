//********************************************************************
/*�� �� ����delay_us
�������ڣ�2010��1��28��
���뻷����ICCAVR7.16A
�������ã�΢�뼶����ʱ����
˵    ����7.3728M������
********************************************************************/
void delay_1us(void);
void delay_3us(void);
void delay_10us(void);
void delay_50us(void);
void delay_100us(void);
void delay_n100us(unsigned char n100us);
void delay_1ms(void);
void delay_nms(unsigned int nms);
void delay_ns(unsigned char ns);


void delay_1us(void)                 //1us��ʱ�����������������ã� 
{ 
   asm("nop");                       //1ʱ������
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       //1T
   asm("nop");

}
void delay_3us(void)                 //3us��ʱ����,,���ظ����ò�Ӱ�쾫��
{ 
   
   asm("nop");
   asm("nop");
   asm("nop");                       
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       
} 

void delay_10us(void)                 //10us��ʱ����,,���ظ����ò�Ӱ�쾫��
{
   delay_3us();
   delay_3us(); 
   delay_3us();  
}
  
void delay_50us(void)                 //48us��ʱ����,,���ظ����ò�Ӱ�쾫��
{ 
   delay_10us();
   delay_10us(); 
   delay_10us();
   delay_10us();
}
void delay_100us(void)     //exactly 98us��ʱ����,,���ظ����ò�Ӱ�쾫��
{
 delay_50us();
 delay_50us();
}
void delay_n100us(unsigned char n100us)
{
 while(n100us--)                          
 delay_100us();
}
/*delay_n100us(2)        250us
delay_n100us(3)          360us
delay_n100us(4)          470us
delay_n100us(5)          580us
delay_n100us(6)          690us
delay_n100us(7)       800us
delay_n100us(8)          900us              ��Ҫ�����ں���������while,,,���6us

*/
void delay_1ms()
{
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
 delay_100us();
}
/********************************************************************
�� �� ����Delay_ms
�������ڣ�2010��1��28��
�޸����ڣ�
�������ã����뼶�ľ�ȷ��ʱ����
˵    ����
********************************************************************/
void delay_nms(unsigned int nms)
{
 while(nms--) 
 delay_1ms();
}
void delay_ns(unsigned char ns)
{
 while(ns--) 
 delay_nms(1000);
}