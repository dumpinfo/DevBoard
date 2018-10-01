CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION="7.16A" -DATMEGA -DATMega128  -l -g -MLongJump -MEnhanced -MHasMul -Wf-use_elpm -Wf-const_is_flash -DCONST="" 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o FAT.o mmc.o spi.o TFT.o EEPROM.o uart.o 

READBMP:	$(FILES)
	$(CC) -o READBMP $(LFLAGS) @READBMP.lk   -llpatm128 -lcatm128
main.o: F:\PROGRA~1\iccavr\include\BMP_main.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\mmc.h F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\DM_spi.h F:\PROGRA~1\iccavr\include\iom128v.h F:\PROGRA~1\iccavr\include\delay.h F:\PROGRA~1\iccavr\include\FAT.h F:\PROGRA~1\iccavr\include\stdlib.h F:\PROGRA~1\iccavr\include\limits.h
main.o:	E:\DMAVR-~3\ReadBmp\main.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\main.c
FAT.o: F:\PROGRA~1\iccavr\include\FAT.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdlib.h F:\PROGRA~1\iccavr\include\limits.h
FAT.o:	E:\DMAVR-~3\ReadBmp\FAT.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\FAT.c
mmc.o: F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\DM_spi.h F:\PROGRA~1\iccavr\include\mmc.h F:\PROGRA~1\iccavr\include\mmcconf.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\iom128v.h
mmc.o:	E:\DMAVR-~3\ReadBmp\mmc.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\mmc.c
spi.o: F:\PROGRA~1\iccavr\include\DM_spi.h F:\PROGRA~1\iccavr\include\libtypes.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\iom128v.h
spi.o:	E:\DMAVR-~3\ReadBmp\spi.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\spi.c
TFT.o: F:\PROGRA~1\iccavr\include\BMP_TFT.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\iom128v.h F:\PROGRA~1\iccavr\include\ascii8x16.h F:\PROGRA~1\iccavr\include\GB2312.h
TFT.o:	E:\DMAVR-~3\ReadBmp\TFT.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\TFT.c
EEPROM.o: F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\iom128v.h
EEPROM.o:	E:\DMAVR-~3\ReadBmp\EEPROM.C
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\EEPROM.C
uart.o: F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\iom128v.h
uart.o:	E:\DMAVR-~3\ReadBmp\uart.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\ReadBmp\uart.c
