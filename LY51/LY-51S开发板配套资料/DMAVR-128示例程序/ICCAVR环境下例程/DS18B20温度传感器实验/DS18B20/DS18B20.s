	.module DS18B20.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\DS18B20\DS18B20.C
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
_table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\DS18B20\DS18B20.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\DS18B20\DS18B20.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 57
; //DMAVR-128���¶ȴ�����DS18B20���Ƴ�����ʾ�����¶�
; //DS18b20��C��������������λ�������ʾ����ȡ��ǰ�����¶ȣ����ȴ�0.1�ȣ��¶ȷ�Χ0-99��
; //DS18B20 ��ϸ���Ź�������1��GND ���źţ�2��DQ������������š���©�����߽ӿ����š��������ڼ�����Դ��
; //Ҳ�����������ṩ��Դ��3��VDD��ѡ���VDD ���š��������ڼ�����Դʱ�������ű���ӵء�
; //DS18B20 ��ʹ�÷�����DS18B20 ���õ���1��Wire ����Э�鷽ʽ
; //����һ��������ʵ�����ݵ�˫����
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
; //			���������
; //***********************************************************************
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define Data_IO	        PORTA                   //��������ݿ�
; #define Data_DDR        DDRA                 	//��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) 	//����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  	//����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) 	//�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  	//�����λ����λΪ1
; 
; #define DQ_IN	        DDRE &= ~(1 << PE4)		//�������룬DS18B20�ӵ�Ƭ��PE4��
; #define DQ_OUT	        DDRE |= (1 << PE4)		//�������
; #define DQ_CLR	        PORTE &= ~(1 << PE4)	//�õ͵�ƽ
; #define DQ_SET	        PORTE |= (1 << PE4)		//�øߵ�ƽ
; #define DQ_R	        PINE & (1 << PE4)		//����ƽ
; 
; uchar key;
; uint temp_value;
; uint temp,A1,A2,A3;             		      	//����ı���,��ʾ���ݴ���
; uchar flag1; 
; 
; //***********************************************************************
; //			�����������ʾ�Ķ����0��F
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
; 	           0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; 
; //***********************************************************************
; //			IO�˿ڳ�ʼ��
; //***********************************************************************
; 
; void System_Init()
; {
	.dbline 58
;     Data_IO=0xFF;             //���ݿ�Ϊ���
	ldi R24,255
	out 0x1b,R24
	.dbline 59
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 61
; 
;     PORTD=0xFF;               //74HC573�Ŀ��ƿڣ�����Ϊ���
	out 0x12,R24
	.dbline 62
;     DDRD=0xFF;
	out 0x11,R24
	.dbline 64
; 	
; 	PORTB=0xFF;				  //�رշ��������
	out 0x18,R24
	.dbline 65
; 	DDRB=0xFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_DS18B20 _Display_DS18B20 fV
;              i -> R22
;              j -> R20
;         data_g -> <dead>
;         data_s -> <dead>
;         data_b -> <dead>
	.even
_Display_DS18B20::
	xcall push_arg4
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 73
; }
; 
; //*************************************************************************
; //			74HC573��������ܶ�̬ɨ����ʾ��������ʾ�ɼ������¶�
; //*************************************************************************
; 
; void Display_DS18B20(uint data_b,uint data_s,uint data_g)
; {
	.dbline 75
; 	 uchar i,j;
; 	 System_Init();
	xcall _System_Init
	.dbline 76
;      j=0x01;                    //��������������λѡ
	ldi R20,1
	.dbline 77
;  for(i=0;i<5;i++)               //�ú�3λ���������ʾ
	clr R22
	xjmp L24
L21:
	.dbline 78
;   {
	.dbline 79
;      D_LE1;                     
	sbi 0x12,4
	.dbline 80
;      W_LE1;                     
	sbi 0x12,5
	.dbline 81
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 82
;      W_LE0;                      
	cbi 0x12,5
	.dbline 83
; 	 j=(j<<1);
	lsl R20
	.dbline 84
;      Data_IO=0x00;           
	clr R2
	out 0x1b,R2
	.dbline 85
;      D_LE0;                      
	cbi 0x12,4
	.dbline 86
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 87
;   }
L22:
	.dbline 77
	inc R22
L24:
	.dbline 77
	cpi R22,5
	brlo L21
X3:
	.dbline 88
;      D_LE1;                    
	sbi 0x12,4
	.dbline 89
;      W_LE1;                    
	sbi 0x12,5
	.dbline 90
;      Data_IO=~j;               
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 91
;      W_LE0;                    
	cbi 0x12,5
	.dbline 92
; 	 j=(j<<1);
	lsl R20
	.dbline 93
;      Data_IO=table[A1];         
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 94
;      D_LE0;                    
	cbi 0x12,4
	.dbline 95
;      delay_nms(1);              
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 97
; 
;      D_LE1;                     
	sbi 0x12,4
	.dbline 98
;      W_LE1;                     
	sbi 0x12,5
	.dbline 99
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 100
;      W_LE0;                      
	cbi 0x12,5
	.dbline 101
; 	 j=(j<<1);
	lsl R20
	.dbline 102
;      Data_IO=table[A2]|0x80;         //��ʾС����    
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R24,z+0
	ori R24,128
	out 0x1b,R24
	.dbline 103
;      D_LE0;                      
	cbi 0x12,4
	.dbline 104
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 106
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 107
;      W_LE1;                     
	sbi 0x12,5
	.dbline 108
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 109
;      W_LE0;                      
	cbi 0x12,5
	.dbline 110
; 	 j=(j<<1);
	lsl R20
	.dbline 111
;      Data_IO=table[A3];           
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 112
;      D_LE0;                      
	cbi 0x12,4
	.dbline 113
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 115
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 116
;      W_LE1;                     
	sbi 0x12,5
	.dbline 117
;      Data_IO=0xff;                
	ldi R24,255
	out 0x1b,R24
	.dbline 118
;      W_LE0;                      
	cbi 0x12,5
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	adiw R28,4
	ret
	.dbsym r i 22 c
	.dbsym r j 20 c
	.dbsym l data_g 6 i
	.dbsym l data_s 4 i
	.dbsym l data_b 2 i
	.dbend
	.dbfunc e DS18B20_Reset _DS18B20_Reset fc
;              i -> R20
	.even
_DS18B20_Reset::
	st -y,R20
	.dbline -1
	.dbline 129
; 
; }
; 
; 
; //************************************************************************* 
; //			DS18B20��ʼ��
; //*************************************************************************
; 
; unsigned char DS18B20_Reset(void)                 //��ʼ���͸�λ
; 
; {
	.dbline 131
; unsigned char i;
;     DQ_OUT;
	sbi 0x2,4
	.dbline 132
; 	DQ_CLR;
	cbi 0x3,4
	.dbline 133
; 	delay_n100us(5);				//��ʱ500uS(480-960)
	ldi R16,5
	xcall _delay_n100us
	.dbline 134
; 	DQ_SET;
	sbi 0x3,4
	.dbline 135
; 	DQ_IN;
	cbi 0x2,4
	.dbline 136
; 	delay_n100us(1);				//��ʱ100uS
	ldi R16,1
	xcall _delay_n100us
	.dbline 137
; 	i = DQ_R;
	in R20,0x1
	andi R20,16
	.dbline 138
; 	delay_n100us(5);				//��ʱ500uS(����>480uS)
	ldi R16,5
	xcall _delay_n100us
	.dbline 140
; 	
; 	if (i) 
	tst R20
	breq L26
X4:
	.dbline 141
;         {
	.dbline 142
; 		return 0x00;
	clr R16
	xjmp L25
L26:
	.dbline 146
; 		
;         }
; 	else 
;         {
	.dbline 147
; 		return 0x01;
	ldi R16,1
	.dbline -2
L25:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r i 20 c
	.dbend
	.dbfunc e DS18B20_Read_byte _DS18B20_Read_byte fc
;          value -> R20
;              i -> R22
	.even
_DS18B20_Read_byte::
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 159
; 		
;         }
; 
; }
; 
; 
; //************************************************************************* 
; //			DS18B20��һ���ֽں���
; //************************************************************************* 
;    
; unsigned char DS18B20_Read_byte(void) 
; {
	.dbline 162
; 
; 	unsigned char i;
; 	unsigned char value = 0;
	clr R20
	.dbline 163
; 	for (i = 8; i != 0; i--) 
	ldi R22,8
	xjmp L32
L29:
	.dbline 164
;         {
	.dbline 165
; 		value >>= 1;
	lsr R20
	.dbline 166
; 		DQ_OUT;
	sbi 0x2,4
	.dbline 167
; 		DQ_CLR;
	cbi 0x3,4
	.dbline 168
;         delay_10us();				//*��ʱ10uS
	xcall _delay_10us
	.dbline 170
; 		
; 		DQ_SET;
	sbi 0x3,4
	.dbline 171
; 		DQ_IN;
	cbi 0x2,4
	.dbline 172
;         delay_10us();				//*��ʱ10uS
	xcall _delay_10us
	.dbline 174
; 		
; 		if (DQ_R) 
	sbis 0x1,4
	rjmp L33
X5:
	.dbline 175
;                 {
	.dbline 176
; 			value|=0x80;
	ori R20,128
	.dbline 178
; 			
;                 }
L33:
	.dbline 179
; 		delay_50us();			       //*��ʱ50uS
	xcall _delay_50us
	.dbline 181
; 		
;         }
L30:
	.dbline 163
	dec R22
L32:
	.dbline 163
	tst R22
	brne L29
X6:
	.dbline 183
; 	
; 	return(value);
	mov R16,R20
	.dbline -2
L28:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	ret
	.dbsym r value 20 c
	.dbsym r i 22 c
	.dbend
	.dbfunc e ds1820_write_byte _ds1820_write_byte fV
;              i -> R20
;          value -> R10
	.even
_ds1820_write_byte::
	st -y,R10
	st -y,R20
	mov R10,R16
	.dbline -1
	.dbline 192
; }
; 
; //************************************************************************* 
; //			��18B20дһ���ֽں���
; //*************************************************************************  
; 
; /*DS18B20�ֽ�д�뺯��*/
; void ds1820_write_byte(unsigned char value) 
; {
	.dbline 195
; 
; 	unsigned char i;
; 	for (i = 8; i != 0; i--) 
	ldi R20,8
	xjmp L39
L36:
	.dbline 196
;         {
	.dbline 197
; 		DQ_OUT;
	sbi 0x2,4
	.dbline 198
; 		DQ_CLR;
	cbi 0x3,4
	.dbline 199
;         delay_10us();				 //��ʱ10uS
	xcall _delay_10us
	.dbline 200
; 		if (value & 0x01) 
	sbrs R10,0
	rjmp L40
X7:
	.dbline 201
;                 {
	.dbline 202
; 			DQ_SET;
	sbi 0x3,4
	.dbline 204
; 			
;                 }
L40:
	.dbline 205
; 		delay_n100us(1);			//��ʱ100uS
	ldi R16,1
	xcall _delay_n100us
	.dbline 206
; 		DQ_SET;			        	//λ����
	sbi 0x3,4
	.dbline 207
; 		value >>= 1;
	lsr R10
	.dbline 209
; 		
;         }
L37:
	.dbline 195
	dec R20
L39:
	.dbline 195
	tst R20
	brne L36
X8:
	.dbline -2
L35:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbsym r i 20 c
	.dbsym r value 10 c
	.dbend
	.dbfunc e ds1820_start _ds1820_start fV
	.even
_ds1820_start::
	.dbline -1
	.dbline 217
; 	
; }
; //*************************************************************************
; //				�����¶�ת������
; //************************************************************************* 
; 
; /*����ds1820ת��*/
; void ds1820_start(void) {
	.dbline 219
; 
; 	DS18B20_Reset();
	xcall _DS18B20_Reset
	.dbline 220
; 	ds1820_write_byte(0xCC);	
	ldi R16,204
	xcall _ds1820_write_byte
	.dbline 221
; 	ds1820_write_byte(0x44);	//����ת��
	ldi R16,68
	.dbline -2
L42:
	.dbline 0 ; func end
	xjmp _ds1820_write_byte
	.dbend
	.dbfunc e DS18B20_Read_temp _DS18B20_Read_temp fi
;            buf -> y+0
;              i -> R20,R21
	.even
_DS18B20_Read_temp::
	st -y,R20
	st -y,R21
	sbiw R28,9
	.dbline -1
	.dbline 229
; }
; 
; //*************************************************************************
; //				DS8B20��ȡ�¶���Ϣ
; //************************************************************************* 
; 
; unsigned int DS18B20_Read_temp(void) 
; {
	.dbline 234
; 
; 	unsigned int i;
; 	unsigned char buf[9];
; 
; 	DS18B20_Reset();
	xcall _DS18B20_Reset
	.dbline 235
; 	ds1820_write_byte(0xCC);	
	ldi R16,204
	xcall _ds1820_write_byte
	.dbline 236
; 	ds1820_write_byte(0xBE);	//��ȡ�¶�
	ldi R16,190
	xcall _ds1820_write_byte
	.dbline 237
; 	for (i = 0; i < 9; i++) 
	clr R20
	clr R21
	xjmp L47
L44:
	.dbline 238
;      {
	.dbline 239
;  	  buf[i] = DS18B20_Read_byte();	
	xcall _DS18B20_Read_byte
	movw R24,R28
	movw R30,R20
	add R30,R24
	adc R31,R25
	std z+0,R16
	.dbline 240
;      }
L45:
	.dbline 237
	subi R20,255  ; offset = 1
	sbci R21,255
L47:
	.dbline 237
	cpi R20,9
	ldi R30,0
	cpc R21,R30
	brlo L44
X9:
	.dbline 241
; 	i = buf[1];
	ldd R20,y+1
	clr R21
	.dbline 242
; 	i <<= 8;
	mov R21,R20
	clr R20
	.dbline 243
; 	i |= buf[0];
	ldd R2,y+0
	clr R3
	or R20,R2
	or R21,R3
	.dbline 244
; 	temp_value=i;
	sts _temp_value+1,R21
	sts _temp_value,R20
	.dbline 245
;     temp_value=temp_value*0.625;    //���ǳ���0.0625��ԭ����Ϊ�˰�С�����һλ����Ҳת��Ϊ������ʾ������
	ldi R16,<L49
	ldi R17,>L49
	xcall elpm32
	movw R2,R16
	movw R4,R18
	lds R16,_temp_value
	lds R17,_temp_value+1
	xcall uint2fp
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R16,R2
	movw R18,R4
	xcall fpmule2
	xcall fpint
	sts _temp_value+1,R17
	sts _temp_value,R16
	.dbline 248
; 		                        //�����¶ȱ���Ϊ27.5�ȣ�Ϊ���ں��������ݴ�������еõ�BCD�룬�����ȷŴ�275
;                                         //Ȼ������ʾ��ʱ��ȷ��С�����λ�ü��ɣ�������ʾ��27.5����
; 	return i;
	movw R16,R20
	.dbline -2
L43:
	.dbline 0 ; func end
	adiw R28,9
	ld R21,y+
	ld R20,y+
	ret
	.dbsym l buf 0 A[9:9]c
	.dbsym r i 20 i
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R10,R11
;         temp_d -> R10,R11
	.even
_data_do::
	st -y,R10
	st -y,R11
	movw R10,R16
	.dbline -1
	.dbline 257
; }
; 
; 
; 
; //*************************************************************************
; //		�¶����ݴ�����
; //*************************************************************************
;  void data_do(uint temp_d)
;  {
	.dbline 259
;      uint A2t;
;      A1=temp_d/100;                       //�ֳ��٣�ʮ���͸�λ
	ldi R18,100
	ldi R19,0
	movw R16,R10
	xcall div16u
	sts _A1+1,R17
	sts _A1,R16
	.dbline 260
;      A2t=temp_d%100;
	ldi R18,100
	ldi R19,0
	movw R16,R10
	xcall mod16u
	movw R10,R16
	.dbline 261
;      A2=A2t/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A2+1,R17
	sts _A2,R16
	.dbline 262
;      A3=A2t%10;
	ldi R18,10
	ldi R19,0
	movw R16,R10
	xcall mod16u
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L50:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym r A2t 10 i
	.dbsym r temp_d 10 i
	.dbend
	.dbfunc e main _main fV
;              j -> R20,R21
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 270
; }
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 272
;     uint j;
; 	DS18B20_Reset();			        //��λD18B20
	xcall _DS18B20_Reset
	xjmp L53
L52:
	.dbline 274
; while (1)
;     {
	.dbline 275
; 		ds1820_start();		           //����һ��ת��
	xcall _ds1820_start
	.dbline 276
; 		DS18B20_Read_temp();		   //��ȡ�¶���ֵ
	xcall _DS18B20_Read_temp
	.dbline 277
;         data_do(temp_value);       	   //�������ݣ��õ�Ҫ��ʾ��ֵ
	lds R16,_temp_value
	lds R17,_temp_value+1
	xcall _data_do
	.dbline 278
; for(j=0;j<200;j++)
	clr R20
	clr R21
	xjmp L58
L55:
	.dbline 279
;     {	    
	.dbline 280
; 		Display_DS18B20(A1,A2,A3);     //��ʾ�¶�ֵ
	lds R2,_A3
	lds R3,_A3+1
	std y+1,R3
	std y+0,R2
	lds R18,_A2
	lds R19,_A2+1
	lds R16,_A1
	lds R17,_A1+1
	xcall _Display_DS18B20
	.dbline 281
; 	}
L56:
	.dbline 278
	subi R20,255  ; offset = 1
	sbci R21,255
L58:
	.dbline 278
	cpi R20,200
	ldi R30,0
	cpc R21,R30
	brlo L55
X10:
	.dbline 284
; 
; 		
;     }
L53:
	.dbline 273
	xjmp L52
X11:
	.dbline -2
L51:
	.dbline 0 ; func end
	adiw R28,2
	ret
	.dbsym r j 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\DS18B20\DS18B20.C
_flag1::
	.blkb 1
	.dbsym e flag1 _flag1 c
_A3::
	.blkb 2
	.dbsym e A3 _A3 i
_A2::
	.blkb 2
	.dbsym e A2 _A2 i
_A1::
	.blkb 2
	.dbsym e A1 _A1 i
_temp::
	.blkb 2
	.dbsym e temp _temp i
_temp_value::
	.blkb 2
	.dbsym e temp_value _temp_value i
_key::
	.blkb 1
	.dbsym e key _key c
	.area lit(rom, con, rel)
L49:
	.word 0x0,0x3f20
; }
