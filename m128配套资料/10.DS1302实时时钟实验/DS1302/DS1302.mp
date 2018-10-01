NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0008 =      8. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       0094  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0094   04E4 =   1252. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004A  __start
       004A  __text_start
       006A  _exit
       006B  _delay_1us
       0072  _delay_3us
       0088  _delay_10us
       008C  _delay_50us
       0091  _delay_100us
       0094  _delay_n100us
       00A1  _delay_1ms
       00AC  _delay_nms
       00BB  _delay_ns
       00CA  _system_init
       00D8  _ds1302_write_byte
       00FC  _ds1302_read_byte
       0121  _ds1302_write_time
       014B  _ds1302_read_time
       016A  _ds1302_init
       016F  _LCD_write_com
       018D  _LCD_write_data
       01AB  _LCD_clear
       01B1  _LCD_write_str
       01CD  _LCD_write_char
       01DF  _LCD_init
       01FA  _main
       0297  pop_gset2
       029A  pop_gset3
       029D  push_gset5
       029F  push_gset4
       02A1  push_gset3
       02A3  push_gset2
       02A5  push_gset1
       02A8  pop_gset1
       02A9  pop
       02BC  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0008 =      8. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _time_buf
       0108  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
DS1302.o	[ DS1302.C ]
<library>	[ gpop2.s, gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

