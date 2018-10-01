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
                            text   009C   03AE =    942. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004E  __text_start
       004E  __start
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
       00CE  _system_init
       00D6  _Display_ADC
       013F  _adc_init
       0146  _data_do
       0182  _ADC_ISR
       01A4  _main
       01A9  mod16u
       01AB  div16u
       01AC  xdiv16u
       01C5  empy16s
       01D5  pop_gset2
       01D8  push_gset5
       01DA  push_gset4
       01DC  push_gset3
       01DE  push_gset2
       01E0  push_gset1
       01E3  pop_gset1
       01E4  pop
       01F7  push_lset
       020E  pop_lset
       0225  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
ADC.o	[ ADC.C ]
<library>	[ div16u.s, emul16s.s, gpop2.s, gpush.s, lpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

