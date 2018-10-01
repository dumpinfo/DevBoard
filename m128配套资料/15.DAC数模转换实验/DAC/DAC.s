	.module DAC.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的DAC转换驱动程序
; //DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615
; //驱动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换，LED指示灯对应从暗到亮
; //编译环境 ICCAVR 
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.06.14
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
; //	定义变量区
; //***********************************************************************
	.dbline 21
; #define uchar unsigned char
	nop
	.dbline 22
; #define uint  unsigned int
	nop
	.dbline 23
; 
	nop
	.dbline 24
; #define cs0     PORTB &= ~(1 << PB0)
	nop
	.dbline 25
; #define cs1   	PORTB |= (1 << PB0)
	nop
	.dbline 26
; #define din0    PORTB &= ~(1 << PB2)
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
; #define din1   	PORTB |= (1 << PB2)
; #define dout0   PORTB &= ~(1 << PB3)
; #define dout1   PORTB |= (1 << PB3)
; #define sclk0   PORTB &= ~(1 << PB1)
	.dbline 32
; #define sclk1   PORTB |= (1 << PB1)
; 
	nop
	.dbline 33
; uint da_data;
	nop
	.dbline 34
; //*************************************************************************
	nop
	.dbline 35
; //			初始化子程序
	nop
	.dbline 36
; //*************************************************************************
	nop
	.dbline 37
; void system_init()
	nop
	.dbline 38
; {
	nop
	.dbline 39
; 
	nop
	.dbline 40
; 	PORTB = 0xFF;				        //电平设置
	nop
	.dbline 41
; 	DDRB = 0xFF;				        //方向输出
	nop
	.dbline 42
; 
	nop
	.dbline 43
; }
	nop
	.dbline 44
; //*************************************************************************
	nop
	.dbline 45
; //			DAC转换程序
	nop
	.dbline 46
; //*************************************************************************
	nop
	.dbline 47
; void DAC_SER(uint data)
	nop
	.dbline 48
; {
	nop
	.dbline 49
;   uchar i;
	nop
	.dbline 50
;   uint da_data2;
	nop
	.dbline 51
; 
	nop
	.dbline 52
;   cs0;                       //片选DAC，置低有效
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
;   sclk0;        
; 
;   for (i=0;i<16;i++)         //尽管是10位DAC，但是其寄存器为16位，只有10位数据有效
;   {
	.dbline 57
;    da_data2=data&0x8000;    //逐位取出
	xcall _delay_3us
	.dbline 58
;    if(da_data2>>15)
	xcall _delay_3us
	.dbline 59
;    din1;
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
;    else
;    din0;
;    sclk1;                  //上升沿数据锁存
;    data<<=1;               //移位
	.dbline 64
;    sclk0;
	xcall _delay_10us
	.dbline 65
;    
	xcall _delay_10us
	.dbline 66
;   }
	xcall _delay_10us
	.dbline 67
;   delay_10us();				//延时10us
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
;    cs1;
;    sclk0;
; 
	.dbline 71
; }
	xcall _delay_50us
	.dbline 72
; 
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
; //*************************************************************************
; //			主程序
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
; //*************************************************************************
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
; void main(void)
; {
;   system_init();              					  //系统初始化
;   while(1)
;   {
;    for(da_data=0x000;da_data<0xffc;da_data++)    //连续转换，输出电压从小到大
;    {
;      DAC_SER(da_data);
;      delay_nms(1);
;   }
;   } 
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\17.DAC数模转换实验\DAC\DAC.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 38
	.dbline 40
	ldi R24,255
	out 0x18,R24
	.dbline 41
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e DAC_SER _DAC_SER fV
;       da_data2 -> R20,R21
;              i -> R22
;           data -> R10,R11
	.even
_DAC_SER::
	xcall push_gset3
	movw R10,R16
	.dbline -1
	.dbline 48
	.dbline 52
	cbi 0x18,0
	.dbline 53
	cbi 0x18,1
	.dbline 55
	clr R22
	xjmp L24
L21:
	.dbline 56
	.dbline 57
	movw R20,R10
	andi R20,0
	andi R21,128
	.dbline 58
	ldi R18,15
	ldi R19,0
	movw R16,R20
	xcall lsr16
	cpi R16,0
	cpc R16,R17
	breq L25
X1:
	.dbline 59
	sbi 0x18,2
	xjmp L26
L25:
	.dbline 61
	cbi 0x18,2
L26:
	.dbline 62
	sbi 0x18,1
	.dbline 63
	lsl R10
	rol R11
	.dbline 64
	cbi 0x18,1
	.dbline 66
L22:
	.dbline 55
	inc R22
L24:
	.dbline 55
	cpi R22,16
	brlo L21
	.dbline 67
	xcall _delay_10us
	.dbline 68
	sbi 0x18,0
	.dbline 69
	cbi 0x18,1
	.dbline -2
L20:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r da_data2 20 i
	.dbsym r i 22 c
	.dbsym r data 10 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 78
	.dbline 79
	xcall _system_init
	xjmp L29
L28:
	.dbline 81
	.dbline 82
	clr R2
	clr R3
	sts _da_data+1,R3
	sts _da_data,R2
	xjmp L34
L31:
	.dbline 83
	.dbline 84
	lds R16,_da_data
	lds R17,_da_data+1
	xcall _DAC_SER
	.dbline 85
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 86
L32:
	.dbline 82
	lds R24,_da_data
	lds R25,_da_data+1
	adiw R24,1
	sts _da_data+1,R25
	sts _da_data,R24
L34:
	.dbline 82
	lds R24,_da_data
	lds R25,_da_data+1
	cpi R24,252
	ldi R30,15
	cpc R25,R30
	brlo L31
	.dbline 87
L29:
	.dbline 80
	xjmp L28
X2:
	.dbline -2
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\17.DAC数模转换实验\DAC\DAC.C
_da_data::
	.blkb 2
	.dbsym e da_data _da_data i
