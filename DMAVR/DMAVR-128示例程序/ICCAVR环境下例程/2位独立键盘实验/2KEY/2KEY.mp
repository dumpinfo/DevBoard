NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       009C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   009C   020E =    526. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004E  __text_start
       004E  __start
       0070  _exit
       0071  _delay_1us
       0078  _delay_3us
       008E  _delay_10us
       0091  _delay_50us
       0095  _delay_100us
       0097  _delay_n100us
       00A2  _delay_1ms
       00AC  _delay_nms
       00BB  _delay_ns
       00C8  _System_Init
       00D0  _Display_Key
       00EE  _KeyboardScan
       011A  _main
       013D  push_xgset300C
       0142  pop_xgset300C
       0147  push_xgsetF00C
       014E  pop_xgsetF00C
       0155  __text_end

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
2KEY.o	[ _2KEY.C ]
<library>	[ gpushx.s, gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

