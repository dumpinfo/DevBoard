CC = iccavr
LIB = ilibw
CFLAGS =  -IE:\DMAVR-~3\FAT -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = FAT.o main.o SD.o SPI.o uart.o 

FAT:	$(FILES)
	$(CC) -o FAT $(LFLAGS) @FAT.lk   -llpatm128 -lcatm128
FAT.o: D:\PROGRA~1\ICCAVR7.22\include\stdio.h D:\PROGRA~1\ICCAVR7.22\include\stdarg.h D:\PROGRA~1\ICCAVR7.22\include\_const.h D:\PROGRA~1\ICCAVR7.22\include\stdlib.h D:\PROGRA~1\ICCAVR7.22\include\limits.h D:\PROGRA~1\ICCAVR7.22\include\string.h .\..\..\DMAVR-~3\FAT-NE~1\SD.h D:\PROGRA~1\ICCAVR7.22\include\iom128v.h E:\DMAVR-~3\FAT\types.h .\..\..\DMAVR-~3\FAT-NE~1\FAT16.h
FAT.o:	..\..\DMAVR-~3\FAT-NE~1\FAT.C
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\FAT-NE~1\FAT.C
main.o: D:\PROGRA~1\ICCAVR7.22\include\string.h D:\PROGRA~1\ICCAVR7.22\include\_const.h D:\PROGRA~1\ICCAVR7.22\include\stdio.h D:\PROGRA~1\ICCAVR7.22\include\stdarg.h D:\PROGRA~1\ICCAVR7.22\include\iom128v.h E:\DMAVR-~3\FAT\SD.h E:\DMAVR-~3\FAT\types.h D:\PROGRA~1\ICCAVR7.22\include\libtypes.h D:\PROGRA~1\ICCAVR7.22\include\delay.h E:\DMAVR-~3\FAT\fat16.h
main.o:	..\..\DMAVR-~3\FAT-NE~1\main.c
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\FAT-NE~1\main.c
SD.o: E:\DMAVR-~3\FAT\SD.h D:\PROGRA~1\ICCAVR7.22\include\iom128v.h E:\DMAVR-~3\FAT\types.h D:\PROGRA~1\ICCAVR7.22\include\math.h
SD.o:	..\..\DMAVR-~3\FAT-NE~1\SD.c
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\FAT-NE~1\SD.c
SPI.o: D:\PROGRA~1\ICCAVR7.22\include\iom128v.h
SPI.o:	..\..\DMAVR-~3\FAT-NE~1\SPI.c
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\FAT-NE~1\SPI.c
uart.o: D:\PROGRA~1\ICCAVR7.22\include\stdio.h D:\PROGRA~1\ICCAVR7.22\include\stdarg.h D:\PROGRA~1\ICCAVR7.22\include\_const.h D:\PROGRA~1\ICCAVR7.22\include\string.h D:\PROGRA~1\ICCAVR7.22\include\iom128v.h
uart.o:	..\..\DMAVR-~3\FAT-NE~1\uart.c
	$(CC) -c $(CFLAGS) ..\..\DMAVR-~3\FAT-NE~1\uart.c
