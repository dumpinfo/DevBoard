NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       0090  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0090   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0090  __idata_start
       00A0  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A0   0644 =   1604. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0050  __text_start
       0050  __start
       0072  _exit
       0073  _delay_1us
       007A  _delay_3us
       0090  _delay_10us
       0093  _delay_50us
       0097  _delay_100us
       0099  _delay_n100us
       00A4  _delay_1ms
       00AE  _delay_nms
       00BD  _delay_ns
       00CA  _System_Init
       00D2  _Display_DS18B20
       0133  _DS18B20_Reset
       0147  _DS18B20_Read_byte
       015E  _ds1820_write_byte
       0173  _ds1820_start
       0178  _DS18B20_Read_temp
       01BA  _data_do
       01E0  _main
       0205  push_arg4
       0207  push_arg2
       020A  mod16u
       020C  div16u
       020D  xdiv16u
       0226  elpm32
       023A  neg32
       0243  fpint
       026F  uint2fp
       0271  int2fp
       027A  ulong2fp
       027C  long2fp
       028F  unpacks
       0297  tstR16_R19
       029F  unpacku
       02B4  normalize_and_pack
       02E2  pack
       02EC  fpneg
       02F3  fpneg2
       02F9  saveR8toR25
       0308  restoreR8toR25
       0317  fpmule
       0367  fpmule2
       0372  __text_end

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

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
DS18B20.o	[ DS18B20.C ]
<library>	[ asave.s, div16u.s, elpm32.s, lneg.s, fpint.s, int2fp.s, fputil.s, fpmule.s, fpmule2.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

