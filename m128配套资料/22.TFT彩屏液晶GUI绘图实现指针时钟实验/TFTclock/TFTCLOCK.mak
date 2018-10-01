CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = DS1302.o main.o TFT.o 

TFTclock:	$(FILES)
	$(CC) -o TFTclock $(LFLAGS) @TFTclock.lk   -lcatmega
DS1302.o: C:/icc/include/DS1302.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/math.h C:/icc/include/iom128v.h
DS1302.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\DS1302.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\DS1302.c
main.o: C:/icc/include/TFTclock_main.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/math.h C:/icc/include/iom128v.h C:/icc/include/delay.h
main.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\main.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\main.c
TFT.o: C:/icc/include/TFT.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/math.h C:/icc/include/stdlib.h C:/icc/include/_const.h C:/icc/include/limits.h\
 C:/icc/include/iom128v.h C:/icc/include/ascii8x16.h C:/icc/include/GB2312.h
TFT.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\TFT.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTclock\TFT.c
