/*************************************************************************
//				SPI初始化配置及操作函数
*************************************************************************/
#include <avr/io.h>
#include <avr/interrupt.h>

volatile uchar spiTransferComplete;

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
#ifdef __AVR_ATmega128__
	// setup SPI I/O pins
	sbi(PORTB, 1);	// set SCK hi
	sbi(DDRB, 1);	// set SCK as output
	cbi(DDRB, 3);	// set MISO as input
	sbi(DDRB, 2);	// set MOSI as output
	sbi(DDRB, 0);	// SS must be output for Master mode to work
	sbi(PORTB,0);   // set SS hi
#elif __AVR_ATmega8__
    // setup SPI I/O pins
    sbi(PORTB, 5);  // set SCK hi
    sbi(DDRB, 5);   // set SCK as output
    cbi(DDRB, 4);   // set MISO as input
    sbi(DDRB, 3);   // set MOSI as output
    sbi(DDRB, 2);   // SS must be output for Master mode to work
#else
	// setup SPI I/O pins
	sbi(PORTB, 7);	// set SCK hi
	sbi(DDRB, 7);	// set SCK as output
	cbi(DDRB, 6);	// set MISO as input
	sbi(DDRB, 5);	// set MOSI as output
	sbi(DDRB, 4);	// SS must be output for Master mode to work
#endif
	
	// setup SPI interface :
	// master mode
	sbi(SPCR, MSTR);

	cbi(SPCR, SPR0);
	sbi(SPCR, SPR1);
	// select clock phase positive-going in middle of data
	cbi(SPCR, CPOL);
	// Data order MSB first
	cbi(SPCR,DORD);
	// enable SPI
	sbi(SPCR, SPE);
		
	// clear status
	inb(SPSR);
	spiTransferComplete = TRUE;

	// enable SPI interrupt
	#ifdef SPI_USEINT
	sbi(SPCR, SPIE);
	#endif
}

void spiSendByte(uchar data)
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

uchar spiTransferByte(uchar data)
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

uint spiTransferWord(uint data)
{
	uint rxData = 0;

	// send MS byte of given data
	rxData = (spiTransferByte((data>>8) & 0x00FF))<<8;
	// send LS byte of given data
	rxData |= (spiTransferByte(data & 0x00FF));

	// return the received data
	return rxData;
}
