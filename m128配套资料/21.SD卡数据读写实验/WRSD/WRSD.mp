NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   008C   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __func_lit_start
       008E  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008E   0101 =    257. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008E  __lit_start
       008E  __ctype
       018F  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   018F   028D =    653. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       018F  __idata_start
       041C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   041C   194E =   6478. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       020E  __text_start
       020E  __start
       022E  _exit
       022F  _delay_1us
       0236  _delay_3us
       024C  _delay_10us
       0250  _delay_50us
       0255  _delay_100us
       0258  _delay_n100us
       0265  _delay_1ms
       0270  _delay_nms
       027F  _delay_ns
       028E  _LED_Off
       0296  _main
       0339  _spiInit
       0349  _spiSendByte
       034D  _spiTransferByte
       0352  _spiTransferWord
       036B  _putchar
       0385  _getchar
       038D  _UART_Init
       0397  _McuInit
       039B  _mmcInit
       03A8  _mmcReset
       03F4  _mmcSendCommand
       0414  _mmcRead
       0466  _mmcWrite
       04B9  _mmcCommand
       0504  _mmcCapacity
       05E3  __print
       0AAE  _strcpy
       0AB7  _strlen
       0AC3  push_arg4
       0AC5  push_arg2
       0AC8  asr16
       0ACF  mod16s
       0AD3  div16s
       0AED  mod16u
       0AEF  div16u
       0AF0  xdiv16u
       0B09  div32u
       0B0B  mod32u
       0B0F  div32s
       0B11  mod32s
       0B3C  long_div_prolog
       0B4F  long_div_epilog
       0B5E  tst_R16_R19
       0B63  tst_R24_R27
       0B68  neg_R16_R19
       0B71  neg_R24_R27
       0B7A  empy16s
       0B8A  empy32s
       0B8A  empy32u
       0BBA  pop_gset2
       0BBD  pop_gset3
       0BC0  pop_gset4
       0BC3  pop_gset5
       0BC6  push_gset5
       0BC8  push_gset4
       0BCA  push_gset3
       0BCC  push_gset2
       0BCE  push_gset1
       0BD1  pop_gset1
       0BD2  pop
       0BE5  xicall
       0BEE  neg32
       0BF7  long_prolog
       0C05  long_epilog
       0C10  tstzero1
       0C16  tstzero2
       0C1C  lsl32
       0C28  lsr32
       0C34  mpy16s
       0C48  __va_start
       0C51  _cstrlen
       0C5E  _atoi
       0CB1  _itoa
       0D0A  _ltoa
       0DA8  _ultoa
       0E1A  _utoa
       0E56  _isdigit
       0E64  _islower
       0E72  _isspace
       0E80  _toupper
       0E97  _printf
       0EB5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   028D =    653. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _sectorwr
       0104  _buffer1
       038D  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   038D   0222 =    546. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       038D  _i
       038D  __bss_start
       038F  _SD_Size
       0393  _buffer2
       0593  _spiTransferComplete
       05AD  __textmode
       05AF  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
spi.o	[ spi.c ]
uart.o	[ uart.c ]
mmc.o	[ mmc.c ]
<library>	[ _printf.s, strcpy.s, strlen.s, asave.s, asr16.s, div16s.s, div16u.s, div32.s, emul16s.s, emul32.s, gpop2.s ]
[ gpop3.s, gpop4.s, gpop5.s, gpush.s, icall.s, lneg.s, longutil.s, lsl32.s, lsr32.s, mpy16s.s, stdarg.s ]
[ cstrlen.s, atoi.s, itoa.s, ltoa.s, ultoa.s, utoa.s, isdigit.s, islower.s, isspace.s, ctype.s, toupper.s ]
[ printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

