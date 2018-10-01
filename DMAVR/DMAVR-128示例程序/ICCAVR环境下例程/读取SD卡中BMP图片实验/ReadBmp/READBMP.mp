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
                             lit   0092   0175 =    373. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0092  __lit_start
       0106  __ctype
       0207  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0207   0CDA =   3290. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0207  __idata_start
       0EE1  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0EE2   3D3E =  15678. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0771  __start
       0771  __text_start
       0793  _exit
       0794  _delay_1us
       079B  _delay_3us
       07B1  _delay_10us
       07B4  _delay_50us
       07B8  _delay_100us
       07BA  _delay_n100us
       07C5  _delay_1ms
       07CF  _delay_nms
       07DE  _delay_ns
       07EB  _disp_image
       0A72  _LED_Off
       0A7A  _main
       0B5B  _SD_SizeDisplay
       0C54  _FAT_Init
       0DD5  _FAT_LoadPartCluster
       0E22  _FAT_NextCluster
       0EF4  _CopyDirentruyItem
       0F9A  _WriteFolderCluster
       0FE5  _GetFolderCluster
       107C  _SearchFolder
       1229  _SearchInit
       12BF  _Search
       1497  _mmcInit
       14A4  _mmcReset
       14EE  _mmcSendCommand
       150B  _mmcRead
       155B  _mmcWrite
       15AB  _mmcCommand
       15EE  _mmcCapacity
       16B9  _spiInit
       16C9  _spiSendByte
       16CD  _spiTransferByte
       16D2  _spiTransferWord
       16E8  _McuInit
       1703  _LCD_WR_REG
       172F  _LCD_RD_REG16
       17A2  _LCD_WR_CMD
       180F  _LCD_WR_Data
       1829  _LCD_WR_DataP
       1835  _LCD_Init
       18C5  _LCD_clear
       1913  _DisplayChar
       1987  _DisplayGB2312
       19F0  _DisplayString
       1A15  _GUIback
       1A41  _GUIpoint
       1A73  _GUIline
       1B0C  _GUIfull
       1B2F  _plotC
       1B8C  _GUIcircle
       1BD5  _GUI_sprintf_nu
       1BE9  _GUI_sprintf_chartobit
       1C1D  _GUI_sprintf_chartohex
       1C45  _eeprom_read_byte
       1C51  _eeprom_write_byte
       1C5B  _putchar$device_specific$
       1C73  _getchar$device_specific$
       1C7B  _UART_Init
       1C85  __print
       2095  _abs
       209B  _memcpy
       20A9  _memset
       20B4  _strlen
       20C0  push_arg4
       20C2  push_arg2
       20C5  asr16
       20CC  mod16u
       20CE  div16u
       20CF  xdiv16u
       20E8  div32u
       20EA  mod32u
       20EE  div32s
       20F0  mod32s
       211C  long_div_prolog
       212F  long_div_epilog
       213F  tst_R16_R19
       2144  tst_R24_R27
       2149  neg_R24_R27
       2152  empy16s
       2162  empy32u
       2162  empy32s
       2196  pop_xgset003C
       219B  pop_xgset00FC
       21A2  pop_xgsetF0FC
       21AD  push_xgsetF0FC
       21AF  push_xgset30FC
       21B1  push_xgset00FC
       21B3  push_xgset003C
       21B8  push_xgset300C
       21BD  pop_xgset300C
       21C2  push_xgsetF000
       21C7  pop_xgsetF000
       21CC  push_xgsetF00C
       21D3  pop_xgsetF00C
       21DA  push_xgset303C
       21E1  pop_xgset303C
       21E8  push_xgsetF03C
       21F1  pop_xgsetF03C
       21FA  xicallx
       2203  neg32
       220C  long_prolog
       221A  long_epilog
       2225  tstzero1
       222B  tstzero2
       2231  lsl16
       2238  lsl32
       2244  lsr32
       2250  _cstrlen
       225D  __NewHeap
       227D  _calloc
       229A  _malloc
       22FE  _realloc
       2399  _free
       23B3  _atoi
       23F9  _itoa
       2464  _ltoa
       251C  _ultoa
       2583  _utoa
       25C3  _isdigit
       25CD  _islower
       25D7  _isspace
       25E1  _toupper
       25F4  _printf
       2610  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0CDA =   3290. bytes (rel,con,ram)

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
       0DDA  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0DDA   0056 =     86. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0DDA  _i
       0DDA  __bss_start
       0DDC  FAT.c:SizeQ
       0DDE  FAT.c:SizeB
       0DE0  FAT.c:SizeS
       0DE2  FAT.c:SizeG
       0DE4  _FileInfo
       0DF3  _FAT32_Enable
       0DF4  _RootDirCount
       0DF8  _RootDirSectors
       0DFC  _FirstDirSector
       0E00  _FirstFATSector
       0E04  _SectorsPerClust
       0E06  _FATsectors
       0E08  _BytesPerSector
       0E0A  _FirstDataSector
       0E0E  _FirstDirClust
       0E12  _spiTransferComplete
       0E2C  ___FreeList
       0E2E  __textmode
       0E30  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
FAT.o	[ FAT.c ]
mmc.o	[ mmc.c ]
spi.o	[ spi.c ]
TFT.o	[ TFT.c ]
EEPROM.o	[ EEPROM.C ]
uart.o	[ uart.c ]
<library>	[ _printf.s, abs.s, memcpy.s, memset.s, strlen.s, asave.s, asr16.s, div16u.s, div32.s, emul16s.s, emul32.s ]
[ gpop2.s, gpop3.s, gpop5.s, gpush.s, gpushx.s, gpushy.s, gpushz.s, gpusha.s, gpushb.s, icallx.s, lneg.s ]
[ longutil.s, lsl16.s, lsl32.s, lsr32.s, cstrlen.s, newheap.s, freelist.s, alloc.s, atoi.s, itoa.s, ltoa.s ]
[ ultoa.s, utoa.s, isdigit.s, islower.s, isspace.s, ctype.s, toupper.s, printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

