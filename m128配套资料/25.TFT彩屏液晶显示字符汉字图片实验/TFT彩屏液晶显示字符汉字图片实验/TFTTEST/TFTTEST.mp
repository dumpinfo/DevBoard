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
                            text   DB98   0FCE =   4046. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       6DCC  __start
       6DCC  __text_start
       6DEC  _exit
       6DED  _delay_1us
       6DF4  _delay_3us
       6E0A  _delay_10us
       6E0E  _delay_50us
       6E13  _delay_100us
       6E16  _delay_n100us
       6E23  _delay_1ms
       6E2E  _delay_nms
       6E3D  _delay_ns
       6E4C  _DisplayData
       6ED1  _main
       6F14  _McuInit
       6F2F  _LCD_WR_REG
       6F5B  _LCD_RD_REG16
       6FCE  _LCD_WR_CMD
       703B  _LCD_WR_Data
       7055  _LCD_WR_DataP
       7061  _LCD_Init
       70EE  _LCD_test
       71E5  _LCD_MM
       7219  _LCD_ph
       725A  _LCD_clear
       72A9  _DisplayChar
       7315  _DisplayGB2312
       7381  _DisplayString
       73A8  _GUIback
       73D5  _GUIpoint
       7407  _GUIline
       74A6  _GUIfull
       74C4  _plotC
       7522  _GUIcircle
       756D  _abs
       7573  push_arg4
       7575  push_arg2
       7578  empy16s
       7588  pop_gset2
       758B  pop_gset3
       758E  pop_gset4
       7591  pop_gset5
       7594  push_gset5
       7596  push_gset4
       7598  push_gset3
       759A  push_gset2
       759C  push_gset1
       759F  pop_gset1
       75A0  pop
       75B3  __text_end

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

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
TFTTEST.o	[ TFTTEST.C ]
mmp.o	[ mmp.c ]
picture-xin.o	[ picture ]
TFT.o	[ TFT.c ]
<library>	[ abs.s, asave.s, emul16s.s, gpop2.s, gpop3.s, gpop4.s, gpop5.s, gpush.s ]

User Global Definitions

ram_end = 0x105f
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

