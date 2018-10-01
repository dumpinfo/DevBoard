	.module main.c
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //DMAVR-128�Ķ�дSD������ʵ�飬��ָ����ַд��ָ�����ݣ���ȡ������д��ģʽ��һ��512�ֽ�
; //Ҫд��SD��������ͨ������д�룬ʹ�ô��ڵ������֣�������9600��8λ���ݣ�1λֹͣλ����У�鷽ʽ
; //��ʼ��SD���ɹ��󣬽�����Please Input the Data Want to Write to SD�ַ�������ʱͨ�����ڵ������ַ��������ַ�����
; //����д��SD�����ֶ�������ʾ�����ڵ������֣�ͨ���Աȿ����ж�д���Ƿ�ɹ�
; //���ڴ��ڳ��������ݣ���ˣ�Ҫ�趨ICCAVR����֧��long�����ݣ�����project->options->Target��ѡ��long
; //���뻷�� ICCAVR 7.16A
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���ߣ����� www.avrgcc.com
; //���ڣ�2010.01.14
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; 
; #include <SDData_main.h>
; 
; 
; u32 sectorwr=200;	//��SD����д�����ݵĵ�ַ��Ϊ������������һ������Ϊ512�ֽڵ�SD��ʵ�ʵ�ַΪsectorwr*512�ֽ�
; u08 buffer1[1]={0x08};  //��SD����д������ݣ�����ֻ������һ���ֽڵĳ��ȣ����Զ���Ϊ512���ֽڳ���	
; u08 buffer2[512];   	//��ȡ���ݴ����
; u32 SD_Size;            //SD��������ȡ�洢����
	.dbline 21
; int i;
	nop
	.dbline 22
; //***********************************************************************
	nop
	.dbline 23
; //		�ر�����ܺ�����Ϊ������ܲ���ʾ���룬���ڳ�ʼ������
	nop
	.dbline 24
; //***********************************************************************
	nop
	.dbline 25
; 
	nop
	.dbline 26
; void LED_Off()
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
; {
;     PORTD=0xFF;
; 	DDRD=0xFF;
; 	D_LE1;                             //�ص�����ܣ�������ʾ����                   
	.dbline 32
;     W_LE1;                     
;     Data_IO=0xFF;                      //�������            
	nop
	.dbline 33
;     W_LE0; 
	nop
	.dbline 34
; }
	nop
	.dbline 35
; 
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; //			������������SD����д����
	nop
	.dbline 38
; //***********************************************************************
	nop
	.dbline 39
; 
	nop
	.dbline 40
; void main(void)
	nop
	.dbline 41
; {
	nop
	.dbline 42
; 
	nop
	.dbline 43
;  u16 i,retry;
	nop
	.dbline 44
;  u08 a;
	nop
	.dbline 45
;  McuInit();					  							  //IO¥��ʼ��
	nop
	.dbline 46
;  UART_Init();                 							  //���ڳ�ʼ��
	nop
	.dbline 47
;  LED_Off();               							  //�������
	nop
	.dbline 48
;  printf("MAGA128��дSD������ʵ��\r\n");
	nop
	.dbline 49
;  printf("ATMEGA28 Initialize Success!\r\n");
	nop
	.dbline 50
;  printf("Waiting Initialize SD����\r\n");
	nop
	.dbline 51
;  delay_nms(500);
	nop
	.dbline 52
;  mmcInit();
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
;  mmcInit();
;  delay_nms(50);
;  while(mmcReset())			 							  //��ʼ��SD��					
; 	{
	.dbline 57
; 		retry++;
	xcall _delay_3us
	.dbline 58
; 		if(retry>20)
	xcall _delay_3us
	.dbline 59
; 		{
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
; 			printf("ATMEAG128 Initialize SD Failure!\r\n");//��ʼ��ʧ����ʾ
; 			printf("Please Checking the SD or Reset the System!\r\n");
; 
; 			while(1)   		
	.dbline 64
; 			{
	xcall _delay_10us
	.dbline 65
; 				
	xcall _delay_10us
	.dbline 66
; 			}
	xcall _delay_10us
	.dbline 67
; 		}
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
; 	} 
;  printf("DMAVR-M128 Initialize SD Success!\r\n");         //��ʼ���ɹ���ʾ��ʾ��Ϣ
;  SD_Size=mmcCapacity();
	.dbline 71
;  printf ("Size=%ld\r\n",SD_Size);							//���SD����������λ�ֽ�
	xcall _delay_50us
	.dbline 72
; while(1)
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
;  {
;  printf("Please Input the Data Want to Write to SD!\r\n");
;                                        //���Ӵ������������д��SD��������Ϊ�����ַ�����a
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;  a=getchar();
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
;  printf("The Data Write to SD is %c\r\n",a) ;
;  buffer1[0]=a;                                          //��������������ݸ���buffer1��׼��д��SD��
;  printf("ATMEGA128 Starting Read and Write SD!\r\n");
;  mmcWrite(sectorwr,buffer1);         					//��ָ����ַ(sectorwr*512)д������
;  delay_nms(1000);
;  mmcRead(sectorwr,buffer2);								//��ȡ�ղ�д��ռ�����ݣ��ж��Ƿ�д��ɹ�
;  for(i=0;i<512;i++)
;    {
;    		printf ("Data=%c \r",buffer2[i]);				//�������������
;    }
;  printf ("\r\n");
;  if(buffer1[1]=buffer2[1])
;  {
	.dbline 90
;  	printf("Write Data Success!\r\n");
	xcall _delay_100us
	.dbline 91
;  }
	xcall _delay_100us
	.dbline 92
;  else
	xcall _delay_100us
	.dbline 93
;  {
	xcall _delay_100us
	.dbline 94
;  	printf("Write Data Failure!\n");
	xcall _delay_100us
	.dbline 95
; 
	xcall _delay_100us
	.dbline 96
;  }
	xcall _delay_100us
	.dbline 97
;  
	xcall _delay_100us
	.dbline 98
;  }
	xcall _delay_100us
	.dbline 99
; 
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
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
_sectorwr::
	.blkb 4
	.area idata
	.word 200,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
	.dbsym e sectorwr _sectorwr l
_buffer1::
	.blkb 1
	.area idata
	.byte 8
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
	.dbsym e buffer1 _buffer1 A[1:1]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
	.dbfunc e LED_Off _LED_Off fV
	.even
_LED_Off::
	.dbline -1
	.dbline 27
	.dbline 28
	ldi R24,255
	out 0x12,R24
	.dbline 29
	out 0x11,R24
	.dbline 30
	sbi 0x12,4
	.dbline 31
	sbi 0x12,5
	.dbline 32
	out 0x1b,R24
	.dbline 33
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;          retry -> R20,R21
;              a -> R20
;              i -> R22,R23
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 41
	.dbline 45
	xcall _McuInit
	.dbline 46
	xcall _UART_Init
	.dbline 47
	xcall _LED_Off
	.dbline 48
	ldi R16,<L21
	ldi R17,>L21
	xcall _printf
	.dbline 49
	ldi R16,<L22
	ldi R17,>L22
	xcall _printf
	.dbline 50
	ldi R16,<L23
	ldi R17,>L23
	xcall _printf
	.dbline 51
	ldi R16,500
	ldi R17,1
	xcall _delay_nms
	.dbline 52
	xcall _mmcInit
	.dbline 53
	xcall _mmcInit
	.dbline 54
	ldi R16,50
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 56
	.dbline 57
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 58
	ldi R24,20
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brsh L27
	.dbline 59
	.dbline 60
	ldi R16,<L29
	ldi R17,>L29
	xcall _printf
	.dbline 61
	ldi R16,<L30
	ldi R17,>L30
	xcall _printf
L31:
	.dbline 64
	.dbline 66
L32:
	.dbline 63
	xjmp L31
X1:
	.dbline 67
L27:
	.dbline 68
L25:
	.dbline 55
	xcall _mmcReset
	tst R16
	brne L24
	.dbline 69
	ldi R16,<L34
	ldi R17,>L34
	xcall _printf
	.dbline 70
	xcall _mmcCapacity
	sts _SD_Size+1,R17
	sts _SD_Size,R16
	sts _SD_Size+2+1,R19
	sts _SD_Size+2,R18
	.dbline 71
	std y+0,R18
	std y+1,R19
	movw R18,R16
	ldi R16,<L35
	ldi R17,>L35
	xcall _printf
	xjmp L37
L36:
	.dbline 73
	.dbline 74
	ldi R16,<L39
	ldi R17,>L39
	xcall _printf
	.dbline 76
	xcall _getchar
	mov R20,R16
	.dbline 77
	mov R18,R20
	clr R19
	ldi R16,<L40
	ldi R17,>L40
	xcall _printf
	.dbline 78
	sts _buffer1,R20
	.dbline 79
	ldi R16,<L41
	ldi R17,>L41
	xcall _printf
	.dbline 80
	ldi R24,<_buffer1
	ldi R25,>_buffer1
	std y+1,R25
	std y+0,R24
	lds R18,_sectorwr+2
	lds R19,_sectorwr+2+1
	lds R16,_sectorwr
	lds R17,_sectorwr+1
	xcall _mmcWrite
	.dbline 81
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 82
	ldi R24,<_buffer2
	ldi R25,>_buffer2
	std y+1,R25
	std y+0,R24
	lds R18,_sectorwr+2
	lds R19,_sectorwr+2+1
	lds R16,_sectorwr
	lds R17,_sectorwr+1
	xcall _mmcRead
	.dbline 83
	clr R22
	clr R23
	xjmp L45
L42:
	.dbline 84
	.dbline 85
	ldi R24,<_buffer2
	ldi R25,>_buffer2
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R18,z+0
	clr R19
	ldi R16,<L46
	ldi R17,>L46
	xcall _printf
	.dbline 86
L43:
	.dbline 83
	subi R22,255  ; offset = 1
	sbci R23,255
L45:
	.dbline 83
	cpi R22,0
	ldi R30,2
	cpc R23,R30
	brlo L42
	.dbline 87
	ldi R16,<L47
	ldi R17,>L47
	xcall _printf
	.dbline 88
	lds R2,_buffer2+1
	sts _buffer1+1,R2
	tst R2
	breq L48
	.dbline 89
	.dbline 90
	ldi R16,<L52
	ldi R17,>L52
	xcall _printf
	.dbline 91
	xjmp L49
L48:
	.dbline 93
	.dbline 94
	ldi R16,<L53
	ldi R17,>L53
	xcall _printf
	.dbline 96
L49:
	.dbline 98
L37:
	.dbline 72
	xjmp L36
X2:
	.dbline -2
L20:
	adiw R28,2
	.dbline 0 ; func end
	ret
	.dbsym r retry 20 s
	.dbsym r a 20 c
	.dbsym r i 22 s
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
_i::
	.blkb 2
	.dbsym e i _i I
_SD_Size::
	.blkb 4
	.dbsym e SD_Size _SD_Size l
_buffer2::
	.blkb 512
	.dbsym e buffer2 _buffer2 A[512:512]c
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L53:
	.blkb 21
	.area idata
	.byte 'W,'r,'i,'t,'e,32,'D,'a,'t,'a,32,'F,'a,'i,'l,'u
	.byte 'r,'e,33,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L52:
	.blkb 22
	.area idata
	.byte 'W,'r,'i,'t,'e,32,'D,'a,'t,'a,32,'S,'u,'c,'c,'e
	.byte 's,'s,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L47:
	.blkb 3
	.area idata
	.byte 13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L46:
	.blkb 10
	.area idata
	.byte 'D,'a,'t,'a,61,37,'c,32,13,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L41:
	.blkb 40
	.area idata
	.byte 'A,'T,'M,'E,'G,'A,49,50,56,32,'S,'t,'a,'r,'t,'i
	.byte 'n,'g,32,'R,'e,'a,'d,32,'a,'n,'d,32,'W,'r,'i,'t
	.byte 'e,32,'S,'D,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L40:
	.blkb 29
	.area idata
	.byte 'T,'h,'e,32,'D,'a,'t,'a,32,'W,'r,'i,'t,'e,32,'t
	.byte 'o,32,'S,'D,32,'i,'s,32,37,'c,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L39:
	.blkb 45
	.area idata
	.byte 'P,'l,'e,'a,'s,'e,32,'I,'n,'p,'u,'t,32,'t,'h,'e
	.byte 32,'D,'a,'t,'a,32,'W,'a,'n,'t,32,'t,'o,32,'W,'r
	.byte 'i,'t,'e,32,'t,'o,32,'S,'D,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L35:
	.blkb 11
	.area idata
	.byte 'S,'i,'z,'e,61,37,'l,'d,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L34:
	.blkb 36
	.area idata
	.byte 'D,'M,'A,'V,'R,45,'M,49,50,56,32,'I,'n,'i,'t,'i
	.byte 'a,'l,'i,'z,'e,32,'S,'D,32,'S,'u,'c,'c,'e,'s,'s
	.byte 33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L30:
	.blkb 46
	.area idata
	.byte 'P,'l,'e,'a,'s,'e,32,'C,'h,'e,'c,'k,'i,'n,'g,32
	.byte 't,'h,'e,32,'S,'D,32,'o,'r,32,'R,'e,'s,'e,'t,32
	.byte 't,'h,'e,32,'S,'y,'s,'t,'e,'m,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L29:
	.blkb 35
	.area idata
	.byte 'A,'T,'M,'E,'A,'G,49,50,56,32,'I,'n,'i,'t,'i,'a
	.byte 'l,'i,'z,'e,32,'S,'D,32,'F,'a,'i,'l,'u,'r,'e,33
	.byte 13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L23:
	.blkb 28
	.area idata
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'I,'n,'i,'t,'i,'a,'l,'i
	.byte 'z,'e,32,'S,'D,161,173,161,173,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L22:
	.blkb 31
	.area idata
	.byte 'A,'T,'M,'E,'G,'A,50,56,32,'I,'n,'i,'t,'i,'a,'l
	.byte 'i,'z,'e,32,'S,'u,'c,'c,'e,'s,'s,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
L21:
	.blkb 26
	.area idata
	.byte 'M,'A,'G,'A,49,50,56,182,193,208,180,'S,'D,191,168,202
	.byte 253,190,221,202,181,209,233,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\23.SD�����ݶ�дʵ��\WRSD\main.c
