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
                            text   009C   0212 =    530. bytes (rel,con,rom)

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
       00D9  _Display_Key
       00F8  _Interrupt_Init
       0101  _INT0_ISR
       0117  _INT1_ISR
       012C  _main
       0135  pop_gset3
       0138  push_gset5
       013A  push_gset4
       013C  push_gset3
       013E  push_gset2
       0140  push_gset1
       0143  pop_gset1
       0144  pop
       0157  __text_end

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
       0110  _count
       0110  __bss_start
       0111  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   000C =     12. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
INTKEY.o	[ INTKEY.C ]
<library>	[ gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

