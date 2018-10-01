NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0018 =     24. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       00A4  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A4   02DC =    732. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0052  __text_start
       0052  __start
       0072  _exit
       0073  _delay_1us
       007A  _delay_3us
       0090  _delay_10us
       0094  _delay_50us
       0099  _delay_100us
       009C  _delay_n100us
       00A9  _delay_1ms
       00B4  _delay_nms
       00C3  _delay_ns
       00D2  _system_init
       00E0  _LCD_write_com
       00FE  _LCD_write_data
       011C  _LCD_clear
       0122  _LCD_write_str
       013E  _LCD_write_char
       0150  _LCD_init
       016F  _main
       019B  pop_gset2
       019E  pop_gset3
       01A1  push_gset5
       01A3  push_gset4
       01A5  push_gset3
       01A7  push_gset2
       01A9  push_gset1
       01AC  pop_gset1
       01AD  pop
       01C0  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0018 =     24. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0118  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
1602.o	[ _1602.c ]
<library>	[ gpop2.s, gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

