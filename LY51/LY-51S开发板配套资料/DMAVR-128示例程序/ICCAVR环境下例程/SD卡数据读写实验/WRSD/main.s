	.module main.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //********************************************************************
; /*函 数 名：delay_us
; 建立日期：2010年1月28日
; 编译环境：ICCAVR7.16A
; 函数作用：微秒级的延时程序
; 说    明：7.3728M晶振下
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
; void delay_1us(void)                 //1us延时函数，不能连续调用， 
; { 
	.dbline 21
;    asm("nop");                       //1时钟周期
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
; void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
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
; void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
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
; void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
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
; void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
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
; delay_n100us(8)          900us              主要是由于函数声明及while,,,大概6us
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
; 函 数 名：Delay_ms
; 建立日期：2010年1月28日
; 修改日期：
; 函数作用：毫秒级的精确延时程序
; 说    明：
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
_sectorwr::
	.blkb 4
	.area idata
	.word 200,0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\WRSD\main.c
	.dbsym e sectorwr _sectorwr l
_buffer1::
	.blkb 1
	.area idata
	.byte 8
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
	.dbsym e buffer1 _buffer1 A[1:1]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
	.dbfunc e LED_Off _LED_Off fV
	.even
_LED_Off::
	.dbline -1
	.dbline 27
; //DMAVR-M128的读写SD卡数据实验，给指定地址写入指定数据，采取扇区读写的模式，一次512字节
; //要写入SD卡的数据通过串口写入，使用串口调试助手，波特率9600，8位数据，1位停止位，无校验方式
; //初始化SD卡成功后，将出现Please Input the Data Want to Write to SD字符样，此时通过串口调试助手发送任意字符即可
; //数据写入SD卡后，又读出来显示到串口调试助手，通过对比可以判断写入是否成功
; //由于存在长整型数据，因此，要设定ICCAVR环境支持long型数据，设置project->options->Target，选中long
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <SDData_main.h>
; 
; 
; u32 sectorwr=200;	//向SD卡中写入数据的地址，为扇区数，对于一个扇区为512字节的SD卡实际地址为sectorwr*512字节
; u08 buffer1[1]={0x08};  //向SD卡中写入的数据，这里只定义了一个字节的长度，可以定义为512个字节长度	
; u08 buffer2[512];   	//读取数据存放区
; u32 SD_Size;            //SD卡容量读取存储变量
; int i;
; //***********************************************************************
; //		关闭数码管函数，为了数码管不显示乱码，属于初始化函数
; //***********************************************************************
; 
; void LED_Off()
; {
	.dbline 28
;     PORTD=0xFF;
	ldi R24,255
	out 0x12,R24
	.dbline 29
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 30
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 31
;     W_LE1;                     
	sbi 0x12,5
	.dbline 32
;     Data_IO=0xFF;                      //关数码管            
	out 0x1b,R24
	.dbline 33
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;          retry -> R20,R21
;              a -> R10
;              i -> R20,R21
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 41
; }
; 
; //***********************************************************************
; //			主函数，调用SD卡读写函数
; //***********************************************************************
; 
; void main(void)
; {
	.dbline 45
; 
;  u16 i,retry;
;  u08 a;
;  McuInit();					  							  //IO楼初始化
	xcall _McuInit
	.dbline 48
;  //delay_nms(500);
;  //LED_Off(); 
;  UART_Init();                 							  //串口初始化
	xcall _UART_Init
	.dbline 49
;  LED_Off();               							  //关数码管
	xcall _LED_Off
	.dbline 50
;  printf("DMAVR-128读写SD卡数据实验\r\n");
	ldi R16,<L21
	ldi R17,>L21
	xcall _printf
	.dbline 51
;  printf("DMAVR-M128 Initialize Success!\r\n");
	ldi R16,<L22
	ldi R17,>L22
	xcall _printf
	.dbline 52
;  printf("Waiting Initialize SD……\r\n");
	ldi R16,<L23
	ldi R17,>L23
	xcall _printf
	.dbline 53
;  delay_nms(500);
	ldi R16,500
	ldi R17,1
	xcall _delay_nms
	.dbline 54
;  mmcInit();
	xcall _mmcInit
	.dbline 55
;  mmcInit();
	xcall _mmcInit
	.dbline 56
;  delay_nms(50);
	ldi R16,50
	ldi R17,0
	xcall _delay_nms
	xjmp L25
L24:
	.dbline 58
;  while(mmcReset())			 							  //初始化SD卡					
; 	{
	.dbline 59
; 		retry++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 60
; 		if(retry>20)
	ldi R24,20
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brsh L27
X3:
	.dbline 61
; 		{
	.dbline 62
; 			printf("DMAVR-M128 Initialize SD Failure!\r\n");//初始化失败显示
	ldi R16,<L29
	ldi R17,>L29
	xcall _printf
	.dbline 63
; 			printf("Please Checking the SD or Reset the System!\r\n");
	ldi R16,<L30
	ldi R17,>L30
	xcall _printf
L31:
	.dbline 66
; 
; 			while(1)   		
; 			{
	.dbline 68
; 				
; 			}
L32:
	.dbline 65
	xjmp L31
L27:
	.dbline 70
; 		}
; 	} 
L25:
	.dbline 57
	xcall _mmcReset
	tst R16
	brne L24
X4:
	.dbline 71
;  printf("DMAVR-M128 Initialize SD Success!\r\n");         //初始化成功显示提示信息
	ldi R16,<L34
	ldi R17,>L34
	xcall _printf
	.dbline 72
;  SD_Size=mmcCapacity();
	xcall _mmcCapacity
	sts _SD_Size+1,R17
	sts _SD_Size,R16
	sts _SD_Size+2+1,R19
	sts _SD_Size+2,R18
	.dbline 73
;  printf ("Size=%ld\r\n",SD_Size);							//输出SD卡容量，单位字节
	std y+0,R18
	std y+1,R19
	movw R18,R16
	ldi R16,<L35
	ldi R17,>L35
	xcall _printf
	xjmp L37
L36:
	.dbline 75
; while(1)
;  {
	.dbline 76
;  printf("Please Input the Data Want to Write to SD!\r\n");
	ldi R16,<L39
	ldi R17,>L39
	xcall _printf
	.dbline 79
;  //printf("The Data is:");
;  //scanf("%c",&a);                                        //将从串口输入的数据写入SD卡，数据为单个字符，如a
;  a=getchar();
	xcall _getchar$device_specific$
	mov R10,R16
	.dbline 81
;  //printf("\n");
;  printf("The Data Write to SD is %c\r\n",a) ;
	mov R18,R10
	clr R19
	ldi R16,<L40
	ldi R17,>L40
	xcall _printf
	.dbline 82
;  buffer1[0]=a;                                          //将串口输入的数据赋予buffer1，准备写入SD卡
	sts _buffer1,R10
	.dbline 83
;  printf("DMAVR-M128 Starting Read and Write SD!\r\n");
	ldi R16,<L41
	ldi R17,>L41
	xcall _printf
	.dbline 85
; 
;  mmcWrite(sectorwr,buffer1);         					//向指定地址(sectorwr*512)写入数据
	ldi R24,<_buffer1
	ldi R25,>_buffer1
	std y+1,R25
	std y+0,R24
	lds R18,_sectorwr+2
	lds R19,_sectorwr+2+1
	lds R16,_sectorwr
	lds R17,_sectorwr+1
	xcall _mmcWrite
	.dbline 86
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 87
;  mmcRead(sectorwr,buffer2);								//读取刚才写入空间的数据，判断是否写入成功
	ldi R24,<_buffer2
	ldi R25,>_buffer2
	std y+1,R25
	std y+0,R24
	lds R18,_sectorwr+2
	lds R19,_sectorwr+2+1
	lds R16,_sectorwr
	lds R17,_sectorwr+1
	xcall _mmcRead
	.dbline 88
;  for(i=0;i<512;i++)
	clr R20
	clr R21
	xjmp L45
L42:
	.dbline 89
;    {
	.dbline 90
;    		printf ("Data=%c \r",buffer2[i]);				//输出读出的数据
	ldi R24,<_buffer2
	ldi R25,>_buffer2
	movw R30,R20
	add R30,R24
	adc R31,R25
	ldd R18,z+0
	clr R19
	ldi R16,<L46
	ldi R17,>L46
	xcall _printf
	.dbline 91
;    }
L43:
	.dbline 88
	subi R20,255  ; offset = 1
	sbci R21,255
L45:
	.dbline 88
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L42
X5:
	.dbline 92
;  printf ("\r\n");
	ldi R16,<L47
	ldi R17,>L47
	xcall _printf
	.dbline 93
;  if(buffer1[1]=buffer2[1])
	lds R10,_buffer2+1
	sts _buffer1+1,R10
	tst R10
	breq L48
X6:
	.dbline 94
;  {
	.dbline 95
;  	printf("Write Data Success!\r\n");
	ldi R16,<L52
	ldi R17,>L52
	xcall _printf
	.dbline 97
; //	printf("Please Take Out the SD!\n");
;  }
	xjmp L49
L48:
	.dbline 99
;  else
;  {
	.dbline 100
;  	printf("Write Data Failure!\n");
	ldi R16,<L53
	ldi R17,>L53
	xcall _printf
	.dbline 102
; 
;  }
L49:
	.dbline 104
;  
;  }
L37:
	.dbline 74
	xjmp L36
X7:
	.dbline -2
L20:
	.dbline 0 ; func end
	adiw R28,2
	ret
	.dbsym r retry 20 s
	.dbsym r a 10 c
	.dbsym r i 20 s
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
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
	.dbfile E:\DMAVR-~3\WRSD\main.c
L53:
	.blkb 21
	.area idata
	.byte 'W,'r,'i,'t,'e,32,'D,'a,'t,'a,32,'F,'a,'i,'l,'u
	.byte 'r,'e,33,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L52:
	.blkb 22
	.area idata
	.byte 'W,'r,'i,'t,'e,32,'D,'a,'t,'a,32,'S,'u,'c,'c,'e
	.byte 's,'s,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L47:
	.blkb 3
	.area idata
	.byte 13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L46:
	.blkb 10
	.area idata
	.byte 'D,'a,'t,'a,61,37,'c,32,13,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L41:
	.blkb 41
	.area idata
	.byte 'D,'M,'A,'V,'R,45,'M,49,50,56,32,'S,'t,'a,'r,'t
	.byte 'i,'n,'g,32,'R,'e,'a,'d,32,'a,'n,'d,32,'W,'r,'i
	.byte 't,'e,32,'S,'D,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L40:
	.blkb 29
	.area idata
	.byte 'T,'h,'e,32,'D,'a,'t,'a,32,'W,'r,'i,'t,'e,32,'t
	.byte 'o,32,'S,'D,32,'i,'s,32,37,'c,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L39:
	.blkb 45
	.area idata
	.byte 'P,'l,'e,'a,'s,'e,32,'I,'n,'p,'u,'t,32,'t,'h,'e
	.byte 32,'D,'a,'t,'a,32,'W,'a,'n,'t,32,'t,'o,32,'W,'r
	.byte 'i,'t,'e,32,'t,'o,32,'S,'D,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L35:
	.blkb 11
	.area idata
	.byte 'S,'i,'z,'e,61,37,'l,'d,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L34:
	.blkb 36
	.area idata
	.byte 'D,'M,'A,'V,'R,45,'M,49,50,56,32,'I,'n,'i,'t,'i
	.byte 'a,'l,'i,'z,'e,32,'S,'D,32,'S,'u,'c,'c,'e,'s,'s
	.byte 33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L30:
	.blkb 46
	.area idata
	.byte 'P,'l,'e,'a,'s,'e,32,'C,'h,'e,'c,'k,'i,'n,'g,32
	.byte 't,'h,'e,32,'S,'D,32,'o,'r,32,'R,'e,'s,'e,'t,32
	.byte 't,'h,'e,32,'S,'y,'s,'t,'e,'m,33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L29:
	.blkb 36
	.area idata
	.byte 'D,'M,'A,'V,'R,45,'M,49,50,56,32,'I,'n,'i,'t,'i
	.byte 'a,'l,'i,'z,'e,32,'S,'D,32,'F,'a,'i,'l,'u,'r,'e
	.byte 33,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L23:
	.blkb 28
	.area idata
	.byte 'W,'a,'i,'t,'i,'n,'g,32,'I,'n,'i,'t,'i,'a,'l,'i
	.byte 'z,'e,32,'S,'D,161,173,161,173,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L22:
	.blkb 33
	.area idata
	.byte 'D,'M,'A,'V,'R,45,'M,49,50,56,32,'I,'n,'i,'t,'i
	.byte 'a,'l,'i,'z,'e,32,'S,'u,'c,'c,'e,'s,'s,33,13,10
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
L21:
	.blkb 28
	.area idata
	.byte 'D,'M,'A,'V,'R,45,49,50,56,182,193,208,180,'S,'D,191
	.byte 168,202,253,190,221,202,181,209,233,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\main.c
; 
; }
; 
