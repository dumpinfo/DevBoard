CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = PS2.o 

PS2:	$(FILES)
	$(CC) -o PS2 $(LFLAGS) @PS2.lk   -lcatmega
PS2.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h C:/icc/include/PS2.h
PS2.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\18.PS2键盘驱动控制实验\PS2\PS2.C
