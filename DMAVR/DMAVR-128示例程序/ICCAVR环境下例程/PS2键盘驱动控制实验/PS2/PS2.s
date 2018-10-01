	.module PS2.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
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
_unshifted::
	.blkb 2
	.area idata
	.byte 14,96
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 21,'q
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 22,49
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 26,'z
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 27,'s
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 28,'a
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 29,'w
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 30,50
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 33,'c
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 34,'x
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 35,'d
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 36,'e
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 37,52
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 38,51
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 41,32
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 42,'v
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 43,'f
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 44,'t
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 45,'r
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 46,53
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 49,'n
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 50,'b
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 51,'h
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 52,'g
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 53,'y
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 54,54
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 57,44
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 58,'m
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 59,'j
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 60,'u
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 61,55
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 62,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'A,44
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'B,'k
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'C,'i
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'D,'o
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'E,48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'F,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'I,46
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'J,47
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'K,'l
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'L,59
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'M,'p
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'N,45
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'R,39
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'T,91
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'U,61
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 91,93
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 93,92
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'a,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'i,49
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'k,52
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'l,55
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'p,48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'q,46
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'r,50
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 's,53
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 't,54
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'u,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'y,43
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 'z,51
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 123,45
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 124,42
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 125,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.dbsym e unshifted _unshifted A[130:65:2]c
_shifted::
	.blkb 2
	.area idata
	.byte 14,126
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 21,'Q
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 22,33
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 26,'Z
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 27,'S
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 28,'A
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 29,'W
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 30,64
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 33,'C
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 34,'X
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 35,'D
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 36,'E
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 37,36
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 38,35
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 41,32
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 42,'V
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 43,'F
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 44,'T
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 45,'R
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 46,62
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 49,'N
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 50,'B
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 51,'H
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 52,'G
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 53,'Y
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 54,94
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 57,'L
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 58,'M
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 59,'J
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 60,'U
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 61,38
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 62,42
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'A,60
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'B,'K
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'C,'I
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'D,'O
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'E,41
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'F,40
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'I,62
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'J,63
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'K,'L
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'L,58
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'M,'P
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'N,95
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'R,34
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'T,123
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'U,43
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 91,125
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 93,124
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'a,62
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'i,49
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'k,52
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'l,55
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'p,48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'q,46
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'r,50
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 's,53
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 't,54
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'u,56
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'y,43
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 'z,51
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 123,45
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 124,42
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 125,57
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.dbsym e shifted _shifted A[130:65:2]c
_key_value::
	.blkb 1
	.area idata
	.byte 48
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\PS2.h
	.dbfile E:\DMAVR-~3\PS2\PS2.C
	.dbsym e key_value _key_value c
_up::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
	.dbsym e up _up c
_shift::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
	.dbsym e shift _shift c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 64
; //DMAVR-128��PS2�����������򣬲���1602Һ������ʾ��ֵ
; //PS2���̰���1�����33��ʱ�����壬��˲����жϵķ�ʽ��ȡ33�Σ�ֻ��ȡ���һ���ֽ��е�����λ������
; //����1�Σ�ʵ�����3���ֽ����ݣ�ÿ���ֽ�Ϊ11λ��һ����ʼλ(0)��8������λ��һ����żУ��λ��һ��ֹͣλ(1)
; //���ҵ�1���ֽ����3���ֽ�������ͬ���˳�����ȡ��3���ֽڵ�����λ��ֵ����
; //�еļ����ڵ�һ�ΰ����ᴥ��34���жϣ�������жϷ�������ж�һ���жϳ���Ĭ��ʹ��33���ж�
; //ѧϰǰ���Ķ�PS2���̵�������ϣ��Գ�ֵ�������������������ͷ�ļ�����ʽ��Ϊ��ֱ�ۣ������ȫ������һ��
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
; #define  F_CPU	7372800		               //��Ƭ����ƵΪ7.3728MHz
; #include <delay.h>
; #include <iom128v.h>
; #include <PS2.h>
; 
; 
; 
; //***********************************************************************
; //			���������
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; #define ulong           unsigned long
; 
; extern  uchar unshifted[][2];
; extern  uchar shifted[][2];
; 
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS�õ�
; #define RS_SET	PORTF |= (1 << PF1)                  //RS�ø�
; 
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW�õ�
; #define RW_SET	PORTF |= (1 << PF2)                  //RW�ø�
; 
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E�õ�
; #define EN_SET	PORTF |= (1 << PF3)                  //E�ø�
; 
; #define Data_IO	        PORTA                //Һ�����ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0������˿�����
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1�������������˿�һ��
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; 
; uchar bitcount;
; uchar data2,key_value=0x30;
; ulong data;
; uchar finish;
; uchar up=0,shift=0;	//upΪͨ�������־��shiftΪshift�����±�־ 
; 
; 
; //*************************************************************************
; //			��ʼ���ӳ���
; //*************************************************************************
; void system_init()
; {
	.dbline 66
; 
; 	Data_IO = 0xFF;				        //��ƽ����
	ldi R24,255
	out 0x1b,R24
	.dbline 67
; 	Data_DDR = 0xFF;				        //�������
	out 0x1a,R24
	.dbline 68
; 	PORTF = 0xFF;                       //��ƽ����
	sts 98,R24
	.dbline 69
; 	DDRF = 0xFF;                        //�������
	sts 97,R24
	.dbline 70
;     PORTD=0xFF;
	out 0x12,R24
	.dbline 71
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 72
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	sbi 0x12,4
	.dbline 73
;     W_LE1;                     
	sbi 0x12,5
	.dbline 74
;     Data_IO=0xFF;                      //�������            
	out 0x1b,R24
	.dbline 75
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R10
	.even
_LCD_write_com::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 84
; }
; 
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
	.dbline 85
; 	RS_CLR;
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 86
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 87
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 88
; 	Data_IO = com;
	out 0x1b,R10
	.dbline 89
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 90
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r com 10 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R10
	.even
_LCD_write_data::
	st -y,R10
	mov R10,R16
	.dbline -1
	.dbline 97
; }
; //***********************************************************************
; //	��ʾ������д�뺯��
; //***********************************************************************
; 
; void LCD_write_data(unsigned char data) 
; {
	.dbline 98
; 	RS_SET;
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 99
; 	RW_CLR;
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 100
; 	EN_SET;
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 101
; 	Data_IO = data;
	out 0x1b,R10
	.dbline 102
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 103
; 	EN_CLR;
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r data 10 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 110
; }
; //***********************************************************************
; //	��ʾ�������ʾ
; //***********************************************************************
; 
; void LCD_clear(void) 
; {
	.dbline 111
; 	LCD_write_com(0x01);
	ldi R16,1
	xcall _LCD_write_com
	.dbline 112
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L22:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+2
;              y -> R10
;              x -> R20
	.even
_LCD_write_char::
	st -y,R10
	st -y,R20
	mov R10,R18
	mov R20,R16
	.dbline -1
	.dbline 119
; }
; //***********************************************************************
; //	��ʾ�����ַ�д�뺯��
; //***********************************************************************
; 
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
; {
	.dbline 121
; 	
;     if (y == 0) 
	tst R10
	brne L24
X3:
	.dbline 122
;     {
	.dbline 123
;     	LCD_write_com(0x80 + x);
	mov R16,R20
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 124
;     }
	xjmp L25
L24:
	.dbline 126
;     else 
;     {
	.dbline 127
;     	LCD_write_com(0xC0 + x);
	mov R16,R20
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 128
;     }
L25:
	.dbline 130
;     
;     LCD_write_data( data);  
	ldd R16,y+2
	xcall _LCD_write_data
	.dbline -2
L23:
	.dbline 0 ; func end
	ld R20,y+
	ld R10,y+
	ret
	.dbsym l data 2 c
	.dbsym r y 10 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_xgsetF00C
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 137
; }
; 
; //***********************************************************************
; //	��ʾ���ַ���д�뺯��
; //***********************************************************************
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
; {
	.dbline 139
; 	
;     if (y == 0) 
	tst R10
	brne L27
X4:
	.dbline 140
;     {
	.dbline 141
;     	LCD_write_com(0x80 + x);
	mov R16,R22
	subi R16,128    ; addi 128
	xcall _LCD_write_com
	.dbline 142
;     }
	xjmp L30
L27:
	.dbline 144
;     else 
;     {
	.dbline 145
;     	LCD_write_com(0xC0 + x);
	mov R16,R22
	subi R16,64    ; addi 192
	xcall _LCD_write_com
	.dbline 146
;     }
	xjmp L30
L29:
	.dbline 149
;     
;     while (*s) 
;     {
	.dbline 150
;     	LCD_write_data( *s);
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 151
;     	s ++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 152
;     }
L30:
	.dbline 148
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L29
X5:
	.dbline -2
L26:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 160
; }
; 
; //***********************************************************************
; //	��ʾ����ʼ������
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 161
; 	LCD_write_com(0x38);				//��ʾģʽ����
	ldi R16,56
	xcall _LCD_write_com
	.dbline 162
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 163
; 	LCD_write_com(0x08);				//��ʾ�ر�
	ldi R16,8
	xcall _LCD_write_com
	.dbline 164
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 165
;     LCD_write_com(0x01);				//��ʾ����
	ldi R16,1
	xcall _LCD_write_com
	.dbline 166
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 167
;     LCD_write_com(0x06);				//��ʾ����ƶ�����
	ldi R16,6
	xcall _LCD_write_com
	.dbline 168
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 169
; 	LCD_write_com(0x0C);				//��ʾ�����������
	ldi R16,12
	xcall _LCD_write_com
	.dbline 170
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	.dbline -2
L32:
	.dbline 0 ; func end
	xjmp _delay_nms
	.dbend
	.dbfunc e ps2_init _ps2_init fV
	.even
_ps2_init::
	.dbline -1
	.dbline 178
; }
; 
; 
; //************************************************************** 
; //                ��ʼ��PS2���� 
; //************************************************************** 
; void ps2_init(void) 
; { 
	.dbline 180
;      
;      EIMSK|=0x03;          //ʹ���ⲿ�ж�0
	in R24,0x39
	ori R24,3
	out 0x39,R24
	.dbline 181
;      EICRA=0x0A;          //�½��ش�����ʽ
	ldi R24,10
	sts 106,R24
	.dbline 182
;      MCUCSR=0x00;         //���ƺ�״̬�Ĵ�����ʼ��
	clr R2
	out 0x34,R2
	.dbline 183
;      bitcount = 0;	     //ÿ��11λ���ݣ�һ����ʼλ(0)��8������λ��һ����żУ��λ��һ��ֹͣλ(1)  
	sts _bitcount,R2
	.dbline 184
;      PORTD|=(1<<PD0);    //ʹ���жϹܽŵ�����
	sbi 0x12,0
	.dbline 185
;      DDRD&=~(1<<PD0);    //�����жϹܽ�Ϊ���� 
	cbi 0x11,0
	.dbline 186
;      PORTC|=(1<<PC7);    //ʹ�����ݹܽŵ����� 
	sbi 0x15,7
	.dbline 187
;      DDRC&=~(1<<PC7);    //�������ݹܽ�Ϊ����
	cbi 0x14,7
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Decode _Decode fV
;              i -> R10
;       scancode -> R16
	.even
_Decode::
	xcall push_xgset300C
	.dbline -1
	.dbline 196
; 
; } 
; 
; //************************************************************** 
; //              ���뺯����scancode--��Ҫ�����ɨ����  
; //************************************************************** 
; 
; void Decode(uchar scancode) 
; { 
	.dbline 199
; 
; uchar i; 
; if (!up)	 //�ѽ��յ�11λ������ͨ�루upΪ0�� 
	lds R2,_up
	tst R2
	breq X19
	xjmp L35
X19:
X6:
	.dbline 200
; { 
	.dbline 201
; 	switch (scancode)//��ʼ����ɨ���� 
	mov R20,R16
	clr R21
	cpi R20,89
	ldi R30,0
	cpc R21,R30
	breq L42
X7:
	ldi R24,89
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L60
X8:
L59:
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	breq L41
X9:
	xjmp L37
L60:
	cpi R20,240
	ldi R30,0
	cpc R21,R30
	breq L40
X10:
	xjmp L37
L40:
	.dbline 204
; 		{ 
; 			case 0xF0:	 //�����ͷű�־������һ���ֽ��Ƕ��룩 
; 						up=1;	        //����upΪ�����־ 
	ldi R24,1
	sts _up,R24
	.dbline 205
; 						break; 
	xjmp L36
L41:
	.dbline 207
; 			case 0x12:	 //��shift������ 
; 						shift=1;         //����shiftΪ���±�־ 
	ldi R24,1
	sts _shift,R24
	.dbline 208
; 						break; 
	xjmp L36
L42:
	.dbline 210
; 			case 0x59:	 //��shift������ 
; 						shift=1;         //����shiftΪ���±�־ 
	ldi R24,1
	sts _shift,R24
	.dbline 211
; 						break; 
	xjmp L36
L37:
	.dbline 213
; 			default: 
; if(!shift)	 //���shift��û�а��� 
	lds R2,_shift
	tst R2
	brne L43
X11:
	.dbline 214
; 	{ //����unshifted������������ɨ���룬�����Ƕ�Ӧ��ASCII�� 
	.dbline 215
; 		for(i=0;unshifted[i][0]!=scancode;i++); 
	clr R10
	xjmp L48
L45:
	.dbline 215
L46:
	.dbline 215
	inc R10
L48:
	.dbline 215
	ldi R24,<_unshifted
	ldi R25,>_unshifted
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L45
X12:
	.dbline 216
; 			if(unshifted[i][0]==scancode) 
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	breq X20
	xjmp L36
X20:
X13:
	.dbline 217
; 				{ 
	.dbline 218
; 					key_value=unshifted[i][1]; 
	ldi R24,<_unshifted+1
	ldi R25,>_unshifted+1
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	sts _key_value,R2
	.dbline 219
; 				} 
	.dbline 220
; 	} 
	xjmp L36
L43:
	.dbline 222
; else //���shift������ 
; 	{	 //����shifted�� 
	.dbline 223
; 		for(i=0;shifted[i][0]!=scancode;i++); 
	clr R10
	xjmp L55
L52:
	.dbline 223
L53:
	.dbline 223
	inc R10
L55:
	.dbline 223
	ldi R24,<_shifted
	ldi R25,>_shifted
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L52
X14:
	.dbline 224
; 			if(shifted[i][0]==scancode) 
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L36
X15:
	.dbline 225
; 				{ 
	.dbline 226
; 					key_value=shifted[i][1];
	ldi R24,<_shifted+1
	ldi R25,>_shifted+1
	mov R30,R10
	clr R31
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	sts _key_value,R2
	.dbline 227
; 					shift=0;
	clr R2
	sts _shift,R2
	.dbline 228
; 				} 
	.dbline 229
; 	} 
	.dbline 230
; 			break; 
	.dbline 232
; 		} 
; } 
	xjmp L36
L35:
	.dbline 234
; else                      //�ѽ��յ�11λ�����Ƕ��루upΪ1�� 
; 	{ 
	.dbline 235
; 		up = 0;                   //�������־��λ 
	clr R2
	sts _up,R2
	.dbline 236
; 		switch (scancode)	 //���shift���ͷ� 
	mov R20,R16
	clr R21
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	breq L64
X16:
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	brlt L62
X17:
L66:
	cpi R20,89
	ldi R30,0
	cpc R21,R30
	breq L65
X18:
	xjmp L62
L64:
	.dbline 239
; 			{ 
; 				case 0x12 :	         //��shift�� 
; 							shift = 0; 
	clr R2
	sts _shift,R2
	.dbline 240
; 							break; 
	xjmp L62
L65:
	.dbline 242
; 				case 0x59 :	         //��shift�� 
; 							shift = 0; 
	clr R2
	sts _shift,R2
	.dbline 243
; 							break; 
	.dbline 245
; 				default: 
; 							break; 
L62:
	.dbline 247
; 			} 
; 	} 
L36:
	.dbline -2
L34:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r i 10 c
	.dbsym r scancode 16 c
	.dbend
	.dbfunc e get_code _get_code fV
;              i -> R20,R21
;          cdata -> R16
	.even
_get_code::
	st -y,R20
	st -y,R21
	.dbline -1
	.dbline 253
; } 
; //************************************************************************
; //          �ж϶�����������ȵ�λ���λ���ú���������λ��������
; //************************************************************************
; void get_code(uchar cdata)
; {
	.dbline 255
;   int i;
;   for(i=0;i<8;i++)
	clr R20
	clr R21
L68:
	.dbline 256
;   { data2<<=1 ;
	.dbline 256
	lds R2,_data2
	lsl R2
	sts _data2,R2
	.dbline 257
;     data2|=cdata&0x01;
	mov R24,R16
	andi R24,1
	or R2,R24
	sts _data2,R2
	.dbline 258
;     cdata>>=1;
	lsr R16
	.dbline 260
;   
;   }
L69:
	.dbline 255
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 255
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	brlt L68
X21:
	.dbline -2
L67:
	.dbline 0 ; func end
	ld R21,y+
	ld R20,y+
	ret
	.dbsym r i 20 I
	.dbsym r cdata 16 c
	.dbend
	.area vector(rom, abs)
	.org 4
	jmp _INT0_ISR
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
	.dbfunc e INT0_ISR _INT0_ISR fV
	.even
_INT0_ISR::
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
	xcall push_xgsetF00C
	.dbline -1
	.dbline 268
; }
; //*************************************************************************
; //	        �ⲿ�ж�0�����ӳ���
; //�� ��: �ⲿ�ж�0���жϷ��������½��ض�ȡ���ݣ�����λULONG�ͣ�ȫ����ȡ 
; //*************************************************************************
; #pragma interrupt_handler  INT0_ISR:iv_INT0 //int0_ISR���жϺ��������������ж�������
; void INT0_ISR() 	 				  		//�ж�0�������
;    {
	.dbline 269
;     bitcount++;                               //�жϴ�������ֵ����һ�μ����ж�33��
	lds R24,_bitcount
	subi R24,255    ; addi 1
	sts _bitcount,R24
	.dbline 270
;     data<<=1;                                 //���Ǽ��̳�ʼ���������һ���жϣ����Ե�һ�����ж�34��
	lds R4,_data+2
	lds R5,_data+2+1
	lds R2,_data
	lds R3,_data+1
	lsl R2
	rol R3
	rol R4
	rol R5
	sts _data+1,R3
	sts _data,R2
	sts _data+2+1,R5
	sts _data+2,R4
	.dbline 271
;     data|=((PINC&0x80)>>7);                   //��ȡÿһ���ж�ʱ������λ
	ldi R18,7
	ldi R19,0
	in R16,0x13
	clr R17
	andi R16,128
	andi R17,0
	xcall asr16
	movw R2,R16
	clr R4
	sbrc R3,7
	com R4
	clr R5
	sbrc R4,7
	com R5
	lds R8,_data+2
	lds R9,_data+2+1
	lds R6,_data
	lds R7,_data+1
	or R6,R2
	or R7,R3
	or R8,R4
	or R9,R5
	sts _data+1,R7
	sts _data,R6
	sts _data+2+1,R9
	sts _data+2,R8
	.dbline 281
;     //if((bitcount==0x22)&&(finish==0))        //�еļ����ڳ�ʼ�������һ���½����ж�
;     //{
;      // bitcount=0;
;     //  finish=1;                              //ֻ���ڵ�һ����ʱ���ô��жϣ���һ���ж�
;      // data=data&0x03fc;
;    //   data>>=2;
;     //  get_code(data);                        //�õ�8λ����
;     //   Decode(data2);	                     //��ɨ���뷭���ASCII��
;   //  }
;     if(bitcount==0x21)//&&(finish==1))    //������˵������33���ж�
	lds R24,_bitcount
	cpi R24,33
	brne L73
X22:
	.dbline 282
;         {
	.dbline 283
;       bitcount=0;
	clr R2
	sts _bitcount,R2
	.dbline 284
;       finish=1;
	ldi R24,1
	sts _finish,R24
	.dbline 285
;       data=data&0x03fc;      //��ȡ���һ���ֽ��е�8λ����λ��ÿ�ΰ��������ֽ����ݣ���һ���͵������ֽ�������ͬ
	ldi R20,252
	ldi R21,3
	ldi R22,0
	ldi R23,0
	movw R2,R6
	movw R4,R8
	and R2,R20
	and R3,R21
	and R4,R22
	and R5,R23
	sts _data+1,R3
	sts _data,R2
	sts _data+2+1,R5
	sts _data+2,R4
	.dbline 286
;       data>>=2;               //��λ����
	ldi R24,2
	ldi R25,0
	movw R16,R2
	movw R18,R4
	st -y,R24
	xcall lsr32
	sts _data+1,R17
	sts _data,R16
	sts _data+2+1,R19
	sts _data+2,R18
	.dbline 287
;       get_code(data);        //�õ�8λ�������������λ
	xcall _get_code
	.dbline 288
;        Decode(data2);	     //��ɨ���뷭���ASCII��
	lds R16,_data2
	xcall _Decode
	.dbline 289
;     }
L73:
	.dbline -2
L72:
	.dbline 0 ; func end
	xcall pop_xgsetF00C
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
	sbiw R28,2
	.dbline -1
	.dbline 297
;    
;   }
; 
; //*************************************************************************
; //                 ������ 
; //*************************************************************************
; void main(void) 
; { 
	.dbline 298
;         system_init();                                //ϵͳ��ʼ��������IO������
	xcall _system_init
	.dbline 299
; 	    delay_nms(100);                                //��ʱ100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 300
;   	    LCD_init();                                   //Һ��������ʼ������
	xcall _LCD_init
	.dbline 301
;         ps2_init();	                             //��ʼ��PS2���̽ӿ� 
	xcall _ps2_init
	.dbline 302
;         LCD_write_str(0,0,"The Keyvalue:");          //Һ����ʼ����
	ldi R24,<L76
	ldi R25,>L76
	std y+1,R25
	std y+0,R24
	clr R18
	clr R16
	xcall _LCD_write_str
	.dbline 303
;         delay_nms(2);
	ldi R16,2
	ldi R17,0
	xcall _delay_nms
	.dbline 304
;         SREG|=0x80;                                  //��ȫ���ж�
	bset 7
	xjmp L78
L77:
	.dbline 306
;        while(1) 
;    		{       
	.dbline 307
;          LCD_write_char(4,1,key_value);             //�����ַ������ʾ����ʾ��ֵ
	lds R2,_key_value
	std y+0,R2
	ldi R18,1
	ldi R16,4
	xcall _LCD_write_char
	.dbline 308
;   		} 
L78:
	.dbline 305
	xjmp L77
X23:
	.dbline -2
L75:
	.dbline 0 ; func end
	adiw R28,2
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
_finish::
	.blkb 1
	.dbsym e finish _finish c
_data::
	.blkb 4
	.dbsym e data _data l
_data2::
	.blkb 1
	.dbsym e data2 _data2 c
_bitcount::
	.blkb 1
	.dbsym e bitcount _bitcount c
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
L76:
	.blkb 14
	.area idata
	.byte 'T,'h,'e,32,'K,'e,'y,'v,'a,'l,'u,'e,58,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\PS2\PS2.C
;  
; } 
