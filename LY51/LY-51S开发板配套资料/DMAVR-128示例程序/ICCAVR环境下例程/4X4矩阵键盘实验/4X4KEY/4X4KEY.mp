NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   008C   0020 =     32. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __func_lit_start
       00AC  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00AC   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00AC  __idata_start
       00BC  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00BC   040C =   1036. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       005E  __text_start
       005E  __start
       0080  _exit
       0081  _delay_1us
       0088  _delay_3us
       009E  _delay_10us
       00A1  _delay_50us
       00A5  _delay_100us
       00A7  _delay_n100us
       00B2  _delay_1ms
       00BC  _delay_nms
       00CB  _delay_ns
       00D8  _System_Init
       00DE  _Display_Key
       00FC  _keyboardscan
       01D3  _main
       024C  push_xgset300C
       0251  pop_xgset300C
       0256  push_xgsetF00C
       025D  pop_xgsetF00C
       0264  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _table
       0100  __data_start
       0110  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0110   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0110  __bss_start
       0110  _key
       0111  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
4X4KEY.o	[ _4X4KEY.C ]
<library>	[ gpushx.s, gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

