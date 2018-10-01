NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   008C   0006 =      6. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __func_lit_start
       0092  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0092   0101 =    257. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0092  __lit_start
       0092  __ctype
       0193  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0193   0DE3 =   3555. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0193  __idata_start
       0F76  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0F76   4178 =  16760. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       07BB  __text_start
       07BB  __start
       07DB  _exit
       07DC  _delay_1us
       07E3  _delay_3us
       07F9  _delay_10us
       07FD  _delay_50us
       0802  _delay_100us
       0805  _delay_n100us
       0812  _delay_1ms
       081D  _delay_nms
       082C  _delay_ns
       083B  _disp_image
       0AFD  _LED_Off
       0B05  _main
       0BE7  _SD_SizeDisplay
       0CED  _FAT_Init
       0E77  _FAT_LoadPartCluster
       0ECB  _FAT_NextCluster
       0FC2  _CopyDirentruyItem
       106A  _WriteFolderCluster
       10BE  _GetFolderCluster
       1169  _SearchFolder
       1320  _SearchInit
       13BB  _Search
       15AB  _mmcInit
       15B8  _mmcReset
       1604  _mmcSendCommand
       1624  _mmcRead
       1676  _mmcWrite
       16C9  _mmcCommand
       1714  _mmcCapacity
       17F3  _spiInit
       1803  _spiSendByte
       1807  _spiTransferByte
       180C  _spiTransferWord
       1825  _McuInit
       1840  _LCD_WR_REG
       186C  _LCD_RD_REG16
       18DF  _LCD_WR_CMD
       194C  _LCD_WR_Data
       1966  _LCD_WR_DataP
       1972  _LCD_Init
       1A03  _LCD_clear
       1A52  _DisplayChar
       1ABE  _DisplayGB2312
       1B2A  _DisplayString
       1B51  _GUIback
       1B7E  _GUIpoint
       1BB0  _GUIline
       1C4F  _GUIfull
       1C6D  _plotC
       1CCB  _GUIcircle
       1D16  _GUI_sprintf_nu
       1D2A  _GUI_sprintf_chartobit
       1D61  _GUI_sprintf_chartohex
       1D8C  _eeprom_read_byte
       1D9A  _eeprom_write_byte
       1DA4  _putchar
       1DBE  _getchar
       1DC6  _UART_Init
       1DD0  __print
       229B  _abs
       22A1  _memcpy
       22AF  _memset
       22BA  _strcpy
       22C3  _strlen
       22CF  push_arg4
       22D1  push_arg2
       22D4  asr16
       22DB  mod16s
       22DF  div16s
       22F9  mod16u
       22FB  div16u
       22FC  xdiv16u
       2315  div32u
       2317  mod32u
       231B  div32s
       231D  mod32s
       2348  long_div_prolog
       235B  long_div_epilog
       236A  tst_R16_R19
       236F  tst_R24_R27
       2374  neg_R16_R19
       237D  neg_R24_R27
       2386  empy16s
       2396  empy32s
       2396  empy32u
       23C6  pop_gset2
       23C9  pop_gset3
       23CC  pop_gset4
       23CF  pop_gset5
       23D2  push_gset5
       23D4  push_gset4
       23D6  push_gset3
       23D8  push_gset2
       23DA  push_gset1
       23DD  pop_gset1
       23DE  pop
       23F1  xicall
       23FA  neg32
       2403  long_prolog
       2411  long_epilog
       241C  tstzero1
       2422  tstzero2
       2428  lsl16
       242F  lsl32
       243B  lsr32
       2447  mpy16s
       245B  __va_start
       2464  _cstrlen
       2471  __NewHeap
       2491  _calloc
       24AF  _malloc
       253C  _realloc
       2601  _free
       2620  _atoi
       2673  _itoa
       26CC  _ltoa
       276A  _ultoa
       27DC  _utoa
       2818  _isdigit
       2826  _islower
       2834  _isspace
       2842  _toupper
       2859  _printf
       2877  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0DE3 =   3555. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _image_count
       0102  _image_all
       0198  _FAT_ReadSector
       019A  _FAT_WriteSector
       02EA  _ascii
       0AEA  _GB2312
       0DCA  _color
       0EE3  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0EE3   0056 =     86. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0EE3  __bss_start
       0EE3  _i
       0EED  _FileInfo
       0EFC  _FAT32_Enable
       0EFD  _RootDirCount
       0F01  _RootDirSectors
       0F05  _FirstDirSector
       0F09  _FirstFATSector
       0F0D  _SectorsPerClust
       0F0F  _FATsectors
       0F11  _BytesPerSector
       0F13  _FirstDataSector
       0F17  _FirstDirClust
       0F1B  _spiTransferComplete
       0F35  ___FreeList
       0F37  __textmode
       0F39  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
FAT.o	[ FAT.c ]
mmc.o	[ mmc.c ]
spi.o	[ spi.c ]
TFT.o	[ TFT.c ]
EEPROM.o	[ EEPROM.C ]
uart.o	[ uart.c ]
<library>	[ _printf.s, abs.s, memcpy.s, memset.s, strcpy.s, strlen.s, asave.s, asr16.s, div16s.s, div16u.s, div32.s ]
[ emul16s.s, emul32.s, gpop2.s, gpop3.s, gpop4.s, gpop5.s, gpush.s, icall.s, lneg.s, longutil.s, lsl16.s ]
[ lsl32.s, lsr32.s, mpy16s.s, stdarg.s, cstrlen.s, newheap.s, freelist.s, alloc.s, atoi.s, itoa.s, ltoa.s ]
[ ultoa.s, utoa.s, isdigit.s, islower.s, isspace.s, ctype.s, toupper.s, printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

