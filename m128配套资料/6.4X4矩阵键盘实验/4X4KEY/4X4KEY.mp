NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   008C   0020 =     32. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __func_lit_start
       00AC  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00AC   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00AC  __idata_start
       00BC  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00BC   045E =   1118. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       005E  __start
       005E  __text_start
       007E  _exit
       007F  _delay_1us
       0086  _delay_3us
       009C  _delay_10us
       00A0  _delay_50us
       00A5  _delay_100us
       00A8  _delay_n100us
       00B5  _delay_1ms
       00C0  _delay_nms
       00CF  _delay_ns
       00DE  _System_Init
       00E6  _Display_Key
       0105  _keyboardscan
       01DC  _main
       0258  empy16s
       0268  pop_gset2
       026B  pop_gset3
       026E  push_gset5
       0270  push_gset4
       0272  push_gset3
       0274  push_gset2
       0276  push_gset1
       0279  pop_gset1
       027A  pop
       028D  __text_end

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
4X4KEY.o	[ _4X4KEY.C ]
<library>	[ emul16s.s, gpop2.s, gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

