NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   008C   01E6 =    486. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0046  __text_start
       0046  __start
       0066  _exit
       0067  _delay_1us
       006E  _delay_3us
       0084  _delay_10us
       0088  _delay_50us
       008D  _delay_100us
       0090  _delay_n100us
       009D  _delay_1ms
       00A8  _delay_nms
       00B7  _delay_ns
       00C6  _system_init
       00CA  _DAC_SER
       00EC  _main
       0110  pop_gset3
       0113  push_gset5
       0115  push_gset4
       0117  push_gset3
       0119  push_gset2
       011B  push_gset1
       011E  pop_gset1
       011F  pop
       0132  lsr16
       0139  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0100   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __bss_start
       0100  _da_data
       0102  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
DAC.o	[ DAC.C ]
<library>	[ gpop3.s, gpush.s, lsr16.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

