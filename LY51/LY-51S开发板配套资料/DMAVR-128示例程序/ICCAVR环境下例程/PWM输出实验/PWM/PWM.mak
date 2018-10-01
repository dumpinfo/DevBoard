CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION="7.16A" -DATMEGA -DATMega128  -l -g -MLongJump -MEnhanced -MHasMul -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = PWM.o 

PWM:	$(FILES)
	$(CC) -o PWM $(LFLAGS) @PWM.lk   -lcatm128
PWM.o: F:\PROGRA~1\iccavr\include\string.h F:\PROGRA~1\iccavr\include\_const.h F:\PROGRA~1\iccavr\include\stdio.h F:\PROGRA~1\iccavr\include\stdarg.h F:\PROGRA~1\iccavr\include\delay.h F:\PROGRA~1\iccavr\include\iom128v.h
PWM.o:	E:\DMAVR-~3\PWM\PWM.C
	$(CC) -c $(CFLAGS) E:\DMAVR-~3\PWM\PWM.C
