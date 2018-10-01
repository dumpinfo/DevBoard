NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0810 =   2064. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       089C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   089C   0396 =    918. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       044E  __text_start
       044E  __start
       0470  _exit
       0471  _delay_1us
       0478  _delay_3us
       048E  _delay_10us
       0491  _delay_50us
       0495  _delay_100us
       0497  _delay_n100us
       04A2  _delay_1ms
       04AC  _delay_nms
       04BB  _delay_ns
       04C8  _system_init
       04D6  _LCD_write_com
       04F2  _LCD_write_data
       050E  _LCD_clear
       0513  _DisplayCgrom
       052B  _LCD_init
       053F  _Display_photo1
       058A  _Display_photo2
       05D0  _main
       05F1  empy16s
       0601  push_xgset300C
       0606  pop_xgset300C
       060B  push_xgsetF00C
       0612  pop_xgsetF00C
       0619  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0810 =   2064. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _photo1
       0100  __data_start
       0310  _photo2
       0510  _photo3
       0710  _photo4
       0910  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
12864TUXING.o	[ _12864TUXING.C ]
<library>	[ emul16s.s, gpushx.s, gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

