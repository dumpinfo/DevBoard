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
                            text   009C   0332 =    818. bytes (rel,con,rom)

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
       00C8  _system_init
       00D0  _Display_EEPROM
       012D  _data_do
       0155  _eprom_read
       016F  _eprom_write
       018B  _main
       01AD  mod16s
       01B1  div16s
       01CB  mod16u
       01CD  div16u
       01CE  xdiv16u
       01E7  __text_end

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
                             bss   0110   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0110  __bss_start
       0110  _A3
       0112  _A2
       0114  _A1
       0116  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
EEPROM.o	[ EEPROM.C ]
<library>	[ div16s.s, div16u.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

