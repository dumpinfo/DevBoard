CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION="7.16A" -DATMEGA -DATMega128  -l -g -MLongJump -MEnhanced -MHasMul -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = DS1302.o main.o TFT.o 

TFTCLOCK:	$(FILES)
	$(CC) -o TFTCLOCK $(LFLAGS) @TFTCLOCK.lk   -lcatm128
DS1302.o: F:\PROGRA~1\iccavr\include\DS1302.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\iom128v.h
DS1302.o:	E:\DMAVR-~3\TFTclock\DS1302.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTclock\DS1302.c
main.o: F:\PROGRA~1\iccavr\include\TFTclock_main.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\iom128v.h F:\PROGRA~1\iccavr\include\delay.h
main.o:	E:\DMAVR-~3\TFTclock\main.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTclock\main.c
TFT.o: F:\PROGRA~1\iccavr\include\TFT.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\stdlib.h F:\PROGRA~1\iccavr\include\limits.h F:\PROGRA~1\iccavr\include\iom128v.h F:\PROGRA~1\iccavr\include\ascii8x16.h F:\PROGRA~1\iccavr\include\GB2312.h
TFT.o:	E:\DMAVR-~3\TFTclock\TFT.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTclock\TFT.c
