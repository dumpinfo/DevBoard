NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   005E =     94. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       00EA  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00EA   0AE8 =   2792. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00EA  __idata_start
       0BD2  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0BD2   2C10 =  11280. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       05E9  __start
       05E9  __text_start
       0609  _exit
       060A  _ds1302_write_byte
       062E  _ds1302_read_byte
       0653  _ds1302_write_time
       067D  _ds1302_read_time
       069C  _ds1302_init
       06A1  _delay_1us
       06A8  _delay_3us
       06BE  _delay_10us
       06C2  _delay_50us
       06C7  _delay_100us
       06CA  _delay_n100us
       06D7  _delay_1ms
       06E2  _delay_nms
       06F1  _delay_ns
       0700  _GUIclock
       0808  _TimeGet
       0867  _DisplayData
       08FE  _main
       117B  _McuInit
       1196  _LCD_WR_REG
       11C2  _LCD_RD_REG16
       1235  _LCD_WR_CMD
       12A2  _LCD_WR_Data
       12BC  _LCD_WR_DataP
       12C8  _LCD_Init
       1355  _LCD_clear
       13A4  _DisplayChar
       1410  _DisplayGB2312
       147C  _DisplayString
       14A3  _GUIback
       14D0  _GUIpoint
       1502  _GUIline
       15A1  _GUIfull
       15BF  _plotC
       161D  _GUIcircle
       1668  _abs
       166E  push_arg4
       1670  push_arg2
       1673  mod16s
       1677  div16s
       1691  mod16u
       1693  div16u
       1694  xdiv16u
       16AD  empy16s
       16BD  pop_gset2
       16C0  pop_gset3
       16C3  pop_gset4
       16C6  pop_gset5
       16C9  push_gset5
       16CB  push_gset4
       16CD  push_gset3
       16CF  push_gset2
       16D1  push_gset1
       16D4  pop_gset1
       16D5  pop
       16E8  neg32
       16F1  lpm32
       1705  fp2int
       170E  nojump1
       1713  fp2long
       171A  nojump2
       171C  FTOI
       171E  FTOL
       174D  int2fp
       1753  long2fp
       1758  ITOF
       176C  itof2
       176E  itof3
       177D  save_floatregs
       1788  restore_floatregs
       1793  stk2arg1
       1798  stk2arg0
       179D  float_epilog
       17A4  float_prolog
       17A7  add32fs
       17AA  add32f
       17AF  sub32fs
       17B2  sub32f
       17B7  fret2
       17BE  FSUB
       17BF  FADD
       1804  usub24
       1808  div32fs
       180B  div32f
       182C  fdiv10
       1831  FDIV
       1865  cmp32f
       186A  FLTCP
       1896  mpy32fs
       1899  mpy32f
       189E  FMUL
       18B3  umul24
       18D6  empy32fs
       18D9  empy32f
       18E2  eFMUL
       18FA  eumul24
       1923  neg32fs
       1926  neg32f
       192F  savfacc1
       1932  restorefacc1
       1935  unpackfacc1
       193E  negmant
       1944  maxres
       194B  minres
       1951  ac1toac2
       1957  swapacc
       1963  unpack
       1975  repack
       197D  _cos
       19B2  _floor
       1A44  _sinus
       1BB8  _sin
       1BF1  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0AE8 =   2792. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _time_buf
       0108  _ascii
       0908  _GB2312
       0BE8  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0BE8   0015 =     21. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0BE8  _time_h
       0BE8  __bss_start
       0BE9  _week
       0BEA  _data_dayg
       0BEB  _data_days
       0BEC  _data_monthg
       0BED  _data_months
       0BEE  _data_yearg
       0BEF  _data_years
       0BF0  _data_yearb
       0BF1  _data_yearq
       0BF2  _time_sec
       0BF3  _time_min
       0BF4  _time_hour
       0BF5  _hyi
       0BF6  _hxi
       0BF7  _myi
       0BF8  _mxi
       0BF9  _syi
       0BFA  _sxi
       0BFB  _postion_y
       0BFC  _postion_x
       0BFD  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
DS1302.o	[ DS1302.c ]
main.o	[ main.c ]
TFT.o	[ TFT.c ]
<library>	[ abs.s, asave.s, div16s.s, div16u.s, emul16s.s, gpop2.s, gpop3.s, gpop4.s, gpop5.s, gpush.s, lneg.s, lpm32.s ]
[ fp2int.s, fpint2fp.s, fputil.s, fpadd.s, fpdiv.s, fpcmp.s, fpmul.s, fpemul.s, fpneg.s, fputil2.s, fputil3.s ]
[ cosx.s, floorx.s, sinx.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

