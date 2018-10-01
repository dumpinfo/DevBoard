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
       008E  __ctype
       0203  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0203   004A =     74. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0203  __idata_start
       024D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   024E   0664 =   1636. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0127  __text_start
       0127  __start
       0149  _exit
       014A  _delay_1us
       0151  _delay_3us
       0167  _delay_10us
       016A  _delay_50us
       016E  _delay_100us
       0170  _delay_n100us
       017B  _delay_1ms
       0185  _delay_nms
       0194  _delay_ns
       01A1  _putchar$device_specific$
       01B9  _getchar$device_specific$
       01C1  _UART_Init
       01CB  _LED_Off
       01D3  _main
       01E8  push_arg4
       01EA  push_arg2
       01ED  mod16u
       01EF  div16u
       01F0  xdiv16u
       0209  pop_xgsetF0FC
       0214  push_xgsetF0FC
       0216  push_xgset30FC
       0218  push_xgset00FC
       021A  push_xgset003C
       021F  xicallx
       0228  _itoa
       0293  _utoa
       02D3  _islower
       02DD  _toupper
       02F0  __print
       043D  _printf
       0459  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   004A =     74. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       014A  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   014A   001B =     27. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       014A  __bss_start
       0163  __textmode
       0165  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
USART.o	[ USART.c ]
<library>	[ asave.s, div16u.s, gpop5.s, gpush.s, icallx.s, itoa.s, utoa.s, islower.s, ctype.s, toupper.s, _printf.s ]
[ printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

