	.module ADC.C
	.area text(rom, con, rel)
	.dbfile C:/icc/include/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //ATMEGA128的ADC单通道转换示例程序
; //采取结束触发中断的方式
; //数据位数为10位精度，可以实现8位精度
; //显示结果为ADC输出的数字量
; //编译环境 ICCAVR 
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡
; //启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.06.24
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
; #define Data_IO	        PORTA                //数码管数据口
	.dbline 21
; #define Data_DDR        DDRA                 //数码管数据口方向寄存器
	nop
	.dbline 22
; #define D_LE0	        PORTD &= ~(1 << PD4) //数码管段控制位为0，锁存端口数据
	nop
	.dbline 23
; #define D_LE1           PORTD |= (1 << PD4)  //数码管段控制位为1，锁存器输出与端口一致
	nop
	.dbline 24
; #define W_LE0	        PORTD &= ~(1 << PD5) //数码管位控制位为0
	nop
	.dbline 25
; #define W_LE1           PORTD |= (1 << PD5)  //数码管位控制位为1
	nop
	.dbline 26
; 
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
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; uchar adc_datah,adc_datal,A1,A2,A3,A4;       //定义变量
	.dbline 32
; uchar flag,j;                                //标志变量
; 
	nop
	.dbline 33
; //***********************************************************************
	nop
	.dbline 34
; //			共阴数码管显示的断码表0～F
	nop
	.dbline 35
; //***********************************************************************
	nop
	.dbline 36
; 
	nop
	.dbline 37
; uchar table[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,
	nop
	.dbline 38
;                0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
	nop
	.dbline 39
; 
	nop
	.dbline 40
; //***********************************************************************
	nop
	.dbline 41
; //			IO端口初始化
	nop
	.dbline 42
; //***********************************************************************
	nop
	.dbline 43
; 
	nop
	.dbline 44
; void system_init()
	nop
	.dbline 45
; {
	nop
	.dbline 46
;     Data_IO=0xFF;             //数据口为输出
	nop
	.dbline 47
;     Data_DDR=0xFF;
	nop
	.dbline 48
;     PORTD=0xFF;               //74HC573的控制口，设置为输出
	nop
	.dbline 49
;     DDRD=0xFF;
	nop
	.dbline 50
; 	
	nop
	.dbline 51
; 	PORTB=0xFF;				  //关闭发光二极管
	nop
	.dbline 52
; 	DDRB=0xFF;
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
; //*************************************************************************
; //			74HC573控制数码管动态扫描显示函数，显示采集到的温度
	.dbline 57
; //*************************************************************************
	xcall _delay_3us
	.dbline 58
; 
	xcall _delay_3us
	.dbline 59
; void Display_ADC()
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
; {
; 	 uchar i,j;
; 	 system_init();
;      j=0x01;                    //此数据用来控制位选
	.dbline 64
;  for(i=0;i<4;i++)               //用后4位数码管来显示
	xcall _delay_10us
	.dbline 65
;   {
	xcall _delay_10us
	.dbline 66
;      D_LE1;                     
	xcall _delay_10us
	.dbline 67
;      W_LE1;                     
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
;      Data_IO=~j;                
;      W_LE0;                      
; 	 j=(j<<1);
	.dbline 71
;      Data_IO=0x00;           
	xcall _delay_50us
	.dbline 72
;      D_LE0;                      
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
;      delay_nms(1);                
;   }
;      D_LE1;                    
	xjmp L8
L7:
	.dbline 77
	xcall _delay_100us
L8:
	.dbline 76
;      W_LE1;                    
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
;      Data_IO=~j;               
;      W_LE0;                    
; 	 j=(j<<1);
;      Data_IO=table[A1];         
;      D_LE0;                    
;      delay_nms(1);              
; 
;      D_LE1;                     
;      W_LE1;                     
;      Data_IO=~j;                
;      W_LE0;                      
; 	 j=(j<<1);
;      Data_IO=table[A2];            
	.dbline 90
;      D_LE0;                      
	xcall _delay_100us
	.dbline 91
;      delay_nms(1);                
	xcall _delay_100us
	.dbline 92
; 
	xcall _delay_100us
	.dbline 93
; 	 D_LE1;                     
	xcall _delay_100us
	.dbline 94
;      W_LE1;                     
	xcall _delay_100us
	.dbline 95
;      Data_IO=~j;                
	xcall _delay_100us
	.dbline 96
;      W_LE0;                      
	xcall _delay_100us
	.dbline 97
; 	 j=(j<<1);
	xcall _delay_100us
	.dbline 98
;      Data_IO=table[A3];           
	xcall _delay_100us
	.dbline 99
;      D_LE0;                      
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
;      delay_nms(1);   
; 	 
; 	  D_LE1;                    
;      W_LE1;                    
;      Data_IO=~j;               
;      W_LE0;                    
; 	 j=(j<<1);
;      Data_IO=table[A4];         
;      D_LE0;                    
;      delay_nms(1);             
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
; }
; 
	xjmp L17
L16:
	.dbline 116
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
; void adc_init()
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
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
	.dbsym e table _table A[16:16]c
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
	.dbfunc e system_init _system_init fV
	.even
_system_init::
	.dbline -1
	.dbline 45
	.dbline 46
	ldi R24,255
	out 0x1b,R24
	.dbline 47
	out 0x1a,R24
	.dbline 48
	out 0x12,R24
	.dbline 49
	out 0x11,R24
	.dbline 51
	out 0x18,R24
	.dbline 52
	out 0x17,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Display_ADC _Display_ADC fV
;              i -> R20
;              j -> R22
	.even
_Display_ADC::
	xcall push_gset2
	.dbline -1
	.dbline 60
	.dbline 62
	xcall _system_init
	.dbline 63
	ldi R22,1
	.dbline 64
	clr R20
	xjmp L24
L21:
	.dbline 65
	.dbline 66
	sbi 0x12,4
	.dbline 67
	sbi 0x12,5
	.dbline 68
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 69
	cbi 0x12,5
	.dbline 70
	lsl R22
	.dbline 71
	clr R2
	out 0x1b,R2
	.dbline 72
	cbi 0x12,4
	.dbline 73
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 74
L22:
	.dbline 64
	inc R20
L24:
	.dbline 64
	cpi R20,4
	brlo L21
	.dbline 75
	sbi 0x12,4
	.dbline 76
	sbi 0x12,5
	.dbline 77
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 78
	cbi 0x12,5
	.dbline 79
	lsl R22
	.dbline 80
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A1
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 81
	cbi 0x12,4
	.dbline 82
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 84
	sbi 0x12,4
	.dbline 85
	sbi 0x12,5
	.dbline 86
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 87
	cbi 0x12,5
	.dbline 88
	lsl R22
	.dbline 89
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A2
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 90
	cbi 0x12,4
	.dbline 91
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 93
	sbi 0x12,4
	.dbline 94
	sbi 0x12,5
	.dbline 95
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 96
	cbi 0x12,5
	.dbline 97
	lsl R22
	.dbline 98
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A3
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 99
	cbi 0x12,4
	.dbline 100
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline 102
	sbi 0x12,4
	.dbline 103
	sbi 0x12,5
	.dbline 104
	mov R2,R22
	com R2
	out 0x1b,R2
	.dbline 105
	cbi 0x12,5
	.dbline 106
	lsl R22
	.dbline 107
	ldi R24,<_table
	ldi R25,>_table
	lds R30,_A4
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 108
	cbi 0x12,4
	.dbline 109
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbend
	.dbfunc e adc_init _adc_init fV
	.even
_adc_init::
	.dbline -1
	.dbline 116
; {
	.dbline 117
;   ADMUX=0x40;                              //选择通道0，数据右对齐，AVCC为电压基准
	ldi R24,64
	out 0x7,R24
	.dbline 118
;   ADCSRA=0xF8;                             //adc使能，连续转换
	ldi R24,248
	out 0x6,R24
	.dbline 119
;   SFIOR=0x00;                              //控制和状态寄存器初始化
	clr R2
	out 0x20,R2
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e data_do _data_do fV
;         temp_3 -> R22,R23
;         temp_2 -> R20,R21
;         temp_1 -> R20,R21
;        temp_dl -> R22,R23
;        temp_dh -> R20,R21
	.even
_data_do::
	xcall push_gset2
	movw R22,R18
	movw R20,R16
	.dbline -1
	.dbline 126
; }
; 
; //*************************************************************************
; //		数据处理函数
; //*************************************************************************
;  void data_do(uint temp_dh,uint temp_dl)
;  {
	.dbline 128
;      uint temp_1,temp_2,temp_3;
;      temp_1=temp_dh*16*16;
	ldi R16,16
	ldi R17,0
	movw R18,R20
	xcall empy16s
	movw R18,R16
	ldi R16,16
	ldi R17,0
	xcall empy16s
	movw R20,R16
	.dbline 129
;      temp_3=temp_1+temp_dl;
	movw R2,R20
	add R2,R22
	adc R3,R23
	movw R22,R2
	.dbline 130
;      A1=temp_3/1000;                       //分出千，百，十，和个位
	ldi R18,1000
	ldi R19,3
	movw R16,R2
	xcall div16u
	sts _A1,R16
	.dbline 131
;      temp_1=temp_3%1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R22
	xcall mod16u
	movw R20,R16
	.dbline 132
;      A2=temp_1/100;
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _A2,R16
	.dbline 133
;      temp_2=temp_1%100;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	movw R20,R16
	.dbline 134
;      A3=temp_2/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _A3,R16
	.dbline 135
;      A4=temp_2%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _A4,R16
	.dbline -2
L26:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r temp_3 22 i
	.dbsym r temp_2 20 i
	.dbsym r temp_1 20 i
	.dbsym r temp_dl 22 i
	.dbsym r temp_dh 20 i
	.dbend
	.area vector(rom, abs)
	.org 84
	jmp _ADC_ISR
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
	.dbfunc e ADC_ISR _ADC_ISR fV
	.even
_ADC_ISR::
	xcall push_lset
	.dbline -1
	.dbline 143
; }
; 
; //*************************************************************************
; //		中断服务子程序
; //*************************************************************************
; #pragma interrupt_handler  ADC_ISR:iv_ADC 
; void ADC_ISR() 	 				  		
; {                                          //ADC中断服务程序
	.dbline 144
;   adc_datal=ADCL;
	in R2,0x4
	sts _adc_datal,R2
	.dbline 145
;   adc_datah=ADCH;                         //读取adc数据寄存器的值，8位精度
	in R2,0x5
	sts _adc_datah,R2
	.dbline 146
;   data_do(adc_datah,adc_datal);           //数据处理，得到BCD码
	lds R18,_adc_datal
	clr R19
	mov R16,R2
	clr R17
	xcall _data_do
	.dbline 147
;   flag=0x01;                              //标志位置1
	ldi R24,1
	sts _flag,R24
	.dbline 148
;  for(j=0;j<50;j++)
	clr R2
	sts _j,R2
	xjmp L31
L28:
	.dbline 149
	.dbline 150
	xcall _Display_ADC
	.dbline 151
L29:
	.dbline 148
	lds R24,_j
	subi R24,255    ; addi 1
	sts _j,R24
L31:
	.dbline 148
	lds R24,_j
	cpi R24,50
	brlo L28
	.dbline -2
L27:
	xcall pop_lset
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 160
;   {
;      Display_ADC();           //显示adc的数据
;   }
; }
; 
; 
; 
; //*************************************************************************
; //			主程序
; //*************************************************************************
; void main()
; {
	.dbline 161
;   system_init();                             //系统初始化
	xcall _system_init
	.dbline 162
;   adc_init();                                //adc初始化配置
	xcall _adc_init
	.dbline 163
;   SREG|=0x80;                                //开启全局中断
	bset 7
L33:
	.dbline 165
	.dbline 167
L34:
	.dbline 164
	xjmp L33
X1:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
_j::
	.blkb 1
	.dbsym e j _j c
_flag::
	.blkb 1
	.dbsym e flag _flag c
_A4::
	.blkb 1
	.dbsym e A4 _A4 c
_A3::
	.blkb 1
	.dbsym e A3 _A3 c
_A2::
	.blkb 1
	.dbsym e A2 _A2 c
_A1::
	.blkb 1
	.dbsym e A1 _A1 c
_adc_datal::
	.blkb 1
	.dbsym e adc_datal _adc_datal c
_adc_datah::
	.blkb 1
	.dbsym e adc_datah _adc_datah c
