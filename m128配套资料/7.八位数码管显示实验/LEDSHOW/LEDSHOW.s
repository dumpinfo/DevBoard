	.module LEDSHOW.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的8位数码管动态显示程序，显示01234567
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
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
; //***********************************************************************
; //			定义变量区
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
	.dbline 21
; 
	nop
	.dbline 22
; #define Data_IO	        PORTA                //数据口
	nop
	.dbline 23
; #define Data_DDR        DDRA                 //数据口方向寄存器
	nop
	.dbline 24
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0
	nop
	.dbline 25
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1
	nop
	.dbline 26
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
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
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; #define W0 				0xfe                 //数码管各位单独选中时应送的位数据
; #define W1              0xfd
	.dbline 32
; #define W2 				0xfb
; #define W3              0xf7
	nop
	.dbline 33
; #define W4 				0xef
	nop
	.dbline 34
; #define W5              0xdf
	nop
	.dbline 35
; #define W6 				0xbf
	nop
	.dbline 36
; #define W7              0x7f
	nop
	.dbline 37
; 
	nop
	.dbline 38
; //***********************************************************************
	nop
	.dbline 39
; //			共阴数码管显示的断码表
	nop
	.dbline 40
; //***********************************************************************
	nop
	.dbline 41
; 
	nop
	.dbline 42
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,
	nop
	.dbline 43
;                0x07,0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 44
; 
	nop
	.dbline 45
; //***********************************************************************
	nop
	.dbline 46
; //			IO端口初始化
	nop
	.dbline 47
; //***********************************************************************
	nop
	.dbline 48
; 
	nop
	.dbline 49
; void System_Init()
	nop
	.dbline 50
; {
	nop
	.dbline 51
;     Data_IO=0xFF;             //数据口为输出
	nop
	.dbline 52
;     Data_DDR=0xFF;
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
;     PORTD=0xFF;               //74HC573的控制口，设置为输出
;     DDRD=0xFF;
; 	
	.dbline 57
; 	PORTB=0xFF;				  //关闭发光二极管
	xcall _delay_3us
	.dbline 58
; 	DDRB=0xFF;
	xcall _delay_3us
	.dbline 59
; }
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
; 
; //***********************************************************************
; //			74HC573控制数码管动态扫描
; //***********************************************************************
	.dbline 64
; 
	xcall _delay_10us
	.dbline 65
; void Write_LED()
	xcall _delay_10us
	.dbline 66
; {
	xcall _delay_10us
	.dbline 67
;    uchar i,j;
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
;    j=0x01;                    //此数据用来控制位选
;   for(i=0;i<8;i++)
;   {
	.dbline 71
;     D_LE1;                    //控制数码管段数据的74HC573的LE管脚置高
	xcall _delay_50us
	.dbline 72
;     W_LE1;                    //控制数码管位的74HC573的LE管脚置高
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
;     Data_IO=~j;               //设置要显示的位，也就是哪一个数码管亮
;     W_LE0;                    //锁存位数据，下面送上段数据以后，就显示出来了
; 	j=(j<<1);
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;     Data_IO=table[i];         //送要显示的数据，就是段数据，如显示0送的是0x3f
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
;     D_LE0;                    //锁存段数据，数码管亮一个时间片刻
;     delay_nms(1);              //显示一个时间片刻，会影响亮度和闪烁性
; 
;   }
; }
; 
; //***********************************************************************
; //			主程序
; //***********************************************************************
; 
; void main(void)
; {
; 
	.dbline 90
;      System_Init();             //初始化
	xcall _delay_100us
	.dbline 91
; 
	xcall _delay_100us
	.dbline 92
;  while(1)
	xcall _delay_100us
	.dbline 93
;    {
	xcall _delay_100us
	.dbline 94
;      Write_LED();               //调用函数，显示
	xcall _delay_100us
	.dbline 95
;    }
	xcall _delay_100us
	.dbline 96
; 
	xcall _delay_100us
	.dbline 97
; }
	xcall _delay_100us
	.dbline 98
; }
	xcall _delay_100us
	.dbline 99
; }
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
; }
; }
; }
; }
; }
; }
; }
; }
; }
	xjmp L13
L12:
	.dbline 111
	xcall _delay_1ms
L13:
	.dbline 110
; }
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
; }
; }
; }
; }
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; }
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\9.八位数码管显示实验\LEDSHOW\LEDSHOW.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\9.八位数码管显示实验\LEDSHOW\LEDSHOW.C
	.dbfunc e System_Init _System_Init fV
	.even
_System_Init::
	.dbline -1
	.dbline 50
	.dbline 51
	ldi R24,255
	out 0x1b,R24
	.dbline 52
	out 0x1a,R24
	.dbline 54
	out 0x12,R24
	.dbline 55
	out 0x11,R24
	.dbline 57
	out 0x18,R24
	.dbline 58
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Write_LED _Write_LED fV
;              j -> R20
;              i -> R22
	.even
_Write_LED::
	xcall push_gset2
	.dbline -1
	.dbline 66
	.dbline 68
	ldi R20,1
	.dbline 69
	clr R22
	xjmp L24
L21:
	.dbline 70
	.dbline 71
	sbi 0x12,4
	.dbline 72
	sbi 0x12,5
	.dbline 73
	mov R2,R20
	com R2
	out 0x1b,R2
	.dbline 74
	cbi 0x12,5
	.dbline 75
	lsl R20
	.dbline 76
	ldi R24,<_table
	ldi R25,>_table
	mov R30,R22
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 77
	cbi 0x12,4
	.dbline 78
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 80
L22:
	.dbline 69
	inc R22
L24:
	.dbline 69
	cpi R22,8
	brlo L21
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r j 20 c
	.dbsym r i 22 c
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 88
	.dbline 90
	xcall _System_Init
	xjmp L27
L26:
	.dbline 93
	.dbline 94
	xcall _Write_LED
	.dbline 95
L27:
	.dbline 92
	xjmp L26
X1:
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
