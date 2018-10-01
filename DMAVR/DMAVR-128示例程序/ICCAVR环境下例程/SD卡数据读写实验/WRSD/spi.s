	.module spi.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\spi.c
	.dbfunc e spiInit _spiInit fV
	.even
_spiInit::
	.dbline -1
	.dbline 36
; //SPI接口驱动程序，采用开源的第三方库函数
; //欣世纪电子略作修改
; 
; //#include <avr/io.h>
; //#include <avr/interrupt.h>
; 
; #include "DM_spi.h"
; #include <string.h>
; #include <stdio.h>
; //#include <delay.h>
; #include <iom128v.h>
; 
; #define   set(x)                (1<<(x))
; #define   sbi(temp,x)    		temp|=(1<<(x))
; #define   clr(x)                (~(1<<(x)))
; #define   cbi(temp,x)     		temp&=~(1<<(x))
; 
; #define	outb(addr, data)	addr = (data)
; #define	inb(addr)			(addr)
; #define	outw(addr, data)	addr = (data)
; #define	inw(addr)			(addr)
; 
; 
; volatile u08 spiTransferComplete;
; 
; // SPI interrupt service handler
; #ifdef SPI_USEINT
; SIGNAL(SIG_SPI)
; {
; 	spiTransferComplete = TRUE;
; }
; #endif
; 
; // access routines
; void spiInit()
; {
	.dbline 38
; 	// setup SPI I/O pins
; 	sbi(PORTB, 1);	// set SCK hi
	sbi 0x18,1
	.dbline 39
; 	sbi(DDRB, 1);	// set SCK as output
	sbi 0x17,1
	.dbline 40
; 	cbi(DDRB, 3);	// set MISO as input
	cbi 0x17,3
	.dbline 41
; 	sbi(DDRB, 2);	// set MOSI as output
	sbi 0x17,2
	.dbline 42
; 	sbi(DDRB, 0);	// SS must be output for Master mode to work
	sbi 0x17,0
	.dbline 43
; 	sbi(PORTB,0);   // set SS hi
	sbi 0x18,0
	.dbline 47
; 	
; 	// setup SPI interface :
; 	// master mode
; 	sbi(SPCR, MSTR);
	sbi 0xd,4
	.dbline 52
; 	// clock = f/4
; //	cbi(SPCR, SPR0);
; //	cbi(SPCR, SPR1);
; 	// clock = f/16
; 	cbi(SPCR, SPR0);
	cbi 0xd,0
	.dbline 53
; 	sbi(SPCR, SPR1);
	sbi 0xd,1
	.dbline 55
; 	// select clock phase positive-going in middle of data
; 	cbi(SPCR, CPOL);
	cbi 0xd,3
	.dbline 57
; 	// Data order MSB first
; 	cbi(SPCR,DORD);
	cbi 0xd,5
	.dbline 59
; 	// enable SPI
; 	sbi(SPCR, SPE);
	sbi 0xd,6
	.dbline 68
; 		
; 	
; 	// some other possible configs
; 	//outp((1<<MSTR)|(1<<SPE)|(1<<SPR0), SPCR );
; 	//outp((1<<CPHA)|(1<<CPOL)|(1<<MSTR)|(1<<SPE)|(1<<SPR0)|(1<<SPR1), SPCR );
; 	//outp((1<<CPHA)|(1<<MSTR)|(1<<SPE)|(1<<SPR0), SPCR );
; 	
; 	// clear status
; 	inb(SPSR);
	.dbline 69
; 	spiTransferComplete = TRUE;
	ldi R24,255
	sts _spiTransferComplete,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e spiSendByte _spiSendByte fV
;           data -> R16
	.even
_spiSendByte::
	.dbline -1
	.dbline 83
; 
; 	// enable SPI interrupt
; 	#ifdef SPI_USEINT
; 	sbi(SPCR, SPIE);
; 	#endif
; }
; /*
; void spiSetBitrate(u08 spr)
; {
; 	outb(SPCR, (inb(SPCR) & ((1<<SPR0)|(1<<SPR1))) | (spr&((1<<SPR0)|(1<<SPR1)))));
; }
; */
; void spiSendByte(u08 data)
; {
L3:
	.dbline 89
; 	// send a byte over SPI and ignore reply
; 	#ifdef SPI_USEINT
; 		while(!spiTransferComplete);
; 		spiTransferComplete = FALSE;
; 	#else
; 		while(!(inb(SPSR) & (1<<SPIF)));
L4:
	.dbline 89
	sbis 0xe,7
	rjmp L3
X0:
	.dbline 92
; 	#endif
; 
; 	outb(SPDR, data);
	out 0xf,R16
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbsym r data 16 c
	.dbend
	.dbfunc e spiTransferByte _spiTransferByte fc
;           data -> R16
	.even
_spiTransferByte::
	.dbline -1
	.dbline 96
; }
; 
; u08 spiTransferByte(u08 data)
; {
	.dbline 105
; 	#ifdef SPI_USEINT
; 	// send the given data
; 	spiTransferComplete = FALSE;
; 	outb(SPDR, data);
; 	// wait for transfer to complete
; 	while(!spiTransferComplete);
; 	#else
; 	// send the given data
; 	outb(SPDR, data);
	out 0xf,R16
L7:
	.dbline 107
; 	// wait for transfer to complete
; 	while(!(inb(SPSR) & (1<<SPIF)));
L8:
	.dbline 107
	sbis 0xe,7
	rjmp L7
X1:
	.dbline 110
; 	#endif
; 	// return the received data
; 	return inb(SPDR);
	in R16,0xf
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbsym r data 16 c
	.dbend
	.dbfunc e spiTransferWord _spiTransferWord fs
;         rxData -> R10,R11
;           data -> R20,R21
	.even
_spiTransferWord::
	xcall push_xgset300C
	movw R20,R16
	.dbline -1
	.dbline 114
; }
; 
; u16 spiTransferWord(u16 data)
; {
	.dbline 115
; 	u16 rxData = 0;
	.dbline 118
; 
; 	// send MS byte of given data
; 	rxData = (spiTransferByte((data>>8) & 0x00FF))<<8;
	movw R16,R20
	mov R16,R17
	clr R17
	andi R17,0
	xcall _spiTransferByte
	mov R10,R16
	clr R11
	mov R11,R10
	clr R10
	.dbline 120
; 	// send LS byte of given data
; 	rxData |= (spiTransferByte(data & 0x00FF));
	movw R16,R20
	andi R17,0
	xcall _spiTransferByte
	mov R2,R16
	clr R3
	or R10,R2
	or R11,R3
	.dbline 123
; 
; 	// return the received data
; 	return rxData;
	movw R16,R10
	.dbline -2
L10:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r rxData 10 s
	.dbsym r data 20 s
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\spi.c
_spiTransferComplete::
	.blkb 1
	.dbsym e spiTransferComplete _spiTransferComplete c
; }
