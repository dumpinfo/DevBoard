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
                            text   00D0   028E =    654. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __start
       0068  __text_start
       0088  _exit
       0089  _delay_1us
       0090  _delay_3us
       00A6  _delay_10us
       00AA  _delay_50us
       00AF  _delay_100us
       00B2  _delay_n100us
       00BF  _delay_1ms
       00CA  _delay_nms
       00D9  _delay_ns
       00E8  _system_init
       00FD  _LCD_write_com
       011B  _LCD_write_data
       0139  _LCD_clear
       013F  _DisplayCgrom
       0158  _Display
       0169  _LCD_init
       0183  _main
       018D  pop_gset2
       0190  push_gset5
       0192  push_gset4
       0194  push_gset3
       0196  push_gset2
       0198  push_gset1
       019B  pop_gset1
       019C  pop
       01AF  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
12864HANZI.o	[ _12864HANZI.C ]
<library>	[ gpop2.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

