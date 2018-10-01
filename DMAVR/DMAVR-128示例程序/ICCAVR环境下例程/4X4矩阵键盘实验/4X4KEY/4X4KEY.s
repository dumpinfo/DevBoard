	.module _4X4KEY.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\4X4KEY\4X4KEY.C
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 9
; //********************************************************************
; /*函 数 名：delay_us
; 建立日期：2010年1月28日
; 编译环境：ICCAVR7.16A
; 函数作用：微秒级的延时程序
; 说    明：7.3728M晶振下
; ********************************************************************/
; void delay_1us(void)                 //1us延时函数，不能连续调用， 
; { 
	.dbline 10
;    asm("nop");                       //1时钟周期
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
; void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
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
; void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
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
; void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
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
; void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
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
; delay_n100us(8)          900us              主要是由于函数声明及while,,,大概6us
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
	.dbfile E:\DMAVR-~3\4X4KEY\4X4KEY.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\4X4KEY\4X4KEY.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 42
; //DMAVR-128的4X4位矩阵键盘控制程序，显示键值
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #include <delay.h>
; #include <iom128v.h>
; 
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define key_io          PORTC               //独立键盘与PC4和PC5连接
; #define key_ior         PINC                //读取IO口值为PINC的值
; #define Data_IO	        PORTA                //数码管数据口
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; 
; //***********************************************************************
; //			共阴数码管显示的断码表0～F
; //***********************************************************************
; 
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
; 	           0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar key;
; 
; //***********************************************************************
; //			IO端口初始化
; //***********************************************************************
; 
; void System_Init()
; {
	.dbline 43
;     Data_IO=0xFF;             //数据口为输出
	ldi R24,255
	out 0x1b,R24
	.dbline 44
;     Data_DDR=0xFF;
	out 0x1a,R24
	.dbline 46
; 
;     PORTD=0xFF;               //74HC573的控制口，设置为输出
	out 0x12,R24
	.dbline 47
;     DDRD=0xFF;
	out 0x11,R24
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
	.dbline 55
; }
; 
; //*************************************************************************
; //			74HC573控制数码管动态扫描显示函数
; //*************************************************************************
; 
; void Display_Key(uchar num)
; {
	.dbline 57
; 	 uchar i,j;
; 	 System_Init();
	xcall _System_Init
	.dbline 58
;    j=0x01;                    //此数据用来控制位选
	ldi R22,1
	.dbline 59
;   for(i=0;i<8;i++)
	clr R20
	xjmp L24
L21:
	.dbline 60
;   {
	.dbline 61
;     D_LE1;                    //控制数码管段数据的74HC573的LE管脚置高
	sbi 0x12,4
	.dbline 62
;     W_LE1;                    //控制数码管位的74HC573的LE管脚置高
	sbi 0x12,5
	.dbline 63
;     Data_IO=0x00;               //设置要显示的位，也就是哪一个数码管亮，这里是八个一起显示
	clr R2
	out 0x1b,R2
	.dbline 64
;     W_LE0;                    //锁存位数据，下面送上段数据以后，就显示出来了
	cbi 0x12,5
	.dbline 65
; 	j=(j<<1);
	lsl R22
	.dbline 66
;     Data_IO=table[num];         //送要显示的数据，就是段数据，如显示0送的是0x3f
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R10
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 67
;     D_LE0;                    //锁存段数据，数码管亮一个时间片刻
	cbi 0x12,4
	.dbline 68
;     delay_nms(1);              //显示一个时间片刻，会影响亮度和闪烁性
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 70
; 
;   }
L22:
	.dbline 59
	inc R20
L24:
	.dbline 59
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
	.dbfunc e keyboardscan _keyboardscan fc
;     statevalue -> R20
;      key_check -> R10
;    key_checkin -> R20
	.even
_keyboardscan::
	xcall push_xgset300C
	.dbline -1
	.dbline 78
; 
; }
; 
; //**********************************************************************
; //	键盘扫描子程序，采用逐键扫描的方式
; //**********************************************************************
; uchar keyboardscan(void) 
; {
	.dbline 80
;   uchar statevalue,key_checkin,key_check;
;   key_io=0xf0;                    //在IO口由输出方式变为输入方式时要延迟一个周期
	ldi R24,240
	out 0x15,R24
	.dbline 81
;   key_io=0xf0;                    //采取写两次的方法延时
	out 0x15,R24
	.dbline 82
;   key_checkin=key_ior;            //读取IO口状态，判断是否有键按下
	in R20,0x13
	.dbline 83
;   if(key_checkin!=0xf0)           //IO口值发生变化则表示有键按下
	cpi R20,240
	brne X30
	xjmp L26
X30:
X4:
	.dbline 84
;   {
	.dbline 85
;     delay_nms(20);                 //键盘消抖，延时20MS
	ldi R16,20
	ldi R17,0
	xcall _delay_nms
	.dbline 86
;     key_checkin=key_ior;
	in R20,0x13
	.dbline 87
;     if(key_checkin!=0xf0)
	cpi R20,240
	brne X31
	xjmp L27
X31:
X5:
	.dbline 88
;     {
	.dbline 89
;      key_io=0xfe;                 //逐行扫描开始
	ldi R24,254
	out 0x15,R24
	.dbline 90
;      key_io=0xfe;                 //写两次延时，下同
	out 0x15,R24
	.dbline 91
;      key_check=key_ior;
	in R10,0x13
	.dbline 92
;      switch (key_check)           //根据读到的IO口值判断按键的按下情况
	mov R20,R10
	clr R21
	cpi R20,190
	ldi R30,0
	cpc R21,R30
	breq L35
X6:
	ldi R24,190
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L38
X7:
L37:
	cpi R20,126
	ldi R30,0
	cpc R21,R30
	breq L36
X8:
	xjmp L30
L38:
	cpi R20,222
	ldi R30,0
	cpc R21,R30
	breq L34
X9:
	cpi R20,222
	ldi R30,0
	cpc R21,R30
	brlt L30
X10:
L39:
	cpi R20,238
	ldi R30,0
	cpc R21,R30
	breq L33
X11:
	xjmp L30
L33:
	.dbline 94
;      {
;      case 0xee:key=15;break;
	ldi R24,15
	sts _key,R24
	.dbline 94
	xjmp L31
L34:
	.dbline 95
;      case 0xde:key=11;break;
	ldi R24,11
	sts _key,R24
	.dbline 95
	xjmp L31
L35:
	.dbline 96
;      case 0xbe:key=8;break;
	ldi R24,8
	sts _key,R24
	.dbline 96
	xjmp L31
L36:
	.dbline 97
;      case 0x7e:key=4;break;
	ldi R24,4
	sts _key,R24
	.dbline 97
L30:
L31:
	.dbline 100
;      }
;      
;      key_io=0xfd;
	ldi R24,253
	out 0x15,R24
	.dbline 101
;      key_io=0xfd;
	out 0x15,R24
	.dbline 102
;      key_check=key_ior;
	in R10,0x13
	.dbline 103
;      switch (key_check)
	mov R20,R10
	clr R21
	cpi R20,189
	ldi R30,0
	cpc R21,R30
	breq L45
X12:
	ldi R24,189
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L48
X13:
L47:
	cpi R20,125
	ldi R30,0
	cpc R21,R30
	breq L46
X14:
	xjmp L40
L48:
	cpi R20,221
	ldi R30,0
	cpc R21,R30
	breq L44
X15:
	cpi R20,221
	ldi R30,0
	cpc R21,R30
	brlt L40
X16:
L49:
	cpi R20,237
	ldi R30,0
	cpc R21,R30
	breq L43
X17:
	xjmp L40
L43:
	.dbline 105
;      {
;      case 0xed:key=14;break;
	ldi R24,14
	sts _key,R24
	.dbline 105
	xjmp L41
L44:
	.dbline 106
;      case 0xdd:key=10;break;
	ldi R24,10
	sts _key,R24
	.dbline 106
	xjmp L41
L45:
	.dbline 107
;      case 0xbd:key=7;break;
	ldi R24,7
	sts _key,R24
	.dbline 107
	xjmp L41
L46:
	.dbline 108
;      case 0x7d:key=3;break;
	ldi R24,3
	sts _key,R24
	.dbline 108
L40:
L41:
	.dbline 111
;      }
;      
;      key_io=0xfb;
	ldi R24,251
	out 0x15,R24
	.dbline 112
;      key_io=0xfb;
	out 0x15,R24
	.dbline 113
;     key_check=key_ior;
	in R10,0x13
	.dbline 114
;      switch (key_check)
	mov R20,R10
	clr R21
	cpi R20,187
	ldi R30,0
	cpc R21,R30
	breq L55
X18:
	ldi R24,187
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L58
X19:
L57:
	cpi R20,123
	ldi R30,0
	cpc R21,R30
	breq L56
X20:
	xjmp L50
L58:
	cpi R20,219
	ldi R30,0
	cpc R21,R30
	breq L54
X21:
	cpi R20,219
	ldi R30,0
	cpc R21,R30
	brlt L50
X22:
L59:
	cpi R20,235
	ldi R30,0
	cpc R21,R30
	breq L53
X23:
	xjmp L50
L53:
	.dbline 116
;      {
;      case 0xeb:key=13;break;
	ldi R24,13
	sts _key,R24
	.dbline 116
	xjmp L51
L54:
	.dbline 117
;      case 0xdb:key=0;break;
	clr R2
	sts _key,R2
	.dbline 117
	xjmp L51
L55:
	.dbline 118
;      case 0xbb:key=6;break;
	ldi R24,6
	sts _key,R24
	.dbline 118
	xjmp L51
L56:
	.dbline 119
;      case 0x7b:key=2;break;
	ldi R24,2
	sts _key,R24
	.dbline 119
L50:
L51:
	.dbline 122
;      }
;      
;       key_io=0xf7;
	ldi R24,247
	out 0x15,R24
	.dbline 123
;       key_io=0xf7;
	out 0x15,R24
	.dbline 124
;      key_check=key_ior;
	in R10,0x13
	.dbline 125
;      switch (key_check)
	mov R20,R10
	clr R21
	cpi R20,183
	ldi R30,0
	cpc R21,R30
	breq L65
X24:
	ldi R24,183
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L68
X25:
L67:
	cpi R20,119
	ldi R30,0
	cpc R21,R30
	breq L66
X26:
	xjmp L27
L68:
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	breq L64
X27:
	cpi R20,215
	ldi R30,0
	cpc R21,R30
	brlt L27
X28:
L69:
	cpi R20,231
	ldi R30,0
	cpc R21,R30
	breq L63
X29:
	xjmp L27
L63:
	.dbline 127
;      {
;      case 0xe7:key=12;break;
	ldi R24,12
	sts _key,R24
	.dbline 127
	xjmp L27
L64:
	.dbline 128
;      case 0xd7:key=9;break;
	ldi R24,9
	sts _key,R24
	.dbline 128
	xjmp L27
L65:
	.dbline 129
;      case 0xb7:key=5;break;
	ldi R24,5
	sts _key,R24
	.dbline 129
	xjmp L27
L66:
	.dbline 130
;      case 0x77:key=1;break;
	ldi R24,1
	sts _key,R24
	.dbline 130
	.dbline 133
;      }
;      
;     }
	.dbline 134
;   }
	xjmp L27
L26:
	.dbline 136
;   else
;   {
	.dbline 137
;   statevalue=0xff;                      //无按键时返回值
	ldi R20,255
	.dbline 138
;   key=statevalue;
	sts _key,R20
	.dbline 139
;   return(key);
	mov R16,R20
L27:
	.dbline -2
L25:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r statevalue 20 c
	.dbsym r key_check 10 c
	.dbsym r key_checkin 20 c
	.dbend
	.dbfunc e main _main fV
	.area  func_lit(rom, con, rel)
L95:
	.word `L88
	.word `L79
	.word `L80
	.word `L81
	.word `L82
	.word `L83
	.word `L84
	.word `L85
	.word `L86
	.word `L87
	.word `L89
	.word `L90
	.word `L91
	.word `L92
	.word `L93
	.word `L94
	.area text(rom, con, rel)
;      key_store -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 149
;   }
; }
; 
; //*************************************************************************
; //			主程序
; //*************************************************************************
; 
; void main()
; 
; {         
	.dbline 150
; 	  uint key_store=0x01;
	ldi R20,1
	ldi R21,0
	.dbline 151
; 	  DDRC=0x0f;                        //PC口上拉电阻使能
	ldi R24,15
	out 0x14,R24
	.dbline 152
;       PORTC=0xf0;                       //PC高四位输入低四位输出
	ldi R24,240
	out 0x15,R24
	xjmp L72
L71:
	.dbline 156
; 
; 
; while(1)
;   {
	.dbline 158
; 
;   keyboardscan();                         //键盘扫描，看是否有按键按下
	xcall _keyboardscan
	.dbline 159
;     if(key!=0xff)                        //如果有按键按下，则显示该按键键值0~15
	lds R24,_key
	cpi R24,255
	brne X37
	xjmp L74
X37:
X32:
	.dbline 160
;       {
	.dbline 161
; 	      { switch(key)
	.dbline 161
	mov R22,R24
	clr R23
	cpi R22,0
	ldi R30,0
	cpc R23,R30
	brge X38
	xjmp L75
X38:
X33:
	ldi R24,15
	ldi R25,0
	cp R24,R22
	cpc R25,R23
	brge X39
	xjmp L75
X39:
X34:
	ldi R24,<L95
	ldi R25,>L95
	movw R30,R22
	lsl R30
	rol R31
	add R30,R24
	adc R31,R25
	elpm R2,Z+
	elpm R3,Z
	movw R30,R2
	 ijmp
X35:
	.dbfile E:\DMAVR-~3\4X4KEY\4X4KEY.C
	.dbline 162
; 		   {  
L79:
	.dbline 163
; 		     case 1: Display_Key(0x01);key_store=0x01;break;   //根据键值显示到数码管上
	ldi R16,1
	xcall _Display_Key
	.dbline 163
	ldi R20,1
	ldi R21,0
	.dbline 163
	xjmp L75
L80:
	.dbline 164
; 		     case 2: Display_Key(0x02);key_store=0x02;break;
	ldi R16,2
	xcall _Display_Key
	.dbline 164
	ldi R20,2
	ldi R21,0
	.dbline 164
	xjmp L75
L81:
	.dbline 165
; 		     case 3: Display_Key(0x03);key_store=0x03;break;
	ldi R16,3
	xcall _Display_Key
	.dbline 165
	ldi R20,3
	ldi R21,0
	.dbline 165
	xjmp L75
L82:
	.dbline 166
; 		     case 4: Display_Key(0x04);key_store=0x04;break;
	ldi R16,4
	xcall _Display_Key
	.dbline 166
	ldi R20,4
	ldi R21,0
	.dbline 166
	xjmp L75
L83:
	.dbline 167
; 		     case 5: Display_Key(0x05);key_store=0x05;break;
	ldi R16,5
	xcall _Display_Key
	.dbline 167
	ldi R20,5
	ldi R21,0
	.dbline 167
	xjmp L75
L84:
	.dbline 168
; 		     case 6: Display_Key(0x06);key_store=0x06;break;
	ldi R16,6
	xcall _Display_Key
	.dbline 168
	ldi R20,6
	ldi R21,0
	.dbline 168
	xjmp L75
L85:
	.dbline 169
; 		     case 7: Display_Key(0x07);key_store=0x07;break;
	ldi R16,7
	xcall _Display_Key
	.dbline 169
	ldi R20,7
	ldi R21,0
	.dbline 169
	xjmp L75
L86:
	.dbline 170
; 		     case 8: Display_Key(0x08);key_store=0x08;break;
	ldi R16,8
	xcall _Display_Key
	.dbline 170
	ldi R20,8
	ldi R21,0
	.dbline 170
	xjmp L75
L87:
	.dbline 171
; 		     case 9: Display_Key(0x09);key_store=0x09;break;
	ldi R16,9
	xcall _Display_Key
	.dbline 171
	ldi R20,9
	ldi R21,0
	.dbline 171
	xjmp L75
L88:
	.dbline 172
; 		     case 0: Display_Key(0x00);key_store=0x00;break;
	clr R16
	xcall _Display_Key
	.dbline 172
	clr R20
	clr R21
	.dbline 172
	xjmp L75
L89:
	.dbline 173
; 		     case 10: Display_Key(0x0a);key_store=0x0a;break;
	ldi R16,10
	xcall _Display_Key
	.dbline 173
	ldi R20,10
	ldi R21,0
	.dbline 173
	xjmp L75
L90:
	.dbline 174
; 		     case 11: Display_Key(0x0b);key_store=0x0b;break;
	ldi R16,11
	xcall _Display_Key
	.dbline 174
	ldi R20,11
	ldi R21,0
	.dbline 174
	xjmp L75
L91:
	.dbline 175
; 		     case 12: Display_Key(0x0c);key_store=0x0c;break;
	ldi R16,12
	xcall _Display_Key
	.dbline 175
	ldi R20,12
	ldi R21,0
	.dbline 175
	xjmp L75
L92:
	.dbline 176
; 		     case 13: Display_Key(0x0d);key_store=0x0d;break;
	ldi R16,13
	xcall _Display_Key
	.dbline 176
	ldi R20,13
	ldi R21,0
	.dbline 176
	xjmp L75
L93:
	.dbline 177
; 	         case 14: Display_Key(0x0e);key_store=0x0e;break;
	ldi R16,14
	xcall _Display_Key
	.dbline 177
	ldi R20,14
	ldi R21,0
	.dbline 177
	xjmp L75
L94:
	.dbline 178
;              case 15: Display_Key(0x0f);key_store=0x0f;break;
	ldi R16,15
	xcall _Display_Key
	.dbline 178
	ldi R20,15
	ldi R21,0
	.dbline 178
	.dbline 181
;            }
; 
;           }
	.dbline 183
; 	
;        }
	xjmp L75
L74:
	.dbline 185
;   else
; 	 {
	.dbline 186
; 	 Display_Key(key_store);              //没有按键的时候显示上次的键值
	mov R16,R20
	xcall _Display_Key
	.dbline 187
; 	 }
L75:
	.dbline 189
; 
;   }
L72:
	.dbline 155
	xjmp L71
X36:
	.dbline -2
L70:
	.dbline 0 ; func end
	ret
	.dbsym r key_store 20 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\4X4KEY\4X4KEY.C
_key::
	.blkb 1
	.dbsym e key _key c
; 
; }
