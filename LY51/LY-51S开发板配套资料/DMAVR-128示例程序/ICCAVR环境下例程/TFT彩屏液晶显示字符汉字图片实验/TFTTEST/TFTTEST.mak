CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION="7.16A" -DATMEGA -DATMega128  -l -g -MLongJump -MEnhanced -MHasMul -Wf-use_elpm -Wf-const_is_flash -DCONST="" 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = TFTTEST.o mmp.o picture-xin.o TFT.o 

TFTTEST:	$(FILES)
	$(CC) -o TFTTEST $(LFLAGS) @TFTTEST.lk   -lcatm128
TFTTEST.o: F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\iom128v.h F:\PROGRA~1\iccavr\include\TFT_main.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\delay.h
TFTTEST.o:	E:\DMAVR-~3\TFTTEST\TFTTEST.C
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTTEST\TFTTEST.C
mmp.o:
mmp.o:	E:\DMAVR-~3\TFTTEST\mmp.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTTEST\mmp.c
picture-xin.o:
picture-xin.o:	E:\DMAVR-~3\TFTTEST\picture-xin.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTTEST\picture-xin.c
TFT.o: F:\PROGRA~1\iccavr\include\TFTtest.h F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\math.h F:\PROGRA~1\iccavr\include\ascii8x16.h F:\PROGRA~1\iccavr\include\GB2312.h F:\PROGRA~1\iccavr\include\iom128v.h
TFT.o:	E:\DMAVR-~3\TFTTEST\TFT.c
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\TFTTEST\TFT.c
