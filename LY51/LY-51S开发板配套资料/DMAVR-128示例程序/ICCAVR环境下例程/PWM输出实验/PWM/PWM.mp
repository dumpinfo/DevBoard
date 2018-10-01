NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   008C   0130 =    304. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0046  __start
       0046  __text_start
       0068  _exit
       0069  _delay_1us
       0070  _delay_3us
       0086  _delay_10us
       0089  _delay_50us
       008D  _delay_100us
       008F  _delay_n100us
       009A  _delay_1ms
       00A4  _delay_nms
       00B3  _delay_ns
       00C0  _system_init
       00C8  _timer0_init
       00D0  _TIMER0_ISR
       00D9  _main
       00DE  __text_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0044 =     68. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

F:\PROGRA~1\iccavr\lib\crtatmega.o	[ crtatmega.s ]
PWM.o	[ PWM.C ]
<library>	

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

