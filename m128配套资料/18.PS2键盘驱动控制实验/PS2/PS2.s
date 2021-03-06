	.module PS2.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的PS2键盘驱动程序，并在1602液晶上显示键值
; //PS2键盘按键1次输出33个时钟脉冲，因此采用中断的方式读取33次，只提取最后一个字节中的数据位做键码
; //按键1次，实际输出3个字节数据，每个字节为11位，一个起始位(0)，8个数据位，一个奇偶校验位，一个停止位(1)
; //并且第1个字节与第3个字节数据相同，此程序提取第3个字节的数据位键值数据
; //有的键盘在第一次按键会触发34次中断，因此在中断服务程序中多一个判断程序，默认使用33个中断
; //学习前请阅读PS2键盘的相关资料，以充分的理解程序，译码表可以做成头文件的形式，为了直观，这里就全部放在一起
; //编译环境 ICCAVR 
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.01.14
; 
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #define  F_CPU	7372800		                                                                 //单片机主频为7.3728MHz
; #include <delay.h>
; #include <iom128v.h>
	.dbline 21
; #include <PS2.h>
	nop
	.dbline 22
; 
	nop
	.dbline 23
; 
	nop
	.dbline 24
; 
	nop
	.dbline 25
; //***********************************************************************
	nop
	.dbline 26
; //			定义变量区
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
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
	.dbline 32
; #define ulong           unsigned long
; 
	nop
	.dbline 33
; extern  uchar unshifted[][2];
	nop
	.dbline 34
; extern  uchar shifted[][2];
	nop
	.dbline 35
; 
	nop
	.dbline 36
; #define RS_CLR	PORTF &= ~(1 << PF1)                 //RS置低
	nop
	.dbline 37
; #define RS_SET	PORTF |= (1 << PF1)                  //RS置高
	nop
	.dbline 38
; 
	nop
	.dbline 39
; #define RW_CLR	PORTF &= ~(1 << PF2)                 //RW置低
	nop
	.dbline 40
; #define RW_SET	PORTF |= (1 << PF2)                  //RW置高
	nop
	.dbline 41
; 
	nop
	.dbline 42
; #define EN_CLR	PORTF &= ~(1 << PF3)                 //E置低
	nop
	.dbline 43
; #define EN_SET	PORTF |= (1 << PF3)                  //E置高
	nop
	.dbline 44
; 
	nop
	.dbline 45
; #define Data_IO	        PORTA                //液晶数据口
	nop
	.dbline 46
; #define Data_DDR        DDRA                 //数据口方向寄存器
	nop
	.dbline 47
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	nop
	.dbline 48
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
	nop
	.dbline 49
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
	nop
	.dbline 50
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
	nop
	.dbline 51
; 
	nop
	.dbline 52
; 
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
; uchar bitcount;
; uchar data2,key_value=0x30;
; ulong data;
; uchar finish;
	.dbline 57
; uchar up=0,shift=0;	//up为通、断码标志，shift为shift键按下标志 
	xcall _delay_3us
	.dbline 58
; 
	xcall _delay_3us
	.dbline 59
; 
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
; //*************************************************************************
; //			初始化子程序
; //*************************************************************************
; void system_init()
	.dbline 64
; {
	xcall _delay_10us
	.dbline 65
; 
	xcall _delay_10us
	.dbline 66
; 	Data_IO = 0xFF;				        //电平设置
	xcall _delay_10us
	.dbline 67
; 	Data_DDR = 0xFF;				        //方向输出
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
; 	PORTF = 0xFF;                       //电平设置
; 	DDRF = 0xFF;                        //方向输出
;     PORTD=0xFF;
	.dbline 71
; 	DDRD=0xFF;
	xcall _delay_50us
	.dbline 72
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
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
;     W_LE1;                     
;     Data_IO=0xFF;                      //关数码管            
;     W_LE0; 
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; }
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
; //***********************************************************************
; //	显示屏命令写入函数
; //***********************************************************************
; 
; 
; void LCD_write_com(unsigned char com) 
; {	
; 	RS_CLR;
; 	RW_CLR;
; 	EN_SET;
; 	Data_IO = com;
; 	delay_nms(5);
	.dbline 90
; 	EN_CLR;
	xcall _delay_100us
	.dbline 91
; }
	xcall _delay_100us
	.dbline 92
; //***********************************************************************
	xcall _delay_100us
	.dbline 93
; //	显示屏数据写入函数
	xcall _delay_100us
	.dbline 94
; //***********************************************************************
	xcall _delay_100us
	.dbline 95
; 
	xcall _delay_100us
	.dbline 96
; void LCD_write_data(unsigned char data) 
	xcall _delay_100us
	.dbline 97
; {
	xcall _delay_100us
	.dbline 98
; 	RS_SET;
	xcall _delay_100us
	.dbline 99
; 	RW_CLR;
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
; 	EN_SET;
; 	Data_IO = data;
; 	delay_nms(5);
; 	EN_CLR;
; }
; //***********************************************************************
; //	显示屏清空显示
; //***********************************************************************
; 
; void LCD_clear(void) 
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; {
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
; 	LCD_write_com(0x01);
; 	delay_nms(5);
; }
; //***********************************************************************
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; //	显示屏单字符写入函数
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
_unshifted::
	.blkb 2
	.area idata
	.byte 14,96
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 21,'q
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 22,49
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 26,'z
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 27,'s
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 28,'a
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 29,'w
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 30,50
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 33,'c
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 34,'x
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 35,'d
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 36,'e
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 37,52
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 38,51
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 41,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 42,'v
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 43,'f
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 44,'t
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 45,'r
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 46,53
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 49,'n
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 50,'b
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 51,'h
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 52,'g
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 53,'y
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 54,54
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 57,44
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 58,'m
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 59,'j
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 60,'u
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 61,55
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 62,56
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'A,44
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'B,'k
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'C,'i
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'D,'o
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'E,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'F,57
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'I,46
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'J,47
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'K,'l
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'L,59
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'M,'p
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'N,45
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'R,39
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'T,91
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'U,61
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 91,93
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 93,92
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'a,60
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'i,49
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'k,52
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'l,55
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'p,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'q,46
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'r,50
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 's,53
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 't,54
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'u,56
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'y,43
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 'z,51
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 123,45
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 124,42
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 125,57
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile C:/icc/include/PS2.h
	.dbsym e unshifted _unshifted A[130:65:2]c
_shifted::
	.blkb 2
	.area idata
	.byte 14,126
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 21,'Q
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 22,33
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 26,'Z
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 27,'S
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 28,'A
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 29,'W
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 30,64
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 33,'C
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 34,'X
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 35,'D
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 36,'E
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 37,36
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 38,35
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 41,32
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 42,'V
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 43,'F
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 44,'T
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 45,'R
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 46,62
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 49,'N
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 50,'B
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 51,'H
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 52,'G
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 53,'Y
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 54,94
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 57,'L
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 58,'M
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 59,'J
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 60,'U
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 61,38
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 62,42
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'A,60
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'B,'K
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'C,'I
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'D,'O
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'E,41
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'F,40
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'I,62
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'J,63
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'K,'L
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'L,58
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'M,'P
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'N,95
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'R,34
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'T,123
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'U,43
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 91,125
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 93,124
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'a,62
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'i,49
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'k,52
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'l,55
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'p,48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'q,46
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'r,50
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 's,53
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 't,54
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'u,56
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'y,43
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 'z,51
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 123,45
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 124,42
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 125,57
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.dbsym e shifted _shifted A[130:65:2]c
_key_value::
	.blkb 1
	.area idata
	.byte 48
	.area data(ram, con, rel)
	.dbfile C:/icc/include/PS2.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	.dbsym e key_value _key_value c
_up::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	.dbsym e up _up c
_shift::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	.dbsym e shift _shift c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 64
	.dbline 66
	ldi R24,255
	out 0x1b,R24
	.dbline 67
	out 0x1a,R24
	.dbline 68
	sts 98,R24
	.dbline 69
	sts 97,R24
	.dbline 70
	out 0x12,R24
	.dbline 71
	out 0x11,R24
	.dbline 72
	sbi 0x12,4
	.dbline 73
	sbi 0x12,5
	.dbline 74
	out 0x1b,R24
	.dbline 75
	cbi 0x12,5
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_com _LCD_write_com fV
;            com -> R20
	.even
_LCD_write_com::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 84
	.dbline 85
	lds R24,98
	andi R24,253
	sts 98,R24
	.dbline 86
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 87
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 88
	out 0x1b,R20
	.dbline 89
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 90
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L20:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r com 20 c
	.dbend
	.dbfunc e LCD_write_data _LCD_write_data fV
;           data -> R20
	.even
_LCD_write_data::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 97
	.dbline 98
	lds R24,98
	ori R24,2
	sts 98,R24
	.dbline 99
	lds R24,98
	andi R24,251
	sts 98,R24
	.dbline 100
	lds R24,98
	ori R24,8
	sts 98,R24
	.dbline 101
	out 0x1b,R20
	.dbline 102
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 103
	lds R24,98
	andi R24,247
	sts 98,R24
	.dbline -2
L21:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r data 20 c
	.dbend
	.dbfunc e LCD_clear _LCD_clear fV
	.even
_LCD_clear::
	.dbline -1
	.dbline 110
	.dbline 111
	ldi R16,1
	xcall _LCD_write_com
	.dbline 112
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e LCD_write_char _LCD_write_char fV
;           data -> y+4
;              y -> R22
;              x -> R20
	.even
_LCD_write_char::
	xcall push_gset2
	mov R22,R18
	mov R20,R16
	.dbline -1
	.dbline 119
; //***********************************************************************
; 
; void LCD_write_char(unsigned char x,unsigned char y,unsigned char data) 
; {
	.dbline 121
; 	
;     if (y == 0) 
	tst R22
	brne L24
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
	ldd R16,y+4
	xcall _LCD_write_data
	.dbline -2
L23:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym l data 4 c
	.dbsym r y 22 c
	.dbsym r x 20 c
	.dbend
	.dbfunc e LCD_write_str _LCD_write_str fV
;              s -> R20,R21
;              y -> R10
;              x -> R22
	.even
_LCD_write_str::
	xcall push_gset3
	mov R10,R18
	mov R22,R16
	ldd R20,y+6
	ldd R21,y+7
	.dbline -1
	.dbline 137
; }
; 
; //***********************************************************************
; //	显示屏字符串写入函数
; //***********************************************************************
; void LCD_write_str(unsigned char x,unsigned char y,unsigned char *s) 
; {
	.dbline 139
; 	
;     if (y == 0) 
	tst R10
	brne L27
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
	.dbline 150
	movw R30,R20
	ldd R16,z+0
	xcall _LCD_write_data
	.dbline 151
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 152
L30:
	.dbline 148
;     
;     while (*s) 
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L29
	.dbline -2
L26:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r s 20 pc
	.dbsym r y 10 c
	.dbsym r x 22 c
	.dbend
	.dbfunc e LCD_init _LCD_init fV
	.even
_LCD_init::
	.dbline -1
	.dbline 160
;     {
;     	LCD_write_data( *s);
;     	s ++;
;     }
; }
; 
; //***********************************************************************
; //	显示屏初始化函数
; //***********************************************************************
; 
; void LCD_init(void) 
; {
	.dbline 161
; 	LCD_write_com(0x38);				//显示模式设置
	ldi R16,56
	xcall _LCD_write_com
	.dbline 162
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 163
; 	LCD_write_com(0x08);				//显示关闭
	ldi R16,8
	xcall _LCD_write_com
	.dbline 164
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 165
;     LCD_write_com(0x01);				//显示清屏
	ldi R16,1
	xcall _LCD_write_com
	.dbline 166
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 167
;     LCD_write_com(0x06);				//显示光标移动设置
	ldi R16,6
	xcall _LCD_write_com
	.dbline 168
; 	delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline 169
; 	LCD_write_com(0x0C);				//显示开及光标设置
	ldi R16,12
	xcall _LCD_write_com
	.dbline 170
;     delay_nms(5);
	ldi R16,5
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
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
; //                初始化PS2函数 
; //************************************************************** 
; void ps2_init(void) 
; { 
	.dbline 180
;      
;      EIMSK|=0x03;          //使能外部中断0
	in R24,0x39
	ori R24,3
	out 0x39,R24
	.dbline 181
;      EICRA=0x0A;          //下降沿触发方式
	ldi R24,10
	sts 106,R24
	.dbline 182
;      MCUCSR=0x00;         //控制和状态寄存器初始化
	clr R2
	out 0x34,R2
	.dbline 183
;      bitcount = 0;	     //每次11位数据，一个起始位(0)，8个数据位，一个奇偶校验位，一个停止位(1)  
	sts _bitcount,R2
	.dbline 184
;      PORTD|=(1<<PD0);    //使能中断管脚的上拉
	sbi 0x12,0
	.dbline 185
;      DDRD&=~(1<<PD0);    //配置中断管脚为输入 
	cbi 0x11,0
	.dbline 186
;      PORTC|=(1<<PC7);    //使能数据管脚的上拉 
	sbi 0x15,7
	.dbline 187
;      DDRC&=~(1<<PC7);    //配置数据管脚为输入
	cbi 0x14,7
	.dbline -2
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Decode _Decode fV
;              i -> R20
;       scancode -> R16
	.even
_Decode::
	xcall push_gset1
	.dbline -1
	.dbline 196
; 
; } 
; 
; //************************************************************** 
; //              译码函数，scancode--需要翻译的扫描码  
; //************************************************************** 
; 
; void Decode(uchar scancode) 
; { 
	.dbline 199
; 
; uchar i; 
; if (!up)	 //已接收的11位数据是通码（up为0） 
	lds R2,_up
	tst R2
	breq X3
	xjmp L35
X3:
	.dbline 200
; { 
	.dbline 201
; 	switch (scancode)//开始翻译扫描码 
	mov R20,R16
	clr R21
	cpi R20,89
	ldi R30,0
	cpc R21,R30
	breq L42
	ldi R24,89
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brlt L60
L59:
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	breq L41
	xjmp L37
L60:
	cpi R20,240
	ldi R30,0
	cpc R21,R30
	breq L40
	xjmp L37
X1:
	.dbline 202
; 		{ 
L40:
	.dbline 204
; 			case 0xF0:	 //键盘释放标志（随后的一个字节是断码） 
; 						up=1;	        //设置up为断码标志 
	ldi R24,1
	sts _up,R24
	.dbline 205
; 						break; 
	xjmp L36
L41:
	.dbline 207
; 			case 0x12:	 //左shift键按下 
; 						shift=1;         //设置shift为按下标志 
	ldi R24,1
	sts _shift,R24
	.dbline 208
; 						break; 
	xjmp L36
L42:
	.dbline 210
; 			case 0x59:	 //右shift键按下 
; 						shift=1;         //设置shift为按下标志 
	ldi R24,1
	sts _shift,R24
	.dbline 211
; 						break; 
	xjmp L36
L37:
	.dbline 213
; 			default: 
; if(!shift)	 //如果shift键没有按下 
	lds R2,_shift
	tst R2
	brne L43
	.dbline 214
; 	{ //查找unshifted表，表中左列是扫描码，右列是对应的ASCII码 
	.dbline 215
	clr R20
	xjmp L48
L45:
	.dbline 215
L46:
	.dbline 215
	inc R20
L48:
	.dbline 215
; 		for(i=0;unshifted[i][0]!=scancode;i++); 
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_unshifted
	ldi R25,>_unshifted
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L45
	.dbline 216
; 			if(unshifted[i][0]==scancode) 
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_unshifted
	ldi R25,>_unshifted
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	breq X4
	xjmp L36
X4:
	.dbline 217
; 				{ 
	.dbline 218
; 					key_value=unshifted[i][1]; 
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_unshifted+1
	ldi R25,>_unshifted+1
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
; else //如果shift键按下 
; 	{	 //查找shifted表 
	.dbline 223
	clr R20
	xjmp L55
L52:
	.dbline 223
L53:
	.dbline 223
	inc R20
L55:
	.dbline 223
; 		for(i=0;shifted[i][0]!=scancode;i++); 
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_shifted
	ldi R25,>_shifted
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L52
	.dbline 224
; 			if(shifted[i][0]==scancode) 
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_shifted
	ldi R25,>_shifted
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	cp R2,R16
	brne L36
	.dbline 225
; 				{ 
	.dbline 226
; 					key_value=shifted[i][1];
	ldi R24,2
	mul R24,R20
	movw R30,R0
	ldi R24,<_shifted+1
	ldi R25,>_shifted+1
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
; else                      //已接收的11位数据是断码（up为1） 
; 	{ 
	.dbline 235
; 		up = 0;                   //将断码标志复位 
	clr R2
	sts _up,R2
	.dbline 236
; 		switch (scancode)	 //检测shift键释放 
	mov R20,R16
	clr R21
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	breq L64
	cpi R20,18
	ldi R30,0
	cpc R21,R30
	brlt L62
L66:
	cpi R20,89
	ldi R30,0
	cpc R21,R30
	breq L65
	xjmp L62
X2:
	.dbline 237
; 			{ 
L64:
	.dbline 239
; 				case 0x12 :	         //左shift键 
; 							shift = 0; 
	clr R2
	sts _shift,R2
	.dbline 240
; 							break; 
	xjmp L62
L65:
	.dbline 242
; 				case 0x59 :	         //右shift键 
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
L36:
	.dbline -2
L34:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r scancode 16 c
	.dbend
	.dbfunc e get_code _get_code fV
;              i -> R20,R21
;          cdata -> R16
	.even
_get_code::
	xcall push_gset1
	.dbline -1
	.dbline 253
; 			} 
; 	} 
; } 
; //************************************************************************
; //          中断读入的数据是先低位后高位，该函数将数据位重新排列
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
	.dbline 256
	lds R2,_data2
	lsl R2
	sts _data2,R2
	.dbline 257
	mov R24,R16
	andi R24,1
	or R2,R24
	sts _data2,R2
	.dbline 258
	lsr R16
	.dbline 260
L69:
	.dbline 255
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 255
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	brlt L68
	.dbline -2
L67:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 I
	.dbsym r cdata 16 c
	.dbend
	.area vector(rom, abs)
	.org 4
	jmp _INT0_ISR
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	.dbfunc e INT0_ISR _INT0_ISR fV
	.even
_INT0_ISR::
	xcall push_lset
	xcall push_gset2
	.dbline -1
	.dbline 268
	.dbline 269
	lds R24,_bitcount
	subi R24,255    ; addi 1
	sts _bitcount,R24
	.dbline 270
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
	lds R24,_bitcount
	cpi R24,33
	brne L73
	.dbline 282
	.dbline 283
	clr R2
	sts _bitcount,R2
	.dbline 284
	ldi R24,1
	sts _finish,R24
	.dbline 285
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
	ldi R24,2
	ldi R25,0
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	sts _data+1,R17
	sts _data,R16
	sts _data+2+1,R19
	sts _data+2,R18
	.dbline 287
	xcall _get_code
	.dbline 288
	lds R16,_data2
	xcall _Decode
	.dbline 289
L73:
	.dbline -2
L72:
	xcall pop_gset2
	xcall pop_lset
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	sbiw R28,2
	.dbline -1
	.dbline 297
;   { data2<<=1 ;
;     data2|=cdata&0x01;
;     cdata>>=1;
;   
;   }
; }
; //*************************************************************************
; //	        外部中断0服务子程序
; //功 能: 外部中断0的中断服务函数，下降沿读取数据，数据位ULONG型，全部读取 
; //*************************************************************************
; #pragma interrupt_handler  INT0_ISR:iv_INT0 //int0_ISR：中断函数名，接着是中断向量号
; void INT0_ISR() 	 				  		//中断0服务程序
;    {
;     bitcount++;                               //中断次数计数值，按一次键，中断33次
;     data<<=1;                                 //但是键盘初始化后可能有一个中断，所以第一个是中断34次
;     data|=((PINC&0x80)>>7);                   //读取每一个中断时的数据位
;     //if((bitcount==0x22)&&(finish==0))        //有的键盘在初始化后会有一个下降沿中断
;     //{
;      // bitcount=0;
;     //  finish=1;                              //只有在第一个键时调用此判断，多一个中断
;      // data=data&0x03fc;
;    //   data>>=2;
;     //  get_code(data);                        //得到8位键码
;     //   Decode(data2);	                     //将扫描码翻译成ASCII码
;   //  }
;     if(bitcount==0x21)//&&(finish==1))    //正常来说，都是33次中断
;         {
;       bitcount=0;
;       finish=1;
;       data=data&0x03fc;      //读取最后一个字节中的8位数据位，每次按键三个字节数据，第一个和第三个字节数据相同
;       data>>=2;               //移位处理
;       get_code(data);        //得到8位正常排序的数据位
;        Decode(data2);	     //将扫描码翻译成ASCII码
;     }
;    
;   }
; 
; //*************************************************************************
; //                 主函数 
; //*************************************************************************
; void main(void) 
; { 
	.dbline 298
;         system_init();                                //系统初始化，设置IO口属性
	xcall _system_init
	.dbline 299
; 	    delay_nms(100);                                //延时100ms
	ldi R16,100
	ldi R17,0
	xcall _delay_nms
	.dbline 300
;   	    LCD_init();                                   //液晶参数初始化设置
	xcall _LCD_init
	.dbline 301
;         ps2_init();	                             //初始化PS2键盘接口 
	xcall _ps2_init
	.dbline 302
;         LCD_write_str(0,0,"The Keyvalue:");          //液晶初始界面
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
;         SREG|=0x80;                                  //开全局中断
	bset 7
	xjmp L78
L77:
	.dbline 306
	.dbline 307
	lds R2,_key_value
	std y+0,R2
	ldi R18,1
	ldi R16,4
	xcall _LCD_write_char
	.dbline 308
L78:
	.dbline 305
	xjmp L77
X5:
	.dbline -2
L75:
	adiw R28,2
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
L76:
	.blkb 14
	.area idata
	.byte 'T,'h,'e,32,'K,'e,'y,'v,'a,'l,'u,'e,58,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
