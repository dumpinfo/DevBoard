//SPI接口驱动程序，采用开源的第三方库函数
//忠兴电子元件店略作修改
#include "DM_spi.h"
#include <string.h>
#include <stdio.h>
#include <iom128v.h>

#define   set(x)                (1<<(x))
#define   sbi(temp,x)    		temp|=(1<<(x))
#define   clr(x)                (~(1<<(x)))
#define   cbi(temp,x)     		temp&=~(1<<(x))

#define	outb(addr, data)	addr = (data)
#define	inb(addr)			(addr)
#define	outw(addr, data)	addr = (data)
#define	inw(addr)			(addr)


volatile u08 spiTransferComplete;

// SPI interrupt service handler
#ifdef SPI_USEINT
SIGNAL(SIG_SPI)
{
	spiTransferComplete = TRUE;
}
#endif

// access routines
void spiInit()
{
	// setup SPI I/O pins
	sbi(PORTB, 1);	// set SCK hi
	sbi(DDRB, 1);	// set SCK as output
	cbi(DDRB, 3);	// set MISO as input
	sbi(DDRB, 2);	// set MOSI as output
	sbi(DDRB, 0);	// SS must be output for Master mode to work
	sbi(PORTB,0);   // set SS hi
	
	// setup SPI interface :
	// master mode
	sbi(SPCR, MSTR);
	// clock = f/4
//	cbi(SPCR, SPR0);
//	cbi(SPCR, SPR1);
	// clock = f/16
	cbi(SPCR, SPR0);
	sbi(SPCR, SPR1);
	// select clock phase positive-going in middle of data
	cbi(SPCR, CPOL);
	// Data order MSB first
	cbi(SPCR,DORD);
	// enable SPI
	sbi(SPCR, SPE);
		
	
	// some other possible configs
	//outp((1<<MSTR)|(1<<SPE)|(1<<SPR0), SPCR );
	//outp((1<<CPHA)|(1<<CPOL)|(1<<MSTR)|(1<<SPE)|(1<<SPR0)|(1<<SPR1), SPCR );
	//outp((1<<CPHA)|(1<<MSTR)|(1<<SPE)|(1<<SPR0), SPCR );
	
	// clear status
	inb(SPSR);
	spiTransferComplete = TRUE;

	// enable SPI interrupt
	#ifdef SPI_USEINT
	sbi(SPCR, SPIE);
	#endif
}
/*
void spiSetBitrate(u08 spr)
{
	outb(SPCR, (inb(SPCR) & ((1<<SPR0)|(1<<SPR1))) | (spr&((1<<SPR0)|(1<<SPR1)))));
}
*/
void spiSendByte(u08 data)
{
	// send a byte over SPI and ignore reply
	#ifdef SPI_USEINT
		while(!spiTransferComplete);
		spiTransferComplete = FALSE;
	#else
		while(!(inb(SPSR) & (1<<SPIF)));
	#endif

	outb(SPDR, data);
}

u08 spiTransferByte(u08 data)
{
	#ifdef SPI_USEINT
	// send the given data
	spiTransferComplete = FALSE;
	outb(SPDR, data);
	// wait for transfer to complete
	while(!spiTransferComplete);
	#else
	// send the given data
	outb(SPDR, data);
	// wait for transfer to complete
	while(!(inb(SPSR) & (1<<SPIF)));
	#endif
	// return the received data
	return inb(SPDR);
}

u16 spiTransferWord(u16 data)
{
	u16 rxData = 0;

	// send MS byte of given data
	rxData = (spiTransferByte((data>>8) & 0x00FF))<<8;
	// send LS byte of given data
	rxData |= (spiTransferByte(data & 0x00FF));

	// return the received data
	return rxData;
}
