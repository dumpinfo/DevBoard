CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = USART.o 

USART:	$(FILES)
	$(CC) -o USART $(LFLAGS) @USART.lk   -lcatmega
USART.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/iom128v.h C:/icc/include/delay.h
USART.o:	E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128������\�ҵ�ATMEGA128������\��������\26.UART����ͨ��ʵ��\USART\USART.c
