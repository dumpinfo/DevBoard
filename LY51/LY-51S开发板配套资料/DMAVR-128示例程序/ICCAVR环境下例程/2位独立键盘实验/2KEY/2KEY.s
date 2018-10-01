	.module _2KEY.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\2KEY\2KEY.C
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
	.dbfile E:\DMAVR-~3\2KEY\2KEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\2KEY\2KEY.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 41
; //DMAVR-128��2λ�������̿��Ƴ�����ʾ��ֵ1��2
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
; #include <delay.h>
; #include <iom128v.h>
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define key_io          PORTC               //����������PC4��PC5����
; #define key_ior         PINC                //��ȡIO��ֵΪPINC��ֵ
; #define Data_IO	        PORTA                //���ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
; 
; 
; //***********************************************************************
; //			�����������ʾ�Ķ����
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
; 	  		   0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar key;
; 
; //***********************************************************************
; //			IO�˿ڳ�ʼ��
; //***********************************************************************
; 
; void System_Init()
; {
	.dbline 42
;     Data_IO=0xFF;             //���ݿ�Ϊ���
	ldi R24,255
	out 0x1b,R24
	.dbline 43
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 45
; 
;     PORTD=0xFF;               //74HC573�Ŀ��ƿڣ�����Ϊ���
	out 0x12,R24
	.dbline 46
;     DDRD=0xFF;
	out 0x11,R24
	.dbline 48
; 	
; 	PORTB=0xFF;
	out 0x18,R24
	.dbline 49
; 	DDRB=0xFF; 				  //�رշ��������
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
	.dbline 57
; }
; 
; //*************************************************************************
; //			74HC573��������ܶ�̬ɨ����ʾ����
; //*************************************************************************
; 
; void Display_Key(uchar num)
; {
	.dbline 59
;  uchar i,j;
;  System_Init();
	xcall _System_Init
	.dbline 60
;  j=0x01;                    //��������������λѡ
	ldi R22,1
	.dbline 61
;   for(i=0;i<8;i++)
	clr R20
	xjmp L24
L21:
	.dbline 62
;   {
	.dbline 63
;     D_LE1;                    //��������ܶ����ݵ�74HC573��LE�ܽ��ø�
	sbi 0x12,4
	.dbline 64
;     W_LE1;                    //���������λ��74HC573��LE�ܽ��ø�
	sbi 0x12,5
	.dbline 65
;     Data_IO=0x00;               //����Ҫ��ʾ��λ��Ҳ������һ����������������ǰ˸�һ����ʾ
	clr R2
	out 0x1b,R2
	.dbline 66
;     W_LE0;                    //����λ���ݣ��������϶������Ժ󣬾���ʾ������
	cbi 0x12,5
	.dbline 67
; 	j=(j<<1);
	lsl R22
	.dbline 68
;     Data_IO=table[num];         //��Ҫ��ʾ�����ݣ����Ƕ����ݣ�����ʾ0�͵���0x3f
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 69
;     D_LE0;                    //��������ݣ��������һ��ʱ��Ƭ��
	cbi 0x12,4
	.dbline 70
;     delay_nms(1);              //��ʾһ��ʱ��Ƭ�̣���Ӱ�����Ⱥ���˸��
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 72
; 
;   }
L22:
	.dbline 61
	inc R20
L24:
	.dbline 61
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
	.dbfunc e KeyboardScan _KeyboardScan fc
;      key_check -> R10
;     statevalue -> R20
;    key_checkin -> R20
	.even
_KeyboardScan::
	xcall push_xgset300C
	.dbline -1
	.dbline 81
; 
; }
; 
; //**********************************************************************
; //	����ɨ���ӳ��򣬲������ɨ��ķ�ʽ
; //**********************************************************************
; 
; uchar KeyboardScan() 
; {
	.dbline 83
;   uchar statevalue,key_checkin,key_check;
;   key_io=0xf0;                    //��IO���������ʽ��Ϊ���뷽ʽʱҪ�ӳ�һ������
	ldi R24,240
	out 0x15,R24
	.dbline 84
;   key_io=0xf0;                    //��ȡд���εķ�����ʱ
	out 0x15,R24
	.dbline 85
;   key_checkin=key_ior;            //��ȡIO��״̬���ж��Ƿ��м�����
	in R20,0x13
	.dbline 86
;   if(key_checkin!=0xf0)           //IO��ֵ�����仯���ʾ�м�����
	cpi R20,240
	breq L26
X4:
	.dbline 87
;   {
	.dbline 88
;     delay_nms(20);                 //������������ʱ20MS
	ldi R16,20
	ldi R17,0
	xcall _delay_nms
	.dbline 89
;     key_checkin=key_ior;
	in R20,0x13
	.dbline 90
;     if(key_checkin!=0xf0)
	cpi R20,240
	breq L27
X5:
	.dbline 91
;     {
	.dbline 93
;      
;      key_check=key_ior;
	in R10,0x13
	.dbline 94
;      switch (key_check)
	mov R20,R10
	clr R21
	cpi R20,208
	ldi R30,0
	cpc R21,R30
	breq L33
X6:
	cpi R20,208
	ldi R30,0
	cpc R21,R30
	brlt L27
X7:
L35:
	cpi R20,224
	ldi R30,0
	cpc R21,R30
	breq L34
X8:
	xjmp L27
L33:
	.dbline 96
;      {
;      case 0xd0:key=2;break;
	ldi R24,2
	sts _key,R24
	.dbline 96
	xjmp L27
L34:
	.dbline 97
;      case 0xe0:key=1;break;
	ldi R24,1
	sts _key,R24
	.dbline 97
	.dbline 100
;      }
;           
;     }
	.dbline 101
;   }
	xjmp L27
L26:
	.dbline 103
;   else
;   {
	.dbline 104
;   statevalue=0xff;                      //�ް���ʱ����ֵ
	ldi R20,255
	.dbline 105
;   key=statevalue;
	sts _key,R20
	.dbline 106
;   return(key);
	mov R16,R20
L27:
	.dbline -2
L25:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r key_check 10 c
	.dbsym r statevalue 20 c
	.dbsym r key_checkin 20 c
	.dbend
	.dbfunc e main _main fV
;      key_store -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 116
;   }
; }
; 
; //*************************************************************************
; //			������
; //*************************************************************************
; 
; void main()
; 
; {         
	.dbline 119
;      
; 	  uint key_store;
; 	  DDRC=0x0f;                        //PC����������ʹ��
	ldi R24,15
	out 0x14,R24
	.dbline 120
;       PORTC=0xf0;                       //PC����λ�������λ���
	ldi R24,240
	out 0x15,R24
	xjmp L38
L37:
	.dbline 124
; 
; 
; while(1)
;   {
	.dbline 126
; 
;  KeyboardScan();                         //����ɨ�裬���Ƿ��а�������
	xcall _KeyboardScan
	.dbline 127
;     if(key!=0xff)                        //����а������£�����ʾ�ð�����ֵ0~15
	lds R24,_key
	cpi R24,255
	breq L40
X9:
	.dbline 128
;       {
	.dbline 129
; 	      { switch(key)
	.dbline 129
	mov R22,R24
	clr R23
	cpi R22,1
	ldi R30,0
	cpc R23,R30
	breq L45
X10:
	cpi R22,2
	ldi R30,0
	cpc R23,R30
	breq L46
X11:
	xjmp L41
L45:
	.dbline 130
; 		   { case 1: Display_Key(0x01);key_store=0x01;break;   //����ͬ�ļ�����ֵ
	ldi R16,1
	xcall _Display_Key
	.dbline 130
	ldi R20,1
	ldi R21,0
	.dbline 130
	xjmp L41
L46:
	.dbline 131
; 		     case 2: Display_Key(0x02);key_store=0x02;break;
	ldi R16,2
	xcall _Display_Key
	.dbline 131
	ldi R20,2
	ldi R21,0
	.dbline 131
	.dbline 134
;            }
; 
;           }
	.dbline 136
; 	
;        }
	xjmp L41
L40:
	.dbline 138
;      else
; 	 {
	.dbline 139
; 	 Display_Key(key_store);              //û�а�����ʱ����ʾ�ϴεļ�ֵ
	mov R16,R20
	xcall _Display_Key
	.dbline 140
; 	 }
L41:
	.dbline 142
; 
;   }
L38:
	.dbline 123
	xjmp L37
X12:
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbsym r key_store 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\2KEY\2KEY.C
_key::
	.blkb 1
	.dbsym e key _key c
; 
; }
; 
; 
; 
; 
