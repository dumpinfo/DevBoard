//********************************************************************
/*函 数 名：delay_us
建立日期：2010年1月28日
编译环境：ICCAVR7.16A
函数作用：微秒级的延时程序
说    明：7.3728M晶振下
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


void delay_1us(void)                 //1us延时函数，不能连续调用， 
{ 
   asm("nop");                       //1时钟周期
   asm("nop");
   asm("nop");
   asm("nop");
   asm("nop");                       //1T
   asm("nop");

}
void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
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

void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
{
   delay_3us();
   delay_3us(); 
   delay_3us();  
}
  
void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
{ 
   delay_10us();
   delay_10us(); 
   delay_10us();
   delay_10us();
}
void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
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
delay_n100us(8)          900us              主要是由于函数声明及while,,,大概6us

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
函 数 名：Delay_ms
建立日期：2010年1月28日
修改日期：
函数作用：毫秒级的精确延时程序
说    明：
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