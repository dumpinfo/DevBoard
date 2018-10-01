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
                           idata   018F   0109 =    265. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       018F  __idata_start
       0298  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0298   078C =   1932. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       014C  __start
       014C  __text_start
       016C  _exit
       016D  _delay_1us
       0174  _delay_3us
       018A  _delay_10us
       018E  _delay_50us
       0193  _delay_100us
       0196  _delay_n100us
       01A3  _delay_1ms
       01AE  _delay_nms
       01BD  _delay_ns
       01CC  _putchar
       01E6  _getchar
       01EE  _UART_Init
       01F8  _LED_Off
       0200  _main
       0215  __print
       03BB  _strcpy
       03C4  push_arg4
       03C6  push_arg2
       03C9  mod16s
       03CD  div16s
       03E7  mod16u
       03E9  div16u
       03EA  xdiv16u
       0403  pop_gset4
       0406  pop_gset5
       0409  push_gset5
       040B  push_gset4
       040D  push_gset3
       040F  push_gset2
       0411  push_gset1
       0414  pop_gset1
       0415  pop
       0428  xicall
       0431  __va_start
       043A  _itoa
       0493  _utoa
       04CF  _islower
       04DD  _toupper
       04F4  _printf
       0512  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0109 =    265. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0209  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0209   001B =     27. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0209  __bss_start
       0222  __textmode
       0224  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
USART.o	[ USART.c ]
<library>	[ _printf.s, strcpy.s, asave.s, div16s.s, div16u.s, gpop4.s, gpop5.s, gpush.s, icall.s, stdarg.s, itoa.s ]
[ utoa.s, islower.s, ctype.s, toupper.s, printf.s, textmode.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

