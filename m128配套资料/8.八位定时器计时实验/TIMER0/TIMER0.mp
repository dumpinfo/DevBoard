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
                            text   009E   03A8 =    936. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004F  __start
       004F  __text_start
       006F  _exit
       0070  _delay_1us
       0077  _delay_3us
       008D  _delay_10us
       0091  _delay_50us
       0096  _delay_100us
       0099  _delay_n100us
       00A6  _delay_1ms
       00B1  _delay_nms
       00C0  _delay_ns
       00CF  _system_init
       00D7  _timer0_init
       00DF  _data_do
       0107  _Display_Timer0
       0164  _TIMER0_ISR
       018F  _main
       0199  mod16s
       019D  div16s
       01B7  mod16u
       01B9  div16u
       01BA  xdiv16u
       01D3  pop_gset2
       01D6  push_gset5
       01D8  push_gset4
       01DA  push_gset3
       01DC  push_gset2
       01DE  push_gset1
       01E1  pop_gset1
       01E2  pop
       01F5  push_lset
       020C  pop_lset
       0223  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
TIMER0.o	[ TIMER0.C ]
<library>	[ div16s.s, div16u.s, gpop2.s, gpush.s, lpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

