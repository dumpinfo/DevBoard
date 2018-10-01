#define CPU_F ((double)8000000) 
#define delay_us(x) __delay_cycles((long)(CPU_F*(double)x/1000000.0)) 
#define delay_ms(x) __delay_cycles((long)(CPU_F*(double)x/1000.0)) 

#define uchar unsigned char
#define uint  unsigned int
#define ulong unsigned long

/*当BRCLK=CPU_F时用下面的公式可以计算，否则要根据设置加入分频系数*/
#define baud           9600                                //设置波特率的大小
#define baud_setting   (uint)((ulong)CPU_F/((ulong)baud))  //波特率计算公式
#define baud_h         (uchar)(baud_setting>>8)            //提取高位
#define baud_l         (uchar)(baud_setting)               //低位

#define DATAPORT	P4OUT                   //数据口所在端口P4
#define DATASEL         P4SEL                   //数据口功能寄存器，控制功能模式
#define DATADIR         P4DIR                   //数据口方向寄存器

#define CTRPORT	        P5OUT                   //控制线所在的端口P6
#define CTRSEL          P5SEL                   //控制口功能寄存器，控制功能模式
#define CTRDIR          P5DIR                   //控制口方向寄存器

#define RS_CLR	        P5OUT &= ~BIT5           //RS置低
#define RS_SET	        P5OUT |=  BIT5           //RS置高

#define RW_CLR	        P5OUT &= ~BIT6           //RW置低
#define RW_SET	        P5OUT |=  BIT6           //RW置高

#define RD_CLR	        P5OUT &= ~BIT7           //E置低
#define RD_SET	        P5OUT |=  BIT7           //E置高

#define CS_CLR	        P5OUT &= ~BIT0            //CS置低
#define CS_SET	        P5OUT |=  BIT0            //CS置高

#define RST_CLR	        P5OUT &= ~BIT3            //RST置低
#define RST_SET	        P5OUT |=  BIT3            //RST置高

#define LE_CLR	        P5OUT &= ~BIT1            //LE置低
#define LE_SET	        P5OUT |=  BIT1            //LE置高


#define DataPort        P4OUT                     //P4口为数据口


#define LED8            P3OUT                      //P34、P35口接2个LED灯用于测试

/*12864应用指令*/
#define CLEAR_SCREEN	0x01		          //清屏指令：清屏且AC值为00H
#define AC_INIT		0x02		          //将AC设置为00H。且游标移到原点位置
#define CURSE_ADD	0x06		          //设定游标移到方向及图像整体移动方向（默认游标右移，图像整体不动）
#define FUN_MODE	0x30		          //工作模式：8位基本指令集
#define DISPLAY_ON	0x0c		          //显示开,显示游标，且游标位置反白
#define DISPLAY_OFF	0x08		          //显示关
#define CURSE_DIR	0x14		          //游标向右移动:AC=AC+1
#define SET_CG_AC	0x40		          //设置AC，范围为：00H~3FH
#define SET_DD_AC	0x80                      //设置DDRAM AC

uchar   key=0xFF;                                 //键值变量

//***********************************************************************
//                   系统时钟初始化
//***********************************************************************
void Clock_Init()
{
  uchar i;
  BCSCTL1&=~XT2OFF;                 //打开XT2振荡器
  BCSCTL2|=SELM1+SELS;              //MCLK为8MHZ，SMCLK为8MHZ
  do{
    IFG1&=~OFIFG;                   //清楚振荡器错误标志
    for(i=0;i<100;i++)
       _NOP();
  }
  while((IFG1&OFIFG)!=0);           //如果标志位1，则继续循环等待
  IFG1&=~OFIFG; 
}
//***********************************************************************
//               MSP430内部看门狗初始化
//***********************************************************************
void WDT_Init()
{
   WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗
}

