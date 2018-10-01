	.module _1602.c
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128��1602��LCD��ʾ��������
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���˵���Ԫ����༭
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
; #define uchar unsigned char
; #define uint  unsigned int
; 
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
; #define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�
	.dbline 21
; 
	nop
	.dbline 22
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
	nop
	.dbline 23
; #define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�
	nop
	.dbline 24
; 
	nop
	.dbline 25
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
	nop
	.dbline 26
; #define EN_SET	PORTF |= (1 << PF3)                  //E�ø�
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
; 
; #define Data_IO	        PORTA                //Һ�����ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
	.dbline 32
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
	nop
	.dbline 33
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
	nop
	.dbline 34
; 
	nop
	.dbline 35
; //*************************************************************************
	nop
	.dbline 36
; //			��ʼ���ӳ���
	nop
	.dbline 37
; //*************************************************************************
	nop
	.dbline 38
; void system_init()
	nop
	.dbline 39
; {
	nop
	.dbline 40
; 
	nop
	.dbline 41
; 	Data_IO = 0xFF;				        //��ƽ����
	nop
	.dbline 42
; 	Data_DDR = 0xFF;				        //�������
	nop
	.dbline 43
; 	PORTF = 0xFF;                       //��ƽ����
	nop
	.dbline 44
; 	DDRF = 0xFF;                        //�������
	nop
	.dbline 45
;     PORTD=0xFF;
	nop
	.dbline 46
; 	DDRD=0xFF;
	nop
	.dbline 47
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	nop
	.dbline 48
;     W_LE1;                     
	nop
	.dbline 49
;     Data_IO=0xFF;                      //�������            
	nop
	.dbline 50
;     W_LE0; 
	nop
	.dbline 51
; }
	nop
	.dbline 52
; 
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
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
	.dbline 57
; 
	xcall _delay_3us
	.dbline 58
; void LCD_write_com(unsigned char com) 
	xcall _delay_3us
	.dbline 59
; {	
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
; 	RS_CLR;
; 	RW_CLR;
; 	EN_SET;
; 	Data_IO = com;
	.dbline 64
; 	delay_nms(5);
	xcall _delay_10us
	.dbline 65
; 	EN_CLR;
	xcall _delay_10us
	.dbline 66
; }
	xcall _delay_10us
	.dbline 67
; //***********************************************************************
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
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
	.dbline 71
; void LCD_write_data(unsigned char data) 
	xcall _delay_50us
	.dbline 72
; {
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
; 	RS_SET;
; 	RW_CLR;
; 	EN_SET;
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 	Data_IO = data;
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
; 	delay_nms(5);
; }
; //***********************************************************************
	.dbline 90
; //	��ʾ���ַ���д�뺯��
	xcall _delay_100us
	.dbline 91
; //***********************************************************************
	xcall _delay_100us
	.dbline 92
; 
	xcall _delay_100us
	.dbline 93
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
	xcall _delay_100us
	.dbline 94
; {
	xcall _delay_100us
	.dbline 95
; 	
	xcall _delay_100us
	.dbline 96
;     if (y == 0) 
	xcall _delay_100us
	.dbline 97
;     {
	xcall _delay_100us
	.dbline 98
;     	LCD_write_com(0x80 + x);
	xcall _delay_100us
	.dbline 99
;     }
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
;     else 
;     {
;     	LCD_write_com(0xC0 + x);
;     }
;     
;     while (*s) 
;     {
;     	LCD_write_data( *s);
;     	s ++;
;     }
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; }
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
; //***********************************************************************
; //	��ʾ�����ַ�д�뺯��
; //***********************************************************************
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
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
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\9.1602Һ����ʾʵ��\1602\1602.c
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 39
	.dbline 41
	ldi R24,255
	out 0x1b,R24
	.dbline 42
	out 0x1a,R24
	.dbline 43
	sts 98,R24
	.dbline 44
	sts 97,R24
	.dbline 45
	out 0x12,R24
	.dbline 46
	out 0x11,R24
	.dbline 47
	sbi 0x12,4
	.dbline 48
	sbi 0x12,5
	.dbline 49
	out 0x1b,R24
	.dbline 50
	cbi 0x12,5
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
	.dbline 59
	.dbline 60
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 61
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 62
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 63
	out 0x1b,R20
	.dbline 64
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 65
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
	.dbline 72
	.dbline 73
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 74
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 75
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 76
	out 0x1b,R20
	.dbline 77
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 78
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
	.dbline 85
	.dbline 86
	ldi R16,1
	xcall _LCD_write_com
	.dbline 87
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_gset3
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 94
	.dbline 96
	tst R10
	brne L24
	.dbline 97
	.dbline 98
	mov R16,R22
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 99
	xjmp L27
L24:
	.dbline 101
	.dbline 102
	mov R16,R22
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 103
	xjmp L27
L26:
	.dbline 106
	.dbline 107
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 108
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 109
L27:
	.dbline 105
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L26
	.dbline -2
L23:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+4
;              y -> R22
;              x -> R20
	.even
_LCD_write_char::
	xcall push_gset2
	mov R22,R18
	mov R20,R16
	.dbline -1
	.dbline 116
; {
	.dbline 118
; 	
;     if (y == 0) 
	tst R22
	brne L30
	.dbline 119
;     {
	.dbline 120
;     	LCD_write_com(0x80 + x);
	mov R16,R20
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 121
;     }
	xjmp L31
L30:
	.dbline 123
;     else 
;     {
	.dbline 124
;     	LCD_write_com(0xC0 + x);
	mov R16,R20
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 125
;     }
L31:
	.dbline 127
;     
;     LCD_write_data( data);  
	ldd R16,y+4
	xcall _LCD_write_data
	.dbline -2
L29:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym l data 4 c
	.dbsym r y 22 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 134
; }
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 135
; 	DDRA = 0xFF;				        //I/O�ڷ�������
	ldi R24,255
	out 0x1a,R24
	.dbline 136
; 	DDRA |= (1 << PA5) | (1 << PA6) | (1 << PA7);
	in R24,0x1a
	ori R24,224
	out 0x1a,R24
	.dbline 137
; 	LCD_write_com(0x38);				//��ʾģʽ����
	ldi R16,56
	xcall _LCD_write_com
	.dbline 138
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 139
; 	LCD_write_com(0x08);				//��ʾ�ر�
	ldi R16,8
	xcall _LCD_write_com
	.dbline 140
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 141
;     LCD_write_com(0x01);				//��ʾ����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 142
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 143
;     LCD_write_com(0x06);				//��ʾ����ƶ�����
	ldi R16,6
	xcall _LCD_write_com
	.dbline 144
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 145
; 	LCD_write_com(0x0C);				//��ʾ�����������
	ldi R16,12
	xcall _LCD_write_com
	.dbline 146
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
;              p -> R22,R23
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 153
; }
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; void main(void) 
; {
	.dbline 157
; 
; 	unsigned char i;
; 	unsigned char *p;
;     system_init();                                //ϵͳ��ʼ��������IO������
	xcall _system_init
	.dbline 158
; 	delay_nms(100);                                //��ʱ100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 159
; 	LCD_init();                                   //Һ��������ʼ������
	xcall _LCD_init
	xjmp L35
L34:
	.dbline 162
; 
;  while (1) 
;    {
	.dbline 163
; 		i = 1;
	ldi R20,1
	.dbline 164
; 		p = "zhongxingdianzi";                     //�ַ��������ʾ
	ldi R22,<L37
	ldi R23,>L37
	.dbline 165
; 		LCD_clear();
	xcall _LCD_clear
	.dbline 166
; 		LCD_write_str(0,0,"Welcome");
	ldi R24,<L38
	ldi R25,>L38
	std y+1,R25
	std y+0,R24
	clr R18
	clr R16
	xcall _LCD_write_str
	.dbline 167
; 		delay_nms(250);
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	xjmp L40
L39:
	.dbline 169
	.dbline 170
	movw R30,R22
	ldd R2,z+0
	std y+0,R2
	ldi R18,1
	mov R16,R20
	xcall _LCD_write_char
	.dbline 171
	inc R20
	.dbline 172
	subi R22,255  ; offset = 1
	sbci R23,255
	.dbline 173
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	.dbline 174
L40:
	.dbline 169
	movw R30,R22
	ldd R2,z+0
	tst R2
	brne L39
	.dbline 175
	ldi R16,250
	ldi R17,0
	xcall _delay_nms
	.dbline 176
L35:
	.dbline 161
	xjmp L34
X1:
	.dbline -2
L33:
	adiw R28,2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r p 22 pc
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\9.1602Һ����ʾʵ��\1602\1602.c
L38:
	.blkb 8
	.area idata
	.byte 'W,'e,'l,'c,'o,'m,'e,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\9.1602Һ����ʾʵ��\1602\1602.c
L37:
	.blkb 16
	.area idata
	.byte 'z,'h,'o,'n,'g,'x,'i,'n,'g,'d,'i,'a,'n,'z,'i,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\9.1602Һ����ʾʵ��\1602\1602.c
