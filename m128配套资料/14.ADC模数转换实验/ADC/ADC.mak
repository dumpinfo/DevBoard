CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = ADC.o 

ADC:	$(FILES)
	$(CC) -o ADC $(LFLAGS) @ADC.lk   -lcatmega
ADC.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
ADC.o:	E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128开发板\配套资料\15.ADC模数转换实验\ADC\ADC.C
