NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0082 =    130. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       010E  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   010E   0170 =    368. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0087  __start
       0087  __text_start
       00A9  _exit
       00AA  _delay_1us
       00B1  _delay_3us
       00C7  _delay_10us
       00CA  _delay_50us
       00CE  _delay_100us
       00D0  _delay_n100us
       00DB  _delay_1ms
       00E5  _delay_nms
       00F4  _delay_ns
       0101  _system_init
       0109  _timer0_init
       0111  _TIMER0_ISR
       013A  _main
       013F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0082 =    130. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _auc_SinParam
       0180  _x_SW
       0181  _X_LUT
       0182  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0044 =     68. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
PWM_CON.o	[ PWM_CON.C ]
<library>	

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

