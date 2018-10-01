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
                            text   009C   0234 =    564. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004E  __start
       004E  __text_start
       006E  _exit
       006F  _delay_1us
       0076  _delay_3us
       008C  _delay_10us
       0090  _delay_50us
       0095  _delay_100us
       0098  _delay_n100us
       00A5  _delay_1ms
       00B0  _delay_nms
       00BF  _delay_ns
       00CE  _System_Init
       00D6  _Display_Key
       00F5  _KeyboardScan
       0121  _main
       0146  pop_gset3
       0149  push_gset5
       014B  push_gset4
       014D  push_gset3
       014F  push_gset2
       0151  push_gset1
       0154  pop_gset1
       0155  pop
       0168  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
2KEY.o	[ _2KEY.C ]
<library>	[ gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

