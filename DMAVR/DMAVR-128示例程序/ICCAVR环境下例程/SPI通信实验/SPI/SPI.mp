NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0001 =      1. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       008D  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   008E   018E =    398. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0047  __start
       0047  __text_start
       0069  _exit
       006A  _delay_1us
       0071  _delay_3us
       0087  _delay_10us
       008A  _delay_50us
       008E  _delay_100us
       0090  _delay_n100us
       009B  _delay_1ms
       00A5  _delay_nms
       00B4  _delay_ns
       00C1  _system_init
       00CA  _SPI_init
       00CD  _main
       010E  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _count
       0100  __data_start
       0101  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0101   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0101  __bss_start
       0101  _da_data2
       0103  _da_data
       0105  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
SPI.o	[ SPI.C ]
<library>	

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

