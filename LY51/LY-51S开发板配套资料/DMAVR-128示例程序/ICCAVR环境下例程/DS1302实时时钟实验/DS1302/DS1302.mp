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
                            text   0094   04A8 =   1192. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004A  __start
       004A  __text_start
       006C  _exit
       006D  _delay_1us
       0074  _delay_3us
       008A  _delay_10us
       008D  _delay_50us
       0091  _delay_100us
       0093  _delay_n100us
       009E  _delay_1ms
       00A8  _delay_nms
       00B7  _delay_ns
       00C4  _system_init
       00D2  _ds1302_write_byte
       00F4  _ds1302_read_byte
       0119  _ds1302_write_time
       0142  _ds1302_read_time
       016A  _ds1302_init
       016F  _LCD_write_com
       018B  _LCD_write_data
       01A7  _LCD_clear
       01AC  _LCD_write_str
       01C7  _LCD_write_char
       01D9  _LCD_init
       01F3  _main
       0290  push_xgsetF00C
       0297  pop_xgsetF00C
       029E  __text_end

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

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
DS1302.o	[ DS1302.C ]
<library>	[ gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

