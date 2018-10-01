NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0060   017A =    378. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0030  __start
       0030  __text_start
       0050  _exit
       0051  _delay_1us
       0058  _delay_3us
       006E  _delay_10us
       0072  _delay_50us
       0077  _delay_100us
       007A  _delay_n100us
       0087  _delay_1ms
       0092  _delay_nms
       00A1  _delay_ns
       00B0  _system_init
       00B8  _timer0_init
       00C0  _TIMER0_ISR
       00C9  _main
       00CE  push_gset5
       00D0  push_gset4
       00D2  push_gset3
       00D4  push_gset2
       00D6  push_gset1
       00D9  pop_gset1
       00DA  pop
       00ED  __text_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0044 =     68. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
PWM.o	[ PWM.C ]
<library>	[ gpush.s ]

User Global Definitions

ram_end = 0xfff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x60
data = 0x60
eeprom:1.4096

