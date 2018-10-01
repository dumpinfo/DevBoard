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
                           idata   0207   016C =    364. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0207  __idata_start
       0373  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0374   420A =  16906. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01BA  __text_start
       01BA  __start
       01DC  _exit
       01DD  _ReadBlock
       01F0  _WriteBlock
       0203  _CopyBytes
       0219  _CopyWord
       0231  _IsEqual
       024C  _EmptyBytes
       025D  _FATInit
       0289  _ReadBPB
       02C6  _ReadBPB32
       0321  _FATStartSec
       0334  _DirStartSec
       0379  _DataStartSec
       0394  _GetDirSecCount
       03A2  _GetDirStartClus
       03AB  _ClusConvLBA
       03C5  _FATSystemType
       03D5  _ReadFAT
       0400  _Read32FAT
       0445  _WriteFAT
       0480  _Write32FAT
       04D6  _WriteFAT2
       0508  _Write32FAT2
       0559  _GetEmptyDIR
       0593  _GetDirectoryEmptyDIR
       05D1  _GetFileID
       062A  _GetFileID32
       0683  _GetNextFAT
       06A1  _GetNext32FAT
       06F6  _ReadDIR
       072E  _WriteDIR
       0768  _WriteDIR32
       07A2  _WriteDirectoryDIR
       07CE  _WriteDirectoryDIR32
       0808  _GetFileCrtDate
       0823  _GetFileCrtTime
       0841  _CreateDirectoryFile
       08AB  _CreateFile
       094A  _FAT32CreateFile
       09BD  _DelFile
       09D8  _DelFile32
       0A19  _CopyFAT
       0A55  _OperateFile
       0C13  _Operate32File
       0E51  _FormatCard
       0EAD  _FileCountSearch
       0F1C  _delay_1us
       0F23  _delay_3us
       0F39  _delay_10us
       0F3C  _delay_50us
       0F40  _delay_100us
       0F42  _delay_n100us
       0F4D  _delay_1ms
       0F57  _delay_nms
       0F66  _delay_ns
       0F73  _SoundSuccess
       0F83  _main
       1127  _initMMC
       1145  _mmcGoIdle
       11BA  _mmcGetResponse
       11D3  _mmcGetXXResponse
       11EA  _mmcCheckBusy
       1228  _mmcEreaseBlock
       1284  _mmcReadBlock
       1308  _mmcWriteBlock
       1389  _mmcSendCmd
       13C7  _mmcSetBlockLength
       13F6  _mmcReadRegister
       1444  _MMC_ReadCardSize
       156F  _spiInit
       157B  _spiLow
       157F  _spiHigh
       1583  _spiSendByte
       1588  _spiTransferWord
       159E  _putchar$device_specific$
       15B6  _getchar$device_specific$
       15BE  _uartInit
       15C8  __print
       19D8  _strlen
       19E4  push_arg4
       19E6  push_arg2
       19E9  mod16s
       19ED  div16s
       1A07  mod16u
       1A09  div16u
       1A0A  xdiv16u
       1A23  div32u
       1A25  mod32u
       1A29  div32s
       1A2B  mod32s
       1A57  long_div_prolog
       1A6A  long_div_epilog
       1A7A  tst_R16_R19
       1A7F  tst_R24_R27
       1A84  neg_R24_R27
       1A8D  empy16s
       1A9D  empy32u
       1A9D  empy32s
       1AD1  pop_xgset003C
       1AD6  pop_xgset00FC
       1ADD  pop_xgset30FC
       1AE6  pop_xgsetF0FC
       1AF1  push_xgsetF0FC
       1AF3  push_xgset30FC
       1AF5  push_xgset00FC
       1AF7  push_xgset003C
       1AFC  push_xgset300C
       1B01  pop_xgset300C
       1B06  push_xgsetF000
       1B0B  pop_xgsetF000
       1B10  push_xgsetF00C
       1B17  pop_xgsetF00C
       1B1E  push_xgset303C
       1B25  pop_xgset303C
       1B2C  push_xgsetF03C
       1B35  pop_xgsetF03C
       1B3E  xicallx
       1B47  neg32
       1B50  long_prolog
       1B5E  long_epilog
       1B69  tstzero1
       1B6F  tstzero2
       1B75  lsl16
       1B7C  lsl32
       1B88  lsr16
       1B8F  lsr32
       1B9B  asgnblk
       1BB3  _cstrlen
       1BC0  _atoi
       1C06  _itoa
       1C71  _ltoa
       1D29  _strtol
       1E97  _strtoul
       1FC7  _ultoa
       202E  _utoa
       206E  _isdigit
       2078  _islower
       2082  _isspace
       208C  _isupper
       2096  _isxdigit
       20A0  _toupper
       20B3  _tolower
       2160  __scanf
       2279  _printf
       22A2  _scanf
       22BF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   016C =    364. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _DirectoryCount
       0100  __data_start
       0102  _FileCount
       011A  _BlockLength
       011C  _cardSize
       0120  _status
       0121  _timeout
       0123  _numSector
       026C  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   026C   063C =   1596. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       026C  _FAT32_EN
       026C  __bss_start
       026D  _BPB_FSInfo
       026F  _BPB_RootClus
       0273  _BPB_FATSz32
       0277  _BPB_HiddSec
       027B  _BPB_FATSz16
       027D  _BPB_TotSec16
       027F  _BPB_RootEntCnt
       0281  _BPB_NumFATs
       0282  _BPB_RsvdSecCnt
       0284  _BPB_SecPerClus
       0285  _BPB_BytesPerSec
       0287  _BUFFER
       0487  _buffer2
       0687  _buffer1
       0887  _spiTransferComplete
       08A4  __textmode
       08A6  _errno
       08A8  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

D:\PROGRA~1\ICCAVR7.22\lib\crtatmega.o	[ crtatmega.s ]
FAT.o	[ FAT.C ]
main.o	[ main.c ]
SD.o	[ SD.c ]
SPI.o	[ SPI.c ]
uart.o	[ uart.c ]
<library>	[ _printf.s, strlen.s, asave.s, div16s.s, div16u.s, div32.s, emul16s.s, emul32.s, gpop2.s, gpop3.s, gpop4.s ]
[ gpop5.s, gpush.s, gpushx.s, gpushy.s, gpushz.s, gpusha.s, gpushb.s, icallx.s, lneg.s, longutil.s, lsl16.s ]
[ lsl32.s, lsr16.s, lsr32.s, struct.s, cstrlen.s, atoi.s, itoa.s, ltoa.s, strtol.s, strtoul.s, ultoa.s ]
[ utoa.s, isdigit.s, islower.s, isspace.s, isupper.s, isxdigit.s, ctype.s, toupper.s, tolower.s, _scanf.s ]
[ printf.s, scanf.s, textmode.s, errno.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

