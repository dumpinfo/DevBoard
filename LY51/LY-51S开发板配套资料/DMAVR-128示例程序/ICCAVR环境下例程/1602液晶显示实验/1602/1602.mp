NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0017 =     23. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       00A3  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A4   0294 =    660. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0052  __start
       0052  __text_start
       0074  _exit
       0075  _delay_1us
       007C  _delay_3us
       0092  _delay_10us
       0095  _delay_50us
       0099  _delay_100us
       009B  _delay_n100us
       00A6  _delay_1ms
       00B0  _delay_nms
       00BF  _delay_ns
       00CC  _system_init
       00DA  _LCD_write_com
       00F6  _LCD_write_data
       0112  _LCD_clear
       0117  _LCD_write_str
       0132  _LCD_write_char
       0144  _LCD_init
       0162  _main
       018E  push_xgsetF00C
       0195  pop_xgsetF00C
       019C  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0017 =     23. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0117  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
1602.o	[ _1602.c ]
<library>	[ gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

