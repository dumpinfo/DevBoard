	.module mmc.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\WRSD\mmc.c
	.dbfunc e McuInit _McuInit fV
	.even
_McuInit::
	.dbline -1
	.dbline 25
; //SD卡驱动函数，采取网络上开源的第三方库文件
; //欣世纪电子略作修改，由于部分SD卡并非标准SD卡命令，因此可能存在兼容性问题，建议使用金士顿SD卡
; //SD卡片选信号SD_CS在mmcconf.h文件中修改，DMAVR-M128为PG3脚控制SD_CS
; //由于DMAVR-128板载SPI接口同时连接在TLC5615芯片上，因此，初始化时要先将SS管脚拉高，禁止TLC5615芯片
; 
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; #include "libtypes.h"		// include our global settings
; #include "DM_spi.h"			// include spi bus support
; #include "mmc.h"
; #include "mmcconf.h"	   // include project-specific hardware configuration
; #include <stdio.h>
; //#include <delay.h>
; #include <iom128v.h>
; 
; #define   set(x)                (1<<(x))
; #define   sbi(temp,x)    		temp|=(1<<(x))
; #define   clr(x)                (~(1<<(x)))
; #define   cbi(temp,x)     		temp&=~(1<<(x))
; //***********************************************************************
; //			IO口初始化
; //***********************************************************************
; void McuInit()
; {
	.dbline 26
; 	PORTB=0XFF;
	ldi R24,255
	out 0x18,R24
	.dbline 27
; 	DDRB=0XFF;
	out 0x17,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e mmcInit _mmcInit fV
	.even
_mmcInit::
	.dbline -1
	.dbline 37
; 	//sbi(DDRB, 0);	// SS must be output for Master mode to work
; 	//sbi(PORTB,0);   // set SS hi
; 
; }
; 
; //***********************************************************************
; //			SD卡初始化
; //***********************************************************************
; void mmcInit(void)
; {
	.dbline 39
; 	// initialize SPI interface
; 	spiInit();
	xcall _spiInit
	.dbline 41
; 	// release chip select
; 	sbi(MMC_CS_DDR, MMC_CS_PIN);
	lds R24,100
	ori R24,8
	sts 100,R24
	.dbline 42
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e mmcReset _mmcReset fc
;          retry -> R10
;             r1 -> R20
;              i -> R22
	.even
_mmcReset::
	xcall push_xgsetF00C
	sbiw R28,2
	.dbline -1
	.dbline 50
; }
; 
; //***********************************************************************
; //			识别SD卡是否存在
; //***********************************************************************
; 
; u08 mmcReset(void)
; {
	.dbline 53
; 	u08 i;
; 	u08 retry;
; 	u08 r1=0;
	clr R20
	.dbline 55
; 
; 	retry = 0;
	clr R10
L4:
	.dbline 57
; 	do
; 	{
	.dbline 59
; 		// send dummy bytes with CS high before accessing
; 		for(i=0;i<10;i++) spiTransferByte(0xFF);
	clr R22
	xjmp L10
L7:
	.dbline 59
	ldi R16,255
	xcall _spiTransferByte
L8:
	.dbline 59
	inc R22
L10:
	.dbline 59
	cpi R22,10
	brlo L7
X0:
	.dbline 61
; 		// resetting card, go to SPI mode
; 		r1 = mmcSendCommand(MMC_GO_IDLE_STATE, 0);
	ldi R24,0
	ldi R25,0
	ldi R26,0
	ldi R27,0
	std y+0,R26
	std y+1,R27
	movw R18,R24
	clr R16
	xcall _mmcSendCommand
	mov R20,R16
	.dbline 66
; 		#ifdef MMC_DEBUG
; 		//rprintf("MMC_GO_IDLE_STATE: R1=0x%x\r\n", r1);
; 		#endif
; 		// do retry counter
; 		retry++;
	inc R10
	.dbline 67
; 		if(retry>10) return -1;
	ldi R24,10
	cp R24,R10
	brsh L11
X1:
	.dbline 67
	ldi R16,255
	xjmp L3
L11:
	.dbline 68
; 	} while(r1 != 0x01);
L5:
	.dbline 68
	cpi R20,1
	brne L4
X2:
	.dbline 73
; 
; 	// TODO: check card parameters for voltage compliance
; 	// before issuing initialize command
; 
; 	retry = 0;
	clr R10
L13:
	.dbline 75
; 	do
; 	{
	.dbline 77
; 		// initializing card for operation
; 		r1 = mmcSendCommand(MMC_SEND_OP_COND, 0);
	ldi R24,0
	ldi R25,0
	ldi R26,0
	ldi R27,0
	std y+0,R26
	std y+1,R27
	movw R18,R24
	ldi R16,1
	xcall _mmcSendCommand
	mov R20,R16
	.dbline 82
; 		#ifdef MMC_DEBUG
; 		//rprintf("MMC_SEND_OP_COND: R1=0x%x\r\n", r1);
; 		#endif
; 		// do retry counter
; 		retry++;
	inc R10
	.dbline 83
; 		if(retry>100) return -1;
	ldi R24,100
	cp R24,R10
	brsh L16
X3:
	.dbline 83
	ldi R16,255
	xjmp L3
L16:
	.dbline 84
; 	} while(r1);
L14:
	.dbline 84
	tst R20
	brne L13
X4:
	.dbline 87
; 		
; 	// turn off CRC checking to simplify communication
; 	r1 = mmcSendCommand(MMC_CRC_ON_OFF, 0);
	ldi R24,0
	ldi R25,0
	ldi R26,0
	ldi R27,0
	std y+0,R26
	std y+1,R27
	movw R18,R24
	ldi R16,59
	xcall _mmcSendCommand
	.dbline 93
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC_CRC_ON_OFF: R1=0x%x\r\n", r1);
; 	#endif
; 
; 	// set block length to 512 bytes
; 	r1 = mmcSendCommand(MMC_SET_BLOCKLEN, 512);
	ldi R24,0
	ldi R25,2
	ldi R26,0
	ldi R27,0
	std y+0,R26
	std y+1,R27
	movw R18,R24
	ldi R16,16
	xcall _mmcSendCommand
	mov R10,R16
	mov R20,R10
	.dbline 99
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC_SET_BLOCKLEN: R1=0x%x\r\n", r1);
; 	#endif
; 
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L3:
	.dbline 0 ; func end
	adiw R28,2
	xjmp pop_xgsetF00C
	.dbsym r retry 10 c
	.dbsym r r1 20 c
	.dbsym r i 22 c
	.dbend
	.dbfunc e mmcSendCommand _mmcSendCommand fc
;             r1 -> R10
;            arg -> y+3
;            cmd -> R10
	.even
_mmcSendCommand::
	st -y,r19
	st -y,r18
	st -y,R10
	mov R10,R16
	sbiw R28,2
	.dbline -1
	.dbline 107
; }
; 
; //***********************************************************************
; //			发送SD卡命令函数
; //***********************************************************************
; 
; u08 mmcSendCommand(u08 cmd, u32 arg)
; {
	.dbline 111
; 	u08 r1;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 113
; 	// issue the command
; 	r1 = mmcCommand(cmd, arg);
	ldd R2,y+3
	ldd R3,y+4
	ldd R4,y+5
	ldd R5,y+6
	std y+0,R4
	std y+1,R5
	movw R18,R2
	mov R16,R10
	xcall _mmcCommand
	mov R10,R16
	.dbline 115
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 117
; 
; 	return r1;
	.dbline -2
L18:
	.dbline 0 ; func end
	adiw R28,2
	ld R10,y+
	adiw R28,2
	ret
	.dbsym r r1 10 c
	.dbsym l arg 3 l
	.dbsym r cmd 10 c
	.dbend
	.dbfunc e mmcRead _mmcRead fc
;             r1 -> R12
;              i -> R20,R21
;         buffer -> R10,R11
;         sector -> y+8
	.even
_mmcRead::
	xcall push_arg4
	xcall push_xgset303C
	sbiw R28,2
	ldd R10,y+12
	ldd R11,y+13
	.dbline -1
	.dbline 124
; }
; 
; //***********************************************************************
; //			读SD卡数据函数，扇区读，一次512个字节
; //***********************************************************************
; u08 mmcRead(u32 sector, u08* buffer)
; {
	.dbline 129
; 	u08 r1;
; 	u16 i;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 130
; 	for(i=0;i<10;i++) spiTransferByte(0xFF);
	clr R20
	clr R21
	xjmp L23
L20:
	.dbline 130
	ldi R16,255
	xcall _spiTransferByte
L21:
	.dbline 130
	subi R20,255  ; offset = 1
	sbci R21,255
L23:
	.dbline 130
	cpi R20,10
	ldi R26,0
	cpc R21,R26
	brlo L20
X5:
	.dbline 132
; 	// issue command
; 	r1 = mmcCommand(MMC_READ_SINGLE_BLOCK, sector<<9);
	ldi R24,9
	ldi R25,0
	ldd R16,y+8
	ldd R17,y+9
	ldd R18,y+10
	ldd R19,y+11
	st -y,R24
	xcall lsl32
	std y+0,R18
	std y+1,R19
	movw R18,R16
	ldi R16,17
	xcall _mmcCommand
	mov R12,R16
	.dbline 137
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC Read Block R1=0x%x\r\n", r1);
; 	#endif
; 	// check for valid response
; 	if(r1 != 0x00)
	tst R16
	breq L27
X6:
	.dbline 138
; 		return r1;
	xjmp L19
L26:
	.dbline 140
; 	// wait for block start
; 	while(spiTransferByte(0xFF) != MMC_STARTBLOCK_READ);
L27:
	.dbline 140
	ldi R16,255
	xcall _spiTransferByte
	cpi R16,254
	brne L26
X7:
	.dbline 142
; 	// read in data
; 	for(i=0; i<0x200; i++)
	clr R20
	clr R21
	xjmp L32
L29:
	.dbline 143
; 	{
	.dbline 144
; 		*buffer++ =spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	mov R12,R16
	movw R30,R10
	st Z+,R12
	movw R10,R30
	.dbline 145
; 	}
L30:
	.dbline 142
	subi R20,255  ; offset = 1
	sbci R21,255
L32:
	.dbline 142
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L29
X8:
	.dbline 147
; 	// read 16-bit CRC
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 148
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 150
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 152
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L19:
	.dbline 0 ; func end
	adiw R28,2
	xcall pop_xgset303C
	adiw R28,4
	ret
	.dbsym r r1 12 c
	.dbsym r i 20 s
	.dbsym r buffer 10 pc
	.dbsym l sector 8 l
	.dbend
	.dbfunc e mmcWrite _mmcWrite fc
;             r1 -> R20
;              i -> R22,R23
;         buffer -> y+12
;         sector -> y+8
	.even
_mmcWrite::
	xcall push_arg4
	xcall push_xgsetF00C
	sbiw R28,2
	.dbline -1
	.dbline 159
; }
; 
; //***********************************************************************
; //			向SD卡中指定地址写数据，扇区写，一次512个字节
; //***********************************************************************
; u08 mmcWrite(u32 sector, u08* buffer)
; {
	.dbline 164
; 	u08 r1;
; 	u16 i;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 166
; 	// issue command
; 	r1 = mmcCommand(MMC_WRITE_BLOCK, sector<<9);
	ldi R24,9
	ldi R25,0
	ldd R16,y+8
	ldd R17,y+9
	ldd R18,y+10
	ldd R19,y+11
	st -y,R24
	xcall lsl32
	std y+0,R18
	std y+1,R19
	movw R18,R16
	ldi R16,24
	xcall _mmcCommand
	mov R20,R16
	.dbline 171
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC Write Block R1=0x%x\r\n", r1);
; 	#endif
; 	// check for valid response
; 	if(r1 != 0x00)
	tst R16
	breq L34
X9:
	.dbline 172
; 		return r1;
	xjmp L33
L34:
	.dbline 174
; 	// send dummy
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 176
; 	// send data start token
; 	spiTransferByte(MMC_STARTBLOCK_WRITE);
	ldi R16,254
	xcall _spiTransferByte
	.dbline 178
; 	// write data
; 	for(i=0; i<0x200; i++)
	clr R22
	clr R23
	xjmp L39
L36:
	.dbline 179
; 	{
	.dbline 180
; 		spiTransferByte(*buffer);   //为了节省空间，只写入buffer[0]的数据，若写入512个不同数据，改为*buffer++
	ldd R30,y+12
	ldd R31,y+13
	ldd R16,z+0
	xcall _spiTransferByte
	.dbline 181
; 	}
L37:
	.dbline 178
	subi R22,255  ; offset = 1
	sbci R23,255
L39:
	.dbline 178
	cpi R22,0
	ldi R30,2
	cpc R23,R30
	brlo L36
X10:
	.dbline 183
; 	// write 16-bit CRC (dummy values)
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 184
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 186
; 	// read data response token
; 	r1 = spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	mov R20,R16
	.dbline 187
; 	if( (r1&MMC_DR_MASK) != MMC_DR_ACCEPT)
	mov R24,R20
	andi R24,31
	cpi R24,5
	breq L43
X11:
	.dbline 188
; 		return r1;
	xjmp L33
L42:
	.dbline 193
; 	#ifdef MMC_DEBUG
; 	//rprintf("Data Response Token=0x%x\r\n", r1);
; 	#endif
; 	// wait until card not busy
; 	while(!spiTransferByte(0xFF));
L43:
	.dbline 193
	ldi R16,255
	xcall _spiTransferByte
	mov R10,R16
	tst R16
	breq L42
X12:
	.dbline 195
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 197
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L33:
	.dbline 0 ; func end
	adiw R28,2
	xcall pop_xgsetF00C
	adiw R28,4
	ret
	.dbsym r r1 20 c
	.dbsym r i 22 s
	.dbsym l buffer 12 pc
	.dbsym l sector 8 l
	.dbend
	.dbfunc e mmcCommand _mmcCommand fc
;          retry -> R20
;             r1 -> R10
;            arg -> y+6
;            cmd -> R22
	.even
_mmcCommand::
	st -y,r19
	st -y,r18
	xcall push_xgsetF00C
	mov R22,R16
	.dbline -1
	.dbline 204
; }
; 
; //***********************************************************************
; //			单命令传送函数
; //***********************************************************************
; u08 mmcCommand(u08 cmd, u32 arg)
; {
	.dbline 206
; 	u08 r1;
; 	u08 retry=0;
	clr R20
	.dbline 208
; 	// send command
; 	spiTransferByte(cmd | 0x40);
	mov R16,R22
	ori R16,64
	xcall _spiTransferByte
	.dbline 209
; 	spiTransferByte(arg>>24);
	ldi R24,24
	ldi R25,0
	ldd R16,y+6
	ldd R17,y+7
	ldd R18,y+8
	ldd R19,y+9
	st -y,R24
	xcall lsr32
	xcall _spiTransferByte
	.dbline 210
; 	spiTransferByte(arg>>16);
	ldd R2,y+6
	ldd R3,y+7
	ldd R4,y+8
	ldd R5,y+9
	movw R2,R4
	clr R4
	clr R5
	mov R16,R2
	xcall _spiTransferByte
	.dbline 211
; 	spiTransferByte(arg>>8);
	ldi R24,8
	ldi R25,0
	ldd R16,y+6
	ldd R17,y+7
	ldd R18,y+8
	ldd R19,y+9
	st -y,R24
	xcall lsr32
	xcall _spiTransferByte
	.dbline 212
; 	spiTransferByte(arg);
	ldd R16,y+6
	xcall _spiTransferByte
	.dbline 213
; 	spiTransferByte(0x95);	// crc valid only for MMC_GO_IDLE_STATE
	ldi R16,149
	xcall _spiTransferByte
	xjmp L47
L46:
	.dbline 219
; 	// end command
; 	// wait for response
; 	// if more than 8 retries, card has timed-out
; 	// return the received 0xFF
; 	while((r1 = spiTransferByte(0xFF)) == 0xFF)
; 		if(retry++ > 8) break;
	mov R2,R20
	clr R3
	subi R20,255    ; addi 1
	ldi R24,8
	cp R24,R2
	brsh L49
X13:
	.dbline 219
	xjmp L48
L49:
L47:
	.dbline 218
	ldi R16,255
	xcall _spiTransferByte
	mov R10,R16
	cpi R16,255
	breq L46
X14:
L48:
	.dbline 221
; 	// return response
; 	return r1;
	mov R16,R10
	.dbline -2
L45:
	.dbline 0 ; func end
	xcall pop_xgsetF00C
	adiw R28,2
	ret
	.dbsym r retry 20 c
	.dbsym r r1 10 c
	.dbsym l arg 6 l
	.dbsym r cmd 22 c
	.dbend
	.dbfunc e mmcCapacity _mmcCapacity fl
;       Capacity -> y+18
;          retry -> R10,R11
;         buffer -> y+2
;           temp -> R10,R11
;             r1 -> R14
;              i -> R12,R13
	.even
_mmcCapacity::
	xcall push_xgsetF0FC
	sbiw R28,22
	.dbline -1
	.dbline 229
; }
; 
; //***********************************************************************
; //			SD卡容量读取函数，返回容量数
; //***********************************************************************
; 
; u32 mmcCapacity()
; {
	.dbline 235
; 	u08 r1;
; 	u16 i;
; 	u16 temp;
; 	u08 buffer[16];
; 	u32 Capacity;
; 	u16 retry =0;
	clr R10
	clr R11
	.dbline 237
; 
; 	r1 = mmcSendCommand(9, 0);						//写命令	
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	std y+0,R22
	std y+1,R23
	movw R18,R20
	ldi R16,9
	xcall _mmcSendCommand
	mov R14,R16
	.dbline 238
; 	if(r1 != 0x00)
	tst R16
	breq L52
X15:
	.dbline 239
; 		return r1;
	movw R16,R14
	movw R18,R16
	clr R17
	clr R18
	clr R19
	xjmp L51
L52:
	.dbline 241
; 
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	xjmp L55
L54:
	.dbline 242
; 	while(spiTransferByte(0xff) != 0xfe)if(retry++ > 0xfffe){sbi(MMC_CS_PORT,MMC_CS_PIN);return 1;}
	movw R2,R10
	movw R24,R2
	adiw R24,1
	movw R10,R24
	ldi R24,65534
	ldi R25,255
	cp R24,R2
	cpc R25,R3
	brsh L57
X16:
	.dbline 242
	.dbline 242
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 242
	ldi R16,1
	ldi R17,0
	ldi R18,0
	ldi R19,0
	xjmp L51
L57:
L55:
	.dbline 242
	ldi R16,255
	xcall _spiTransferByte
	mov R12,R16
	cpi R16,254
	brne L54
X17:
	.dbline 245
; 
; 	
; 	for(i=0;i<16;i++)
	clr R12
	clr R13
	xjmp L62
L59:
	.dbline 246
; 	{
	.dbline 247
; 		buffer[i]=spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	mov R10,R16
	movw R24,R28
	adiw R24,2
	movw R30,R12
	add R30,R24
	adc R31,R25
	std z+0,R10
	.dbline 248
; 	}	
L60:
	.dbline 245
	movw R24,R12
	adiw R24,1
	movw R12,R24
L62:
	.dbline 245
	movw R24,R12
	cpi R24,16
	ldi R30,0
	cpc R25,R30
	brlo L59
X18:
	.dbline 250
; 
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 251
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 253
; 	
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 255
; 	
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 257
; 
; 	spiTransferByte(0xff);// extra 8 CLK
	ldi R16,255
	xcall _spiTransferByte
	.dbline 261
; 
; /*********************************/
; //	C_SIZE
; 	i = buffer[6]&0x03;
	ldd R24,y+8
	clr R25
	andi R24,3
	andi R25,0
	movw R12,R24
	.dbline 262
; 	i<<=8;
	mov R13,R12
	clr R12
	.dbline 263
; 	i += buffer[7];
	ldd R2,y+9
	clr R3
	add R12,R2
	adc R13,R3
	.dbline 264
; 	i<<=2;
	lsl R12
	rol R13
	lsl R12
	rol R13
	.dbline 265
; 	i += ((buffer[8]&0xc0)>>6);
	ldi R18,6
	ldi R19,0
	ldd R16,y+10
	clr R17
	andi R16,192
	andi R17,0
	xcall asr16
	add R12,R16
	adc R13,R17
	.dbline 270
; 
; /**********************************/
; //  C_SIZE_MULT
; 
; 	r1 = buffer[9]&0x03;
	ldd R24,y+11
	andi R24,3
	mov R14,R24
	.dbline 271
; 	r1<<=1;
	lsl R14
	.dbline 272
; 	r1 += ((buffer[10]&0x80)>>7);
	ldd R24,y+12
	andi R24,128
	lsr R24
	lsr R24
	lsr R24
	lsr R24
	lsr R24
	lsr R24
	lsr R24
	add R14,R24
	.dbline 278
; 
; 
; /**********************************/
; // BLOCKNR
; 
; 	r1+=2;
	mov R24,R14
	subi R24,254    ; addi 2
	mov R14,R24
	.dbline 280
; 
; 	temp = 1;
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L69
L68:
	.dbline 282
; 	while(r1)
; 	{
	.dbline 283
; 		temp*=2;
	lsl R10
	rol R11
	.dbline 284
; 		r1--;
	dec R14
	.dbline 285
; 	}
L69:
	.dbline 281
	tst R14
	brne L68
X19:
	.dbline 287
; 	
; 	Capacity = ((u32)(i+1))*((u32)temp);
	movw R2,R10
	clr R4
	clr R5
	movw R16,R12
	subi R16,255  ; offset = 1
	sbci R17,255
	clr R18
	clr R19
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32u
	std y+18,R16
	std y+19,R17
	std y+20,R18
	std y+21,R19
	.dbline 292
; 
; 
; // READ_BL_LEN
; 
; 	i = buffer[5]&0x0f;
	ldd R24,y+7
	clr R25
	andi R24,15
	andi R25,0
	movw R12,R24
	.dbline 297
; 
; 
; //BLOCK_LEN
; 
; 	temp = 1;
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L73
L72:
	.dbline 299
; 	while(i)
; 	{
	.dbline 300
; 		temp*=2;
	lsl R10
	rol R11
	.dbline 301
; 		i--;
	movw R24,R12
	sbiw R24,1
	movw R12,R24
	.dbline 302
; 	}
L73:
	.dbline 298
	tst R12
	brne L72
	tst R13
	brne L72
X20:
	.dbline 307
; 
; 
; //The final result
; 	
; 	Capacity *= (u32)temp;	 
	movw R2,R10
	clr R4
	clr R5
	ldd R16,y+18
	ldd R17,y+19
	ldd R18,y+20
	ldd R19,y+21
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32u
	std y+18,R16
	std y+19,R17
	std y+20,R18
	std y+21,R19
	.dbline 308
; 	return Capacity;		
	ldd R16,y+18
	ldd R17,y+19
	ldd R18,y+20
	ldd R19,y+21
	.dbline -2
L51:
	.dbline 0 ; func end
	adiw R28,22
	xjmp pop_xgsetF0FC
	.dbsym l Capacity 18 l
	.dbsym r retry 10 s
	.dbsym l buffer 2 A[16:16]c
	.dbsym r temp 10 s
	.dbsym r r1 14 c
	.dbsym r i 12 s
	.dbend
; }
