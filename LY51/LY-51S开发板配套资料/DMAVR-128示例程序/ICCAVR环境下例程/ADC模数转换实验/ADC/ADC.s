	.module ADC.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ADC\ADC.C
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
	.dbfile E:\DMAVR-~3\ADC\ADC.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ADC\ADC.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 42
; //DMAVR-128��ADC��ͨ��ת��ʾ�����򣬲�ȡ���������жϵķ�ʽ
; //����λ��Ϊ10λ���ȣ�����ʵ��8λ���ȣ���ʾ���ΪADC�����������
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
; #define Data_IO	        PORTA                //��������ݿ�
; #define Data_DDR        DDRA                 //��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; uchar adc_datah,adc_datal,A1,A2,A3,A4;                       //�������
; uchar flag,j;                                               //��־����
; 
; //***********************************************************************
; //			�����������ʾ�Ķ����0��F
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,
;                0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; 
; //***********************************************************************
; //			IO�˿ڳ�ʼ��
; //***********************************************************************
; 
; void system_init()
; {
	.dbline 43
;     Data_IO=0xFF;             //���ݿ�Ϊ���
	ldi R24,255
	out 0x1b,R24
	.dbline 44
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 46
; 
;     PORTD=0xFF;               //74HC573�Ŀ��ƿڣ�����Ϊ���
	out 0x12,R24
	.dbline 47
;     DDRD=0xFF;
	out 0x11,R24
	.dbline 49
; 	
; 	PORTB=0xFF;				  //�رշ��������
	out 0x18,R24
	.dbline 50
; 	DDRB=0xFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_ADC _Display_ADC fV
;              i -> R22
;              j -> R20
	.even
_Display_ADC::
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 58
; }
; 
; //*************************************************************************
; //			74HC573��������ܶ�̬ɨ����ʾ��������ʾ�ɼ������¶�
; //*************************************************************************
; 
; void Display_ADC()
; {
	.dbline 60
; 	 uchar i,j;
; 	 system_init();
	xcall _system_init
	.dbline 61
;      j=0x01;                    //��������������λѡ
	ldi R20,1
	.dbline 62
;  for(i=0;i<4;i++)               //�ú�4λ���������ʾ
	clr R22
	xjmp L24
L21:
	.dbline 63
;   {
	.dbline 64
;      D_LE1;                     
	sbi 0x12,4
	.dbline 65
;      W_LE1;                     
	sbi 0x12,5
	.dbline 66
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 67
;      W_LE0;                      
	cbi 0x12,5
	.dbline 68
; 	 j=(j<<1);
	lsl R20
	.dbline 69
;      Data_IO=0x00;           
	clr R2
	out 0x1b,R2
	.dbline 70
;      D_LE0;                      
	cbi 0x12,4
	.dbline 71
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 72
;   }
L22:
	.dbline 62
	inc R22
L24:
	.dbline 62
	cpi R22,4
	brlo L21
X3:
	.dbline 73
;      D_LE1;                    
	sbi 0x12,4
	.dbline 74
;      W_LE1;                    
	sbi 0x12,5
	.dbline 75
;      Data_IO=~j;               
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 76
;      W_LE0;                    
	cbi 0x12,5
	.dbline 77
; 	 j=(j<<1);
	lsl R20
	.dbline 78
;      Data_IO=table[A1];         
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 79
;      D_LE0;                    
	cbi 0x12,4
	.dbline 80
;      delay_nms(1);              
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 82
; 
;      D_LE1;                     
	sbi 0x12,4
	.dbline 83
;      W_LE1;                     
	sbi 0x12,5
	.dbline 84
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 85
;      W_LE0;                      
	cbi 0x12,5
	.dbline 86
; 	 j=(j<<1);
	lsl R20
	.dbline 87
;      Data_IO=table[A2];            
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 88
;      D_LE0;                      
	cbi 0x12,4
	.dbline 89
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 91
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 92
;      W_LE1;                     
	sbi 0x12,5
	.dbline 93
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 94
;      W_LE0;                      
	cbi 0x12,5
	.dbline 95
; 	 j=(j<<1);
	lsl R20
	.dbline 96
;      Data_IO=table[A3];           
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 97
;      D_LE0;                      
	cbi 0x12,4
	.dbline 98
;      delay_nms(1);   
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 100
; 	 
; 	  D_LE1;                    
	sbi 0x12,4
	.dbline 101
;      W_LE1;                    
	sbi 0x12,5
	.dbline 102
;      Data_IO=~j;               
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 103
;      W_LE0;                    
	cbi 0x12,5
	.dbline 104
; 	 j=(j<<1);
	lsl R20
	.dbline 105
;      Data_IO=table[A4];         
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A4
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 106
;      D_LE0;                    
	cbi 0x12,4
	.dbline 107
;      delay_nms(1);             
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	ret
	.dbsym r i 22 c
	.dbsym r j 20 c
	.dbend
	.dbfunc e adc_init _adc_init fV
	.even
_adc_init::
	.dbline -1
	.dbline 114
; 
; 	 
; 
; }
; 
; void adc_init()
; {
	.dbline 115
;   ADMUX=0x40;                              //ѡ��ͨ��0�������Ҷ��룬AVCCΪ��ѹ��׼
	ldi R24,64
	out 0x7,R24
	.dbline 116
;   ADCSRA=0xF8;                             //adcʹ�ܣ�����ת��
	ldi R24,248
	out 0x6,R24
	.dbline 117
;   SFIOR=0x00;                              //���ƺ�״̬�Ĵ�����ʼ��
	clr R2
	out 0x20,R2
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e data_do _data_do fV
;         temp_3 -> R12,R13
;         temp_2 -> R10,R11
;         temp_1 -> R10,R11
;        temp_dl -> R12,R13
;        temp_dh -> R10,R11
	.even
_data_do::
	xcall push_xgset003C
	movw R12,R18
	movw R10,R16
	.dbline -1
	.dbline 124
; }
; 
; //*************************************************************************
; //		���ݴ�����
; //*************************************************************************
;  void data_do(uint temp_dh,uint temp_dl)
;  {
	.dbline 126
;      uint temp_1,temp_2,temp_3;
;      temp_1=temp_dh*16*16;
	ldi R16,16
	ldi R17,0
	movw R18,R10
	xcall empy16s
	movw R18,R16
	ldi R16,16
	ldi R17,0
	xcall empy16s
	movw R10,R16
	.dbline 127
;      temp_3=temp_1+temp_dl;
	movw R2,R10
	add R2,R12
	adc R3,R13
	movw R12,R2
	.dbline 128
;      A1=temp_3/1000;                       //�ֳ�ǧ���٣�ʮ���͸�λ
	ldi R18,1000
	ldi R19,3
	movw R16,R2
	xcall div16u
	sts _A1,R16
	.dbline 129
;      temp_1=temp_3%1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R12
	xcall mod16u
	movw R10,R16
	.dbline 130
;      A2=temp_1/100;
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _A2,R16
	.dbline 131
;      temp_2=temp_1%100;
	ldi R18,100
	ldi R19,0
	movw R16,R10
	xcall mod16u
	movw R10,R16
	.dbline 132
;      A3=temp_2/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A3,R16
	.dbline 133
;      A4=temp_2%10;
	ldi R18,10
	ldi R19,0
	movw R16,R10
	xcall mod16u
	sts _A4,R16
	.dbline -2
L26:
	.dbline 0 ; func end
	xjmp pop_xgset003C
	.dbsym r temp_3 12 i
	.dbsym r temp_2 10 i
	.dbsym r temp_1 10 i
	.dbsym r temp_dl 12 i
	.dbsym r temp_dh 10 i
	.dbend
	.area vector(rom, abs)
	.org 84
	jmp _ADC_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ADC\ADC.C
	.dbfunc e ADC_ISR _ADC_ISR fV
	.even
_ADC_ISR::
	st -y,R0
	st -y,R1
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R6
	st -y,R7
	st -y,R8
	st -y,R9
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R26
	st -y,R27
	st -y,R30
	st -y,R31
	in R0,0x3f
	st -y,R0
	.dbline -1
	.dbline 141
; }
; 
; //*************************************************************************
; //		�жϷ����ӳ���
; //*************************************************************************
; #pragma interrupt_handler  ADC_ISR:iv_ADC 
; void ADC_ISR() 	 				  		
; {                                          //ADC�жϷ������
	.dbline 142
;   adc_datal=ADCL;
	in R2,0x4
	sts _adc_datal,R2
	.dbline 143
;   adc_datah=ADCH;                         //��ȡadc���ݼĴ�����ֵ��8λ����
	in R2,0x5
	sts _adc_datah,R2
	.dbline 144
;   data_do(adc_datah,adc_datal);           //���ݴ����õ�BCD��
	lds R18,_adc_datal
	clr R19
	mov R16,R2
	clr R17
	xcall _data_do
	.dbline 145
;   flag=0x01;                              //��־λ��1
	ldi R24,1
	sts _flag,R24
	.dbline 146
;  for(j=0;j<50;j++)
	clr R2
	sts _j,R2
	xjmp L31
L28:
	.dbline 147
;   {
	.dbline 148
;      Display_ADC();           //��ʾadc������
	xcall _Display_ADC
	.dbline 149
;   }
L29:
	.dbline 146
	lds R24,_j
	subi R24,255    ; addi 1
	sts _j,R24
L31:
	.dbline 146
	lds R24,_j
	cpi R24,50
	brlo L28
X4:
	.dbline -2
L27:
	.dbline 0 ; func end
	ld R0,y+
	out 0x3f,R0
	ld R31,y+
	ld R30,y+
	ld R27,y+
	ld R26,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R9,y+
	ld R8,y+
	ld R7,y+
	ld R6,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	ld R1,y+
	ld R0,y+
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 158
; }
; 
; 
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; void main()
; {
	.dbline 159
;   system_init();                             //ϵͳ��ʼ��
	xcall _system_init
	.dbline 160
;   adc_init();                                //adc��ʼ������
	xcall _adc_init
	.dbline 161
;   SREG|=0x80;                                //����ȫ���ж�
	bset 7
L33:
	.dbline 163
;   while(1)
;   {
	.dbline 165
;     
;   }
L34:
	.dbline 162
	xjmp L33
X5:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\ADC\ADC.C
_j::
	.blkb 1
	.dbsym e j _j c
_flag::
	.blkb 1
	.dbsym e flag _flag c
_A4::
	.blkb 1
	.dbsym e A4 _A4 c
_A3::
	.blkb 1
	.dbsym e A3 _A3 c
_A2::
	.blkb 1
	.dbsym e A2 _A2 c
_A1::
	.blkb 1
	.dbsym e A1 _A1 c
_adc_datal::
	.blkb 1
	.dbsym e adc_datal _adc_datal c
_adc_datah::
	.blkb 1
	.dbsym e adc_datah _adc_datah c
; }
