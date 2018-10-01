NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0011 =     17. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       009D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   009E   0300 =    768. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004F  __start
       004F  __text_start
       0071  _exit
       0072  _delay_1us
       0079  _delay_3us
       008F  _delay_10us
       0092  _delay_50us
       0096  _delay_100us
       0098  _delay_n100us
       00A3  _delay_1ms
       00AD  _delay_nms
       00BC  _delay_ns
       00C9  _system_init
       00D4  _Display_Key
       00EB  _Key_Icode
       0168  _Red_Code
       01BC  _main
       01C1  push_xgsetF00C
       01C8  pop_xgsetF00C
       01CF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _code_value
       0100  __data_start
       0101  _table
       0111  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0111   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0111  __bss_start
       0111  _p
       0113  _l
       0115  _key_code
       0119  _A
       011B  _temp
       011D  _temp_value
       011F  _key
       0120  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

D:\PROGRA~1\ICCAVR7.22\lib\crtatmega.o	[ crtatmega.s ]
RedCtrl.o	[ RedCtrl.c ]
<library>	[ gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

