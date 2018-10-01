	.module INTKEY.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
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
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 42
; //DMAVR-M16�ж�ʽ��������ʾ�����򣬼�ֵ�仯���ܲ��ȣ���Ϊ����Ӳ���Ķ���ԭ��
; //�����жϼ��̽��м�1���߼�1����
; //ע��ICCAVR�жϺ������������ж������ſ�����ͷ�ļ�iom128v.h�в���
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
; #define Data_IO	        PORTA                //���ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; uchar count;                                  //������̼�������
; 
; //***********************************************************************
; //			�����������ʾ�Ķ����
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
; 	           0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; 
; //***********************************************************************
; //			IO�˿ڳ�ʼ��
; //***********************************************************************
; 
; void System_Init()
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
; 	PORTD=0x7F;               //PD0 PD1����Ϊ����
	ldi R24,127
	out 0x12,R24
	.dbline 47
; 	DDRD=0x70;                //PD0 PD1��������ʹ����Ч
	ldi R24,112
	out 0x11,R24
	.dbline 49
; 	
; 	PORTB=0xFF;				  //�رշ��������
	ldi R24,255
	out 0x18,R24
	.dbline 50
; 	DDRB=0xFF;
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_Key _Display_Key fV
;              j -> R22
;              i -> R20
;            num -> R10
	.even
_Display_Key::
	xcall push_xgsetF00C
	mov R10,R16
	.dbline -1
	.dbline 58
; }
; 
; //*************************************************************************
; //			74HC573��������ܶ�̬ɨ����ʾ����
; //*************************************************************************
; 
; void Display_Key(uchar num)
; {
	.dbline 60
; 	 uchar i,j;
; 	 System_Init();
	xcall _System_Init
	.dbline 61
;      j=0x01;                   //��������������λѡ
	ldi R22,1
	.dbline 62
;   for(i=0;i<8;i++)
	clr R20
	xjmp L24
L21:
	.dbline 63
;   {
	.dbline 64
;     D_LE1;                    //��������ܶ����ݵ�74HC573��LE�ܽ��ø�
	sbi 0x12,4
	.dbline 65
;     W_LE1;                    //���������λ��74HC573��LE�ܽ��ø�
	sbi 0x12,5
	.dbline 66
;     Data_IO=0x00;             //������ʾ��λ��Ҳ�����ĸ���������������ǰ˸�һ����ʾ
	clr R2
	out 0x1b,R2
	.dbline 67
;     W_LE0;                    //����λ���ݣ��������϶������Ժ󣬾���ʾ������
	cbi 0x12,5
	.dbline 68
; 	j=(j<<1);
	lsl R22
	.dbline 69
;     Data_IO=table[num];       //��Ҫ��ʾ�����ݣ����Ƕ����ݣ�����ʾ0�͵���0x3f
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 70
;     D_LE0;                    //��������ݣ��������һ��ʱ��Ƭ��
	cbi 0x12,4
	.dbline 71
;     delay_nms(1);             //��ʾһ��ʱ��Ƭ�̣���Ӱ�����Ⱥ���˸��
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 73
; 
;   }
L22:
	.dbline 62
	inc R20
L24:
	.dbline 62
	cpi R20,8
	brlo L21
X3:
	.dbline -2
L20:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r j 22 c
	.dbsym r i 20 c
	.dbsym r num 10 c
	.dbend
	.dbfunc e Interrupt_Init _Interrupt_Init fV
	.even
_Interrupt_Init::
	.dbline -1
	.dbline 78
; 
; }
; 
; void Interrupt_Init()
; {
	.dbline 79
;   EIMSK|=0x03;                                     //ʹ���ⲿ�ж�0���ⲿ�ж�1
	in R24,0x39
	ori R24,3
	out 0x39,R24
	.dbline 80
;   EICRA=0x0A;                                     //�½��ش�����ʽ
	ldi R24,10
	sts 106,R24
	.dbline 81
;   MCUCSR=0x00;                                    //���ƺ�״̬�Ĵ�����ʼ��
	clr R2
	out 0x34,R2
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 4
	jmp _INT0_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
	.dbfunc e INT0_ISR _INT0_ISR fV
	.even
_INT0_ISR::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 90
; }
; 
; //*************************************************************************
; //	   �жϷ����ӳ���
; //*************************************************************************
; 
; #pragma interrupt_handler  INT0_ISR:iv_INT0 //int0_ISR���жϺ��������������ж�������
; void INT0_ISR() 	 				  		//�ж�0�������
;    { 
	.dbline 91
;    	 if(++count>=16) 
	lds R24,_count
	subi R24,255    ; addi 1
	mov R2,R24
	sts _count,R2
	cpi R24,16
	brlo L27
X4:
	.dbline 92
;    	 count=0;
	clr R2
	sts _count,R2
L27:
	.dbline -2
L26:
	.dbline 0 ; func end
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R2,y+
	reti
	.dbend
	.area vector(rom, abs)
	.org 8
	jmp _INT1_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
	.dbfunc e INT1_ISR _INT1_ISR fV
	.even
_INT1_ISR::
	st -y,R2
	st -y,R24
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 97
;    } 
; 
; #pragma interrupt_handler  INT1_ISR:iv_INT1
; void INT1_ISR() 	 				 	   //�ж�1�������
;    { 
	.dbline 98
;    	 if(count) --count;
	lds R2,_count
	tst R2
	breq L30
X5:
	.dbline 98
	mov R24,R2
	subi R24,1
	sts _count,R24
	xjmp L31
L30:
	.dbline 99
;    	 else count=15;
	ldi R24,15
	sts _count,R24
L31:
	.dbline -2
L29:
	.dbline 0 ; func end
	ld R2,y+
	out 0x3f,R2
	ld R24,y+
	ld R2,y+
	reti
	.dbend
	.dbfunc e main _main fI
	.even
_main::
	.dbline -1
	.dbline 107
;   }
; 
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; int main(void)
; {
	.dbline 108
;   System_Init();                             //ϵͳ��ʼ��
	xcall _System_Init
	.dbline 109
;   Interrupt_Init();                          //�ж����ó�ʼ��
	xcall _Interrupt_Init
	.dbline 110
;   SREG|=0x80;                                //����ȫ���ж�
	bset 7
	xjmp L34
L33:
	.dbline 112
;   while(1)
;   {
	.dbline 113
;     Display_Key(count);                     //��ʾ��ֵ
	lds R16,_count
	xcall _Display_Key
	.dbline 114
;   }
L34:
	.dbline 111
	xjmp L33
X6:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\INTKEY\INTKEY.C
_count::
	.blkb 1
	.dbsym e count _count c
; }
