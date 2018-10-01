	.module PWM.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM\PWM.C
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
	.dbfile E:\DMAVR-~3\PWM\PWM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 37
; //DMAVR-128�Ķ�ʱ��ʵ�ֿ���PWM���ʾ�����򣬶�ʱ��0����жϵķ�ʽ
; //PWM���ͨ������LED������ֱ�۵Ŀ���Ч�����ı�OCR0��ֵ�����Կ�������
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
; #define f_count         25                              //0CR0�Ĵ�����ʼֵ
; #define timer_clk       0x07
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define Data_IO	        PORTA                //��������ݿ�
; #define Data_DDR        DDRA                 //��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()                                   //IO�ڳ�ʼ��
; {
	.dbline 39
;   
;   PORTB=0xff;                                       //PB����Ϊ���
	ldi R24,255
	out 0x18,R24
	.dbline 40
;   DDRB=0xff;                                        //����������Ч
	out 0x17,R24
	.dbline 42
;   
;   D_LE1;                             				//�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 43
;   W_LE1;                     
	sbi 0x12,5
	.dbline 44
;   Data_IO=0xFF;                      				//�������            
	out 0x1b,R24
	.dbline 45
;   W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e timer0_init _timer0_init fV
	.even
_timer0_init::
	.dbline -1
	.dbline 50
; 
; }
; 
; void timer0_init()                                 //��ʱ����ʼ��
; {
	.dbline 51
;   TCCR0=0x68|timer_clk;                            //���PWMģʽ��OC0�����1024��Ƶ
	ldi R24,111
	out 0x33,R24
	.dbline 52
;   OCR0=f_count;                                    //OCR0�Ƚ�ƥ��Ĵ���ֵ
	ldi R24,25
	out 0x31,R24
	.dbline 53
;   TIFR=0x01;                                       //���жϱ�־λ
	ldi R24,1
	out 0x36,R24
	.dbline 54
;   TIMSK=0x01;                                      //ʹ�ܶ�ʱ��0����ж�
	out 0x37,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 64
	jmp _TIMER0_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PWM\PWM.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R24
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 63
; }
; 
; 
; //*************************************************************************
; //		��ʱ��0�жϷ����ӳ���
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:iv_TIM0_OVF
; void TIMER0_ISR() 	 	
; {
	.dbline 64
;   OCR0=f_count;                                 //�ı�OCR0��ֵ���Ըı�PWM���
	ldi R24,25
	out 0x31,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R24,y+
	out 0x3f,R24
	ld R24,y+
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 72
; }
; 
; //*************************************************************************
; //		������
; //*************************************************************************
; 
; void main(void)
; {
	.dbline 73
;   system_init();                             //ϵͳ��ʼ��.PB4���PWM����
	xcall _system_init
	.dbline 74
;   timer0_init();                             //��ʱ��0��ʼ�������PWM�������
	xcall _timer0_init
	.dbline 75
;   SREG|=0x80;                                //����ȫ���ж�
	bset 7
L23:
	.dbline 77
;   while(1)
;   {
	.dbline 78
;   }
L24:
	.dbline 76
	xjmp L23
X3:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
; }
