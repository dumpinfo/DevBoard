	.module SPI.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\SPI\SPI.C
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 9
; //********************************************************************
; /*�� �� ����delay_us
; �������ڣ�2010��1��28��
; ���뻷����ICCAVR7.16A
; �������ã�΢�뼶����ʱ����
; ˵    ����7.3728M������
; ********************************************************************/
; void delay_1us(void)                 //1us��ʱ�����������������ã� 
; { 
	.dbline 10
;    asm("nop");                       //1ʱ������
	nop
	.dbline 11
;    asm("nop");
	nop
	.dbline 12
;    asm("nop");
	nop
	.dbline 13
;    asm("nop");
	nop
	.dbline 14
;    asm("nop");                       //1T
	nop
	.dbline 15
;    asm("nop");
	nop
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_3us _delay_3us fV
	.even
_delay_3us::
	.dbline -1
	.dbline 19
; 
; }
; void delay_3us(void)                 //3us��ʱ����,,���ظ����ò�Ӱ�쾫��
; { 
	.dbline 21
;    
;    asm("nop");
	nop
	.dbline 22
;    asm("nop");
	nop
	.dbline 23
;    asm("nop");                       
	nop
	.dbline 24
;    asm("nop");
	nop
	.dbline 25
;    asm("nop");
	nop
	.dbline 26
;    asm("nop");
	nop
	.dbline 27
;    asm("nop");                       
	nop
	.dbline 28
;    asm("nop");
	nop
	.dbline 29
;    asm("nop");
	nop
	.dbline 30
;    asm("nop");
	nop
	.dbline 31
;    asm("nop");                       
	nop
	.dbline 32
;    asm("nop");
	nop
	.dbline 33
;    asm("nop");
	nop
	.dbline 34
;    asm("nop");
	nop
	.dbline 35
;    asm("nop");                       
	nop
	.dbline 36
;    asm("nop");
	nop
	.dbline 37
;    asm("nop");
	nop
	.dbline 38
;    asm("nop");
	nop
	.dbline 39
;    asm("nop");
	nop
	.dbline 40
;    asm("nop");
	nop
	.dbline 41
;    asm("nop");                       
	nop
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_10us _delay_10us fV
	.even
_delay_10us::
	.dbline -1
	.dbline 45
; } 
; 
; void delay_10us(void)                 //10us��ʱ����,,���ظ����ò�Ӱ�쾫��
; {
	.dbline 46
;    delay_3us();
	xcall _delay_3us
	.dbline 47
;    delay_3us(); 
	xcall _delay_3us
	.dbline 48
;    delay_3us();  
	.dbline -2
L3:
	.dbline 0 ; func end
	xjmp _delay_3us
	.dbend
	.dbfunc e delay_50us _delay_50us fV
	.even
_delay_50us::
	.dbline -1
	.dbline 52
; }
;   
; void delay_50us(void)                 //48us��ʱ����,,���ظ����ò�Ӱ�쾫��
; { 
	.dbline 53
;    delay_10us();
	xcall _delay_10us
	.dbline 54
;    delay_10us(); 
	xcall _delay_10us
	.dbline 55
;    delay_10us();
	xcall _delay_10us
	.dbline 56
;    delay_10us();
	.dbline -2
L4:
	.dbline 0 ; func end
	xjmp _delay_10us
	.dbend
	.dbfunc e delay_100us _delay_100us fV
	.even
_delay_100us::
	.dbline -1
	.dbline 59
; }
; void delay_100us(void)     //exactly 98us��ʱ����,,���ظ����ò�Ӱ�쾫��
; {
	.dbline 60
;  delay_50us();
	xcall _delay_50us
	.dbline 61
;  delay_50us();
	.dbline -2
L5:
	.dbline 0 ; func end
	xjmp _delay_50us
	.dbend
	.dbfunc e delay_n100us _delay_n100us fV
;         n100us -> R20
	.even
_delay_n100us::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 64
; }
; void delay_n100us(unsigned char n100us)
; {
	xjmp L8
L7:
	.dbline 66
;  while(n100us--)                          
;  delay_100us();
	xcall _delay_100us
L8:
	.dbline 65
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L7
X0:
	.dbline -2
L6:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r n100us 20 c
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
	.even
_delay_1ms::
	.dbline -1
	.dbline 78
; }
; /*delay_n100us(2)        250us
; delay_n100us(3)          360us
; delay_n100us(4)          470us
; delay_n100us(5)          580us
; delay_n100us(6)          690us
; delay_n100us(7)       800us
; delay_n100us(8)          900us              ��Ҫ�����ں���������while,,,���6us
; 
; */
; void delay_1ms()
; {
	.dbline 79
;  delay_100us();
	xcall _delay_100us
	.dbline 80
;  delay_100us();
	xcall _delay_100us
	.dbline 81
;  delay_100us();
	xcall _delay_100us
	.dbline 82
;  delay_100us();
	xcall _delay_100us
	.dbline 83
;  delay_100us();
	xcall _delay_100us
	.dbline 84
;  delay_100us();
	xcall _delay_100us
	.dbline 85
;  delay_100us();
	xcall _delay_100us
	.dbline 86
;  delay_100us();
	xcall _delay_100us
	.dbline 87
;  delay_100us();
	xcall _delay_100us
	.dbline 88
;  delay_100us();
	.dbline -2
L10:
	.dbline 0 ; func end
	xjmp _delay_100us
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;            nms -> R20,R21
	.even
_delay_nms::
	st -y,R20
	st -y,R21
	movw R20,R16
	.dbline -1
	.dbline 98
; }
; /********************************************************************
; �� �� ����Delay_ms
; �������ڣ�2010��1��28��
; �޸����ڣ�
; �������ã����뼶�ľ�ȷ��ʱ����
; ˵    ����
; ********************************************************************/
; void delay_nms(unsigned int nms)
; {
	xjmp L13
L12:
	.dbline 100
;  while(nms--) 
;  delay_1ms();
	xcall _delay_1ms
L13:
	.dbline 99
	movw R2,R20
	subi R20,1
	sbci R21,0
	tst R2
	brne L12
	tst R3
	brne L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ld R21,y+
	ld R20,y+
	ret
	.dbsym r nms 20 i
	.dbend
	.dbfunc e delay_ns _delay_ns fV
;             ns -> R20
	.even
_delay_ns::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 103
; }
; void delay_ns(unsigned char ns)
; {
	xjmp L17
L16:
	.dbline 105
;  while(ns--) 
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 104
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L16
X2:
	.dbline -2
L15:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r ns 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
_count::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\SPI\SPI.C
	.dbsym e count _count c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\SPI\SPI.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 42
; //DMAVR-128��SPIӦ��ʾ�����򣬲���SPI�ӿڵ�DACоƬTLC5615���������е�ѹת��
; //DACΪTI��˾��10λ���е�ѹ�������DACоƬTLC5615,SPI�ӿ����ӷ�ʽ
; //��ͨ��SPI�ӿڣ���DACоƬ��ʹ�����000-FFC(TLC5615����λ��ֵһֱΪ0)�����ת��
; //LEDָʾ��DS3��Ӧ�Ӱ���������ʾ��ѹ������
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���ߣ����� www.avrgcc.com
; //���ڣ�2010.01.14
; 
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
; 
; //***********************************************************************
; //	���������
; //***********************************************************************
; #define uchar unsigned char
; #define uint  unsigned int
; 
; #define cs0   PORTB &= ~(1 << PB0)          //Ƭѡ�ź��õ�
; #define cs1   PORTB |= (1 << PB0)           //Ƭѡ�ź��ø�
; 
; #define Data_IO	        PORTA                //��������ݿ�
; #define Data_DDR        DDRA                 //��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; uint da_data;
; uchar count=0;
; uint da_data2;
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()
; {
	.dbline 43
;  	 D_LE1;                             //�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 44
;      W_LE1;                     
	sbi 0x12,5
	.dbline 45
;      Data_IO=0xFF;                      //�������            
	ldi R24,255
	out 0x1b,R24
	.dbline 46
;      W_LE0; 
	cbi 0x12,5
	.dbline 48
; 
; 	PORTB = 0x00;		         //��ƽ����
	clr R2
	out 0x18,R2
	.dbline 49
; 	DDRB = 0xFF;		         //�������
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e SPI_init _SPI_init fV
	.even
_SPI_init::
	.dbline -1
	.dbline 53
; 
; }
; void SPI_init()
; {
	.dbline 54
;   SPCR=(1<<SPE)|(1<<MSTR);              //������ʽ��SPIģʽΪ0��SCKƵ��ΪFosc/4
	ldi R24,80
	out 0xd,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 64
;   
; }
; 
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; 
; void main(void)
; { 
	.dbline 65
;   system_init();                               //ϵͳIO�ڳ�ʼ��
	xcall _system_init
	.dbline 66
;   SPI_init();                                  //SPI��ʼ��
	xcall _SPI_init
	xjmp L23
L22:
	.dbline 68
;   while(1)
;   {
	.dbline 69
;     for(da_data=0x0000;da_data<0x0ffc;da_data++)
	clr R2
	clr R3
	sts _da_data+1,R3
	sts _da_data,R2
	xjmp L28
L25:
	.dbline 70
;     {
	.dbline 71
;       cs0;                                     //ʹ��DAC
	cbi 0x18,0
	.dbline 72
;       da_data2=(da_data&0xff00);               //��ȡ���ݵĸ�8λ
	lds R24,_da_data
	lds R25,_da_data+1
	andi R24,0
	sts _da_data2+1,R25
	sts _da_data2,R24
	.dbline 73
;       da_data2>>=8;                            //��8λ�Ƶ���8λ�����ڸ�ֵ
	movw R2,R24
	mov R2,R3
	clr R3
	sts _da_data2+1,R3
	sts _da_data2,R2
	.dbline 74
;       SPDR=da_data2;                           //д���ݵĸ�8λ��SPI���ݼĴ���
	out 0xf,R2
	.dbline 75
;       SPDR=da_data&&0x00ff;                    //д���ݵĵ�8λ��SPI���ݼĴ���
	lds R2,_da_data
	lds R3,_da_data+1
	tst R2
	brne X3
	tst R3
	breq L29
X3:
	ldi R20,1
	ldi R21,0
	xjmp L30
L29:
	clr R20
	clr R21
L30:
	out 0xf,R20
	.dbline 76
;       delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 77
;       cs1;                                    //�ر�ʹ��
	sbi 0x18,0
	.dbline 78
;     }
L26:
	.dbline 69
	lds R24,_da_data
	lds R25,_da_data+1
	adiw R24,1
	sts _da_data+1,R25
	sts _da_data,R24
L28:
	.dbline 69
	lds R24,_da_data
	lds R25,_da_data+1
	cpi R24,252
	ldi R30,15
	cpc R25,R30
	brlo L25
X4:
	.dbline 79
;   }
L23:
	.dbline 67
	xjmp L22
X5:
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\SPI\SPI.C
_da_data2::
	.blkb 2
	.dbsym e da_data2 _da_data2 i
_da_data::
	.blkb 2
	.dbsym e da_data _da_data i
; }
