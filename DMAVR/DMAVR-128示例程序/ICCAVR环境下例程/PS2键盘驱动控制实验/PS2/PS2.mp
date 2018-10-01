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
                            text   01A2   054C =   1356. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00D1  __text_start
       00D1  __start
       00F3  _exit
       00F4  _delay_1us
       00FB  _delay_3us
       0111  _delay_10us
       0114  _delay_50us
       0118  _delay_100us
       011A  _delay_n100us
       0125  _delay_1ms
       012F  _delay_nms
       013E  _delay_ns
       014B  _system_init
       0159  _LCD_write_com
       0175  _LCD_write_data
       0191  _LCD_clear
       0196  _LCD_write_char
       01A8  _LCD_write_str
       01C3  _LCD_init
       01DC  _ps2_init
       01EB  _Decode
       027C  _get_code
       0294  _INT0_ISR
       0330  _main
       034C  asr16
       0353  push_xgset300C
       0358  pop_xgset300C
       035D  push_xgsetF00C
       0364  pop_xgsetF00C
       036B  lsr32
       0377  __text_end

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

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
PS2.o	[ PS2.C ]
<library>	[ asr16.s, gpushx.s, gpushz.s, lsr32.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

