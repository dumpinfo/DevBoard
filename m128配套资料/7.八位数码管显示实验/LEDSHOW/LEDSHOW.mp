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
                            text   009C   019A =    410. bytes (rel,con,rom)

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
       00D6  _Write_LED
       00F4  _main
       00F9  pop_gset2
       00FC  push_gset5
       00FE  push_gset4
       0100  push_gset3
       0102  push_gset2
       0104  push_gset1
       0107  pop_gset1
       0108  pop
       011B  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _table
       0100  __data_start
       0110  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
LEDSHOW.o	[ LEDSHOW.C ]
<library>	[ gpop2.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

