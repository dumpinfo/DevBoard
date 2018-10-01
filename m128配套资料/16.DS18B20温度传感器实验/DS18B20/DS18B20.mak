CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = DS18B20.o 

DS18B20:	$(FILES)
	$(CC) -o DS18B20 $(LFLAGS) @DS18B20.lk   -lcatmega
DS18B20.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
DS18B20.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\16.DS18B20温度传感器实验\DS18B20\DS18B20.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\16.DS18B20温度传感器实验\DS18B20\DS18B20.C
