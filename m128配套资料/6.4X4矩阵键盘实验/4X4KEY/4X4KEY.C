//ATMEGA128µÄ4X4Î»¾ØÕó¼üÅÌ¿ØÖÆ³ÌĞò£¬ÏÔÊ¾¼üÖµ
//±àÒë»·¾³ ICCAVR 7.16A
//ÏµÍ³Ê±ÖÓ7.3728MHZ£¬ÉèÖÃÈÛË¿Î»ÎªÍâ²¿¸ßÆµÊ¯Ó¢¾§ÌåÕñµ
//ÖÒĞËµç×ÓÔª¼şµê±à¼­
//ÈÕÆÚ£º2010.05.24
//***********************************************************************
//			°üº¬ÎÄ¼ş
//***********************************************************************

#include <string.h>
#include <stdio.h>
#include <delay.h>
#include <iom128v.h>


#define uchar           unsigned char
#define uint            unsigned int

#define key_io          PORTC               //¶ÀÁ¢¼üÅÌÓëPC4ºÍPC5Á¬½Ó
#define key_ior         PINC                //¶ÁÈ¡IO¿ÚÖµÎªPINCµÄÖµ
#define Data_IO	        PORTA                //ÊıÂë¹ÜÊı¾İ¿Ú
#define Data_DDR        DDRA                 //ÊıÂë¹ÜÊı¾İ¿Ú·½Ïò¼Ä´æÆ÷
#define D_LE0	        PORTD &= ~(1 << PD4) //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª0£¬Ëø´æ¶Ë¿ÚÊı¾İ
#define D_LE1           PORTD |= (1 << PD4)  //ÊıÂë¹Ü¶Î¿ØÖÆÎ»Îª1£¬Ëø´æÆ÷Êä³öÓë¶Ë¿ÚÒ»ÖÂ
#define W_LE0	        PORTD &= ~(1 << PD5) //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª0
#define W_LE1           PORTD |= (1 << PD5)  //ÊıÂë¹ÜÎ»¿ØÖÆÎ»Îª1


//***********************************************************************
//			¹²ÒõÊıÂë¹ÜÏÔÊ¾µÄ¶ÏÂë±í0¡«F
//***********************************************************************

uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
	           0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
uchar key;

//***********************************************************************
//			IO¶Ë¿Ú³õÊ¼»¯
//***********************************************************************

void System_Init()
{
    Data_IO=0xFF;             //Êı¾İ¿ÚÎªÊä³ö
    Data_DDR=0xFF;

    PORTD=0xFF;               //74HC573µÄ¿ØÖÆ¿Ú£¬ÉèÖÃÎªÊä³ö
    DDRD=0xFF;

    PORTB=0xFF;		     //¹Ø±Õ·¢¹â¶ş¼«¹Ü
    DDRB=0xFF;
}

//*************************************************************************
//			74HC573¿ØÖÆÊıÂë¹Ü¶¯Ì¬É¨ÃèÏÔÊ¾º¯Êı
//*************************************************************************

void Display_Key(uchar num)
{
	 uchar i,j;
	 System_Init();
   j=0x01;                    //´ËÊı¾İÓÃÀ´¿ØÖÆÎ»Ñ¡
  for(i=0;i<8;i++)
  {
    D_LE1;                    //¿ØÖÆÊıÂë¹Ü¶ÎÊı¾İµÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
    W_LE1;                    //¿ØÖÆÊıÂë¹ÜÎ»µÄ74HC573µÄLE¹Ü½ÅÖÃ¸ß
    Data_IO=0x00;               //ÉèÖÃÒªÏÔÊ¾µÄÎ»£¬Ò²¾ÍÊÇÄÄÒ»¸öÊıÂë¹ÜÁÁ£¬ÕâÀïÊÇ°Ë¸öÒ»ÆğÏÔÊ¾
    W_LE0;                    //Ëø´æÎ»Êı¾İ£¬ÏÂÃæËÍÉÏ¶ÎÊı¾İÒÔºó£¬¾ÍÏÔÊ¾³öÀ´ÁË
	j=(j<<1);
    Data_IO=table[num];         //ËÍÒªÏÔÊ¾µÄÊı¾İ£¬¾ÍÊÇ¶ÎÊı¾İ£¬ÈçÏÔÊ¾0ËÍµÄÊÇ0x3f
    D_LE0;                    //Ëø´æ¶ÎÊı¾İ£¬ÊıÂë¹ÜÁÁÒ»¸öÊ±¼äÆ¬¿Ì
    delay_nms(1);              //ÏÔÊ¾Ò»¸öÊ±¼äÆ¬¿Ì£¬»áÓ°ÏìÁÁ¶ÈºÍÉÁË¸ĞÔ

  }

}

//**********************************************************************
//	¼üÅÌÉ¨Ãè×Ó³ÌĞò£¬²ÉÓÃÖğ¼üÉ¨ÃèµÄ·½Ê½
//**********************************************************************
uchar keyboardscan(void) 
{
  uchar statevalue,key_checkin,key_check;
  key_io=0xf0;                    //ÔÚIO¿ÚÓÉÊä³ö·½Ê½±äÎªÊäÈë·½Ê½Ê±ÒªÑÓ³ÙÒ»¸öÖÜÆÚ
  key_io=0xf0;                    //²ÉÈ¡Ğ´Á½´ÎµÄ·½·¨ÑÓÊ±
  key_checkin=key_ior;            //¶ÁÈ¡IO¿Ú×´Ì¬£¬ÅĞ¶ÏÊÇ·ñÓĞ¼ü°´ÏÂ
  if(key_checkin!=0xf0)           //IO¿ÚÖµ·¢Éú±ä»¯Ôò±íÊ¾ÓĞ¼ü°´ÏÂ
  {
    delay_nms(20);                 //¼üÅÌÏû¶¶£¬ÑÓÊ±20MS
    key_checkin=key_ior;
    if(key_checkin!=0xf0)
    {
     key_io=0xfe;                 //ÖğĞĞÉ¨Ãè¿ªÊ¼
     key_io=0xfe;                 //Ğ´Á½´ÎÑÓÊ±£¬ÏÂÍ¬
     key_check=key_ior;
     switch (key_check)           //¸ù¾İ¶Áµ½µÄIO¿ÚÖµÅĞ¶Ï°´¼üµÄ°´ÏÂÇé¿ö
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
  statevalue=0xff;                      //ÎŞ°´¼üÊ±·µ»ØÖµ
  key=statevalue;
  return(key);
  }
}

//*************************************************************************
//			Ö÷³ÌĞò
//*************************************************************************

void main()

{         
	  uint key_store=0x01;
	  DDRC=0x0f;                        //PC¿ÚÉÏÀ­µç×èÊ¹ÄÜ
      PORTC=0xf0;                       //PC¸ßËÄÎ»ÊäÈëµÍËÄÎ»Êä³ö


while(1)
  {

  keyboardscan();                         //¼üÅÌÉ¨Ãè£¬¿´ÊÇ·ñÓĞ°´¼ü°´ÏÂ
    if(key!=0xff)                        //Èç¹ûÓĞ°´¼ü°´ÏÂ£¬ÔòÏÔÊ¾¸Ã°´¼ü¼üÖµ0~15
      {
	      { switch(key)
		   {  
		     case 1: Display_Key(0x01);key_store=0x01;break;   //¸ù¾İ¼üÖµÏÔÊ¾µ½ÊıÂë¹ÜÉÏ
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
	 Display_Key(key_store);              //Ã»ÓĞ°´¼üµÄÊ±ºòÏÔÊ¾ÉÏ´ÎµÄ¼üÖµ
	 }

  }

}
