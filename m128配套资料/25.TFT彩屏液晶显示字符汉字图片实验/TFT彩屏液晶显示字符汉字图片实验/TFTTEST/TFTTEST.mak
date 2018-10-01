CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x105f -bdata:0x100.0x105f -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = TFTTEST.o mmp.o picture-xin.o TFT.o 

TFTTEST:	$(FILES)
	$(CC) -o TFTTEST $(LFLAGS) @TFTTEST.lk   -lcatmega
TFTTEST.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h C:/icc/include/TFT_main.h C:/icc/include/stdio.h C:/icc/include/math.h C:/icc/include/string.h\
 C:/icc/include/stdio.h C:/icc/include/delay.h C:/icc/include/iom128v.h
TFTTEST.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFTTEST.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFTTEST.C
mmp.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\mmp.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\mmp.c
picture-xin.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\picture-xin.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\picture-xin.c
TFT.o: C:/icc/include/TFTtest.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/math.h C:/icc/include/ascii8x16.h C:/icc/include/GB2312.h C:/icc/include/iom128v.h
TFT.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFT.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\TFTTEST\TFT.c
