NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   0400 =   1024. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       048C  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   048C   03DA =    986. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0246  __text_start
       0246  __start
       0266  _exit
       0267  _delay_1us
       026E  _delay_3us
       0284  _delay_10us
       0288  _delay_50us
       028D  _delay_100us
       0290  _delay_n100us
       029D  _delay_1ms
       02A8  _delay_nms
       02B7  _delay_ns
       02C6  _system_init
       02DB  _LCD_write_com
       02F9  _LCD_write_data
       0317  _LCD_clear
       031D  _DisplayCgrom
       0336  _LCD_init
       034B  _Display_photo1
       039F  _Display_photo2
       03EE  _main
       03FE  empy16s
       040E  pop_gset2
       0411  pop_gset3
       0414  push_gset5
       0416  push_gset4
       0418  push_gset3
       041A  push_gset2
       041C  push_gset1
       041F  pop_gset1
       0420  pop
       0433  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0400 =   1024. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _photo3
       0100  __data_start
       0300  _photo4
       0500  __data_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
12864TUXING.o	[ _12864TUXING.C ]
<library>	[ emul16s.s, gpop2.s, gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

