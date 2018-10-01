CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = INTKEY.o 

INTKEY:	$(FILES)
	$(CC) -o INTKEY $(LFLAGS) @INTKEY.lk   -lcatmega
INTKEY.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/delay.h C:/icc/include/iom128v.h
INTKEY.o:	E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\5.��λ�жϼ���ʵ��\INTKEY\INTKEY.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\5.��λ�жϼ���ʵ��\INTKEY\INTKEY.C
