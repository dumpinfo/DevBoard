	.module SPI.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的SPI应用示例程序，采用SPI接口的DAC芯片TLC5615，连续进行电压转换
; //DAC为TI公司的10位串行电压型输出的DAC芯片TLC5615,SPI接口连接方式
; //驱通过SPI接口，动DAC芯片，使其完成000-FFC(TLC5615后两位的值一直为0)输出的转换
; //LED指示灯DS3对应从暗到亮，表示电压逐渐增大
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
; #include <delay.h>
; #include <iom128v.h>
; 
; //***********************************************************************
; //	定义变量区
	.dbline 21
; //***********************************************************************
	nop
	.dbline 22
; #define uchar unsigned char
	nop
	.dbline 23
; #define uint  unsigned int
	nop
	.dbline 24
; 
	nop
	.dbline 25
; #define cs0   PORTB &= ~(1 << PB0)          //片选信号置低
	nop
	.dbline 26
; #define cs1   PORTB |= (1 << PB0)           //片选信号置高
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
; #define Data_IO	        PORTA                //数码管数据口
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	.dbline 32
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
	nop
	.dbline 33
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
	nop
	.dbline 34
; 
	nop
	.dbline 35
; uint da_data;
	nop
	.dbline 36
; uchar count=0;
	nop
	.dbline 37
; uint da_data2;
	nop
	.dbline 38
; //*************************************************************************
	nop
	.dbline 39
; //			初始化子程序
	nop
	.dbline 40
; //*************************************************************************
	nop
	.dbline 41
; void system_init()
	nop
	.dbline 42
; {
	nop
	.dbline 43
;  	 D_LE1;                             //关掉数码管，以免显示乱码                   
	nop
	.dbline 44
;      W_LE1;                     
	nop
	.dbline 45
;      Data_IO=0xFF;                      //关数码管            
	nop
	.dbline 46
;      W_LE0; 
	nop
	.dbline 47
; 
	nop
	.dbline 48
; 	PORTB = 0x00;		         		//电平设置
	nop
	.dbline 49
; 	DDRB = 0xFF;		         		//方向输出
	nop
	.dbline 50
; 
	nop
	.dbline 51
; }
	nop
	.dbline 52
; void SPI_init()
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
; {
;   SPCR=(1<<SPE)|(1<<MSTR);              //主机方式，SPI模式为0，SCK频率为Fosc/4
;   
; }
	.dbline 57
; 
	xcall _delay_3us
	.dbline 58
; 
	xcall _delay_3us
	.dbline 59
; //*************************************************************************
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
; //			主程序
; //*************************************************************************
; 
; void main(void)
	.dbline 64
; { 
	xcall _delay_10us
	.dbline 65
;   system_init();                               //系统IO口初始化
	xcall _delay_10us
	.dbline 66
;   SPI_init();                                  //SPI初始化
	xcall _delay_10us
	.dbline 67
;   while(1)
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
;   {
;     for(da_data=0x0000;da_data<0x0ffc;da_data++)
;     {
	.dbline 71
;       cs0;                                     //使能DAC
	xcall _delay_50us
	.dbline 72
;       da_data2=(da_data&0xff00);               //提取数据的高8位
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
;       da_data2>>=8;                            //高8位移到低8位，便于赋值
;       SPDR=da_data2;                           //写数据的高8位到SPI数据寄存器
;       SPDR=da_data&&0x00ff;                    //写数据的低8位到SPI数据寄存器
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;       delay_nms(1);
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
;       cs1;                                    //关闭使能
;     }
;   }
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
_count::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\22.SPI通信实验\SPI\SPI.C
	.dbsym e count _count c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\22.SPI通信实验\SPI\SPI.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 42
	.dbline 43
	sbi 0x12,4
	.dbline 44
	sbi 0x12,5
	.dbline 45
	ldi R24,255
	out 0x1b,R24
	.dbline 46
	cbi 0x12,5
	.dbline 48
	clr R2
	out 0x18,R2
	.dbline 49
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e SPI_init _SPI_init fV
	.even
_SPI_init::
	.dbline -1
	.dbline 53
	.dbline 54
	ldi R24,80
	out 0xd,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 64
	.dbline 65
	xcall _system_init
	.dbline 66
	xcall _SPI_init
	xjmp L23
L22:
	.dbline 68
	.dbline 69
	clr R2
	clr R3
	sts _da_data+1,R3
	sts _da_data,R2
	xjmp L28
L25:
	.dbline 70
	.dbline 71
	cbi 0x18,0
	.dbline 72
	lds R24,_da_data
	lds R25,_da_data+1
	andi R24,0
	sts _da_data2+1,R25
	sts _da_data2,R24
	.dbline 73
	movw R2,R24
	mov R2,R3
	clr R3
	sts _da_data2+1,R3
	sts _da_data2,R2
	.dbline 74
	out 0xf,R2
	.dbline 75
	lds R2,_da_data
	lds R3,_da_data+1
	tst R2
	brne X1
	tst R3
	breq L29
X1:
	ldi R20,1
	ldi R21,0
	xjmp L30
L29:
	clr R20
	clr R21
L30:
	out 0xf,R20
	.dbline 76
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 77
	sbi 0x18,0
	.dbline 78
L26:
	.dbline 69
	lds R24,_da_data
	lds R25,_da_data+1
	adiw R24,1
	sts _da_data+1,R25
	sts _da_data,R24
L28:
	.dbline 69
	lds R24,_da_data
	lds R25,_da_data+1
	cpi R24,252
	ldi R30,15
	cpc R25,R30
	brlo L25
	.dbline 79
L23:
	.dbline 67
	xjmp L22
X2:
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\22.SPI通信实验\SPI\SPI.C
_da_data2::
	.blkb 2
	.dbsym e da_data2 _da_data2 i
_da_data::
	.blkb 2
	.dbsym e da_data _da_data i
