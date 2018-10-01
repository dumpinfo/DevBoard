NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   D000 =  53248. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       008C  _gImage_mmp
       308C  _gImage_ph1
       808C  _gImage_ph2
       D08C  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   D08C   0B0C =   2828. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       D08C  __idata_start
       DB98  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   DB98   0FD8 =   4056. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       6DCC  __text_start
       6DCC  __start
       6DEE  _exit
       6DEF  _delay_1us
       6DF6  _delay_3us
       6E0C  _delay_10us
       6E0F  _delay_50us
       6E13  _delay_100us
       6E15  _delay_n100us
       6E20  _delay_1ms
       6E2A  _delay_nms
       6E39  _delay_ns
       6E46  _DisplayData
       6ECB  _main
       6F16  _McuInit
       6F31  _LCD_WR_REG
       6F5D  _LCD_RD_REG16
       6FD0  _LCD_WR_CMD
       703D  _LCD_WR_Data
       7057  _LCD_WR_DataP
       7063  _LCD_Init
       70EF  _LCD_test
       71DB  _LCD_MM
       720E  _LCD_ph
       724E  _LCD_clear
       729C  _DisplayChar
       7310  _DisplayGB2312
       7379  _DisplayString
       739E  _GUIback
       73CA  _GUIpoint
       73FC  _GUIline
       7495  _GUIfull
       74B8  _plotC
       7515  _GUIcircle
       755E  _abs
       7564  push_arg4
       7566  push_arg2
       7569  empy16s
       7579  pop_xgset00FC
       7580  pop_xgsetF0FC
       758B  push_xgsetF0FC
       758D  push_xgset30FC
       758F  push_xgset00FC
       7591  push_xgset003C
       7596  push_xgset300C
       759B  pop_xgset300C
       75A0  push_xgsetF000
       75A5  pop_xgsetF000
       75AA  push_xgsetF00C
       75B1  pop_xgsetF00C
       75B8  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0B0C =   2828. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       011C  _ascii
       091C  _GB2312
       0BFC  _color
       0C0C  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0C0C   0202 =    514. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0C0C  _postion_y
       0C0C  __bss_start
       0C0D  _postion_x
       0C0E  _RamVar_1
       0E0E  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
TFTTEST.o	[ TFTTEST.C ]
mmp.o	[ mmp.c ]
picture-xin.o	[ picture ]
TFT.o	[ TFT.c ]
<library>	[ abs.s, asave.s, emul16s.s, gpop3.s, gpop5.s, gpush.s, gpushx.s, gpushy.s, gpushz.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

