	.module _2KEY.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128��2λ�������̿��Ƴ�����ʾ��ֵ1��2
; //���뻷�� ICCAVR 
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ������
; //���ߣ����˵���Ԫ����
; //���ڣ�2010.05.24
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define key_io          PORTC               //����������PC4��PC5����
; #define key_ior         PINC                //��ȡIO��ֵΪPINC��ֵ
; #define Data_IO	        PORTA                //���ݿ�
; #define Data_DDR        DDRA                 //���ݿڷ���Ĵ���
; #define D_LE0	        PORTD &= ~(1 << PD4) //����ܶο���λΪ0
	.dbline 21
; #define D_LE1           PORTD |= (1 << PD4)  //����ܶο���λΪ1
	nop
	.dbline 22
; #define W_LE0	        PORTD &= ~(1 << PD5) //�����λ����λΪ0
	nop
	.dbline 23
; #define W_LE1           PORTD |= (1 << PD5)  //�����λ����λΪ1
	nop
	.dbline 24
; 
	nop
	.dbline 25
; 
	nop
	.dbline 26
; //***********************************************************************
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
; //			�����������ʾ�Ķ����
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
	.dbline 32
; 	  		   0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar key;
	nop
	.dbline 33
; 
	nop
	.dbline 34
; //***********************************************************************
	nop
	.dbline 35
; //			IO�˿ڳ�ʼ��
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; 
	nop
	.dbline 38
; void System_Init()
	nop
	.dbline 39
; {
	nop
	.dbline 40
;     Data_IO=0xFF;             //���ݿ�Ϊ���
	nop
	.dbline 41
;     Data_DDR=0xFF;
	nop
	.dbline 42
; 
	nop
	.dbline 43
;     PORTD=0xFF;               //74HC573�Ŀ��ƿڣ�����Ϊ���
	nop
	.dbline 44
;     DDRD=0xFF;
	nop
	.dbline 45
; 	
	nop
	.dbline 46
; 	PORTB=0xFF;
	nop
	.dbline 47
; 	DDRB=0xFF; 				  //�رշ��������
	nop
	.dbline 48
; }
	nop
	.dbline 49
; 
	nop
	.dbline 50
; //*************************************************************************
	nop
	.dbline 51
; //			74HC573��������ܶ�̬ɨ����ʾ����
	nop
	.dbline 52
; //*************************************************************************
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
; 
; void Display_Key(uchar num)
; {
;  uchar i,j;
	.dbline 57
;  System_Init();
	xcall _delay_3us
	.dbline 58
;  j=0x01;                    //��������������λѡ
	xcall _delay_3us
	.dbline 59
;   for(i=0;i<8;i++)
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
;   {
;     D_LE1;                    //��������ܶ����ݵ�74HC573��LE�ܽ��ø�
;     W_LE1;                    //���������λ��74HC573��LE�ܽ��ø�
;     Data_IO=0x00;               //����Ҫ��ʾ��λ��Ҳ������һ����������������ǰ˸�һ����ʾ
	.dbline 64
;     W_LE0;                    //����λ���ݣ��������϶������Ժ󣬾���ʾ������
	xcall _delay_10us
	.dbline 65
; 	j=(j<<1);
	xcall _delay_10us
	.dbline 66
;     Data_IO=table[num];         //��Ҫ��ʾ�����ݣ����Ƕ����ݣ�����ʾ0�͵���0x3f
	xcall _delay_10us
	.dbline 67
;     D_LE0;                    //��������ݣ��������һ��ʱ��Ƭ��
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
;     delay_nms(1);              //��ʾһ��ʱ��Ƭ�̣���Ӱ�����Ⱥ���˸��
; 
;   }
	.dbline 71
; 
	xcall _delay_50us
	.dbline 72
; }
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
; 
; //**********************************************************************
; //	����ɨ���ӳ��򣬲������ɨ��ķ�ʽ
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; //**********************************************************************
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
; 
; uchar KeyboardScan() 
; {
;   uchar statevalue,key_checkin,key_check;
;   key_io=0xf0;                    //��IO���������ʽ��Ϊ���뷽ʽʱҪ�ӳ�һ������
;   key_io=0xf0;                    //��ȡд���εķ�����ʱ
;   key_checkin=key_ior;            //��ȡIO��״̬���ж��Ƿ��м�����
;   if(key_checkin!=0xf0)           //IO��ֵ�����仯���ʾ�м�����
;   {
;     delay_nms(20);                 //������������ʱ20MS
;     key_checkin=key_ior;
;     if(key_checkin!=0xf0)
;     {
	.dbline 90
;      
	xcall _delay_100us
	.dbline 91
;      key_check=key_ior;
	xcall _delay_100us
	.dbline 92
;      switch (key_check)
	xcall _delay_100us
	.dbline 93
;      {
	xcall _delay_100us
	.dbline 94
;      case 0xd0:key=2;break;
	xcall _delay_100us
	.dbline 95
;      case 0xe0:key=1;break;
	xcall _delay_100us
	.dbline 96
;      }
	xcall _delay_100us
	.dbline 97
;           
	xcall _delay_100us
	.dbline 98
;     }
	xcall _delay_100us
	.dbline 99
;   }
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
;   else
;   {
;   statevalue=0xff;                      //�ް���ʱ����ֵ
;   key=statevalue;
;   return(key);
;   }
; }
; 
; //*************************************************************************
; //			������
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; //*************************************************************************
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
; void main()
; 
; {         
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
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
_table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\4.��λ��������ʵ��\2KEY����\2KEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\4.��λ��������ʵ��\2KEY����\2KEY.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 39
	.dbline 40
	ldi R24,255
	out 0x1b,R24
	.dbline 41
	out 0x1a,R24
	.dbline 43
	out 0x12,R24
	.dbline 44
	out 0x11,R24
	.dbline 46
	out 0x18,R24
	.dbline 47
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_Key _Display_Key fV
;              j -> R20
;              i -> R22
;            num -> R10
	.even
_Display_Key::
	xcall push_gset3
	mov R10,R16
	.dbline -1
	.dbline 55
	.dbline 57
	xcall _System_Init
	.dbline 58
	ldi R20,1
	.dbline 59
	clr R22
	xjmp L24
L21:
	.dbline 60
	.dbline 61
	sbi 0x12,4
	.dbline 62
	sbi 0x12,5
	.dbline 63
	clr R2
	out 0x1b,R2
	.dbline 64
	cbi 0x12,5
	.dbline 65
	lsl R20
	.dbline 66
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 67
	cbi 0x12,4
	.dbline 68
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 70
L22:
	.dbline 59
	inc R22
L24:
	.dbline 59
	cpi R22,8
	brlo L21
	.dbline -2
L20:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r j 20 c
	.dbsym r i 22 c
	.dbsym r num 10 c
	.dbend
	.dbfunc e KeyboardScan _KeyboardScan fc
;      key_check -> R20
;     statevalue -> R20
;    key_checkin -> R20
	.even
_KeyboardScan::
	xcall push_gset1
	.dbline -1
	.dbline 79
	.dbline 81
	ldi R24,240
	out 0x15,R24
	.dbline 82
	out 0x15,R24
	.dbline 83
	in R20,0x13
	.dbline 84
	cpi R20,240
	breq L26
	.dbline 85
	.dbline 86
	ldi R16,20
	ldi R17,0
	xcall _delay_nms
	.dbline 87
	in R20,0x13
	.dbline 88
	cpi R20,240
	breq L27
	.dbline 89
	.dbline 91
	in R20,0x13
	.dbline 92
	clr R21
	cpi R20,208
	ldi R30,0
	cpc R21,R30
	breq L33
	cpi R20,208
	ldi R30,0
	cpc R21,R30
	brlt L27
L35:
	cpi R20,224
	ldi R30,0
	cpc R21,R30
	breq L34
	xjmp L27
X1:
	.dbline 93
L33:
	.dbline 94
	ldi R24,2
	sts _key,R24
	.dbline 94
	xjmp L27
L34:
	.dbline 95
	ldi R24,1
	sts _key,R24
	.dbline 95
	.dbline 98
	.dbline 99
	xjmp L27
L26:
	.dbline 101
	.dbline 102
	ldi R20,255
	.dbline 103
	sts _key,R20
	.dbline 104
	mov R16,R20
L27:
	.dbline -2
L25:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r key_check 20 c
	.dbsym r statevalue 20 c
	.dbsym r key_checkin 20 c
	.dbend
	.dbfunc e main _main fV
;      key_store -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 114
	.dbline 117
; 	  uint key_store;
; 	  DDRC=0x0f;                        //PC����������ʹ��
	ldi R24,15
	out 0x14,R24
	.dbline 118
;       PORTC=0xf0;                       //PC����λ�������λ���
	ldi R24,240
	out 0x15,R24
	.dbline 119
;       key_store=0;
	clr R20
	clr R21
	xjmp L38
L37:
	.dbline 122
; 
; while(1)
;   {
	.dbline 124
; 
;  KeyboardScan();                         //����ɨ�裬���Ƿ��а�������
	xcall _KeyboardScan
	.dbline 125
;     if(key!=0xff)                        //����а������£�����ʾ�ð�����ֵ0~15
	lds R24,_key
	cpi R24,255
	breq L40
	.dbline 126
;       {
	.dbline 127
; 	      { switch(key)
	.dbline 127
	mov R22,R24
	clr R23
	cpi R22,1
	ldi R30,0
	cpc R23,R30
	breq L45
	cpi R22,2
	ldi R30,0
	cpc R23,R30
	breq L46
	xjmp L41
X2:
	.dbline 128
L45:
	.dbline 128
; 		   { case 1: Display_Key(0x01);key_store=0x01;break;   //����ͬ�ļ�����ֵ
	ldi R16,1
	xcall _Display_Key
	.dbline 128
	ldi R20,1
	ldi R21,0
	.dbline 128
	xjmp L41
L46:
	.dbline 129
; 		     case 2: Display_Key(0x02);key_store=0x02;break;
	ldi R16,2
	xcall _Display_Key
	.dbline 129
	ldi R20,2
	ldi R21,0
	.dbline 129
	.dbline 132
;            }
; 
;           }
	.dbline 134
; 	
;        }
	xjmp L41
L40:
	.dbline 136
;      else
; 	 {
	.dbline 137
; 	 Display_Key(key_store);              //û�а�����ʱ����ʾ�ϴεļ�ֵ
	mov R16,R20
	xcall _Display_Key
	.dbline 138
; 	 }
L41:
	.dbline 140
L38:
	.dbline 121
	xjmp L37
X3:
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbsym r key_store 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\4.��λ��������ʵ��\2KEY����\2KEY.C
_key::
	.blkb 1
	.dbsym e key _key c
