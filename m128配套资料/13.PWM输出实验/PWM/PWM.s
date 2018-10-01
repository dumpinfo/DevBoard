	.module PWM.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128�Ķ�ʱ��ʵ�ֿ���PWM���ʾ�����򣬶�ʱ��0����жϵķ�ʽ
; //PWM���ͨ������LED������ֱ�۵Ŀ���Ч�����ı�OCR0��ֵ�����Կ�������
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
; //***********************************************************************
; //			���������
; //***********************************************************************
; #define f_count         25                    //0CR0�Ĵ�����ʼֵ
	.dbline 21
; #define timer_clk       0x07
	nop
	.dbline 22
; 
	nop
	.dbline 23
; #define uchar           unsigned char
	nop
	.dbline 24
; #define uint            unsigned int
	nop
	.dbline 25
; 
	nop
	.dbline 26
; #define Data_IO	        PORTA                //��������ݿ�
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
; #define Data_DDR        DDRA                 //��������ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
	.dbline 32
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
	nop
	.dbline 33
; //*************************************************************************
	nop
	.dbline 34
; //			��ʼ���ӳ���
	nop
	.dbline 35
; //*************************************************************************
	nop
	.dbline 36
; void system_init()                                   //IO�ڳ�ʼ��
	nop
	.dbline 37
; {
	nop
	.dbline 38
;   
	nop
	.dbline 39
;   PORTB=0xff;                                       //PB����Ϊ���
	nop
	.dbline 40
;   DDRB=0xff;                                        //����������Ч
	nop
	.dbline 41
;   
	nop
	.dbline 42
;   D_LE1;//�ص�����ܣ�������ʾ����                   
	nop
	.dbline 43
;   W_LE1;
	nop
	.dbline 44
;   Data_IO=0xFF;//�������            
	nop
	.dbline 45
;   W_LE0;
	nop
	.dbline 46
; 
	nop
	.dbline 47
; }
	nop
	.dbline 48
; 
	nop
	.dbline 49
; void timer0_init()                                 //��ʱ����ʼ��
	nop
	.dbline 50
; {
	nop
	.dbline 51
;   TCCR0=0x68|timer_clk;                            //���PWMģʽ��OC0�����1024��Ƶ
	nop
	.dbline 52
;   OCR0=f_count;                                    //OCR0�Ƚ�ƥ��Ĵ���ֵ
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
;   TIFR=0x01;                                       //���жϱ�־λ
;   TIMSK=0x01;                                      //ʹ�ܶ�ʱ��0����ж�
; }
; 
	.dbline 57
; 
	xcall _delay_3us
	.dbline 58
; //*************************************************************************
	xcall _delay_3us
	.dbline 59
; //		��ʱ��0�жϷ����ӳ���
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
; //*************************************************************************
; #pragma interrupt_handler  TIMER0_ISR:17
; void TIMER0_ISR() 	 	
; {
	.dbline 64
;   OCR0=f_count;                                 //�ı�OCR0��ֵ���Ըı�PWM���
	xcall _delay_10us
	.dbline 65
; }
	xcall _delay_10us
	.dbline 66
; 
	xcall _delay_10us
	.dbline 67
; //*************************************************************************
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
; //		������
; //*************************************************************************
; 
	.dbline 71
; void main(void)
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
;   system_init();                             //ϵͳ��ʼ��.PB4���PWM����
;   timer0_init();                             //��ʱ��0��ʼ�������PWM�������
;   SREG|=0x80;                                //����ȫ���ж�
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;   while(1)
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
;   {
;   }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 90
; }
	xcall _delay_100us
	.dbline 91
; }
	xcall _delay_100us
	.dbline 92
; }
	xcall _delay_100us
	.dbline 93
; }
	xcall _delay_100us
	.dbline 94
; }
	xcall _delay_100us
	.dbline 95
; }
	xcall _delay_100us
	.dbline 96
; }
	xcall _delay_100us
	.dbline 97
; }
	xcall _delay_100us
	.dbline 98
; }
	xcall _delay_100us
	.dbline 99
; }
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
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
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
; }
; }
; }
; }
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; }
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
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\15.PWM���ʵ��\PWM\PWM.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 37
	.dbline 39
	ldi R24,255
	out 0x18,R24
	.dbline 40
	out 0x17,R24
	.dbline 42
	sbi 0x12,4
	.dbline 43
	sbi 0x12,5
	.dbline 44
	out 0x1b,R24
	.dbline 45
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
	.dbline 51
	ldi R24,111
	out 0x33,R24
	.dbline 52
	ldi R24,25
	out 0x31,R24
	.dbline 53
	ldi R24,1
	out 0x36,R24
	.dbline 54
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
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\15.PWM���ʵ��\PWM\PWM.C
	.dbfunc e TIMER0_ISR _TIMER0_ISR fV
	.even
_TIMER0_ISR::
	st -y,R24
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 63
	.dbline 64
	ldi R24,25
	out 0x31,R24
	.dbline -2
L21:
	ld R24,y+
	out 0x3f,R24
	ld R24,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 72
	.dbline 73
	xcall _system_init
	.dbline 74
	xcall _timer0_init
	.dbline 75
	bset 7
L23:
	.dbline 77
	.dbline 78
L24:
	.dbline 76
	xjmp L23
X1:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
