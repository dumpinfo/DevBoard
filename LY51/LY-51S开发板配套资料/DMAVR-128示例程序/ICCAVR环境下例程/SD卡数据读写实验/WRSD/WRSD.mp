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
                             lit   008E   0175 =    373. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008E  __lit_start
       0102  __ctype
       0203  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0203   018A =    394. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0203  __idata_start
       038D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   038E   1716 =   5910. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01C7  __text_start
       01C7  __start
       01E9  _exit
       01EA  _delay_1us
       01F1  _delay_3us
       0207  _delay_10us
       020A  _delay_50us
       020E  _delay_100us
       0210  _delay_n100us
       021B  _delay_1ms
       0225  _delay_nms
       0234  _delay_ns
       0241  _LED_Off
       0249  _main
       02EC  _spiInit
       02FC  _spiSendByte
       0300  _spiTransferByte
       0305  _spiTransferWord
       031B  _putchar$device_specific$
       0333  _getchar$device_specific$
       033B  _UART_Init
       0345  _McuInit
       0349  _mmcInit
       0356  _mmcReset
       03A0  _mmcSendCommand
       03BD  _mmcRead
       040D  _mmcWrite
       045D  _mmcCommand
       04A0  _mmcCapacity
       056B  __print
       097B  _strlen
       0987  push_arg4
       0989  push_arg2
       098C  asr16
       0993  mod16u
       0995  div16u
       0996  xdiv16u
       09AF  div32u
       09B1  mod32u
       09B5  div32s
       09B7  mod32s
       09E3  long_div_prolog
       09F6  long_div_epilog
       0A06  tst_R16_R19
       0A0B  tst_R24_R27
       0A10  neg_R24_R27
       0A19  empy16s
       0A29  empy32s
       0A29  empy32u
       0A5D  pop_xgsetF0FC
       0A68  push_xgsetF0FC
       0A6A  push_xgset30FC
       0A6C  push_xgset00FC
       0A6E  push_xgset003C
       0A73  push_xgset300C
       0A78  pop_xgset300C
       0A7D  push_xgsetF00C
       0A84  pop_xgsetF00C
       0A8B  push_xgset303C
       0A92  pop_xgset303C
       0A99  xicallx
       0AA2  neg32
       0AAB  long_prolog
       0AB9  long_epilog
       0AC4  tstzero1
       0ACA  tstzero2
       0AD0  lsl32
       0ADC  lsr32
       0AE8  _cstrlen
       0AF5  _atoi
       0B3B  _itoa
       0BA6  _ltoa
       0C5E  _ultoa
       0CC5  _utoa
       0D05  _isdigit
       0D0F  _islower
       0D19  _isspace
       0D23  _toupper
       0D36  _printf
       0D52  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   018A =    394. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _sectorwr
       0104  _buffer1
       028A  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   028A   0222 =    546. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       028A  _i
       028A  __bss_start
       028C  _SD_Size
       0290  _buffer2
       0490  _spiTransferComplete
       04AA  __textmode
       04AC  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
spi.o	[ spi.c ]
uart.o	[ uart.c ]
mmc.o	[ mmc.c ]
<library>	[ _printf.s, strlen.s, asave.s, asr16.s, div16u.s, div32.s, emul16s.s, emul32.s, gpop5.s, gpush.s, gpushx.s ]
[ gpushz.s, gpusha.s, icallx.s, lneg.s, longutil.s, lsl32.s, lsr32.s, cstrlen.s, atoi.s, itoa.s, ltoa.s ]
[ ultoa.s, utoa.s, isdigit.s, islower.s, isspace.s, ctype.s, toupper.s, printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

