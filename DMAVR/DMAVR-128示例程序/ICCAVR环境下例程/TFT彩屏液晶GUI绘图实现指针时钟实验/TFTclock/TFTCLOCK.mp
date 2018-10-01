NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   004C =     76. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       00D8  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00D8   0AE8 =   2792. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00D8  __idata_start
       0BC0  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0BC0   256C =   9580. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       05E0  __text_start
       05E0  __start
       0602  _exit
       0603  _ds1302_write_byte
       0625  _ds1302_read_byte
       064A  _ds1302_write_time
       0673  _ds1302_read_time
       069B  _ds1302_init
       06A0  _delay_1us
       06A7  _delay_3us
       06BD  _delay_10us
       06C0  _delay_50us
       06C4  _delay_100us
       06C6  _delay_n100us
       06D1  _delay_1ms
       06DB  _delay_nms
       06EA  _delay_ns
       06F7  _GUIclock
       07FF  _TimeGet
       085E  _DisplayData
       08F5  _main
       0EAC  _McuInit
       0EC7  _LCD_WR_REG
       0EF3  _LCD_RD_REG16
       0F66  _LCD_WR_CMD
       0FD3  _LCD_WR_Data
       0FED  _LCD_WR_DataP
       0FF9  _LCD_Init
       1085  _LCD_clear
       10D3  _DisplayChar
       1147  _DisplayGB2312
       11B0  _DisplayString
       11D5  _GUIback
       1201  _GUIpoint
       1233  _GUIline
       12CC  _GUIfull
       12EF  _plotC
       134C  _GUIcircle
       1395  _abs
       139B  push_arg4
       139D  push_arg2
       13A0  mod16s
       13A4  div16s
       13BE  mod16u
       13C0  div16u
       13C1  xdiv16u
       13DA  elpm32
       13EE  empy16s
       13FE  pop_xgset00FC
       1405  pop_xgsetF0FC
       1410  push_xgsetF0FC
       1412  push_xgset30FC
       1414  push_xgset00FC
       1416  push_xgset003C
       141B  push_xgset300C
       1420  pop_xgset300C
       1425  push_xgsetF00C
       142C  pop_xgsetF00C
       1433  neg32
       143C  fpsub
       143E  fpadd
       143F  fpadd_alt
       14A4  fpadd2
       14AF  fpadd2x
       14BD  fpsub1
       14C7  fpsub2
       14D2  fpsub2x
       14E0  fpint
       150C  uint2fp
       150E  int2fp
       1517  ulong2fp
       1519  long2fp
       152C  fpdiv1
       1535  fpdiv2
       153F  fpdiv1x
       154B  fpdiv2x
       15DC  unpacks
       15E4  tstR16_R19
       15EC  unpacku
       1601  normalize_and_pack
       162F  pack
       1639  fpneg
       1640  fpneg2
       1646  saveR8toR25
       1655  restoreR8toR25
       1664  fpmule
       16B4  fpmule1
       16BE  fpmule2
       16C9  fpmule2x
       16D7  fpcmp
       16E4  fpcmp1
       16EF  fpcmp2
       16FB  _cosf
       1724  _floorf
       1785  _sinus
       186D  _sinf
       1896  __text_end

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

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
DS1302.o	[ DS1302.c ]
main.o	[ main.c ]
TFT.o	[ TFT.c ]
<library>	[ abs.s, asave.s, div16s.s, div16u.s, elpm32.s, emul16s.s, gpop3.s, gpop5.s, gpush.s, gpushx.s, gpushz.s ]
[ lneg.s, fpadd.s, fpadd2.s, fpadd2x.s, fpsub1.s, fpsub2.s, fpsub2x.s, fpint.s, int2fp.s, fpdiv_new.s ]
[ fputil.s, fpmule.s, fpmule1.s, fpmule2.s, fpmule2x.s, fpcmp.s, fpcmp1.s, fpcmp2.s, cosf.s, floorf.s ]
[ sinf.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

