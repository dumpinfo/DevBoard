	.module EEPROM.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\EEPROM\EEPROM.C
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //********************************************************************
; /*�� �� ����delay_us
; �������ڣ�2010��1��28��
; ���뻷����ICCAVR7.16A
; �������ã�΢�뼶����ʱ����
; ˵    ����7.3728M������
; ********************************************************************/
; void delay_1us(void);
; void delay_3us(void);
; void delay_10us(void);
; void delay_50us(void);
; void delay_100us(void);
; void delay_n100us(unsigned char n100us);
; void delay_1ms(void);
; void delay_nms(unsigned int nms);
; void delay_ns(unsigned char ns);
; 
; 
; void delay_1us(void)                 //1us��ʱ�����������������ã� 
; { 
	.dbline 21
;    asm("nop");                       //1ʱ������
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
;    asm("nop");                       //1T
	nop
	.dbline 26
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
	.dbline 30
; 
; }
; void delay_3us(void)                 //3us��ʱ����,,���ظ����ò�Ӱ�쾫��
; { 
	.dbline 32
;    
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
	.dbline 42
;    asm("nop");                       
	nop
	.dbline 43
;    asm("nop");
	nop
	.dbline 44
;    asm("nop");
	nop
	.dbline 45
;    asm("nop");
	nop
	.dbline 46
;    asm("nop");                       
	nop
	.dbline 47
;    asm("nop");
	nop
	.dbline 48
;    asm("nop");
	nop
	.dbline 49
;    asm("nop");
	nop
	.dbline 50
;    asm("nop");
	nop
	.dbline 51
;    asm("nop");
	nop
	.dbline 52
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
	.dbline 56
; } 
; 
; void delay_10us(void)                 //10us��ʱ����,,���ظ����ò�Ӱ�쾫��
; {
	.dbline 57
;    delay_3us();
	xcall _delay_3us
	.dbline 58
;    delay_3us(); 
	xcall _delay_3us
	.dbline 59
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
	.dbline 63
; }
;   
; void delay_50us(void)                 //48us��ʱ����,,���ظ����ò�Ӱ�쾫��
; { 
	.dbline 64
;    delay_10us();
	xcall _delay_10us
	.dbline 65
;    delay_10us(); 
	xcall _delay_10us
	.dbline 66
;    delay_10us();
	xcall _delay_10us
	.dbline 67
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
	.dbline 70
; }
; void delay_100us(void)     //exactly 98us��ʱ����,,���ظ����ò�Ӱ�쾫��
; {
	.dbline 71
;  delay_50us();
	xcall _delay_50us
	.dbline 72
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
	.dbline 75
; }
; void delay_n100us(unsigned char n100us)
; {
	xjmp L8
L7:
	.dbline 77
;  while(n100us--)                          
;  delay_100us();
	xcall _delay_100us
L8:
	.dbline 76
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
	.dbline 89
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
	.dbline 90
;  delay_100us();
	xcall _delay_100us
	.dbline 91
;  delay_100us();
	xcall _delay_100us
	.dbline 92
;  delay_100us();
	xcall _delay_100us
	.dbline 93
;  delay_100us();
	xcall _delay_100us
	.dbline 94
;  delay_100us();
	xcall _delay_100us
	.dbline 95
;  delay_100us();
	xcall _delay_100us
	.dbline 96
;  delay_100us();
	xcall _delay_100us
	.dbline 97
;  delay_100us();
	xcall _delay_100us
	.dbline 98
;  delay_100us();
	xcall _delay_100us
	.dbline 99
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
	.dbline 109
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
	.dbline 111
;  while(nms--) 
;  delay_1ms();
	xcall _delay_1ms
L13:
	.dbline 110
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
	.dbline 114
; }
; void delay_ns(unsigned char ns)
; {
	xjmp L17
L16:
	.dbline 116
;  while(ns--) 
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
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
	.dbfile E:\DMAVR-~3\EEPROM\EEPROM.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\EEPROM\EEPROM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 47
; //DMAVR-128�Ķ�дEEPROMʾ�����򣬼�¼CPU�����Ĵ�����EEPROM��
; //��LED���������ʾ����������,���ø�λ��ˢ����ʾ
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���ߣ����� www.avrgcc.com
; //���ڣ�2010.01.14
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #define	 F_CPU	7372800							// ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ���
; #include <delay.h>
; #include <iom128v.h>
; 
; 
; //***********************************************************************
; //			���������
; //***********************************************************************
; 
; #define Data_IO	        PORTA                	//��������ݿ�
; #define Data_DDR        DDRA                 	//��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) 	//����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  	//����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) 	//�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  	//�����λ����λΪ1
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; //***********************************************************************
; //			�����������ʾ�Ķ����0��F
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
; 	           0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uint A1,A2,A3;             		      			//����ı���,��ʾ���ݴ���
; 
; 
; 
; //***********************************************************************
; //			IO�˿ڳ�ʼ��
; //***********************************************************************
; 
; void system_init()
; {
	.dbline 48
;     Data_IO=0xFF;             						//���ݿ�Ϊ���
	ldi R24,255
	out 0x1b,R24
	.dbline 49
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 51
; 
;     PORTD=0xFF;               						//74HC573�Ŀ��ƿڣ�����Ϊ���
	out 0x12,R24
	.dbline 52
;     DDRD=0xFF;
	out 0x11,R24
	.dbline 53
; 	PORTB=0XFF;
	out 0x18,R24
	.dbline 54
; 	DDRB=0XFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_EEPROM _Display_EEPROM fV
;              i -> R22
;              j -> R20
	.even
_Display_EEPROM::
	st -y,R20
	st -y,R22
	.dbline -1
	.dbline 62
; }
; 
; //*************************************************************************
; //			74HC573��������ܶ�̬ɨ����ʾ��������ʾ�ɼ������¶�
; //*************************************************************************
; 
; void Display_EEPROM(void)
; {
	.dbline 64
; 	 uchar i,j;
; 	 system_init();
	xcall _system_init
	.dbline 65
;      j=0x01;                    			//��������������λѡ
	ldi R20,1
	.dbline 66
;  for(i=0;i<5;i++)               			//�ú�3λ���������ʾ
	clr R22
	xjmp L24
L21:
	.dbline 67
;   {
	.dbline 68
;      D_LE1;                     
	sbi 0x12,4
	.dbline 69
;      W_LE1;                     
	sbi 0x12,5
	.dbline 70
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 71
;      W_LE0;                      
	cbi 0x12,5
	.dbline 72
; 	 j=(j<<1);
	lsl R20
	.dbline 73
;      Data_IO=0x00;           
	clr R2
	out 0x1b,R2
	.dbline 74
;      D_LE0;                      
	cbi 0x12,4
	.dbline 75
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 76
;   }
L22:
	.dbline 66
	inc R22
L24:
	.dbline 66
	cpi R22,5
	brlo L21
X3:
	.dbline 77
;      D_LE1;                    
	sbi 0x12,4
	.dbline 78
;      W_LE1;                    
	sbi 0x12,5
	.dbline 79
;      Data_IO=~j;               
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 80
;      W_LE0;                    
	cbi 0x12,5
	.dbline 81
; 	 j=(j<<1);
	lsl R20
	.dbline 82
;      Data_IO=table[A1];         
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	lds R31,_A1+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 83
;      D_LE0;                    
	cbi 0x12,4
	.dbline 84
;      delay_nms(1);              
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 86
; 
;      D_LE1;                     
	sbi 0x12,4
	.dbline 87
;      W_LE1;                     
	sbi 0x12,5
	.dbline 88
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 89
;      W_LE0;                      
	cbi 0x12,5
	.dbline 90
; 	 j=(j<<1);
	lsl R20
	.dbline 91
;      Data_IO=table[A2];             
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	lds R31,_A2+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 92
;      D_LE0;                      
	cbi 0x12,4
	.dbline 93
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 95
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 96
;      W_LE1;                     
	sbi 0x12,5
	.dbline 97
;      Data_IO=~j;                
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 98
;      W_LE0;                      
	cbi 0x12,5
	.dbline 99
; 	 j=(j<<1);
	lsl R20
	.dbline 100
;      Data_IO=table[A3];           
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	lds R31,_A3+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 101
;      D_LE0;                      
	cbi 0x12,4
	.dbline 102
;      delay_nms(1);                
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 104
; 
; 	 D_LE1;                     
	sbi 0x12,4
	.dbline 105
;      W_LE1;                     
	sbi 0x12,5
	.dbline 106
;      Data_IO=0xff;                
	ldi R24,255
	out 0x1b,R24
	.dbline 107
;      W_LE0;                      
	cbi 0x12,5
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R22,y+
	ld R20,y+
	ret
	.dbsym r i 22 c
	.dbsym r j 20 c
	.dbend
	.dbfunc e data_do _data_do fV
;            A2t -> R10,R11
;         temp_d -> R10
	.even
_data_do::
	st -y,R10
	st -y,R11
	mov R10,R16
	.dbline -1
	.dbline 116
; 
; }
; 
; 
; //*************************************************************************
; //		���ݴ�����
; //*************************************************************************
;  void data_do(uchar temp_d)
;  {
	.dbline 118
;      uint A2t;
;      A1=temp_d/100;                       //�ֳ��٣�ʮ���͸�λ
	ldi R18,100
	ldi R19,0
	mov R16,R10
	clr R17
	xcall div16s
	sts _A1+1,R17
	sts _A1,R16
	.dbline 119
;      A2t=temp_d%100;
	ldi R18,100
	ldi R19,0
	mov R16,R10
	clr R17
	xcall mod16s
	movw R10,R16
	.dbline 120
;      A2=A2t/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A2+1,R17
	sts _A2,R16
	.dbline 121
;      A3=A2t%10;
	ldi R18,10
	ldi R19,0
	movw R16,R10
	xcall mod16u
	sts _A3+1,R17
	sts _A3,R16
	.dbline -2
L25:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym r A2t 10 i
	.dbsym r temp_d 10 c
	.dbend
	.dbfunc e eprom_read _eprom_read fV
;         p_buff -> R10,R11
;         number -> R18
;           addr -> R16,R17
	.even
_eprom_read::
	st -y,R10
	st -y,R11
	ldd R10,y+2
	ldd R11,y+3
	.dbline -1
	.dbline 129
; }
; 
; 
; //***********************************************************************
; //                EEPROM��ȡ����*/
; //            addr����ַ��number�����ȣ�p_buff���������ݴ��ָ��
; //***********************************************************************
; void eprom_read(unsigned int addr, unsigned char number, unsigned char *p_buff) {
L27:
	.dbline 131
; 
; 	while(EECR & (1 << EEWE));               //�ȴ�ǰ���д���
L28:
	.dbline 131
	sbic 0x1c,1
	rjmp L27
X4:
	.dbline 133
; 
; 	EEARH = 0x00;                           //д���ֽڵ�ַ
	clr R2
	out 0x1f,R2
	xjmp L31
L30:
	.dbline 135
; 	
; 	while(number --) {
	.dbline 136
; 		EEARL = addr ++;                 	//д��ַ���ֽ�
	movw R2,R16
	subi R16,255  ; offset = 1
	sbci R17,255
	out 0x1e,R2
	.dbline 137
; 		EECR |= (1 << EERE);            	//������λ��1
	sbi 0x1c,0
	.dbline 138
; 		*p_buff++ = EEDR;               	//����EEDR�е�����
	in R2,0x1d
	movw R30,R10
	st Z+,R2
	movw R10,R30
	.dbline 139
; 		}
L31:
	.dbline 135
	mov R2,R18
	clr R3
	subi R18,1
	tst R2
	brne L30
X5:
	.dbline -2
L26:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym r p_buff 10 pc
	.dbsym r number 18 c
	.dbsym r addr 16 i
	.dbend
	.dbfunc e eprom_write _eprom_write fV
;         p_buff -> R10,R11
;         number -> R18
;           addr -> R16,R17
	.even
_eprom_write::
	st -y,R10
	st -y,R11
	ldd R10,y+2
	ldd R11,y+3
	.dbline -1
	.dbline 145
; }
; //***********************************************************************
; //              EEPROMд�뺯��
; //          addr����ַ��number�����ȣ�p_buff��д�����ݴ��ָ��
; //***********************************************************************
; void eprom_write(unsigned int addr, unsigned char number, unsigned char *p_buff) {
	.dbline 147
; 
; 	EEARH = 0x00;
	clr R2
	out 0x1f,R2
	xjmp L35
L37:
	.dbline 150
; 	
; 	while(number --) {
; 		while(EECR & (1 << EEWE));       //�ȴ�ǰ���д���
L38:
	.dbline 150
	sbic 0x1c,1
	rjmp L37
X6:
	.dbline 151
; 		EEARL = addr ++;                 //д��ַ
	movw R2,R16
	subi R16,255  ; offset = 1
	sbci R17,255
	out 0x1e,R2
	.dbline 152
; 		EEDR = *p_buff ++;               //д���ݵ�EEDR
	movw R30,R10
	ld R2,Z+
	movw R10,R30
	out 0x1d,R2
	.dbline 153
; 		EECR |= (1 << EEMWE);            //����д������λ
	sbi 0x1c,2
	.dbline 154
; 		EECR&=~(1<<EEWE);
	cbi 0x1c,1
	.dbline 155
; 		EECR |= (1 << EEWE);             //EEWEΪ1��ִ��д����
	sbi 0x1c,1
	.dbline 156
; 		}
L35:
	.dbline 149
	mov R2,R18
	clr R3
	subi R18,1
	tst R2
	brne L38
X7:
	.dbline -2
L33:
	.dbline 0 ; func end
	ld R11,y+
	ld R10,y+
	ret
	.dbsym r p_buff 10 pc
	.dbsym r number 18 c
	.dbsym r addr 16 i
	.dbend
	.dbfunc e main _main fV
;           temp -> y+2
	.even
_main::
	sbiw R28,3
	.dbline -1
	.dbline 164
; }
; 
; 
; //***********************************************************************
; //                       ������
; //***********************************************************************
; void main(void) 
; {
	.dbline 167
; 
; 	unsigned char temp;
;     system_init();                      //ϵͳ��ʼ��
	xcall _system_init
	.dbline 168
;     eprom_read(0x10, 0x01, &temp);		//������¼
	movw R24,R28
	adiw R24,2
	std y+1,R25
	std y+0,R24
	ldi R18,1
	ldi R16,16
	ldi R17,0
	xcall _eprom_read
	.dbline 169
;     delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 170
; 	temp ++;                            //����ֵ��1
	ldd R24,y+2
	subi R24,255    ; addi 1
	std y+2,R24
	.dbline 171
;     eprom_write(0x10, 0x01, &temp);		//д���¼	
	movw R24,R28
	adiw R24,2
	std y+1,R25
	std y+0,R24
	ldi R18,1
	ldi R16,16
	ldi R17,0
	xcall _eprom_write
	.dbline 172
;     delay_nms(10);              
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	xjmp L42
L41:
	.dbline 175
; 				             	
; 	while (1)
; 	 {
	.dbline 176
; 	data_do(temp);                      //ÿ����һ��temp��1����¼��EEPROM��
	ldd R16,y+2
	xcall _data_do
	.dbline 177
; 	Display_EEPROM();					//��ʾ����ֵ
	xcall _Display_EEPROM
	.dbline 178
; 	 }
L42:
	.dbline 174
	xjmp L41
X8:
	.dbline -2
L40:
	.dbline 0 ; func end
	adiw R28,3
	ret
	.dbsym l temp 2 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\EEPROM\EEPROM.C
_A3::
	.blkb 2
	.dbsym e A3 _A3 i
_A2::
	.blkb 2
	.dbsym e A2 _A2 i
_A1::
	.blkb 2
	.dbsym e A1 _A1 i
; }
