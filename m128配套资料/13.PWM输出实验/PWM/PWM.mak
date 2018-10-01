CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x60.0x20000 -dram_end:0xfff -bdata:0x60.0xfff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = PWM.o 

PWM:	$(FILES)
	$(CC) -o PWM $(LFLAGS) @PWM.lk   -lcatmega
PWM.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
PWM.o:	E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\15.PWM���ʵ��\PWM\PWM.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\15.PWM���ʵ��\PWM\PWM.C
