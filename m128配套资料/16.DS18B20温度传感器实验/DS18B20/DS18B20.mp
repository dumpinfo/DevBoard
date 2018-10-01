NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   0016 =     22. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       00A2  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00A2   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00A2  __idata_start
       00B2  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00B2   087A =   2170. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0059  __start
       0059  __text_start
       0079  _exit
       007A  _delay_1us
       0081  _delay_3us
       0097  _delay_10us
       009B  _delay_50us
       00A0  _delay_100us
       00A3  _delay_n100us
       00B0  _delay_1ms
       00BB  _delay_nms
       00CA  _delay_ns
       00D9  _System_Init
       00E1  _Display_DS18B20
       0141  _DS18B20_Reset
       0157  _DS18B20_Read_byte
       016E  _ds1820_write_byte
       0182  _ds1820_start
       0188  _DS18B20_Read_temp
       021C  _data_do
       0242  _main
       0267  push_arg4
       0269  push_arg2
       026C  mod16u
       026E  div16u
       026F  xdiv16u
       0288  pop_gset2
       028B  push_gset5
       028D  push_gset4
       028F  push_gset3
       0291  push_gset2
       0293  push_gset1
       0296  pop_gset1
       0297  pop
       02AA  neg32
       02B3  lpm32
       02C7  fp2int
       02D0  nojump1
       02D5  fp2long
       02DC  nojump2
       02DE  FTOI
       02E0  FTOL
       030F  int2fp
       0315  long2fp
       031A  ITOF
       032E  itof2
       0330  itof3
       033F  save_floatregs
       034A  restore_floatregs
       0355  stk2arg1
       035A  stk2arg0
       035F  float_epilog
       0366  float_prolog
       0369  add32fs
       036C  add32f
       0371  sub32fs
       0374  sub32f
       0379  fret2
       0380  FSUB
       0381  FADD
       03C6  usub24
       03CA  cmp32f
       03CF  FLTCP
       03FB  empy32fs
       03FE  empy32f
       0407  eFMUL
       041F  eumul24
       0448  savfacc1
       044B  restorefacc1
       044E  unpackfacc1
       0457  negmant
       045D  maxres
       0464  minres
       046A  ac1toac2
       0470  swapacc
       047C  unpack
       048E  repack
       0496  __text_end

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
                             bss   0110   000C =     12. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0110  __bss_start
       0110  _flag1
       0111  _A3
       0113  _A2
       0115  _A1
       0117  _temp
       0119  _temp_value
       011B  _key
       011C  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
DS18B20.o	[ DS18B20.C ]
<library>	[ asave.s, div16u.s, gpop2.s, gpush.s, lneg.s, lpm32.s, fp2int.s, fpint2fp.s, fputil.s, fpadd.s, fpcmp.s ]
[ fpemul.s, fputil2.s, fputil3.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

