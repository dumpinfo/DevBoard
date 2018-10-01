NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0044 =     68. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       00D0  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00D0   0238 =    568. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __start
       0068  __text_start
       008A  _exit
       008B  _delay_1us
       0092  _delay_3us
       00A8  _delay_10us
       00AB  _delay_50us
       00AF  _delay_100us
       00B1  _delay_n100us
       00BC  _delay_1ms
       00C6  _delay_nms
       00D5  _delay_ns
       00E2  _system_init
       00F2  _LCD_write_com
       010E  _LCD_write_data
       012A  _LCD_clear
       012F  _DisplayCgrom
       0147  _Display
       0157  _LCD_init
       0170  _main
       017A  push_xgset300C
       017F  pop_xgset300C
       0184  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0044 =     68. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0144  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
12864HANZI.o	[ _12864HANZI.C ]
<library>	[ gpushx.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

