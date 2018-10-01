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
                            text   010E   01B8 =    440. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0087  __start
       0087  __text_start
       00A7  _exit
       00A8  _delay_1us
       00AF  _delay_3us
       00C5  _delay_10us
       00C9  _delay_50us
       00CE  _delay_100us
       00D1  _delay_n100us
       00DE  _delay_1ms
       00E9  _delay_nms
       00F8  _delay_ns
       0107  _system_init
       010F  _timer0_init
       0117  _TIMER0_ISR
       013F  _main
       0144  push_gset5
       0146  push_gset4
       0148  push_gset3
       014A  push_gset2
       014C  push_gset1
       014F  pop_gset1
       0150  pop
       0163  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
PWM_CON.o	[ PWM_CON.C ]
<library>	[ gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

