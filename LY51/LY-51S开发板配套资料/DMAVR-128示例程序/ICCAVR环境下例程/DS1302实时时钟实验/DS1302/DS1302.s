	.module DS1302.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\DS1302\DS1302.C
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
_time_buf::
	.blkb 2
	.area idata
	.byte 32,16
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 1,20
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 9,'U
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,2
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\DS1302\DS1302.C
	.dbsym e time_buf _time_buf A[8:8]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\DS1302\DS1302.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 75
; //DMAVR-128��DS1302ʵʱʱ��оƬ��������
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
; /*��λ��*/
; #define RST_CLR	PORTE &= ~(1 << PE7)              //��ƽ�õ�
; #define RST_SET	PORTE |= (1 << PE7)               //��ƽ�ø�
; #define RST_IN	DDRE &= ~(1 << PE7)               //��������
; #define RST_OUT	DDRE |= (1 << PE7)                //�������
; 
; /*˫������*/
; #define IO_CLR	PORTE &= ~(1 << PE6)              //��ƽ�õ�
; #define IO_SET	PORTE |= (1 << PE6)               //��ƽ�ø�
; #define IO_R	PINE & (1 << PE6)                 //��ƽ��ȡ
; #define IO_IN	DDRE &= ~(1 << PE6)               //��������
; #define IO_OUT	DDRE |= (1 << PE6)                //�������
; 
; /*ʱ���ź�*/
; #define SCK_CLR	PORTE &= ~(1 << PE5)              //ʱ���ź�
; #define SCK_SET	PORTE |= (1 << PE5)               //��ƽ�ø�
; #define SCK_IN	DDRE &= ~(1 << PE5)               //��������
; #define SCK_OUT	DDRE |= (1 << PE5)                //�������
; 
; /*ds1302��������ص�ַ*/
; #define ds1302_sec_add			0x80		//�����ݵ�ַ
; #define ds1302_min_add			0x82		//�����ݵ�ַ
; #define ds1302_hr_add			0x84		//ʱ���ݵ�ַ
; #define ds1302_date_add			0x86		//�����ݵ�ַ
; #define ds1302_month_add		0x88		//�����ݵ�ַ
; #define ds1302_day_add			0x8a		//�������ݵ�ַ
; #define ds1302_year_add			0x8c		//�����ݵ�ַ
; #define ds1302_control_add		0x8e		//�������ݵ�ַ
; #define ds1302_charger_add		0x90 					 
; #define ds1302_clkburst_add		0xbe
; 
; #define RS_CLR	PORTF &= ~(1 << PF1)       //RS�õ�
; #define RS_SET	PORTF |= (1 << PF1)        //RS�ø�
; 
; #define RW_CLR	PORTF &= ~(1 << PF2)       //RW�õ�
; #define RW_SET	PORTF |= (1 << PF2)        //RW�ø�
; 
; #define EN_CLR	PORTF &= ~(1 << PF3)       //E�õ�
; #define EN_SET	PORTF |= (1 << PF3)        //E�ø�
; 
; #define Data_IO	        PORTA                //Һ�����ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; unsigned char time_buf[8] = {0x20,0x10,0x01,0x14,0x09,0x55,0x00,0x02};
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()
; {
	.dbline 77
; 
; 	Data_IO = 0xFF;				        //��ƽ����
	ldi R24,255
	out 0x1b,R24
	.dbline 78
; 	Data_DDR = 0xFF;				        //�������
	out 0x1a,R24
	.dbline 79
; 	PORTF = 0xFF;                       //��ƽ����
	sts 98,R24
	.dbline 80
; 	DDRF = 0xFF;                        //�������
	sts 97,R24
	.dbline 81
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 82
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 83
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 84
;     W_LE1;                     
	sbi 0x12,5
	.dbline 85
;     Data_IO=0xFF;                      //�������            
	out 0x1b,R24
	.dbline 86
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ds1302_write_byte _ds1302_write_byte fV
;              i -> R20
;              d -> R18
;           addr -> R16
	.even
_ds1302_write_byte::
	st -y,R20
	.dbline -1
	.dbline 93
; }
; 
; //***********************************************************************
; //��DS1302д��һ�ֽ�����
; //***********************************************************************
; void ds1302_write_byte(unsigned char addr, unsigned char d) 
; {
	.dbline 96
; 
; 	unsigned char i;
; 	RST_SET;					//����DS1302����
	sbi 0x3,7
	.dbline 99
; 	
; 	                                                //д��Ŀ���ַ��addr
; 	IO_OUT;
	sbi 0x2,6
	.dbline 100
; 	addr = addr & 0xFE;                            //���λ����
	andi R16,254
	.dbline 101
; 	for (i = 0; i < 8; i ++) {
	clr R20
	xjmp L24
L21:
	.dbline 101
	.dbline 102
; 		if (addr & 0x01) {
	sbrs R16,0
	rjmp L25
X3:
	.dbline 102
	.dbline 103
; 			IO_SET;
	sbi 0x3,6
	.dbline 104
; 			}
	xjmp L26
L25:
	.dbline 105
; 		else {
	.dbline 106
; 			IO_CLR;
	cbi 0x3,6
	.dbline 107
; 			}
L26:
	.dbline 108
; 		SCK_SET;
	sbi 0x3,5
	.dbline 109
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 110
; 		addr = addr >> 1;
	lsr R16
	.dbline 111
; 		}
L22:
	.dbline 101
	inc R20
L24:
	.dbline 101
	cpi R20,8
	brlo L21
X4:
	.dbline 114
; 	
; 	                                              //д�����ݣ�d
; 	IO_OUT;
	sbi 0x2,6
	.dbline 115
; 	for (i = 0; i < 8; i ++) {
	clr R20
	xjmp L30
L27:
	.dbline 115
	.dbline 116
; 		if (d & 0x01) {
	sbrs R18,0
	rjmp L31
X5:
	.dbline 116
	.dbline 117
; 			IO_SET;
	sbi 0x3,6
	.dbline 118
; 			}
	xjmp L32
L31:
	.dbline 119
; 		else {
	.dbline 120
; 			IO_CLR;
	cbi 0x3,6
	.dbline 121
; 			}
L32:
	.dbline 122
; 		SCK_SET;
	sbi 0x3,5
	.dbline 123
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 124
; 		d = d >> 1;
	lsr R18
	.dbline 125
; 		}
L28:
	.dbline 115
	inc R20
L30:
	.dbline 115
	cpi R20,8
	brlo L27
X6:
	.dbline 126
; 	RST_CLR;					//ֹͣDS1302����
	cbi 0x3,7
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r i 20 c
	.dbsym r d 18 c
	.dbsym r addr 16 c
	.dbend
	.dbfunc e ds1302_read_byte _ds1302_read_byte fc
;           temp -> R20
;              i -> R22
;           addr -> R16
	.even
_ds1302_read_byte::
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 132
; }
; //***********************************************************************
; //                   ��DS1302����һ�ֽ�����
; //***********************************************************************
; unsigned char ds1302_read_byte(unsigned char addr)
;  {
	.dbline 136
; 
; 	unsigned char i;
; 	unsigned char temp;
; 	RST_SET;					//����DS1302����
	sbi 0x3,7
	.dbline 139
; 
; 	                                                //д��Ŀ���ַ��addr
; 	IO_OUT;
	sbi 0x2,6
	.dbline 140
; 	addr = addr | 0x01;                             //���λ�ø�
	ori R16,1
	.dbline 141
; 	for (i = 0; i < 8; i ++) {
	clr R22
	xjmp L37
L34:
	.dbline 141
	.dbline 142
; 		if (addr & 0x01) {
	sbrs R16,0
	rjmp L38
X7:
	.dbline 142
	.dbline 143
; 			IO_SET;
	sbi 0x3,6
	.dbline 144
; 			}
	xjmp L39
L38:
	.dbline 145
; 		else {
	.dbline 146
; 			IO_CLR;
	cbi 0x3,6
	.dbline 147
; 			}
L39:
	.dbline 148
; 		SCK_SET;
	sbi 0x3,5
	.dbline 149
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 150
; 		addr = addr >> 1;
	lsr R16
	.dbline 151
; 		}
L35:
	.dbline 141
	inc R22
L37:
	.dbline 141
	cpi R22,8
	brlo L34
X8:
	.dbline 154
; 	
; 	/*������ݣ�temp*/
; 	IO_IN;
	cbi 0x2,6
	.dbline 155
; 	for (i = 0; i < 8; i ++) {
	clr R22
	xjmp L43
L40:
	.dbline 155
	.dbline 156
; 		temp = temp >> 1;
	lsr R20
	.dbline 157
; 		if (IO_R) {
	sbis 0x1,6
	rjmp L44
X9:
	.dbline 157
	.dbline 158
; 			temp |= 0x80;
	ori R20,128
	.dbline 159
; 			}
	xjmp L45
L44:
	.dbline 160
; 		else {
	.dbline 161
; 			temp &= 0x7F;
	andi R20,127
	.dbline 162
; 			}
L45:
	.dbline 163
; 		SCK_SET;
	sbi 0x3,5
	.dbline 164
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 165
; 		}
L41:
	.dbline 155
	inc R22
L43:
	.dbline 155
	cpi R22,8
	brlo L40
X10:
	.dbline 167
; 	
; 	RST_CLR;					//ֹͣDS1302����
	cbi 0x3,7
	.dbline 168
; 	return temp;
	mov R16,R20
	.dbline -2
L33:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	ret
	.dbsym r temp 20 c
	.dbsym r i 22 c
	.dbsym r addr 16 c
	.dbend
	.dbfunc e ds1302_write_time _ds1302_write_time fV
	.even
_ds1302_write_time::
	.dbline -1
	.dbline 176
; }
; 
; //***********************************************************************
; //                   ��DS302д��ʱ������
; //***********************************************************************
; 
; void ds1302_write_time(void)
;  {
	.dbline 178
; 
; 	ds1302_write_byte(ds1302_control_add,0x00);		//�ر�д���� 
	clr R18
	ldi R16,142
	xcall _ds1302_write_byte
	.dbline 179
; 	ds1302_write_byte(ds1302_sec_add,0x80);			//��ͣ 
	ldi R18,128
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 181
; 	//ds1302_write_byte(ds1302_charger_add,0xa9);		//������ 
; 	ds1302_write_byte(ds1302_year_add,time_buf[1]);		//�� 
	lds R18,_time_buf+1
	ldi R16,140
	xcall _ds1302_write_byte
	.dbline 182
; 	ds1302_write_byte(ds1302_month_add,time_buf[2]);	//�� 
	lds R18,_time_buf+2
	ldi R16,136
	xcall _ds1302_write_byte
	.dbline 183
; 	ds1302_write_byte(ds1302_date_add,time_buf[3]);		//�� 
	lds R18,_time_buf+3
	ldi R16,134
	xcall _ds1302_write_byte
	.dbline 184
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 185
; 	ds1302_write_byte(ds1302_hr_add,time_buf[4]);		//ʱ 
	lds R18,_time_buf+4
	ldi R16,132
	xcall _ds1302_write_byte
	.dbline 186
; 	ds1302_write_byte(ds1302_min_add,time_buf[5]);		//��
	lds R18,_time_buf+5
	ldi R16,130
	xcall _ds1302_write_byte
	.dbline 187
; 	ds1302_write_byte(ds1302_sec_add,time_buf[6]);		//��
	lds R18,_time_buf+6
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 188
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 189
; 	ds1302_write_byte(ds1302_control_add,0x80);		//��д���� 
	ldi R18,128
	ldi R16,142
	.dbline -2
L46:
	.dbline 0 ; func end
	xjmp _ds1302_write_byte
	.dbend
	.dbfunc e ds1302_read_time _ds1302_read_time fV
	.even
_ds1302_read_time::
	st -y,R10
	st -y,R20
	.dbline -1
	.dbline 197
; }
; 
; //***********************************************************************
; //                     ��DS302����ʱ������
; //***********************************************************************
; 
; void ds1302_read_time(void)  
; { 
	.dbline 199
; 
; 	time_buf[1]=ds1302_read_byte(ds1302_year_add);		//�� 
	ldi R16,140
	xcall _ds1302_read_byte
	sts _time_buf+1,R16
	.dbline 200
; 	time_buf[2]=ds1302_read_byte(ds1302_month_add);		//�� 
	ldi R16,136
	xcall _ds1302_read_byte
	sts _time_buf+2,R16
	.dbline 201
; 	time_buf[3]=ds1302_read_byte(ds1302_date_add);		//�� 
	ldi R16,134
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+3,R10
	.dbline 202
; 	time_buf[4]=ds1302_read_byte(ds1302_hr_add);		//ʱ 
	ldi R16,132
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+4,R10
	.dbline 203
; 	time_buf[5]=ds1302_read_byte(ds1302_min_add);		//�� 
	ldi R16,130
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+5,R10
	.dbline 204
; 	time_buf[6]=(ds1302_read_byte(ds1302_sec_add))&0x7F;//�� 
	ldi R16,128
	xcall _ds1302_read_byte
	mov R20,R16
	mov R24,R20
	andi R24,127
	sts _time_buf+6,R24
	.dbline 205
; 	time_buf[7]=ds1302_read_byte(ds1302_day_add);		//�� 
	ldi R16,138
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+7,R10
	.dbline -2
L55:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbend
	.dbfunc e ds1302_init _ds1302_init fV
	.even
_ds1302_init::
	.dbline -1
	.dbline 213
; }
; 
; //***********************************************************************
; //               DS302��ʼ������
; //***********************************************************************
; 
; void ds1302_init(void) 
; {
	.dbline 215
; 	
; 	RST_CLR;			//RST���õ�
	cbi 0x3,7
	.dbline 216
; 	SCK_CLR;			//SCK���õ�
	cbi 0x3,5
	.dbline 217
; 	RST_OUT;			//RST������Ϊ���
	sbi 0x2,7
	.dbline 218
; 	SCK_OUT;			//SCK������Ϊ���
	sbi 0x2,5
	.dbline -2
L63:
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
	.dbline 227
; }
; 
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 228
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 229
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 230
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 231
; 	Data_IO = com;
	out 0x1b,R10
	.dbline 232
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 233
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L64:
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
	.dbline 240
; }
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 241
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 242
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 243
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 244
; 	Data_IO = data;
	out 0x1b,R10
	.dbline 245
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 246
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L65:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r data 10 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 253
; }
; //***********************************************************************
; //	��ʾ�������ʾ
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 254
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 255
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L66:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_xgsetF00C
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 262
; }
; //***********************************************************************
; //	��ʾ���ַ���д�뺯��
; //***********************************************************************
; 
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
; {
	.dbline 264
; 	
;     if (y == 0) 
	tst R10
	brne L68
X11:
	.dbline 265
;     {
	.dbline 266
;     	LCD_write_com(0x80 + x);
	mov R16,R22
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 267
;     }
	xjmp L71
L68:
	.dbline 269
;     else 
;     {
	.dbline 270
;     	LCD_write_com(0xC0 + x);
	mov R16,R22
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 271
;     }
	xjmp L71
L70:
	.dbline 274
;     
;     while (*s) 
;     {
	.dbline 275
;     	LCD_write_data( *s);
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 276
;     	s ++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 277
;     }
L71:
	.dbline 273
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L70
X12:
	.dbline -2
L67:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+2
;              y -> R10
;              x -> R20
	.even
_LCD_write_char::
	st -y,R10
	st -y,R20
	mov R10,R18
	mov R20,R16
	.dbline -1
	.dbline 284
; }
; //***********************************************************************
; //	��ʾ�����ַ�д�뺯��
; //***********************************************************************
; 
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
; {
	.dbline 286
; 	
;     if (y == 0) 
	tst R10
	brne L74
X13:
	.dbline 287
;     {
	.dbline 288
;     	LCD_write_com(0x80 + x);
	mov R16,R20
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 289
;     }
	xjmp L75
L74:
	.dbline 291
;     else 
;     {
	.dbline 292
;     	LCD_write_com(0xC0 + x);
	mov R16,R20
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 293
;     }
L75:
	.dbline 295
;     
;     LCD_write_data( data);  
	ldd R16,y+2
	xcall _LCD_write_data
	.dbline -2
L73:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbsym l data 2 c
	.dbsym r y 10 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 302
; }
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 303
; 	system_init();
	xcall _system_init
	.dbline 304
; 	LCD_write_com(0x38);				//��ʾģʽ����
	ldi R16,56
	xcall _LCD_write_com
	.dbline 305
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 306
; 	LCD_write_com(0x08);				//��ʾ�ر�
	ldi R16,8
	xcall _LCD_write_com
	.dbline 307
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 308
;     LCD_write_com(0x01);				//��ʾ����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 309
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 310
;     LCD_write_com(0x06);				//��ʾ����ƶ�����
	ldi R16,6
	xcall _LCD_write_com
	.dbline 311
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 312
; 	LCD_write_com(0x0C);				//��ʾ�����������
	ldi R16,12
	xcall _LCD_write_com
	.dbline 313
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L76:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e main _main fV
;           temp -> R20
	.even
_main::
	sbiw R28,1
	.dbline -1
	.dbline 322
; }
; 
; //***********************************************************************
; //	������
; //***********************************************************************
; 
; void main(void) 
; 
; {
	.dbline 325
; 
; 	unsigned char temp;
;  	delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 326
; 	LCD_init();                           //1602Һ����ʼ��
	xcall _LCD_init
	.dbline 327
; 	ds1302_init();                        //DS1302��ʼ��
	xcall _ds1302_init
	.dbline 328
; 	delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 329
; 	ds1302_write_time();                 //��DS1302д��ʼ���ݣ������º�ʱ���
	xcall _ds1302_write_time
	xjmp L79
L78:
	.dbline 332
; 
; 	while (1) 
; 	{
	.dbline 333
; 		delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 334
; 		ds1302_read_time();                //��DS1302����
	xcall _ds1302_read_time
	.dbline 336
; 			
; 		temp = (time_buf[0] >> 4) + '0';   //��LCD��дҪ��ʾ������
	lds R20,_time_buf
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 337
; 		LCD_write_char(0, 0, temp);/*��*/
	std y+0,R20
	clr R18
	clr R16
	xcall _LCD_write_char
	.dbline 338
; 		temp = (time_buf[0] & 0x0F) + '0';
	lds R20,_time_buf
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 339
; 		LCD_write_char(1, 0, temp);
	std y+0,R20
	clr R18
	ldi R16,1
	xcall _LCD_write_char
	.dbline 340
; 		temp = (time_buf[1] >> 4) + '0';
	lds R20,_time_buf+1
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 341
; 		LCD_write_char(2, 0, temp);
	std y+0,R20
	clr R18
	ldi R16,2
	xcall _LCD_write_char
	.dbline 342
; 		temp = (time_buf[1] & 0x0F) + '0';
	lds R20,_time_buf+1
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 343
; 		LCD_write_char(3, 0, temp);
	std y+0,R20
	clr R18
	ldi R16,3
	xcall _LCD_write_char
	.dbline 344
; 		LCD_write_char(4, 0, '-');
	ldi R24,45
	std y+0,R24
	clr R18
	ldi R16,4
	xcall _LCD_write_char
	.dbline 346
; 		
; 		temp = (time_buf[2] >> 4) + '0';
	lds R20,_time_buf+2
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 347
; 		LCD_write_char(5, 0, temp);/*��*/
	std y+0,R20
	clr R18
	ldi R16,5
	xcall _LCD_write_char
	.dbline 348
; 		temp = (time_buf[2] & 0x0F) + '0';
	lds R20,_time_buf+2
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 349
; 		LCD_write_char(6, 0, temp);
	std y+0,R20
	clr R18
	ldi R16,6
	xcall _LCD_write_char
	.dbline 350
; 		LCD_write_char(7, 0, '-');
	ldi R24,45
	std y+0,R24
	clr R18
	ldi R16,7
	xcall _LCD_write_char
	.dbline 352
; 		
; 		temp = (time_buf[3] >> 4) + '0';
	lds R20,_time_buf+3
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 353
; 		LCD_write_char(8, 0, temp);/*��*/
	std y+0,R20
	clr R18
	ldi R16,8
	xcall _LCD_write_char
	.dbline 354
; 		temp = (time_buf[3] & 0x0F) + '0';
	lds R20,_time_buf+3
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 355
; 		LCD_write_char(9, 0, temp);
	std y+0,R20
	clr R18
	ldi R16,9
	xcall _LCD_write_char
	.dbline 357
; 		
; 		temp = (time_buf[4] >> 4) + '0';
	lds R20,_time_buf+4
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 358
; 		LCD_write_char(8, 1, temp);/*ʱ*/
	std y+0,R20
	ldi R18,1
	ldi R16,8
	xcall _LCD_write_char
	.dbline 359
; 		temp = (time_buf[4] & 0x0F) + '0';
	lds R20,_time_buf+4
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 360
; 		LCD_write_char(9, 1, temp);
	std y+0,R20
	ldi R18,1
	ldi R16,9
	xcall _LCD_write_char
	.dbline 361
; 		LCD_write_char(10, 1, ':');
	ldi R24,58
	std y+0,R24
	ldi R18,1
	ldi R16,10
	xcall _LCD_write_char
	.dbline 363
; 		
; 		temp = (time_buf[5] >> 4) + '0';
	lds R20,_time_buf+5
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 364
; 		LCD_write_char(11, 1, temp);/*��*/
	std y+0,R20
	ldi R18,1
	ldi R16,11
	xcall _LCD_write_char
	.dbline 365
; 		temp = (time_buf[5] & 0x0F) + '0';
	lds R20,_time_buf+5
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 366
; 		LCD_write_char(12, 1, temp);
	std y+0,R20
	ldi R18,1
	ldi R16,12
	xcall _LCD_write_char
	.dbline 367
; 		LCD_write_char(13, 1, ':');
	ldi R24,58
	std y+0,R24
	ldi R18,1
	ldi R16,13
	xcall _LCD_write_char
	.dbline 369
; 		
; 		temp = (time_buf[6] >> 4) + '0';
	lds R20,_time_buf+6
	swap R20
	andi R20,#0x0F
	subi R20,208    ; addi 48
	.dbline 370
; 		LCD_write_char(14, 1, temp);/*��*/
	std y+0,R20
	ldi R18,1
	ldi R16,14
	xcall _LCD_write_char
	.dbline 371
; 		temp = (time_buf[6] & 0x0F) + '0';
	lds R20,_time_buf+6
	andi R20,15
	subi R20,208    ; addi 48
	.dbline 372
; 		LCD_write_char(15, 1, temp);
	std y+0,R20
	ldi R18,1
	ldi R16,15
	xcall _LCD_write_char
	.dbline 373
; 	}
L79:
	.dbline 331
	xjmp L78
X14:
	.dbline -2
L77:
	.dbline 0 ; func end
	adiw R28,1
	ret
	.dbsym r temp 20 c
	.dbend
; }
