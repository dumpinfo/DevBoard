CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = main.o spi.o uart.o mmc.o 

WRSD:	$(FILES)
	$(CC) -o WRSD $(LFLAGS) @WRSD.lk   -llpatmega -lcatmega
main.o: C:/icc/include/SDData_main.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/mmc.h C:/icc/include/libtypes.h C:/icc/include/libtypes.h\
 C:/icc/include/DM_spi.h C:/icc/include/libtypes.h C:/icc/include/string.h C:/icc/include/stdio.h C:/icc/include/delay.h C:/icc/include/iom128v.h
main.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\main.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\main.c
spi.o: C:/icc/include/DM_spi.h C:/icc/include/libtypes.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h
spi.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\spi.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\spi.c
uart.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/iom128v.h
uart.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\uart.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\uart.c
mmc.o: C:/icc/include/libtypes.h C:/icc/include/DM_spi.h C:/icc/include/libtypes.h C:/icc/include/mmc.h C:/icc/include/libtypes.h C:/icc/include/mmcconf.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h
mmc.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\mmc.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\23.SD卡数据读写实验\WRSD\mmc.c
