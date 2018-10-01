	.module _12864HANZI.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
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
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 56
; //DMAVR-128��12864��LCD��ʾ����������ʾ����welcome��Ϣ�������͵�����վ��ַ���Ǽ򵥵���ʾ���ֺ��ַ�
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
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
; #define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�
; 
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
; #define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�
; 
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
; #define EN_SET	PORTF |= (1 << PF3)                  //E�ø�
; 
; #define LOW		0
; #define HIGH    1
; 
; //12864��ʼ��ָ��
; #define CLEAR_SCREEN	0x01		//����ָ�������ACֵΪ00H
; #define AC_INIT		    0x02		//��AC����Ϊ00H�����α��Ƶ�ԭ��λ��
; #define CURSE_ADD		0x06		//�趨�α��Ƶ�����ͼ�������ƶ�����Ĭ���α����ƣ�ͼ�����岻����
; #define FUN_MODE		0x30		//����ģʽ��8λ����ָ�
; #define DISPLAY_ON		0x0c		//��ʾ��,��ʾ�α꣬���α�λ�÷���
; #define DISPLAY_OFF		0x08		//��ʾ��
; #define CURSE_DIR		0x14		//�α������ƶ�:AC=AC+1
; #define SET_CG_AC		0x40		//����AC����ΧΪ��00H~3FH
; #define SET_DD_AC		0x80
; 
; #define Data_IO	        PORTA                //Һ�����ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()
; {
	.dbline 58
; 
; 	Data_IO = 0xFF;				        //��ƽ����
	ldi R24,255
	out 0x1b,R24
	.dbline 59
; 	Data_DDR = 0xFF;				        //�������
	out 0x1a,R24
	.dbline 60
; 	PORTF = 0xFF;                       //��ƽ����
	sts 98,R24
	.dbline 61
; 	DDRF = 0xFF;                        //�������
	sts 97,R24
	.dbline 62
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 63
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 64
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 65
;     W_LE1;                     
	sbi 0x12,5
	.dbline 66
;     Data_IO=0xFF;                      //�������            
	out 0x1b,R24
	.dbline 67
;     W_LE0; 
	cbi 0x12,5
	.dbline 69
; 	
; 	PORTB=0xFF;
	out 0x18,R24
	.dbline 70
; 	DDRB=0xFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R10
	.even
_LCD_write_com::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 79
; }
; 
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 80
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 81
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 82
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 83
; 	Data_IO = com;
	out 0x1b,R10
	.dbline 84
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 85
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r com 10 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R10
	.even
_LCD_write_data::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 92
; }
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 93
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 94
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 95
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 96
; 	Data_IO = data;
	out 0x1b,R10
	.dbline 97
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 98
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r data 10 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 105
; }
; //***********************************************************************
; //	��ʾ�������ʾ
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 106
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 107
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L22:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e DisplayCgrom _DisplayCgrom fV
;             hz -> R20,R21
;           addr -> R10
	.even
_DisplayCgrom::
	xcall push_xgset300C
	movw R20,R18
	mov R10,R16
	.dbline -1
	.dbline 116
; }
; 
; //***********************************************************************
; //�������ƣ�DisplayCgrom(uchar hz)��ʾCGROM��ĺ���
; //��ڲ�������
; //���ز�������
; //***********************************************************************
; void DisplayCgrom(uchar addr,uchar *hz)
; {
	.dbline 117
; 	LCD_write_com(addr);
	mov R16,R10
	xcall _LCD_write_com
	.dbline 118
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 120
; 	while(*hz != '\0')
; 	{
	.dbline 121
; 		LCD_write_data(*hz);
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 122
; 		hz++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 123
;         delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 124
; 	}
L25:
	.dbline 119
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L24
X3:
	.dbline -2
L23:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r hz 20 pc
	.dbsym r addr 10 c
	.dbend
	.dbfunc e Display _Display fV
	.even
_Display::
	.dbline -1
	.dbline 133
; 
; } 
; //****************************************************************
; //�������ƣ�Display()��ʾ���Խ��
; //��ڲ�������
; //���ز�������
; //****************************************************************
; void Display(void)
; {
	.dbline 134
; 	DisplayCgrom(0x80,"�����͵��ӻ�ӭ��");
	ldi R18,<L28
	ldi R19,>L28
	ldi R16,128
	xcall _DisplayCgrom
	.dbline 135
; 	DisplayCgrom(0x88,"��:jingyehanxing");
	ldi R18,<L29
	ldi R19,>L29
	ldi R16,136
	xcall _DisplayCgrom
	.dbline 136
; 	DisplayCgrom(0x90,"www.avrgcc.com  ");
	ldi R18,<L30
	ldi R19,>L30
	ldi R16,144
	xcall _DisplayCgrom
	.dbline 137
; 	DisplayCgrom(0x98,"�绰:13946060471");
	ldi R18,<L31
	ldi R19,>L31
	ldi R16,152
	.dbline -2
L27:
	.dbline 0 ; func end
	xjmp _DisplayCgrom
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 146
; 
; }
; 
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 147
; 	DDRA = 0xFF;				        //I/O�ڷ�������
	ldi R24,255
	out 0x1a,R24
	.dbline 148
; 	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	in R24,0x1a
	ori R24,224
	out 0x1a,R24
	.dbline 149
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 150
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 151
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 152
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 153
;     LCD_write_com(DISPLAY_ON);			//��ʾ��
	ldi R16,12
	xcall _LCD_write_com
	.dbline 154
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 155
;     LCD_write_com(CLEAR_SCREEN);			//����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 156
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L32:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 162
; }
; //***********************************************************************
; //			������
; //***********************************************************************
; void main(void)
; {
	.dbline 164
; 
;     system_init();                                //ϵͳ��ʼ��������IO������
	xcall _system_init
	.dbline 165
; 	delay_nms(100);                                //��ʱ100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 166
; 	LCD_init();                                   //Һ��������ʼ������
	xcall _LCD_init
	.dbline 167
; 	LCD_clear();                                  //����
	xcall _LCD_clear
	xjmp L35
L34:
	.dbline 169
; 	while(1)
; 	{
	.dbline 170
; 	Display();                                    //��ʾ����
	xcall _Display
	.dbline 171
; 	}
L35:
	.dbline 168
	xjmp L34
X4:
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
L31:
	.blkb 17
	.area idata
	.byte 181,231,187,176,58,49,51,57,52,54,48,54,48,52,55,49
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
L30:
	.blkb 17
	.area idata
	.byte 'w,'w,'w,46,'a,'v,'r,'g,'c,'c,46,'c,'o,'m,32,32
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
L29:
	.blkb 17
	.area idata
	.byte 205,250,58,'j,'i,'n,'g,'y,'e,'h,'a,'n,'x,'i,'n,'g
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
L28:
	.blkb 17
	.area idata
	.byte 208,192,202,192,188,205,181,231,215,211,187,182,211,173,196,227
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\12864HANZI\12864HANZI.C
; }
; 
