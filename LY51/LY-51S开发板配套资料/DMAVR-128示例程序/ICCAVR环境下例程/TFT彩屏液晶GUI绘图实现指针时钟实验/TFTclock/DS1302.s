	.module DS1302.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
_time_buf::
	.blkb 2
	.area idata
	.byte 32,16
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.blkb 2
	.area idata
	.byte 2,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.blkb 2
	.area idata
	.byte 163,34
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.dbsym e time_buf _time_buf A[8:8]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\TFTclock\DS1302.c
	.dbfunc e ds1302_write_byte _ds1302_write_byte fV
;              i -> R20
;              d -> R18
;           addr -> R16
	.even
_ds1302_write_byte::
	st -y,R20
	.dbline -1
	.dbline 16
; //DMAVR-128��DS1302ʵʱʱ��оƬ��������
; //���뻷�� AVR Studio 4.17/AVR GCC
; //ʹ��ǰ��ͨ���޸�time_buf[8]�����õ�ǰ��������
; //��ǰ����2010-01-29 10��48 ���� ����
; //0xb0��ʾ12Сʱ�ƣ����磬��ǰʱ���Сʱ��Ϊ10������λ������ο�DS1302�������ֲ�
; 
; 
; #include  <DS1302.h>
; 
; unsigned char time_buf[8] = {0x20,0x10,0x02,0x01,0xa3,0x22,0x00,0x01};  //12Сʱ�ƣ�Ҫд���绹������
; 
; //***********************************************************************
; //��DS1302д��һ�ֽ�����
; //***********************************************************************
; void ds1302_write_byte(unsigned char addr, unsigned char d) 
; {
	.dbline 19
; 
; 	unsigned char i;
; 	RST_SET;					//����DS1302����
	sbi 0x3,7
	.dbline 22
; 	
; 	                                                //д��Ŀ���ַ��addr
; 	IO_OUT;
	sbi 0x2,6
	.dbline 23
; 	addr = addr & 0xFE;                            //���λ����
	andi R16,254
	.dbline 24
; 	for (i = 0; i < 8; i ++) {
	clr R20
	xjmp L5
L2:
	.dbline 24
	.dbline 25
; 		if (addr & 0x01) {
	sbrs R16,0
	rjmp L6
X0:
	.dbline 25
	.dbline 26
; 			IO_SET;
	sbi 0x3,6
	.dbline 27
; 			}
	xjmp L7
L6:
	.dbline 28
; 		else {
	.dbline 29
; 			IO_CLR;
	cbi 0x3,6
	.dbline 30
; 			}
L7:
	.dbline 31
; 		SCK_SET;
	sbi 0x3,5
	.dbline 32
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 33
; 		addr = addr >> 1;
	lsr R16
	.dbline 34
; 		}
L3:
	.dbline 24
	inc R20
L5:
	.dbline 24
	cpi R20,8
	brlo L2
X1:
	.dbline 37
; 	
; 	                                              //д�����ݣ�d
; 	IO_OUT;
	sbi 0x2,6
	.dbline 38
; 	for (i = 0; i < 8; i ++) {
	clr R20
	xjmp L11
L8:
	.dbline 38
	.dbline 39
; 		if (d & 0x01) {
	sbrs R18,0
	rjmp L12
X2:
	.dbline 39
	.dbline 40
; 			IO_SET;
	sbi 0x3,6
	.dbline 41
; 			}
	xjmp L13
L12:
	.dbline 42
; 		else {
	.dbline 43
; 			IO_CLR;
	cbi 0x3,6
	.dbline 44
; 			}
L13:
	.dbline 45
; 		SCK_SET;
	sbi 0x3,5
	.dbline 46
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 47
; 		d = d >> 1;
	lsr R18
	.dbline 48
; 		}
L9:
	.dbline 38
	inc R20
L11:
	.dbline 38
	cpi R20,8
	brlo L8
X3:
	.dbline 49
; 	RST_CLR;					//ֹͣDS1302����
	cbi 0x3,7
	.dbline -2
L1:
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
	.dbline 55
; }
; //***********************************************************************
; //                   ��DS1302����һ�ֽ�����
; //***********************************************************************
; unsigned char ds1302_read_byte(unsigned char addr)
;  {
	.dbline 59
; 
; 	unsigned char i;
; 	unsigned char temp;
; 	RST_SET;					//����DS1302����
	sbi 0x3,7
	.dbline 62
; 
; 	                                                //д��Ŀ���ַ��addr
; 	IO_OUT;
	sbi 0x2,6
	.dbline 63
; 	addr = addr | 0x01;                             //���λ�ø�
	ori R16,1
	.dbline 64
; 	for (i = 0; i < 8; i ++) {
	clr R22
	xjmp L18
L15:
	.dbline 64
	.dbline 65
; 		if (addr & 0x01) {
	sbrs R16,0
	rjmp L19
X4:
	.dbline 65
	.dbline 66
; 			IO_SET;
	sbi 0x3,6
	.dbline 67
; 			}
	xjmp L20
L19:
	.dbline 68
; 		else {
	.dbline 69
; 			IO_CLR;
	cbi 0x3,6
	.dbline 70
; 			}
L20:
	.dbline 71
; 		SCK_SET;
	sbi 0x3,5
	.dbline 72
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 73
; 		addr = addr >> 1;
	lsr R16
	.dbline 74
; 		}
L16:
	.dbline 64
	inc R22
L18:
	.dbline 64
	cpi R22,8
	brlo L15
X5:
	.dbline 77
; 	
; 	/*������ݣ�temp*/
; 	IO_IN;
	cbi 0x2,6
	.dbline 78
; 	for (i = 0; i < 8; i ++) {
	clr R22
	xjmp L24
L21:
	.dbline 78
	.dbline 79
; 		temp = temp >> 1;
	lsr R20
	.dbline 80
; 		if (IO_R) {
	sbis 0x1,6
	rjmp L25
X6:
	.dbline 80
	.dbline 81
; 			temp |= 0x80;
	ori R20,128
	.dbline 82
; 			}
	xjmp L26
L25:
	.dbline 83
; 		else {
	.dbline 84
; 			temp &= 0x7F;
	andi R20,127
	.dbline 85
; 			}
L26:
	.dbline 86
; 		SCK_SET;
	sbi 0x3,5
	.dbline 87
; 		SCK_CLR;
	cbi 0x3,5
	.dbline 88
; 		}
L22:
	.dbline 78
	inc R22
L24:
	.dbline 78
	cpi R22,8
	brlo L21
X7:
	.dbline 90
; 	
; 	RST_CLR;					//ֹͣDS1302����
	cbi 0x3,7
	.dbline 91
; 	return temp;
	mov R16,R20
	.dbline -2
L14:
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
	.dbline 99
; }
; 
; //***********************************************************************
; //                   ��DS302д��ʱ������
; //***********************************************************************
; 
; void ds1302_write_time(void)
;  {
	.dbline 101
; 
; 	ds1302_write_byte(ds1302_control_add,0x00);		//�ر�д���� 
	clr R18
	ldi R16,142
	xcall _ds1302_write_byte
	.dbline 102
; 	ds1302_write_byte(ds1302_sec_add,0x80);			//��ͣ 
	ldi R18,128
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 104
; 	//ds1302_write_byte(ds1302_charger_add,0xa9);		//������ 
; 	ds1302_write_byte(ds1302_year_add,time_buf[1]);		//�� 
	lds R18,_time_buf+1
	ldi R16,140
	xcall _ds1302_write_byte
	.dbline 105
; 	ds1302_write_byte(ds1302_month_add,time_buf[2]);	//�� 
	lds R18,_time_buf+2
	ldi R16,136
	xcall _ds1302_write_byte
	.dbline 106
; 	ds1302_write_byte(ds1302_date_add,time_buf[3]);		//�� 
	lds R18,_time_buf+3
	ldi R16,134
	xcall _ds1302_write_byte
	.dbline 107
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 108
; 	ds1302_write_byte(ds1302_hr_add,time_buf[4]);		//ʱ 
	lds R18,_time_buf+4
	ldi R16,132
	xcall _ds1302_write_byte
	.dbline 109
; 	ds1302_write_byte(ds1302_min_add,time_buf[5]);		//��
	lds R18,_time_buf+5
	ldi R16,130
	xcall _ds1302_write_byte
	.dbline 110
; 	ds1302_write_byte(ds1302_sec_add,time_buf[6]);		//��
	lds R18,_time_buf+6
	ldi R16,128
	xcall _ds1302_write_byte
	.dbline 111
; 	ds1302_write_byte(ds1302_day_add,time_buf[7]);		//�� 
	lds R18,_time_buf+7
	ldi R16,138
	xcall _ds1302_write_byte
	.dbline 112
; 	ds1302_write_byte(ds1302_control_add,0x80);		//��д���� 
	ldi R18,128
	ldi R16,142
	.dbline -2
L27:
	.dbline 0 ; func end
	xjmp _ds1302_write_byte
	.dbend
	.dbfunc e ds1302_read_time _ds1302_read_time fV
	.even
_ds1302_read_time::
	st -y,R10
	st -y,R20
	.dbline -1
	.dbline 120
; }
; 
; //***********************************************************************
; //                     ��DS302����ʱ������
; //***********************************************************************
; 
; void ds1302_read_time(void)  
; { 
	.dbline 122
; 
; 	time_buf[1]=ds1302_read_byte(ds1302_year_add);		//�� 
	ldi R16,140
	xcall _ds1302_read_byte
	sts _time_buf+1,R16
	.dbline 123
; 	time_buf[2]=ds1302_read_byte(ds1302_month_add);		//�� 
	ldi R16,136
	xcall _ds1302_read_byte
	sts _time_buf+2,R16
	.dbline 124
; 	time_buf[3]=ds1302_read_byte(ds1302_date_add);		//�� 
	ldi R16,134
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+3,R10
	.dbline 125
; 	time_buf[4]=ds1302_read_byte(ds1302_hr_add);		//ʱ 
	ldi R16,132
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+4,R10
	.dbline 126
; 	time_buf[5]=ds1302_read_byte(ds1302_min_add);		//�� 
	ldi R16,130
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+5,R10
	.dbline 127
; 	time_buf[6]=(ds1302_read_byte(ds1302_sec_add))&0x7F;//�� 
	ldi R16,128
	xcall _ds1302_read_byte
	mov R20,R16
	mov R24,R20
	andi R24,127
	sts _time_buf+6,R24
	.dbline 128
; 	time_buf[7]=ds1302_read_byte(ds1302_day_add);		//�� 
	ldi R16,138
	xcall _ds1302_read_byte
	mov R10,R16
	sts _time_buf+7,R10
	.dbline -2
L36:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbend
	.dbfunc e ds1302_init _ds1302_init fV
	.even
_ds1302_init::
	.dbline -1
	.dbline 136
; }
; 
; //***********************************************************************
; //               DS302��ʼ������
; //***********************************************************************
; 
; void ds1302_init(void) 
; {
	.dbline 138
; 	
; 	RST_CLR;			//RST���õ�
	cbi 0x3,7
	.dbline 139
; 	SCK_CLR;			//SCK���õ�
	cbi 0x3,5
	.dbline 140
; 	RST_OUT;			//RST������Ϊ���
	sbi 0x2,7
	.dbline 141
; 	SCK_OUT;			//SCK������Ϊ���
	sbi 0x2,5
	.dbline -2
L44:
	.dbline 0 ; func end
	ret
	.dbend
; }
