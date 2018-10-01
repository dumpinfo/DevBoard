	.module USART.c
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128�Ĵ���ͨ��ʵ�飬ͨ��getchar��printf���������ַ�
; //���뻷�� ICCAVR
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���˵���Ԫ����༭																	
; //���ڣ�2010.01.14
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; #include <stdio.h>
; #include <string.h>
; #include <iom128v.h>
; #include <delay.h>
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define ulong           unsigned long
; 
; /*������������*/
; #define Data_IO	        PORTA                			//��������ݿ�
; #define Data_DDR        DDRA                 			//���ݿڷ���Ĵ���
	.dbline 21
; #define D_LE0	        PORTD &= ~(1 << PD4) 			//����ܶο���λΪ0������˿�����
	nop
	.dbline 22
; #define D_LE1           PORTD |= (1 << PD4)  			//����ܶο���λΪ1�������������˿�һ��
	nop
	.dbline 23
; #define W_LE0	        PORTD &= ~(1 << PD5) 			//�����λ����λΪ0
	nop
	.dbline 24
; #define W_LE1           PORTD |= (1 << PD5)  			//�����λ����λΪ1
	nop
	.dbline 25
; 
	nop
	.dbline 26
; #define	F_CPU		   7372800		 						    // ��Ƭ����ƵΪ7.3728MHz
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
; #define baud           9600                                     //���ò����ʵĴ�С
; #define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //�����ʼ��㹫ʽ
; #define baud_h         (uchar)(baud_setting>>8)                 //��ȡ��λ
; #define baud_l         (uchar)(baud_setting)                    //��λ
	.dbline 32
; 
; 
	nop
	.dbline 33
; extern int _textmode;
	nop
	.dbline 34
; //***********************************************************************
	nop
	.dbline 35
; // ��������ı�׼��ʽ��������printf�����UART1
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; int putchar(char c)
	nop
	.dbline 38
;     {
	nop
	.dbline 39
;     if (_textmode && c == '\n')
	nop
	.dbline 40
;         putchar('\r');
	nop
	.dbline 41
;     while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
	nop
	.dbline 42
;         ;
	nop
	.dbline 43
;     UDR1 = c;
	nop
	.dbline 44
;     return c;
	nop
	.dbline 45
;     }
	nop
	.dbline 46
; //***********************************************************************
	nop
	.dbline 47
; // ��������ı�׼��ʽ��������getcharͨ��UART1���뵽��Ƭ��������C�е�scanf
	nop
	.dbline 48
; //***********************************************************************
	nop
	.dbline 49
; 
	nop
	.dbline 50
; int getchar(void)
	nop
	.dbline 51
;     {
	nop
	.dbline 52
;     while ((UCSR1A & 0x80) == 0)
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
;         ;
;     return UDR1;
;     } 
; //***********************************************************************
	.dbline 57
; // ����1��ʼ���ӿں���
	xcall _delay_3us
	.dbline 58
; // ��ʼ��uart,��ѯ��ʽ��д
	xcall _delay_3us
	.dbline 59
; //***********************************************************************
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
; void UART_Init(void)
; {
;  
;   UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//���ͽ���ʹ��
	.dbline 64
;   UBRR1H=baud_h;                                	//д�����ʵ�ֵ
	xcall _delay_10us
	.dbline 65
;   UBRR1L=baud_l; 
	xcall _delay_10us
	.dbline 66
; }
	xcall _delay_10us
	.dbline 67
; 
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
; //***********************************************************************
; //		�ر�����ܺ�����Ϊ������ܲ���ʾ���룬���ڳ�ʼ������
; //***********************************************************************
	.dbline 71
; 
	xcall _delay_50us
	.dbline 72
; void LED_Off()
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
; {
;     PORTD=0xFF;
; 	DDRD=0xFF;
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
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
;     W_LE1;                     
;     Data_IO=0xFF;                      //�������            
;     W_LE0; 
; }
; 
; //***********************************************************************
; //			������������SD����д����
; //***********************************************************************
; 
; void main(void)
; {
;  unsigned char a;
;  
	.dbline 90
;  UART_Init();                 							  //���ڳ�ʼ��
	xcall _delay_100us
	.dbline 91
;  LED_Off();               							      //�������
	xcall _delay_100us
	.dbline 92
;  while(1)
	xcall _delay_100us
	.dbline 93
;  {
	xcall _delay_100us
	.dbline 94
;   printf("M128_ZZX2����ͨ��ʵ��\r\n");
	xcall _delay_100us
	.dbline 95
;   printf("��ͨ�����ڵ������ַ����ַ�\r\n");
	xcall _delay_100us
	.dbline 96
;   a=getchar();
	xcall _delay_100us
	.dbline 97
;   printf("���յ����ַ��ǣ�%c\r\n",a);
	xcall _delay_100us
	.dbline 98
;  }
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
; 
;  
; 
; 
; 
; 
; 
; 
; 
; 
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; 
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
; 
; 
; 
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; 
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
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
	.dbfunc e putchar _putchar fI
;              c -> R20
	.even
_putchar::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 38
	.dbline 39
	lds R2,__textmode
	lds R3,__textmode+1
	tst R2
	brne X1
	tst R3
	breq L23
X1:
	cpi R20,10
	brne L23
	.dbline 40
	ldi R16,13
	xcall _putchar
L22:
	.dbline 42
L23:
	.dbline 41
	lds R2,155
	sbrs R2,5
	rjmp L22
	.dbline 43
	sts 156,R20
	.dbline 44
	mov R16,R20
	clr R17
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r c 20 c
	.dbend
	.dbfunc e getchar _getchar fI
	.even
_getchar::
	.dbline -1
	.dbline 51
L26:
	.dbline 53
L27:
	.dbline 52
	lds R2,155
	sbrs R2,7
	rjmp L26
	.dbline 54
	lds R16,156
	clr R17
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e UART_Init _UART_Init fV
	.even
_UART_Init::
	.dbline -1
	.dbline 61
	.dbline 63
	ldi R24,24
	sts 154,R24
	.dbline 64
	clr R2
	sts 152,R2
	.dbline 65
	ldi R24,47
	sts 153,R24
	.dbline -2
L29:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LED_Off _LED_Off fV
	.even
_LED_Off::
	.dbline -1
	.dbline 73
	.dbline 74
	ldi R24,255
	out 0x12,R24
	.dbline 75
	out 0x11,R24
	.dbline 76
	sbi 0x12,4
	.dbline 77
	sbi 0x12,5
	.dbline 78
	out 0x1b,R24
	.dbline 79
	cbi 0x12,5
	.dbline -2
L30:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              a -> R20
	.even
_main::
	.dbline -1
	.dbline 87
	.dbline 90
	xcall _UART_Init
	.dbline 91
	xcall _LED_Off
	xjmp L33
L32:
	.dbline 93
	.dbline 94
	ldi R16,<L35
	ldi R17,>L35
	xcall _printf
	.dbline 95
	ldi R16,<L36
	ldi R17,>L36
	xcall _printf
	.dbline 96
	xcall _getchar
	mov R20,R16
	.dbline 97
	mov R18,R20
	clr R19
	ldi R16,<L37
	ldi R17,>L37
	xcall _printf
	.dbline 98
L33:
	.dbline 92
	xjmp L32
X2:
	.dbline -2
L31:
	.dbline 0 ; func end
	ret
	.dbsym r a 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
L37:
	.blkb 21
	.area idata
	.byte 189,211,202,213,181,189,181,196,215,214,183,251,202,199,163,186
	.byte 37,'c,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
L36:
	.blkb 29
	.area idata
	.byte 199,235,205,168,185,253,180,174,191,218,181,247,202,212,214,250
	.byte 202,214,183,162,203,205,215,214,183,251,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
L35:
	.blkb 24
	.area idata
	.byte 'M,49,50,56,95,'Z,'Z,'X,50,180,174,191,218,205,168,208
	.byte 197,202,181,209,233,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
