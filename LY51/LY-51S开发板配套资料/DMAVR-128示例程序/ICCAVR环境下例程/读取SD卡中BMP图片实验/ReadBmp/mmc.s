	.module mmc.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\mmc.c
	.dbfunc e mmcInit _mmcInit fV
	.even
_mmcInit::
	.dbline -1
	.dbline 34
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
; #define   sbi(temp,x)    		temp|=(1<<(x))     //置位
; #define   clr(x)                (~(1<<(x)))
; #define   cbi(temp,x)     		temp&=~(1<<(x))    //清零
; //***********************************************************************
; //			IO口初始化
; //***********************************************************************
; //void McuInit()
; //{
; 	//PORTB=0XFF;
; 	//DDRB=0XFF;
; //}
; 
; //***********************************************************************
; //			SD卡初始化
; //***********************************************************************
; void mmcInit(void)
; {
	.dbline 36
; 	// initialize SPI interface
; 	spiInit();
	xcall _spiInit
	.dbline 38
; 	// release chip select
; 	sbi(MMC_CS_DDR, MMC_CS_PIN);
	lds R24,100
	ori R24,8
	sts 100,R24
	.dbline 39
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline -2
L1:
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
	.dbline 47
; }
; 
; //***********************************************************************
; //			识别SD卡是否存在
; //***********************************************************************
; 
; u08 mmcReset(void)
; {
	.dbline 50
; 	u08 i;
; 	u08 retry;
; 	u08 r1=0;
	clr R20
	.dbline 52
; 
; 	retry = 0;
	clr R10
L3:
	.dbline 54
; 	do
; 	{
	.dbline 56
; 		// send dummy bytes with CS high before accessing
; 		for(i=0;i<10;i++) spiTransferByte(0xFF);
	clr R22
	xjmp L9
L6:
	.dbline 56
	ldi R16,255
	xcall _spiTransferByte
L7:
	.dbline 56
	inc R22
L9:
	.dbline 56
	cpi R22,10
	brlo L6
X0:
	.dbline 58
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
	.dbline 63
; 		#ifdef MMC_DEBUG
; 		//rprintf("MMC_GO_IDLE_STATE: R1=0x%x\r\n", r1);
; 		#endif
; 		// do retry counter
; 		retry++;
	inc R10
	.dbline 64
; 		if(retry>10) return -1;
	ldi R24,10
	cp R24,R10
	brsh L10
X1:
	.dbline 64
	ldi R16,255
	xjmp L2
L10:
	.dbline 65
; 	} while(r1 != 0x01);
L4:
	.dbline 65
	cpi R20,1
	brne L3
X2:
	.dbline 70
; 
; 	// TODO: check card parameters for voltage compliance
; 	// before issuing initialize command
; 
; 	retry = 0;
	clr R10
L12:
	.dbline 72
; 	do
; 	{
	.dbline 74
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
	.dbline 79
; 		#ifdef MMC_DEBUG
; 		//rprintf("MMC_SEND_OP_COND: R1=0x%x\r\n", r1);
; 		#endif
; 		// do retry counter
; 		retry++;
	inc R10
	.dbline 80
; 		if(retry>100) return -1;
	ldi R24,100
	cp R24,R10
	brsh L15
X3:
	.dbline 80
	ldi R16,255
	xjmp L2
L15:
	.dbline 81
; 	} while(r1);
L13:
	.dbline 81
	tst R20
	brne L12
X4:
	.dbline 84
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
	.dbline 90
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
	.dbline 96
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC_SET_BLOCKLEN: R1=0x%x\r\n", r1);
; 	#endif
; 
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L2:
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
	.dbline 104
; }
; 
; //***********************************************************************
; //			发送SD卡命令函数
; //***********************************************************************
; 
; u08 mmcSendCommand(u08 cmd, u32 arg)
; {
	.dbline 108
; 	u08 r1;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 110
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
	.dbline 112
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 114
; 
; 	return r1;
	.dbline -2
L17:
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
	.dbline 121
; }
; 
; //***********************************************************************
; //			读SD卡数据函数，扇区读，一次512个字节
; //***********************************************************************
; u08 mmcRead(u32 sector, u08* buffer)
; {
	.dbline 126
; 	u08 r1;
; 	u16 i;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 127
; 	for(i=0;i<10;i++) spiTransferByte(0xFF);
	clr R20
	clr R21
	xjmp L22
L19:
	.dbline 127
	ldi R16,255
	xcall _spiTransferByte
L20:
	.dbline 127
	subi R20,255  ; offset = 1
	sbci R21,255
L22:
	.dbline 127
	cpi R20,10
	ldi R26,0
	cpc R21,R26
	brlo L19
X5:
	.dbline 129
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
	.dbline 134
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC Read Block R1=0x%x\r\n", r1);
; 	#endif
; 	// check for valid response
; 	if(r1 != 0x00)
	tst R16
	breq L26
X6:
	.dbline 135
; 		return r1;
	xjmp L18
L25:
	.dbline 137
; 	// wait for block start
; 	while(spiTransferByte(0xFF) != MMC_STARTBLOCK_READ);
L26:
	.dbline 137
	ldi R16,255
	xcall _spiTransferByte
	cpi R16,254
	brne L25
X7:
	.dbline 139
; 	// read in data
; 	for(i=0; i<0x200; i++)
	clr R20
	clr R21
	xjmp L31
L28:
	.dbline 140
; 	{
	.dbline 141
; 		*buffer++ =spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	mov R12,R16
	movw R30,R10
	st Z+,R12
	movw R10,R30
	.dbline 142
; 	}
L29:
	.dbline 139
	subi R20,255  ; offset = 1
	sbci R21,255
L31:
	.dbline 139
	cpi R20,0
	ldi R30,2
	cpc R21,R30
	brlo L28
X8:
	.dbline 144
; 	// read 16-bit CRC
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 145
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 147
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 149
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L18:
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
	.dbline 156
; }
; 
; //***********************************************************************
; //			向SD卡中指定地址写数据，扇区写，一次512个字节
; //***********************************************************************
; u08 mmcWrite(u32 sector, u08* buffer)
; {
	.dbline 161
; 	u08 r1;
; 	u16 i;
; 
; 	// assert chip select
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	.dbline 163
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
	.dbline 168
; 	#ifdef MMC_DEBUG
; 	//rprintf("MMC Write Block R1=0x%x\r\n", r1);
; 	#endif
; 	// check for valid response
; 	if(r1 != 0x00)
	tst R16
	breq L33
X9:
	.dbline 169
; 		return r1;
	xjmp L32
L33:
	.dbline 171
; 	// send dummy
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 173
; 	// send data start token
; 	spiTransferByte(MMC_STARTBLOCK_WRITE);
	ldi R16,254
	xcall _spiTransferByte
	.dbline 175
; 	// write data
; 	for(i=0; i<0x200; i++)
	clr R22
	clr R23
	xjmp L38
L35:
	.dbline 176
; 	{
	.dbline 177
; 		spiTransferByte(*buffer);   //为了节省空间，只写入buffer[0]的数据，若写入512个不同数据，改为*buffer++
	ldd R30,y+12
	ldd R31,y+13
	ldd R16,z+0
	xcall _spiTransferByte
	.dbline 178
; 	}
L36:
	.dbline 175
	subi R22,255  ; offset = 1
	sbci R23,255
L38:
	.dbline 175
	cpi R22,0
	ldi R30,2
	cpc R23,R30
	brlo L35
X10:
	.dbline 180
; 	// write 16-bit CRC (dummy values)
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 181
; 	spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 183
; 	// read data response token
; 	r1 = spiTransferByte(0xFF);
	ldi R16,255
	xcall _spiTransferByte
	mov R20,R16
	.dbline 184
; 	if( (r1&MMC_DR_MASK) != MMC_DR_ACCEPT)
	mov R24,R20
	andi R24,31
	cpi R24,5
	breq L42
X11:
	.dbline 185
; 		return r1;
	xjmp L32
L41:
	.dbline 190
; 	#ifdef MMC_DEBUG
; 	//rprintf("Data Response Token=0x%x\r\n", r1);
; 	#endif
; 	// wait until card not busy
; 	while(!spiTransferByte(0xFF));
L42:
	.dbline 190
	ldi R16,255
	xcall _spiTransferByte
	mov R10,R16
	tst R16
	breq L41
X12:
	.dbline 192
; 	// release chip select
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 194
; 	// return success
; 	return 0;
	clr R16
	.dbline -2
L32:
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
	.dbline 201
; }
; 
; //***********************************************************************
; //			单命令传送函数
; //***********************************************************************
; u08 mmcCommand(u08 cmd, u32 arg)
; {
	.dbline 203
; 	u08 r1;
; 	u08 retry=0;
	clr R20
	.dbline 205
; 	// send command
; 	spiTransferByte(cmd | 0x40);
	mov R16,R22
	ori R16,64
	xcall _spiTransferByte
	.dbline 206
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
	.dbline 207
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
	.dbline 208
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
	.dbline 209
; 	spiTransferByte(arg);
	ldd R16,y+6
	xcall _spiTransferByte
	.dbline 210
; 	spiTransferByte(0x95);	// crc valid only for MMC_GO_IDLE_STATE
	ldi R16,149
	xcall _spiTransferByte
	xjmp L46
L45:
	.dbline 216
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
	brsh L48
X13:
	.dbline 216
	xjmp L47
L48:
L46:
	.dbline 215
	ldi R16,255
	xcall _spiTransferByte
	mov R10,R16
	cpi R16,255
	breq L45
X14:
L47:
	.dbline 218
; 	// return response
; 	return r1;
	mov R16,R10
	.dbline -2
L44:
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
	.dbline 226
; }
; 
; //***********************************************************************
; //			SD卡容量读取函数，返回容量数
; //***********************************************************************
; 
; u32 mmcCapacity()
; {
	.dbline 232
; 	u08 r1;
; 	u16 i;
; 	u16 temp;
; 	u08 buffer[16];
; 	u32 Capacity;
; 	u16 retry =0;
	clr R10
	clr R11
	.dbline 234
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
	.dbline 235
; 	if(r1 != 0x00)
	tst R16
	breq L51
X15:
	.dbline 236
; 		return r1;
	movw R16,R14
	movw R18,R16
	clr R17
	clr R18
	clr R19
	xjmp L50
L51:
	.dbline 238
; 
; 	cbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	andi R24,247
	sts 101,R24
	xjmp L54
L53:
	.dbline 239
; 	while(spiTransferByte(0xff) != 0xfe)if(retry++ > 0xfffe){sbi(MMC_CS_PORT,MMC_CS_PIN);return 1;}
	movw R2,R10
	movw R24,R2
	adiw R24,1
	movw R10,R24
	ldi R24,65534
	ldi R25,255
	cp R24,R2
	cpc R25,R3
	brsh L56
X16:
	.dbline 239
	.dbline 239
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 239
	ldi R16,1
	ldi R17,0
	ldi R18,0
	ldi R19,0
	xjmp L50
L56:
L54:
	.dbline 239
	ldi R16,255
	xcall _spiTransferByte
	mov R12,R16
	cpi R16,254
	brne L53
X17:
	.dbline 242
; 
; 	
; 	for(i=0;i<16;i++)
	clr R12
	clr R13
	xjmp L61
L58:
	.dbline 243
; 	{
	.dbline 244
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
	.dbline 245
; 	}	
L59:
	.dbline 242
	movw R24,R12
	adiw R24,1
	movw R12,R24
L61:
	.dbline 242
	movw R24,R12
	cpi R24,16
	ldi R30,0
	cpc R25,R30
	brlo L58
X18:
	.dbline 247
; 
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 248
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 250
; 	
; 	spiTransferByte(0xff);
	ldi R16,255
	xcall _spiTransferByte
	.dbline 252
; 	
; 	sbi(MMC_CS_PORT,MMC_CS_PIN);
	lds R24,101
	ori R24,8
	sts 101,R24
	.dbline 254
; 
; 	spiTransferByte(0xff);// extra 8 CLK
	ldi R16,255
	xcall _spiTransferByte
	.dbline 258
; 
; /*********************************/
; //	C_SIZE
; 	i = buffer[6]&0x03;
	ldd R24,y+8
	clr R25
	andi R24,3
	andi R25,0
	movw R12,R24
	.dbline 259
; 	i<<=8;
	mov R13,R12
	clr R12
	.dbline 260
; 	i += buffer[7];
	ldd R2,y+9
	clr R3
	add R12,R2
	adc R13,R3
	.dbline 261
; 	i<<=2;
	lsl R12
	rol R13
	lsl R12
	rol R13
	.dbline 262
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
	.dbline 267
; 
; /**********************************/
; //  C_SIZE_MULT
; 
; 	r1 = buffer[9]&0x03;
	ldd R24,y+11
	andi R24,3
	mov R14,R24
	.dbline 268
; 	r1<<=1;
	lsl R14
	.dbline 269
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
	.dbline 275
; 
; 
; /**********************************/
; // BLOCKNR
; 
; 	r1+=2;
	mov R24,R14
	subi R24,254    ; addi 2
	mov R14,R24
	.dbline 277
; 
; 	temp = 1;
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L68
L67:
	.dbline 279
; 	while(r1)
; 	{
	.dbline 280
; 		temp*=2;
	lsl R10
	rol R11
	.dbline 281
; 		r1--;
	dec R14
	.dbline 282
; 	}
L68:
	.dbline 278
	tst R14
	brne L67
X19:
	.dbline 284
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
	.dbline 289
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
	.dbline 294
; 
; 
; //BLOCK_LEN
; 
; 	temp = 1;
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L72
L71:
	.dbline 296
; 	while(i)
; 	{
	.dbline 297
; 		temp*=2;
	lsl R10
	rol R11
	.dbline 298
; 		i--;
	movw R24,R12
	sbiw R24,1
	movw R12,R24
	.dbline 299
; 	}
L72:
	.dbline 295
	tst R12
	brne L71
	tst R13
	brne L71
X20:
	.dbline 304
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
	.dbline 305
; 	return Capacity;		
	ldd R16,y+18
	ldd R17,y+19
	ldd R18,y+20
	ldd R19,y+21
	.dbline -2
L50:
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
