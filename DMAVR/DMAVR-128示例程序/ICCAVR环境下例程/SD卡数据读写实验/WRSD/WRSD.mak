CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION="7.16A" -DATMEGA -DATMega128  -l -g -MLongJump -MEnhanced -MHasMul -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o spi.o uart.o mmc.o 

WRSD:	$(FILES)
	$(CC) -o WRSD $(LFLAGS) @WRSD.lk   -llpatm128 -lcatm128
main.o: F:\PROGRA~1\iccavr\include\SDData_main.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\mmc.h F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\spi.h F:\PROGRA~1\iccavr\include\delay.h F:\PROGRA~1\iccavr\include\iom128v.h
main.o:	E:\DMAVR-~3\WRSD\main.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\WRSD\main.c
spi.o: F:\PROGRA~1\iccavr\include\DM_spi.h F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\iom128v.h
spi.o:	E:\DMAVR-~3\WRSD\spi.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\WRSD\spi.c
uart.o: F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\iom128v.h
uart.o:	E:\DMAVR-~3\WRSD\uart.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\WRSD\uart.c
mmc.o: F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\DM_spi.h F:\PROGRA~1\iccavr\include\mmc.h F:\PROGRA~1\iccavr\include\mmcconf.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\iom128v.h
mmc.o:	E:\DMAVR-~3\WRSD\mmc.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\WRSD\mmc.c
