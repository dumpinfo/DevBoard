CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x60.0x20000 -dram_end:0xfff -bdata:0x60.0xfff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = SPI.o 

SPI:	$(FILES)
	$(CC) -o SPI $(LFLAGS) @SPI.lk   -lcatmega
SPI.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
SPI.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\22.SPI通信实验\SPI\SPI.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\22.SPI通信实验\SPI\SPI.C
