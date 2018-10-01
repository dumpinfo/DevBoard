NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0115 =    277. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       01A1  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   01A2   058A =   1418. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00D1  __start
       00D1  __text_start
       00F1  _exit
       00F2  _delay_1us
       00F9  _delay_3us
       010F  _delay_10us
       0113  _delay_50us
       0118  _delay_100us
       011B  _delay_n100us
       0128  _delay_1ms
       0133  _delay_nms
       0142  _delay_ns
       0151  _system_init
       015F  _LCD_write_com
       017D  _LCD_write_data
       019B  _LCD_clear
       01A1  _LCD_write_char
       01B3  _LCD_write_str
       01CF  _LCD_init
       01E9  _ps2_init
       01F8  _Decode
       0288  _get_code
       02A0  _INT0_ISR
       0314  _main
       0330  asr16
       0337  pop_gset2
       033A  pop_gset3
       033D  push_gset5
       033F  push_gset4
       0341  push_gset3
       0343  push_gset2
       0345  push_gset1
       0348  pop_gset1
       0349  pop
       035C  push_lset
       0373  pop_lset
       038A  lsr32
       0396  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0115 =    277. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _unshifted
       0182  _shifted
       0204  _key_value
       0205  _up
       0206  _shift
       0215  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0215   0007 =      7. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0215  __bss_start
       0215  _finish
       0216  _data
       021A  _data2
       021B  _bitcount
       021C  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0008 =      8. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
PS2.o	[ PS2.C ]
<library>	[ asr16.s, gpop2.s, gpop3.s, gpush.s, lpush.s, lsr32.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

