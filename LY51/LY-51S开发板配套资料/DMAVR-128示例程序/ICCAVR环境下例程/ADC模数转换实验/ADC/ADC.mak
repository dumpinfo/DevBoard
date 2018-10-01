CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = ADC.o 

ADC:	$(FILES)
	$(CC) -o ADC $(LFLAGS) @ADC.lk   -lcatm128
ADC.o: C:\iccv7avr\include\string.h C:\iccv7avr\include\_const.h C:\iccv7avr\include\stdio.h C:\iccv7avr\include\stdarg.h
ADC.o:	ADC.C
	$(CC) -c $(CFLAGS) ADC.C
