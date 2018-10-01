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
                            text   009E   034C =    844. bytes (rel,con,rom)

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
       00D1  _timer0_init
       00D9  _data_do
       0101  _Display_Timer0
       015E  _TIMER0_ISR
       01B1  _main
       01BB  mod16s
       01BF  div16s
       01D9  mod16u
       01DB  div16u
       01DC  xdiv16u
       01F5  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _table
       0100  __data_start
       0110  _time_1s_count
       0111  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0111   0008 =      8. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0111  __bss_start
       0111  _A3
       0113  _A2
       0115  _A1
       0117  _second
       0119  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0044 =     68. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
TIMER0.o	[ TIMER0.C ]
<library>	[ div16s.s, div16u.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

