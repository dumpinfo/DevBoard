	.module _12864HANZI.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA1228��12864��LCD��ʾ������
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���˵���Ԫ����༭
; //���ڣ�2010.05.24
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
	.dbline 21
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
	nop
	.dbline 22
; #define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�
	nop
	.dbline 23
; 
	nop
	.dbline 24
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
	nop
	.dbline 25
; #define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�
	nop
	.dbline 26
; 
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
	.dbline 30
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
; #define EN_SET	PORTF |= (1 << PF3)                  //E�ø�
; 
; #define PSB_CLR	PORTF &= ~(1 << PE2)                 //PSB�õͣ����ڷ�ʽ
	.dbline 32
; #define PSB_SET	PORTF |= (1 << PE2)                  //PSB�øߣ����ڷ�ʽ
; 
	nop
	.dbline 33
; #define LOW		0
	nop
	.dbline 34
; #define HIGH    1
	nop
	.dbline 35
; 
	nop
	.dbline 36
; //12864��ʼ��ָ��
	nop
	.dbline 37
; #define CLEAR_SCREEN	0x01		//����ָ�������ACֵΪ00H
	nop
	.dbline 38
; #define AC_INIT		    0x02		//��AC����Ϊ00H�����α��Ƶ�ԭ��λ��
	nop
	.dbline 39
; #define CURSE_ADD		0x06		//�趨�α��Ƶ�����ͼ�������ƶ�����Ĭ���α����ƣ�ͼ�����岻����
	nop
	.dbline 40
; #define FUN_MODE		0x30		//����ģʽ��8λ����ָ�
	nop
	.dbline 41
; #define DISPLAY_ON		0x0c		//��ʾ��,��ʾ�α꣬���α�λ�÷���
	nop
	.dbline 42
; #define DISPLAY_OFF		0x08		//��ʾ��
	nop
	.dbline 43
; #define CURSE_DIR		0x14		//�α������ƶ�:AC=AC+1
	nop
	.dbline 44
; #define SET_CG_AC		0x40		//����AC����ΧΪ��00H~3FH
	nop
	.dbline 45
; #define SET_DD_AC		0x80
	nop
	.dbline 46
; 
	nop
	.dbline 47
; #define Data_IO	        PORTA                //Һ�����ݿ�
	nop
	.dbline 48
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
	nop
	.dbline 49
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
	nop
	.dbline 50
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
	nop
	.dbline 51
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
	nop
	.dbline 52
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
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
	.dbline 56
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
	.dbline 57
; void system_init()
	xcall _delay_3us
	.dbline 58
; {
	xcall _delay_3us
	.dbline 59
; 
	xcall _delay_3us
	.dbline -2
L3:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_50us _delay_50us fV
	.even
_delay_50us::
	.dbline -1
	.dbline 63
; 	Data_IO = 0xFF;				        //��ƽ����
; 	Data_DDR = 0xFF;				        //�������
; 	PORTF = 0xFF;                       //��ƽ����
; 	DDRF = 0xFF;                        //�������
	.dbline 64
;     PORTD=0xFF;
	xcall _delay_10us
	.dbline 65
; 	DDRD=0xFF;
	xcall _delay_10us
	.dbline 66
; 	PORTE=0xFF;                        //PSB��Ӧ��PE2
	xcall _delay_10us
	.dbline 67
; 	DDRE=0xFF;
	xcall _delay_10us
	.dbline -2
L4:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_100us _delay_100us fV
	.even
_delay_100us::
	.dbline -1
	.dbline 70
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
;     W_LE1;                     
;     Data_IO=0xFF;                      //�������            
	.dbline 71
;     W_LE0; 
	xcall _delay_50us
	.dbline 72
; 
	xcall _delay_50us
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_n100us _delay_n100us fV
;         n100us -> R20
	.even
_delay_n100us::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 75
; 	PSB_SET;						   //Һ�����ڷ�ʽ
; }
; 
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; //***********************************************************************
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L7
	.dbline -2
L6:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r n100us 20 c
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
	.even
_delay_1ms::
	.dbline -1
	.dbline 89
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
; 	RS_CLR;
; 	RW_CLR;
; 	EN_SET;
; 	Data_IO = com;
; 	delay_nms(5);
; 	EN_CLR;
; }
	.dbline 90
; //***********************************************************************
	xcall _delay_100us
	.dbline 91
; //	��ʾ������д�뺯��
	xcall _delay_100us
	.dbline 92
; //***********************************************************************
	xcall _delay_100us
	.dbline 93
; 
	xcall _delay_100us
	.dbline 94
; void LCD_write_data(unsigned char data) 
	xcall _delay_100us
	.dbline 95
; {
	xcall _delay_100us
	.dbline 96
; 	RS_SET;
	xcall _delay_100us
	.dbline 97
; 	RW_CLR;
	xcall _delay_100us
	.dbline 98
; 	EN_SET;
	xcall _delay_100us
	.dbline 99
; 	Data_IO = data;
	xcall _delay_100us
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;            nms -> R20,R21
	.even
_delay_nms::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 109
; 	delay_nms(5);
; 	EN_CLR;
; }
; //***********************************************************************
; //	��ʾ�������ʾ
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
; 	LCD_write_com(0x01);
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 	delay_nms(5);
	movw R2,R20
	subi R20,1
	sbci R21,0
	tst R2
	brne L12
	tst R3
	brne L12
X0:
	.dbline -2
L11:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r nms 20 i
	.dbend
	.dbfunc e delay_ns _delay_ns fV
;             ns -> R20
	.even
_delay_ns::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 114
; }
; 
; //***********************************************************************
; //�������ƣ�DisplayCgrom(uchar hz)��ʾCGROM��ĺ���
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; //��ڲ�������
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L16
	.dbline -2
L15:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r ns 20 c
	.dbend
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 58
	.dbline 60
	ldi R24,255
	out 0x1b,R24
	.dbline 61
	out 0x1a,R24
	.dbline 62
	sts 98,R24
	.dbline 63
	sts 97,R24
	.dbline 64
	out 0x12,R24
	.dbline 65
	out 0x11,R24
	.dbline 66
	out 0x3,R24
	.dbline 67
	out 0x2,R24
	.dbline 68
	sbi 0x12,4
	.dbline 69
	sbi 0x12,5
	.dbline 70
	out 0x1b,R24
	.dbline 71
	cbi 0x12,5
	.dbline 73
	lds R24,98
	ori R24,4
	sts 98,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R20
	.even
_LCD_write_com::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 82
	.dbline 83
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 84
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 85
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 86
	out 0x1b,R20
	.dbline 87
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 88
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r com 20 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R20
	.even
_LCD_write_data::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 95
	.dbline 96
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 97
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 98
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 99
	out 0x1b,R20
	.dbline 100
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 101
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r data 20 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 108
	.dbline 109
	ldi R16,1
	xcall _LCD_write_com
	.dbline 110
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e DisplayCgrom _DisplayCgrom fV
;             hz -> R20,R21
;           addr -> R22
	.even
_DisplayCgrom::
	xcall push_gset2
	movw R20,R18
	mov R22,R16
	.dbline -1
	.dbline 119
; //���ز�������
; //***********************************************************************
; void DisplayCgrom(uchar addr,uchar *hz)
; {
	.dbline 120
; 	LCD_write_com(addr);
	mov R16,R22
	xcall _LCD_write_com
	.dbline 121
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 123
	.dbline 124
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 125
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 126
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 127
L25:
	.dbline 122
; 	while(*hz != '\0')
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L24
	.dbline -2
L23:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r hz 20 pc
	.dbsym r addr 22 c
	.dbend
	.dbfunc e Display _Display fV
	.even
_Display::
	.dbline -1
	.dbline 136
; 	{
; 		LCD_write_data(*hz);
; 		hz++;
;         delay_nms(5);
; 	}
; 
; } 
; //****************************************************************
; //�������ƣ�Display()��ʾ���Խ��
; //��ڲ�������
; //���ز�������
; //****************************************************************
; void Display(void)
; {
	.dbline 137
; 	DisplayCgrom(0x80,"���˵���Ԫ���껶");
	ldi R18,<L28
	ldi R19,>L28
	ldi R16,128
	xcall _DisplayCgrom
	.dbline 138
; 	DisplayCgrom(0x90,"ӭ���Ĺ��٣�    ");
	ldi R18,<L29
	ldi R19,>L29
	ldi R16,144
	xcall _DisplayCgrom
	.dbline 139
; 	DisplayCgrom(0x88,"QQ:792758921    ");
	ldi R18,<L30
	ldi R19,>L30
	ldi R16,136
	xcall _DisplayCgrom
	.dbline 140
; 	DisplayCgrom(0x98,"�绰:13820127377");
	ldi R18,<L31
	ldi R19,>L31
	ldi R16,152
	xcall _DisplayCgrom
	.dbline -2
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 149
; 
; }
; 
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 150
; 	DDRA = 0xFF;				        //I/O�ڷ�������
	ldi R24,255
	out 0x1a,R24
	.dbline 151
; 	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	in R24,0x1a
	ori R24,224
	out 0x1a,R24
	.dbline 152
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 153
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 154
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 155
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 156
;     LCD_write_com(DISPLAY_ON);			//��ʾ��
	ldi R16,12
	xcall _LCD_write_com
	.dbline 157
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 158
;     LCD_write_com(CLEAR_SCREEN);			//����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 159
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 165
; }
; //***********************************************************************
; //			������
; //***********************************************************************
; void main(void)
; {
	.dbline 167
; 
;     system_init();                                //ϵͳ��ʼ��������IO������
	xcall _system_init
	.dbline 168
; 	delay_nms(100);                                //��ʱ100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 169
; 	LCD_init();                                   //Һ��������ʼ������
	xcall _LCD_init
	.dbline 170
; 	LCD_clear();                                  //����
	xcall _LCD_clear
	xjmp L35
L34:
	.dbline 172
	.dbline 173
	xcall _Display
	.dbline 174
L35:
	.dbline 171
	xjmp L34
X1:
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
L31:
	.blkb 17
	.area idata
	.byte 181,231,187,176,58,49,51,56,50,48,49,50,55,51,55,55
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
L30:
	.blkb 17
	.area idata
	.byte 'Q,'Q,58,55,57,50,55,53,56,57,50,49,32,32,32,32
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
L29:
	.blkb 17
	.area idata
	.byte 211,173,196,250,181,196,185,226,193,217,163,161,32,32,32,32
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
L28:
	.blkb 17
	.area idata
	.byte 214,210,208,203,181,231,215,211,212,170,188,254,181,234,187,182
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\13.12864��ʾ�����ַ�ʵ��\12864HANZI\12864HANZI.C
