CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = 2KEY.o 

2KEY:	$(FILES)
	$(CC) -o 2KEY $(LFLAGS) @2KEY.lk   -lcatmega
2KEY.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
2KEY.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\4.两位独立键盘实验\2KEY程序\2KEY.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\4.两位独立键盘实验\2KEY程序\2KEY.C
