NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0015 =     21. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       00A1  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A2   0522 =   1314. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0051  __text_start
       0051  __start
       0073  _exit
       0074  _delay_1us
       007B  _delay_3us
       0091  _delay_10us
       0094  _delay_50us
       0098  _delay_100us
       009A  _delay_n100us
       00A5  _delay_1ms
       00AF  _delay_nms
       00BE  _delay_ns
       00CB  _system_init
       00E0  _ds1302_write_byte
       0102  _ds1302_read_byte
       0127  _ds1302_write_time
       0150  _ds1302_read_time
       0178  _ds1302_init
       017D  _LCD_write_com
       0199  _LCD_write_data
       01B5  _LCD_write_char
       01CA  _LCD_clear
       01CF  _DisplayCgrom
       01E7  _Display
       01EB  _LCD_init
       0204  _main
       02CA  push_xgset300C
       02CF  pop_xgset300C
       02D4  push_xgset303C
       02DB  pop_xgset303C
       02E2  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0015 =     21. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _time_buf
       0115  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

D:\PROGRA~1\ICCAVR7.22\lib\crtatmega.o	[ crtatmega.s ]
12864time.o	[ _12864time.c ]
<library>	[ gpushx.s, gpusha.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

