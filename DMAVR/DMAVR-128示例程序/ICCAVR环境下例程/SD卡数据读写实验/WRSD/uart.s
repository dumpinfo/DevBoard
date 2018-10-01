	.module uart.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\uart.c
	.dbfunc e putchar _putchar$device_specific$ fI
;              c -> R20
	.even
_putchar$device_specific$::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 31
; //���ڷ��ͽ�����������
; //���ñ�׼���������ʽ���д�ӡ���뵥�����ͽ����ַ���ͬ
; //���뻷�� AVR Studio 4.17/AVR GCC
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���ߣ����� www.avrgcc.com
; //���ڣ�2010.01.14
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; 
; #include <stdio.h>
; #include <string.h>
; #include <iom128v.h>
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define ulong           unsigned long
; #define	F_CPU		   7372800		 						    // ��Ƭ����ƵΪ7.3728MHz
; #define baud           9600                                     //���ò����ʵĴ�С
; #define baud_setting   (uint)((ulong)F_CPU/(16*(ulong)baud)-1)  //�����ʼ��㹫ʽ
; #define baud_h         (uchar)(baud_setting>>8)                 //��ȡ��λ
; #define baud_l         (uchar)(baud_setting)                    //��λ
; 
; //***********************************************************************
; // ��������ı�׼��ʽ��������printf�����UART1
; //***********************************************************************
; 
; extern int _textmode;
; 
; int putchar(char c)
;     {
	.dbline 32
;     if (_textmode && c == '\n')
	lds R2,__textmode
	lds R3,__textmode+1
	tst R2
	brne X0
	tst R3
	breq L5
X0:
	cpi R20,10
	brne L5
X1:
	.dbline 33
;         putchar('\r');
	ldi R16,13
	xcall _putchar$device_specific$
L4:
	.dbline 35
;     while ( !(UCSR1A & (1<<UDRE1)) )   // UDRE, data register empty
;         ;
L5:
	.dbline 34
	lds R2,155
	sbrs R2,5
	rjmp L4
X2:
	.dbline 36
;     UDR1 = c;
	sts 156,R20
	.dbline 37
;     return c;
	mov R16,R20
	clr R17
	.dbline -2
L1:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r c 20 c
	.dbend
	.dbfunc e getchar _getchar$device_specific$ fI
	.even
_getchar$device_specific$::
	.dbline -1
	.dbline 44
;     }
; //***********************************************************************
; // ��������ı�׼��ʽ��������getcharͨ��UART1���뵽��Ƭ��������C�е�scanf
; //***********************************************************************
; 
; int getchar(void)
;     {
L8:
	.dbline 46
;     while ((UCSR1A & 0x80) == 0)
;         ;
L9:
	.dbline 45
	lds R2,155
	sbrs R2,7
	rjmp L8
X3:
	.dbline 47
;     return UDR1;
	lds R16,156
	clr R17
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e UART_Init _UART_Init fV
	.even
_UART_Init::
	.dbline -1
	.dbline 54
;     } 
; //***********************************************************************
; // ����1��ʼ���ӿں���
; // ��ʼ��uart,��ѯ��ʽ��д
; //***********************************************************************
; void UART_Init(void)
; {
	.dbline 56
;  
;   UCSR1B =(1<<RXEN1)|(1<<TXEN1);             		//���ͽ���ʹ��
	ldi R24,24
	sts 154,R24
	.dbline 57
;   UBRR1H=baud_h;                                	//д�����ʵ�ֵ
	clr R2
	sts 152,R2
	.dbline 58
;   UBRR1L=baud_l; 
	ldi R24,47
	sts 153,R24
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
; }
