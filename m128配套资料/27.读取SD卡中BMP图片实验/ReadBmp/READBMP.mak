CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA -DATMega128  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = main.o FAT.o mmc.o spi.o TFT.o EEPROM.o uart.o 

ReadBmp:	$(FILES)
	$(CC) -o ReadBmp $(LFLAGS) @ReadBmp.lk   -llpatmega -lcatmega
main.o: C:/icc/include/BMP_main.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/mmc.h C:/icc/include/libtypes.h C:/icc/include/libtypes.h C:/icc/include/DM_spi.h\
 C:/icc/include/libtypes.h C:/icc/include/iom128v.h C:/icc/include/delay.h C:/icc/include/FAT.h C:/icc/include/stdio.h C:/icc/include/stdlib.h C:/icc/include/_const.h C:/icc/include/limits.h
main.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\main.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\main.c
FAT.o: C:/icc/include/FAT.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/stdlib.h C:/icc/include/_const.h C:/icc/include/limits.h
FAT.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
mmc.o: C:/icc/include/libtypes.h C:/icc/include/DM_spi.h C:/icc/include/libtypes.h C:/icc/include/mmc.h C:/icc/include/libtypes.h C:/icc/include/mmcconf.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h
mmc.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\mmc.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\mmc.c
spi.o: C:/icc/include/DM_spi.h C:/icc/include/libtypes.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h
spi.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\spi.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\spi.c
TFT.o: C:/icc/include/BMP_TFT.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/math.h C:/icc/include/iom128v.h C:/icc/include/ascii8x16.h C:/icc/include/GB2312.h
TFT.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\TFT.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\TFT.c
EEPROM.o: C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/iom128v.h
EEPROM.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\EEPROM.C
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\EEPROM.C
uart.o: C:/icc/include/stdio.h C:/icc/include/stdarg.h C:/icc/include/_const.h C:/icc/include/string.h C:/icc/include/_const.h C:/icc/include/iom128v.h
uart.o:	E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\uart.c
	$(CC) -c $(CFLAGS) E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\uart.c
