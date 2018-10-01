NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0060   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __idata_start
       0061  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0062   01D8 =    472. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0031  __start
       0031  __text_start
       0051  _exit
       0052  _delay_1us
       0059  _delay_3us
       006F  _delay_10us
       0073  _delay_50us
       0078  _delay_100us
       007B  _delay_n100us
       0088  _delay_1ms
       0093  _delay_nms
       00A2  _delay_ns
       00B1  _system_init
       00BA  _SPI_init
       00BD  _main
       00FE  push_gset5
       0100  push_gset4
       0102  push_gset3
       0104  push_gset2
       0106  push_gset1
       0109  pop_gset1
       010A  pop
       011D  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _count
       0060  __data_start
       0061  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0061   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0061  __bss_start
       0061  _da_data2
       0063  _da_data
       0065  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
SPI.o	[ SPI.C ]
<library>	[ gpush.s ]

User Global Definitions

ram_end = 0xfff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x60
data = 0x60
eeprom:1.4096

