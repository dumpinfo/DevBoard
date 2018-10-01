CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = RedCtrl.o 

REDCTRL:	$(FILES)
	$(CC) -o REDCTRL $(LFLAGS) @REDCTRL.lk   -lcatm128
RedCtrl.o: D:\PROGRA~1\ICCAVR7.22\include\string.h D:\PROGRA~1\ICCAVR7.22\include\_const.h D:\PROGRA~1\ICCAVR7.22\include\stdio.h D:\PROGRA~1\ICCAVR7.22\include\stdarg.h D:\PROGRA~1\ICCAVR7.22\include\delay.h D:\PROGRA~1\ICCAVR7.22\include\iom128v.h
RedCtrl.o:	..\..\DMAVR-~3\RedCrl\RedCtrl.c
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\RedCrl\RedCtrl.c
