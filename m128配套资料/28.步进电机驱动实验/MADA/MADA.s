	.module MADA.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //M128_ZZX_1的步进电机驱动程序
; //步进电机为四相八拍驱动方式，额定电压5V,ABCD对应PB1~PB4
; ///编译环境 ICCAVR 
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
; #include <delay.h>
; #include <iom128v.h>
; 
; //***********************************************************************
; //			定义变量区
; //***********************************************************************
; 
	.dbline 21
; #define uchar           unsigned char
	nop
	.dbline 22
; #define uint            unsigned int
	nop
	.dbline 23
; #define Data_IO	        PORTA                //液晶数据口
	nop
	.dbline 24
; #define Data_DDR        DDRA                 //数据口方向寄存器
	nop
	.dbline 25
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	nop
	.dbline 26
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
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
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
; 
; uchar  F_Rotation[8]={0xE2,0xE6,0xE4,0xEC,0xE8,0xF8,0xF0,0xF2};//正转表格， 0111，0011 1011，1001 1101，1100 ，1110，0110
	.dbline 32
; //a--ab-b-bc-c-cd-d-da 四相八拍方式
; uchar  B_Rotation[8]={0xF2,0xF0,0xF8,0xE8,0xEC,0xE4,0xE6,0xE2};//反转表格
	nop
	.dbline 33
; 
	nop
	.dbline 34
; //***********************************************************************
	nop
	.dbline 35
; //			主程序
	nop
	.dbline 36
; //***********************************************************************
	nop
	.dbline 37
; void main(void)
	nop
	.dbline 38
; {
	nop
	.dbline 39
;  uint i,j;
	nop
	.dbline 40
;  	DDRB=0xFF;
	nop
	.dbline 41
;     PORTD=0xFF;
	nop
	.dbline 42
; 	DDRD=0xFF;
	nop
	.dbline 43
; 	D_LE1;                             //关掉数码管，以免显示乱码                   
	nop
	.dbline 44
;     W_LE1;                     
	nop
	.dbline 45
;     Data_IO=0xFF;                      //关数码管            
	nop
	.dbline 46
;     W_LE0; 
	nop
	.dbline 47
;   while(1)
	nop
	.dbline 48
;    {
	nop
	.dbline 49
;    for(j=0;j<64*8;j++)   			   //步距角5.625/64 减速比1/64，8拍，这个循环为反转一圈
	nop
	.dbline 50
;    {
	nop
	.dbline 51
;     for(i=0;i<8;i++)
	nop
	.dbline 52
; 	{
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
;     PORTB=B_Rotation[i];
; 	delay_nms(10);
;     }
;    }
	.dbline 57
;    for(j=0;j<64*8;j++)				   //步距角5.625/64 减速比1/64，8拍，这个循环为正转一圈
	xcall _delay_3us
	.dbline 58
;    {
	xcall _delay_3us
	.dbline 59
;     for(i=0;i<8;i++)
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
; 	{
;     PORTB=F_Rotation[i];
; 	delay_nms(10);
;     }
	.dbline 64
;    }
	xcall _delay_10us
	.dbline 65
;    
	xcall _delay_10us
	.dbline 66
;    }
	xcall _delay_10us
	.dbline 67
; }
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
; }
; }
; }
	.dbline 71
; }
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
; }
; }
; }
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
; }
; }
; }
	.dbline 90
; }
	xcall _delay_100us
	.dbline 91
; }
	xcall _delay_100us
	.dbline 92
; }
	xcall _delay_100us
	.dbline 93
; }
	xcall _delay_100us
	.dbline 94
; }
	xcall _delay_100us
	.dbline 95
; }
	xcall _delay_100us
	.dbline 96
; }
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
_F_Rotation::
	.blkb 2
	.area idata
	.byte 226,230
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 228,236
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 232,248
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.blkb 2
	.area idata
	.byte 240,242
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.dbsym e F_Rotation _F_Rotation A[8:8]c
_B_Rotation::
	.blkb 2
	.area idata
	.byte 242,240
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 248,232
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 236,228
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.blkb 2
	.area idata
	.byte 230,226
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.dbsym e B_Rotation _B_Rotation A[8:8]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\28.步进电机驱动实验\MADA\MADA.C
	.dbfunc e main _main fV
;              j -> R20,R21
;              i -> R22,R23
	.even
_main::
	.dbline -1
	.dbline 38
	.dbline 40
	ldi R24,255
	out 0x17,R24
	.dbline 41
	out 0x12,R24
	.dbline 42
	out 0x11,R24
	.dbline 43
	sbi 0x12,4
	.dbline 44
	sbi 0x12,5
	.dbline 45
	out 0x1b,R24
	.dbline 46
	cbi 0x12,5
	xjmp L21
L20:
	.dbline 48
	.dbline 49
	clr R20
	clr R21
	xjmp L26
L23:
	.dbline 50
	.dbline 51
	clr R22
	clr R23
	xjmp L30
L27:
	.dbline 52
	.dbline 53
	ldi R24,<_B_Rotation
	ldi R25,>_B_Rotation
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 54
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 55
L28:
	.dbline 51
	subi R22,255  ; offset = 1
	sbci R23,255
L30:
	.dbline 51
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L27
	.dbline 56
L24:
	.dbline 49
	subi R20,255  ; offset = 1
	sbci R21,255
L26:
	.dbline 49
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L23
	.dbline 57
	clr R20
	clr R21
	xjmp L34
L31:
	.dbline 58
	.dbline 59
	clr R22
	clr R23
	xjmp L38
L35:
	.dbline 60
	.dbline 61
	ldi R24,<_F_Rotation
	ldi R25,>_F_Rotation
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 62
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 63
L36:
	.dbline 59
	subi R22,255  ; offset = 1
	sbci R23,255
L38:
	.dbline 59
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L35
	.dbline 64
L32:
	.dbline 57
	subi R20,255  ; offset = 1
	sbci R21,255
L34:
	.dbline 57
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L31
	.dbline 66
L21:
	.dbline 47
	xjmp L20
X1:
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 22 i
	.dbend
