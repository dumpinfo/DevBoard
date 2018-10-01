	.module SOUND.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\SOUND\SOUND.C
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
	.dbfile E:\DMAVR-~3\SOUND\SOUND.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 30
; //DMAVR-128的蜂鸣器发声示例程序
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
; //***********************************************************************
; //			定义变量区
; //			CH451各个功能命令值，根据需要写入
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; #define beep0             PORTD &= ~(1 << PD6)    		//蜂鸣器所在IO口PD6
; #define beep1             PORTD |= (1 << PD6)
; #define led8              PORTB                        //LED控制口PB
; 
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()
; {
	.dbline 31
;   PORTD=0xff;                                       //PB设置为输出
	ldi R24,255
	out 0x12,R24
	.dbline 32
;   DDRD=0xff;
	out 0x11,R24
	.dbline 34
;   
;   PORTB=0xff;                                       //PB设置为输出
	out 0x18,R24
	.dbline 35
;   DDRB=0xff;                                        //上拉电阻无效
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e left_shift _left_shift fi
;          count -> R12
;            dat -> R10
	.even
_left_shift::
	st -y,R10
	st -y,R12
	mov R12,R18
	mov R10,R16
	.dbline -1
	.dbline 39
; }
; 
; uint left_shift(uchar dat,uchar count)              //左移
; {
	.dbline 40
;   dat=dat<<count;
	mov R16,R10
	mov R17,R12
	xcall lsl8
	mov R10,R16
	.dbline -2
L20:
	.dbline 0 ; func end
	ld R12,y+
	ld R10,y+
	ret
	.dbsym r count 12 c
	.dbsym r dat 10 c
	.dbend
	.dbfunc e main _main fV
;              j -> <dead>
;              b -> <dead>
;              c -> R12,R13
;              i -> R22,R23
;              k -> R20,R21
;              a -> R10,R11
	.even
_main::
	.dbline -1
	.dbline 48
; }
; //********************************************************************
; //			主函数
; //********************************************************************
; 
; 
; void main(void)
; {
	.dbline 51
;   uint i; 
;   uint  a,b,c,k,j;  
;   system_init();  
	xcall _system_init
	.dbline 52
;   k=0x01;             								 //先给k初值00000001等待移位
	ldi R20,1
	ldi R21,0
	xjmp L23
L22:
	.dbline 54
;   while(1)
;   {
	.dbline 55
;        for(i=8;i>0;i--)
	ldi R22,8
	ldi R23,0
	xjmp L28
L25:
	.dbline 56
;        {     
	.dbline 57
;         delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 58
;         beep1;             							 //打开蜂鸣器
	sbi 0x12,6
	.dbline 59
;         delay_nms(300);    							 //让它响
	ldi R16,300
	ldi R17,1
	xcall _delay_nms
	.dbline 60
;         beep0;            							 //关闭蜂鸣器 
	cbi 0x12,6
	.dbline 61
;         a=k;              							 //把移完的值再送给j  
	movw R10,R20
	.dbline 62
; 		c=~a;     
	movw R12,R10
	com R12
	com R13
	.dbline 63
;         led8=c;          							 //同时把值送到PB口点亮发二极管        
	out 0x18,R12
	.dbline 64
;         a=left_shift(k,1);     						 //把k循环左移一位        
	ldi R18,1
	mov R16,R20
	xcall _left_shift
	movw R10,R16
	.dbline 65
;         k=a;             							 //把移完的值再送给k
	movw R20,R10
	.dbline 66
;       }
L26:
	.dbline 55
	subi R22,1
	sbci R23,0
L28:
	.dbline 55
	cpi R22,0
	cpc R22,R23
	brne L25
X3:
	.dbline 67
;       k=0x01;
	ldi R20,1
	ldi R21,0
	.dbline 68
;    }
L23:
	.dbline 53
	xjmp L22
X4:
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbsym l j 1 i
	.dbsym l b 1 i
	.dbsym r c 12 i
	.dbsym r i 22 i
	.dbsym r k 20 i
	.dbsym r a 10 i
	.dbend
; 
; }
