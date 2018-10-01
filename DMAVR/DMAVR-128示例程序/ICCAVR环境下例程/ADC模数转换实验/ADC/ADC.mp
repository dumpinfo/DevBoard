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
                            text   009C   0370 =    880. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004E  __start
       004E  __text_start
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
       00D0  _Display_ADC
       0139  _adc_init
       0140  _data_do
       017B  _ADC_ISR
       01C5  _main
       01CA  mod16u
       01CC  div16u
       01CD  xdiv16u
       01E6  empy16s
       01F6  pop_xgset003C
       01FB  push_xgsetF0FC
       01FD  push_xgset30FC
       01FF  push_xgset00FC
       0201  push_xgset003C
       0206  __text_end

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
                             bss   0110   0008 =      8. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0110  __bss_start
       0110  _j
       0111  _flag
       0112  _A4
       0113  _A3
       0114  _A2
       0115  _A1
       0116  _adc_datal
       0117  _adc_datah
       0118  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0058 =     88. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
ADC.o	[ ADC.C ]
<library>	[ div16u.s, emul16s.s, gpop2.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

