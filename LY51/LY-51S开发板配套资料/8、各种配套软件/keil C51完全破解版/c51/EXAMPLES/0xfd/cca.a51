; cca.a51 generated from: ee.c
; COMPILER INVOKED BY:
;        d:\Keil\C51\BIN\C51.EXE ee.c OPTIMIZE(9,SPEED) BROWSE DEBUG OBJECTEXTEND CODE

$NOMOD51

NAME	EE

P0	DATA	080H
P1	DATA	090H
P2	DATA	0A0H
P3	DATA	0B0H
T0	BIT	0B0H.4
AC	BIT	0D0H.6
T1	BIT	0B0H.5
EA	BIT	0A8H.7
IE	DATA	0A8H
RD	BIT	0B0H.7
ES	BIT	0A8H.4
IP	DATA	0B8H
RI	BIT	098H.0
INT0	BIT	0B0H.2
CY	BIT	0D0H.7
TI	BIT	098H.1
INT1	BIT	0B0H.3
PS	BIT	0B8H.4
SP	DATA	081H
OV	BIT	0D0H.2
WR	BIT	0B0H.6
SBUF	DATA	099H
PCON	DATA	087H
SCON	DATA	098H
TMOD	DATA	089H
TCON	DATA	088H
IE0	BIT	088H.1
IE1	BIT	088H.3
B	DATA	0F0H
ACC	DATA	0E0H
ET0	BIT	0A8H.1
ET1	BIT	0A8H.3
TF0	BIT	088H.5
TF1	BIT	088H.7
RB8	BIT	098H.2
TH0	DATA	08CH
EX0	BIT	0A8H.0
IT0	BIT	088H.0
TH1	DATA	08DH
TB8	BIT	098H.3
EX1	BIT	0A8H.2
IT1	BIT	088H.2
P	BIT	0D0H.0
SM0	BIT	098H.7
TL0	DATA	08AH
SM1	BIT	098H.6
TL1	DATA	08BH
SM2	BIT	098H.5
PT0	BIT	0B8H.1
PT1	BIT	0B8H.3
RS0	BIT	0D0H.3
TR0	BIT	088H.4
RS1	BIT	0D0H.4
TR1	BIT	088H.6
PX0	BIT	0B8H.0
PX1	BIT	0B8H.2
DPH	DATA	083H
DPL	DATA	082H
REN	BIT	098H.4
RXD	BIT	0B0H.0
TXD	BIT	0B0H.1
F0	BIT	0D0H.5
PSW	DATA	0D0H
?PR?main?EE          SEGMENT CODE 
?DT?main?EE          SEGMENT DATA OVERLAYABLE 
?C_INITSEG           SEGMENT CODE 
?DT?EE               SEGMENT DATA 
	EXTRN	CODE (_strlen)
	EXTRN	CODE (?C_STARTUP)
	PUBLIC	cc
	PUBLIC	main

	RSEG  ?DT?main?EE
?main?BYTE:
         b1?042:   DS   2

	RSEG  ?DT?EE
             cc:   DS   79

	RSEG  ?C_INITSEG
	DB	020H
	DB	04FH
	DB	cc
	DB  0B1H,0FDH,0B2H,0FDH,0B3H,0FDH,0B4H,0FDH,0B5H,0FDH
	DB  0B6H,0FDH,0B7H,0FDH,0B8H,0FDH,0B9H,0FDH,0BAH,0FDH
	DB  0BBH,0FDH,0BCH,0FDH,0BDH,0FDH,0BEH,0FDH,0BFH,0FDH
	DB  0C0H,0FDH,0C1H,0FDH,0C2H,0FDH,0C3H,0FDH,0C4H,0FDH
	DB  0C5H,0FDH,0C6H,0FDH,0C7H,0FDH,0C8H,0FDH,0C9H,0FDH
	DB  0CAH,0FDH,0CBH,0FDH,0CCH,0FDH,0CDH,0FDH,0CEH,0FDH
	DB  0CFH,0FDH,0D0H,0FDH,0D1H,0FDH,0D2H,0FDH,0D3H,0FDH
	DB  0D4H,0FDH,0D5H,0FDH,0D6H,0FDH,0D8H,0FDH,000H


; #pragma src(cca.a51)
; #include <reg51.h>
; #include <string.h>
; char cc[]="����������������������������������������������\
; ��������������������������������";
; void main(void) {

	RSEG  ?PR?main?EE
main:
	USING	0
			; SOURCE LINE # 6
; unsigned char c1,i;
; unsigned int b1;
; 	c1=strlen(cc);
			; SOURCE LINE # 9
	MOV  	R3,#00H
	MOV  	R2,#HIGH (cc)
	MOV  	R1,#LOW (cc)
	LCALL	_strlen
;---- Variable 'c1?040' assigned to Register 'R7' ----
; 	for(i=0;i<c1;i++){
			; SOURCE LINE # 10
;---- Variable 'i?041' assigned to Register 'R6' ----
	CLR  	A
	MOV  	R6,A
?C0001:
	MOV  	A,R6
	CLR  	C
	SUBB 	A,R7
	JNC  	?C0004
; 		b1+=cc[i];
			; SOURCE LINE # 11
	MOV  	A,#LOW (cc)
	ADD  	A,R6
	MOV  	R0,A
	MOV  	A,@R0
	MOV  	R5,A
	RLC  	A
	SUBB 	A,ACC
	MOV  	R4,A
	MOV  	A,R5
	ADD  	A,b1?042+01H
	MOV  	b1?042+01H,A
	MOV  	A,R4
	ADDC 	A,b1?042
	MOV  	b1?042,A
; 	}
			; SOURCE LINE # 12
	INC  	R6
	SJMP 	?C0001
?C0004:
; 	while(1);
			; SOURCE LINE # 13
	SJMP 	?C0004
; END OF main

	END
