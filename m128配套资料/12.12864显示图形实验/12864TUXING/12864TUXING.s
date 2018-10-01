	.module _12864TUXING.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128��12864��LCD��ʾͼ����������,������ʾ2��ͼƬ
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���˵���Ԫ����༭
; //���ڣ�2010.06.14
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
; 
	nop
	.dbline 22
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
	nop
	.dbline 23
; #define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�
	nop
	.dbline 24
; 
	nop
	.dbline 25
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
	nop
	.dbline 26
; #define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�
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
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
; #define EN_SET	PORTF |= (1 << PF3)                  //E�ø�
; 
	.dbline 32
; #define PSB_CLR	PORTF &= ~(1 << PE2)                 //PSB�õͣ����ڷ�ʽ
; #define PSB_SET	PORTF |= (1 << PE2)                  //PSB�øߣ����ڷ�ʽ
	nop
	.dbline 33
; 
	nop
	.dbline 34
; #define LOW		    0
	nop
	.dbline 35
; #define HIGH		1
	nop
	.dbline 36
; #define FIRST_ADDR  0          	     //�����ַ�/������ʾ��ʼλ��
	nop
	.dbline 37
; 
	nop
	.dbline 38
; //12864��س�ʼ��ָ��
	nop
	.dbline 39
; #define CLEAR_SCREEN	0x01		//����ָ�������ACֵΪ00H
	nop
	.dbline 40
; #define AC_INIT		    0x02		//��AC����Ϊ00H�����α��Ƶ�ԭ��λ��
	nop
	.dbline 41
; #define CURSE_ADD	    0x06		//�趨�α��Ƶ�����ͼ�������ƶ�����Ĭ���α����ƣ�ͼ�����岻����
	nop
	.dbline 42
; #define FUN_MODE	    0x30		//����ģʽ��8λ����ָ�
	nop
	.dbline 43
; #define DISPLAY_ON	    0x0c		//��ʾ��,��ʾ�α꣬���α�λ�÷���
	nop
	.dbline 44
; #define DISPLAY_OFF	    0x08		//��ʾ��
	nop
	.dbline 45
; #define CURSE_DIR  	    0x14		//�α������ƶ�:AC=AC+1
	nop
	.dbline 46
; #define SET_CG_AC	    0x40		//����AC����ΧΪ��00H~3FH
	nop
	.dbline 47
; #define SET_DD_AC	    0x80
	nop
	.dbline 48
; #define FUN_MODEK	    0x36		//����ģʽ��8λ��չָ�
	nop
	.dbline 49
; 
	nop
	.dbline 50
; #define X1address       0x80        //12864�ϰ���X����ʼ��ַ
	nop
	.dbline 51
; #define X2address       0x88        //12864�°���X����ʼ��ַ
	nop
	.dbline 52
; #define Yaddress        0x80        //Y����ʼ��ַ
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
; #define Data_IO	        PORTA                //Һ�����ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
	.dbline 57
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
	xcall _delay_3us
	.dbline 58
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
	xcall _delay_3us
	.dbline 59
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
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
; //ͼ������<��>
;  uchar photo3[]={
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	.dbline 64
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	xcall _delay_10us
	.dbline 65
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	xcall _delay_10us
	.dbline 66
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	xcall _delay_10us
	.dbline 67
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
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
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	.dbline 71
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	xcall _delay_50us
	.dbline 72
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
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
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x02,0x00,0x00,0x00,0x18,0x03,0xC0,0x00,0x00,0x03,0xC0,0x00,0x00,0x00,0x00,
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 0x00,0x02,0x00,0x00,0x00,0x30,0x0F,0xC0,0x00,0x00,0x06,0x60,0x00,0x06,0x00,0x00,
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
; 0x00,0x06,0x00,0x00,0x00,0x70,0x18,0x40,0x00,0x00,0x04,0x10,0x00,0x06,0x00,0x00,
; 0x00,0x0E,0x00,0x00,0x01,0xE0,0x22,0x40,0x00,0x00,0x0C,0x18,0x00,0x05,0x00,0x00,
; 0x00,0x1E,0x00,0x00,0x07,0xE0,0x42,0x00,0x00,0x07,0xF8,0x0C,0x00,0x0D,0x00,0x00,
; 0x00,0x1E,0x00,0x7F,0xFF,0xC0,0x42,0x60,0x00,0x1F,0xDC,0x06,0x00,0xE8,0x80,0x00,
; 0x00,0x3E,0x01,0xFF,0xFF,0x80,0xB3,0xE0,0x00,0x70,0x04,0x08,0x00,0xF8,0xBC,0x00,
; 0x00,0x3E,0x03,0xFF,0xFF,0x00,0xEB,0x20,0x00,0xC0,0x04,0x18,0x00,0xB8,0xFE,0x00,
; 0x00,0x3C,0x07,0xFF,0xFE,0x00,0xCA,0x20,0x01,0x00,0x06,0x30,0x00,0x98,0xC3,0x00,
; 0x00,0x7C,0x0F,0x8F,0xF8,0x00,0x8C,0x20,0x02,0x7F,0x03,0xE0,0x00,0x08,0xC1,0x00,
; 0x00,0x78,0x7F,0xC0,0x00,0x00,0x8C,0x20,0x05,0xFF,0xC1,0xC0,0x00,0x08,0xA0,0x80,
; 0x00,0x79,0xFF,0xF0,0x00,0x00,0xCF,0xA0,0x0F,0x00,0xE0,0x00,0x00,0x88,0xE0,0x80,
; 0x00,0x77,0x00,0x7C,0x00,0x00,0xD8,0xA2,0x1C,0x00,0x38,0x00,0x00,0x89,0xE0,0x40,
; 0x00,0x7F,0x00,0x1E,0x00,0x00,0xD8,0x82,0x1B,0xC0,0x1C,0x00,0x00,0x9A,0x30,0x40,
; 0x00,0xF3,0xC0,0x07,0x00,0x00,0xF8,0xC2,0x3F,0xF0,0x06,0xF0,0x00,0x9E,0x30,0x40,
	.dbline 90
; 0x00,0xC0,0x70,0x03,0x80,0x00,0xF8,0xC2,0x3C,0x1C,0x03,0xF8,0x00,0xB4,0x28,0x20,
	xcall _delay_100us
	.dbline 91
; 0x01,0x80,0x1C,0x01,0x80,0x00,0x7E,0x82,0x60,0x0E,0x00,0xFE,0x00,0xE6,0x2C,0x20,
	xcall _delay_100us
	.dbline 92
; 0x03,0x00,0x06,0x00,0xC0,0x00,0x7F,0x06,0xC0,0x02,0x00,0xFF,0xC0,0xE2,0x26,0x20,
	xcall _delay_100us
	.dbline 93
; 0x07,0xF0,0x03,0x00,0x70,0x00,0x3F,0x06,0x80,0x01,0x00,0xFF,0xC0,0x42,0x23,0x60,
	xcall _delay_100us
	.dbline 94
; 
	xcall _delay_100us
	.dbline 95
; };
	xcall _delay_100us
	.dbline 96
;  uchar  photo4[]={
	xcall _delay_100us
	.dbline 97
; 0x0E,0x1C,0x01,0x80,0x78,0x00,0x7C,0x0F,0x00,0x03,0x8C,0xFF,0x00,0x42,0x67,0xC0,
	xcall _delay_100us
	.dbline 98
; 0x18,0x06,0x00,0x80,0x3E,0x00,0xC0,0x0F,0x00,0x02,0x14,0x7C,0x00,0x43,0xFF,0xF0,
	xcall _delay_100us
	.dbline 99
; 0x30,0x03,0x00,0x40,0x1F,0xC3,0x80,0x1F,0x80,0x02,0x64,0x7C,0x00,0x43,0xB1,0xFC,
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
; 0x60,0x03,0x80,0x3C,0x09,0xFE,0x00,0x1F,0xC0,0x72,0x60,0x7E,0x00,0x42,0x10,0x86,
; 0x40,0x03,0x80,0x3E,0x0C,0x00,0x00,0x1F,0xC0,0x7C,0x00,0x3A,0x00,0x44,0x10,0x86,
; 0x80,0x03,0xC0,0x7F,0x06,0x00,0x00,0x1F,0xE0,0x46,0x47,0x9B,0x00,0x64,0x10,0x84,
; 0x00,0x01,0xE0,0x7F,0x82,0x00,0x00,0x30,0x20,0x42,0x46,0xD9,0x00,0x24,0x11,0x04,
; 0x00,0x01,0xE0,0xEF,0xC3,0x00,0x00,0x60,0x00,0x62,0xE4,0x28,0xBF,0xA4,0x1D,0x08,
; 0x00,0x01,0xE0,0xE7,0xC1,0x80,0x00,0xC0,0x00,0x21,0xFC,0x20,0xFF,0xFC,0x1F,0x30,
; 0x00,0x00,0xF0,0xE3,0xC0,0xC0,0x01,0x80,0x01,0xE7,0x32,0x40,0x7F,0xDC,0x23,0xF0,
; 0x00,0x00,0xF0,0xC3,0x80,0x60,0x03,0x00,0x03,0xFE,0x12,0x40,0x7F,0x84,0x21,0xD8,
; 0x00,0x00,0x71,0xC0,0x00,0x30,0x0E,0x00,0x02,0x32,0x13,0x80,0x3F,0x04,0x60,0x88,
; 0x00,0x00,0x39,0xC2,0x40,0x1C,0x1C,0x00,0x04,0x12,0x13,0x80,0x3E,0x03,0xC0,0x8C,
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 0x00,0x00,0x18,0x82,0x40,0x07,0xF8,0x00,0x04,0x13,0x13,0x80,0x18,0x03,0x81,0x04,
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
; 0x00,0x00,0x08,0x82,0x40,0x01,0xC0,0x00,0x02,0x11,0x32,0x80,0x1C,0x05,0xC6,0x1C,
; 0x00,0x00,0x08,0x42,0x40,0x00,0x00,0x00,0x03,0x32,0xB4,0x40,0x0E,0x0C,0xFE,0x38,
; 0x00,0x00,0x00,0x42,0x40,0x00,0x00,0x00,0x01,0xFA,0x4C,0x40,0x07,0xF8,0x3F,0xE0,
; 0x00,0x00,0x00,0x42,0x40,0x00,0x00,0x00,0x00,0xCE,0x0C,0x40,0x07,0xFE,0x00,0x00,
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 0x00,0x00,0x00,0x26,0x00,0x00,0x00,0x00,0x00,0x8E,0x0B,0xC0,0x07,0xBF,0x00,0x00,
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
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
_photo3::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,24
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 15,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 6,96
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 24,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 4,16
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,14
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 1,224
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 34,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 12,24
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,5
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 7,224
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'B,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 248,12
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,13
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,127
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 255,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'B,96
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 220,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,232
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,62
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 1,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 255,128
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 179,224
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,'p
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 4,8
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,248
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 188,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,62
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 255,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 235,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 4,24
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,184
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 254,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,60
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 7,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 254,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 202,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 1,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 6,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,152
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 195,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 15,143
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 248,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 140,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 2,127
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,224
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 193,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,'x
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 127,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 140,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 5,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 193,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,8
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 160,128
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,'y
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 255,240
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 207,160
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 15,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,136
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 224,128
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,'w
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 216,162
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 56,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,137
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 224,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,127
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,30
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 216,130
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 27,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,154
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 48,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,243
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 192,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 248,194
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 63,240
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 6,240
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,158
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 48,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'p,3
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 248,194
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 60,28
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,248
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,180
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 40,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 28,1
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 126,130
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 96,14
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,254
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,230
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 44,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 6,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 127,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 192,2
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 192,226
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 38,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 7,240
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'p,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 128,1
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,255
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 192,'B
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 35,96
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.dbsym e photo3 _photo3 A[512:512]c
_photo4::
	.blkb 2
	.area idata
	.byte 14,28
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'x,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 124,15
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 140,255
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'g,192
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,6
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 62,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,15
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 20,124
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'C
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,240
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 48,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 31,195
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,31
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,2
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'd,124
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'C
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 177,252
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,60
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 9,254
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,'r
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,126
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,134
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,62
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 12,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,124
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,58
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'D
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,134
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,127
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 6,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,31
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,'F
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'G,155
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'d
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 16,132
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,127
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 130,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 32,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'F,217
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,36
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 17,4
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,239
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 195,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,96
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'b
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 228,40
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 191,164
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 29,8
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,231
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 193,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,192
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,33
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 252,32
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 255,252
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 31,48
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,227
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,192
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,231
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 50,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,220
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 35,240
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,195
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,96
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,254
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 18,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 127,132
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 33,216
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'q,192
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 14,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 2,50
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,4
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 96,136
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 57,194
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,28
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,18
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 62,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,140
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,130
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,7
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 248,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 4,19
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 19,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 24,3
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 129,4
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 8,130
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,1
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 2,17
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 50,128
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 28,5
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 198,28
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 8,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,50
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 180,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 14,12
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 254,56
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,250
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 'L,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,248
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 63,224
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,'B
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 64,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,206
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 12,64
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,254
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,38
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,142
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 11,192
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,191
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,22
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,139
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 26,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 7,159
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,21
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,145
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 240,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,207
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,12
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 128,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,241
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 242,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 3,207
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,7
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,16
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 18,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,199
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,19
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 30,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 1,227
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,23
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 32,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,225
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,28
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 224,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,224
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 192,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,96
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,48
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,16
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.dbsym e photo4 _photo4 A[512:512]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\12.12864��ʾͼ��ʵ��\12864TUXING\12864TUXING.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 136
; 0x00,0x00,0x00,0x16,0x80,0x00,0x00,0x00,0x00,0x8B,0x1A,0x00,0x07,0x9F,0x80,0x00,
; 0x00,0x00,0x00,0x15,0x80,0x00,0x00,0x00,0x00,0x91,0xF0,0x00,0x03,0xCF,0xC0,0x00,
; 0x00,0x00,0x00,0x0C,0x80,0x00,0x00,0x00,0x00,0xF1,0xF2,0x00,0x03,0xCF,0xC0,0x00,
; 0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x00,0x00,0x10,0x12,0x00,0x01,0xC7,0xC0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x13,0x1E,0x00,0x01,0xE3,0xE0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x17,0x20,0x00,0x00,0xE1,0xE0,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x1C,0xE0,0x00,0x00,0xE0,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0x00,0x00,0x60,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
; };
; //#pragma data:data
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()
; {
	.dbline 138
; 
; 		Data_IO = 0xFF;				        //��ƽ����
	ldi R24,255
	out 0x1b,R24
	.dbline 139
; 	Data_DDR = 0xFF;				        //�������
	out 0x1a,R24
	.dbline 140
; 	PORTF = 0xFF;                       //��ƽ����
	sts 98,R24
	.dbline 141
; 	DDRF = 0xFF;                        //�������
	sts 97,R24
	.dbline 142
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 143
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 144
; 	PORTE=0xFF;                        //PSB��Ӧ��PE2
	out 0x3,R24
	.dbline 145
; 	DDRE=0xFF;
	out 0x2,R24
	.dbline 146
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 147
;     W_LE1;                     
	sbi 0x12,5
	.dbline 148
;     Data_IO=0xFF;                      //�������            
	out 0x1b,R24
	.dbline 149
;     W_LE0; 
	cbi 0x12,5
	.dbline 151
; 
; 	PSB_SET;						   //Һ�����ڷ�ʽ
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
	.dbline 160
; }
; 
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 161
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 162
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 163
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 164
; 	Data_IO = com;
	out 0x1b,R20
	.dbline 165
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 166
; 	EN_CLR;
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
	.dbline 173
; }
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 174
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 175
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 176
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 177
; 	Data_IO = data;
	out 0x1b,R20
	.dbline 178
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 179
; 	EN_CLR;
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
	.dbline 187
; }
; 
; //***********************************************************************
; //	��ʾ�������ʾ
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 188
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 189
; 	delay_nms(5);
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
	.dbline 199
; }
; 
; //***********************************************************************
; //�������ƣ�DisplayCgrom(uchar hz)��ʾCGROM��ĺ���
; //��ڲ�������
; //���ز�������
; //***********************************************************************
; 
; void DisplayCgrom(uchar addr,uchar *hz)
; {
	.dbline 201
; 
; 	LCD_write_com(addr);
	mov R16,R22
	xcall _LCD_write_com
	.dbline 202
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 204
	.dbline 205
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 206
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 207
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 208
L25:
	.dbline 203
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
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 217
; 	{
; 		LCD_write_data(*hz);
; 		hz++;
;         delay_nms(5);
; 	}
; 
; } 
; 
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 218
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 219
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 220
; 	LCD_write_com(FUN_MODE);			//��ʾģʽ����
	ldi R16,48
	xcall _LCD_write_com
	.dbline 221
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 222
;     LCD_write_com(DISPLAY_ON);			//��ʾ��
	ldi R16,12
	xcall _LCD_write_com
	.dbline 223
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 224
;     LCD_write_com(CLEAR_SCREEN);        //����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 225
; 	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_photo1 _Display_photo1 fV
;              i -> R20,R21
;              j -> R10,R11
;           img1 -> R22,R23
	.even
_Display_photo1::
	xcall push_gset3
	movw R22,R16
	.dbline -1
	.dbline 233
; }
; 
; //****************************************************************
; //�������ƣ�Display_photo(uchar *hz)��ʾ�Զ���ͼ�Σ������°�����д
; //****************************************************************
; 
; void Display_photo1( uchar *img1)                      //д�ϰ���ͼ�����ݺ���
; {
	.dbline 236
;    int i,j;     
; 
;    for(i=0;i<32;i++)                                 //�ϰ���32��
	clr R20
	clr R21
L29:
	.dbline 237
;     {  
	.dbline 238
; 		LCD_write_com(FUN_MODEK);                     //��չָ�����ͼ��ʾ
	ldi R16,54
	xcall _LCD_write_com
	.dbline 239
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 241
;      
;  		LCD_write_com(Yaddress+i);                   //��д��ֱ��ַ����Y��ַ�������Զ���һ
	mov R16,R20
	subi R16,128  ; offset = 128
	sbci R17,255
	xcall _LCD_write_com
	.dbline 242
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 244
; 
;         LCD_write_com(X1address);                    //��дˮƽ��ַ����X��ַ
	ldi R16,128
	xcall _LCD_write_com
	.dbline 245
;         delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 247
;       
;  	for(j=0;j<8;j++)                       //����д��2���ֽڵ����ݣ�һ��8�Σ�Ϊһ�У���16*8λ����
	clr R10
	clr R11
L33:
	.dbline 248
	.dbline 249
	ldi R16,2
	ldi R17,0
	movw R18,R10
	xcall empy16s
	movw R2,R16
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	add R30,R2
	adc R31,R3
	add R30,R22
	adc R31,R23
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 250
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 251
	ldi R16,2
	ldi R17,0
	movw R18,R10
	xcall empy16s
	movw R2,R16
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	add R30,R2
	adc R31,R3
	add R30,R22
	adc R31,R23
	ldd R16,z+1
	xcall _LCD_write_data
	.dbline 252
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 253
L34:
	.dbline 247
	movw R24,R10
	adiw R24,1
	movw R10,R24
	.dbline 247
	cpi R24,8
	ldi R30,0
	cpc R25,R30
	brge X1
	xjmp L33
X1:
	.dbline 255
L30:
	.dbline 236
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 236
	cpi R20,32
	ldi R30,0
	cpc R21,R30
	brge X2
	xjmp L29
X2:
	.dbline -2
L28:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r i 20 I
	.dbsym r j 10 I
	.dbsym r img1 22 pc
	.dbend
	.dbfunc e Display_photo2 _Display_photo2 fV
;              i -> R20,R21
;              j -> R10,R11
;           img2 -> R22,R23
	.even
_Display_photo2::
	xcall push_gset3
	movw R22,R16
	.dbline -1
	.dbline 259
;         {  			                                     
; 		LCD_write_data(img1[i*16+j*2]);
; 		delay_nms(2);                       //�����ʱ�Ǳ���ģ���Ϊû�ж�Һ��������æ���������Խ�����ʱ
; 		LCD_write_data(img1[i*16+j*2+1]); 
; 		delay_nms(2);          
;         }
; 
;     }
; }
; 
; void Display_photo2( uchar *img2)                   //д�°���ͼ������
; {
	.dbline 262
; 	int i,j;
; 
; 	for(i=0;i<32;i++)                         //�°���32��
	clr R20
	clr R21
L38:
	.dbline 263
; 	{  
	.dbline 265
; 
; 	 	LCD_write_com(Yaddress+i);                //��д��ֱ��ַ����Y��ַ�������Զ���һ
	mov R16,R20
	subi R16,128  ; offset = 128
	sbci R17,255
	xcall _LCD_write_com
	.dbline 266
; 	    delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 267
; 		LCD_write_com(X2address);                 //��дˮƽ��ַ����X��ַ
	ldi R16,136
	xcall _LCD_write_com
	.dbline 268
; 	    delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 269
; 	 	 for(j=0;j<8;j++)                        //����д��2���ֽڵ����ݣ�һ��8�Σ�Ϊһ�У���16*8λ����
	clr R10
	clr R11
L42:
	.dbline 270
	.dbline 272
	ldi R16,2
	ldi R17,0
	movw R18,R10
	xcall empy16s
	movw R2,R16
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	add R30,R2
	adc R31,R3
	add R30,R22
	adc R31,R23
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 273
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 274
	ldi R16,2
	ldi R17,0
	movw R18,R10
	xcall empy16s
	movw R2,R16
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R30,R16
	add R30,R2
	adc R31,R3
	add R30,R22
	adc R31,R23
	ldd R16,z+1
	xcall _LCD_write_data
	.dbline 275
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 277
L43:
	.dbline 269
	movw R24,R10
	adiw R24,1
	movw R10,R24
	.dbline 269
	cpi R24,8
	ldi R30,0
	cpc R25,R30
	brge X3
	xjmp L42
X3:
	.dbline 279
L39:
	.dbline 262
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 262
	cpi R20,32
	ldi R30,0
	cpc R21,R30
	brge X4
	xjmp L38
X4:
	.dbline -2
L37:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r i 20 I
	.dbsym r j 10 I
	.dbsym r img2 22 pc
	.dbend
	.dbfunc e main _main fV
;              m -> <dead>
	.even
_main::
	.dbline -1
	.dbline 288
; 	    {
; 			
; 			LCD_write_data(img2[i*16+j*2]);
; 			delay_nms(2);                    
; 			LCD_write_data(img2[i*16+j*2+1]);  
; 			delay_nms(2);  
;       
; 		}
; 
; 	}
; 
; }
; 
; //****************************************************************
; //�������ƣ�����������������ӳ�����ʾͼ��
; //****************************************************************
; 
; void main(void)
; {
	.dbline 290
; 	int m;
;     system_init();                      //ϵͳ��ʼ��������IO������
	xcall _system_init
	.dbline 291
; 	delay_nms(1);                        //��ʱ1ms
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 292
; 	LCD_init();                        //Һ��������ʼ������
	xcall _LCD_init
	.dbline 293
;     LCD_clear(); 
	xcall _LCD_clear
	xjmp L48
L47:
	.dbline 295
;   while(1)
; 	{
	.dbline 296
;       	Display_photo1(photo3);     //��ʾ�ϰ�������
	ldi R16,<_photo3
	ldi R17,>_photo3
	xcall _Display_photo1
	.dbline 297
; 		Display_photo2(photo4);     //��ʾ�°�������
	ldi R16,<_photo4
	ldi R17,>_photo4
	xcall _Display_photo2
	.dbline 298
L50:
	.dbline 298
	.dbline 298
	.dbline 298
	xjmp L50
L48:
	.dbline 294
	xjmp L47
X5:
	.dbline -2
L46:
	.dbline 0 ; func end
	ret
	.dbsym l m 1 I
	.dbend
