	.module FAT.c
	.area data(ram, con, rel)
_FAT_ReadSector::
	.blkw 1
	.area idata
	.word PL_mmcRead
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
	.dbsym e FAT_ReadSector _FAT_ReadSector pfc
_FAT_WriteSector::
	.blkw 1
	.area idata
	.word PL_mmcWrite
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
	.dbsym e FAT_WriteSector _FAT_WriteSector pfc
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L2:
	.blkb 2
L3:
	.blkb 2
L4:
	.blkb 2
L5:
	.blkb 2
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
	.dbfunc e SD_SizeDisplay _SD_SizeDisplay fV
	.dbsym s SizeG L5 i
	.dbsym s SizeS L4 i
	.dbsym s SizeB L3 i
	.dbsym s SizeQ L2 i
;           Size -> y+4
;       Capacity -> y+12
	.even
_SD_SizeDisplay::
	xcall push_arg4
	xcall push_gset2
	sbiw R28,8
	.dbline -1
	.dbline 37
; //FAT文件系统驱动程序，对网络开源代码的更改		
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //忠兴电子元件店编辑
; //日期：2010.01.14 
; 
; #include"FAT.h"
; 
; DWORD FirstDirClust;    //first directory cluster
; DWORD FirstDataSector;	// The first sector number of data
; WORD BytesPerSector;	// Bytes per sector
; WORD FATsectors;		// The amount sector a FAT occupied
; WORD SectorsPerClust;	// Sector per cluster
; DWORD FirstFATSector;	// The first FAT sector
; DWORD FirstDirSector;	// The first Dir sector
; DWORD RootDirSectors;	// The sector number a Root dir occupied 
; DWORD RootDirCount;		// The count of directory in root dir
; BYTE FAT32_Enable;
; 
; BYTE (* FAT_ReadSector)(DWORD,BYTE *);
; BYTE (* FAT_WriteSector)(DWORD,BYTE *);
; void DisplayChar(unsigned char casc,unsigned char postion_x,unsigned char postion_y,unsigned int char_color);
; void DisplayString(unsigned char *s,unsigned char x,unsigned char y,unsigned int s_color);
; eeprom_read_byte(unsigned int addr);
; void eeprom_write_byte(unsigned int addr, unsigned char p_buff);
; 
; //函数指针指向sd卡的读写函数
; //function pointer to the sd card read & write single block
; //wirte sector are not use in this player
; BYTE (* FAT_ReadSector)(DWORD sector, BYTE * buffer)=mmcRead;//device read
; BYTE (* FAT_WriteSector)(DWORD sector, BYTE * buffer)=mmcWrite;//device write
; 
; struct FileInfoStruct FileInfo;//temporarily buffer for file information
; 
; //读取SD卡容量并处理显示函数
; void SD_SizeDisplay(DWORD Capacity)
; {
	.dbline 40
; 	static	unsigned int SizeQ,SizeB,SizeS,SizeG;
; 	DWORD Size;
;     DisplayString("SD Size:",0,8,0xf800);  //显示SD卡容量
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	clr R18
	ldi R16,<L6
	ldi R17,>L6
	xcall _DisplayString
	.dbline 41
; 	Size=Capacity/1024/1024;
	ldi R24,10
	ldi R25,0
	movw R30,R28
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	ldi R24,10
	ldi R25,0
	st -y,R24
	xcall lsr32
	movw R30,R28
	std z+4,R16
	std z+5,R17
	std z+6,R18
	std z+7,R19
	.dbline 42
; 	SizeQ=Size/1000;
	ldi R20,232
	ldi R21,3
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	movw R16,R2
	movw R18,R4
	xcall div32u
	sts L2+1,R17
	sts L2,R16
	.dbline 43
; 	SizeB=(Size%1000)/100;
	ldi R20,232
	ldi R21,3
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	movw R16,R2
	movw R18,R4
	xcall mod32u
	ldi R20,100
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	xcall div32u
	sts L3+1,R17
	sts L3,R16
	.dbline 44
; 	SizeS=(Size%1000)%100/10;
	ldi R20,232
	ldi R21,3
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	movw R16,R2
	movw R18,R4
	xcall mod32u
	ldi R20,100
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	xcall mod32u
	ldi R20,10
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	xcall div32u
	sts L4+1,R17
	sts L4,R16
	.dbline 45
; 	SizeG=(Size%1000)%100%10;
	ldi R20,232
	ldi R21,3
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	movw R16,R2
	movw R18,R4
	xcall mod32u
	ldi R20,100
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	xcall mod32u
	ldi R20,10
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R23
	st -y,R22
	st -y,R21
	st -y,R20
	xcall mod32u
	sts L5+1,R17
	sts L5,R16
	.dbline 46
;     DisplayChar(SizeQ+'0',8,8,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	ldi R18,8
	lds R16,L2
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 47
; 	DisplayChar(SizeB+'0',9,8,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	ldi R18,9
	lds R16,L3
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 48
; 	DisplayChar(SizeS+'0',10,8,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	ldi R18,10
	lds R16,L4
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 49
; 	DisplayChar(SizeG+'0',11,8,0x0eee);
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	ldi R18,11
	lds R16,L5
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 50
; 	DisplayString("MB",13,8,0xf800);  		//显示SD卡容量
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	ldi R18,13
	ldi R16,<L7
	ldi R17,>L7
	xcall _DisplayString
	.dbline 51
; 	DisplayString("BMP Num:",0,9,0xf800);  	//BMP图片数量，最大显示99张，可以更改算法
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	clr R18
	ldi R16,<L8
	ldi R17,>L8
	xcall _DisplayString
	.dbline 52
; 	DisplayString("Finding.",8,9,0xffff);  	//BMP图片数量，最大显示99张，可以更改算法
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,8
	ldi R16,<L9
	ldi R17,>L9
	xcall _DisplayString
	.dbline -2
L1:
	adiw R28,8
	xcall pop_gset2
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l Size 4 l
	.dbsym l Capacity 12 l
	.dbend
	.dbfunc e FAT_Init _FAT_Init fc
	.dbstruct 0 41 bpb710
	.dbfield 0 bpbBytesPerSec i
	.dbfield 2 bpbSecPerClust c
	.dbfield 3 bpbResSectors i
	.dbfield 5 bpbFATs c
	.dbfield 6 bpbRootDirEnts i
	.dbfield 8 bpbSectors i
	.dbfield 10 bpbMedia c
	.dbfield 11 bpbFATsecs i
	.dbfield 13 bpbSecPerTrack i
	.dbfield 15 bpbHeads i
	.dbfield 17 bpbHiddenSecs l
	.dbfield 21 bpbHugeSectors l
	.dbfield 25 bpbBigFATsecs l
	.dbfield 29 bpbExtFlags i
	.dbfield 31 bpbFSVers i
	.dbfield 33 bpbRootClust l
	.dbfield 37 bpbFSInfo i
	.dbfield 39 bpbBackup i
	.dbend
	.dbstruct 0 512 bootsector710
	.dbfield 0 bsJump A[3:3]c
	.dbfield 3 bsOemName A[8:8]c
	.dbfield 11 bsBPB A[53:53]c
	.dbfield 64 bsExt A[26:26]c
	.dbfield 90 bsBootCode A[418:418]c
	.dbfield 508 bsBootSectSig2 c
	.dbfield 509 bsBootSectSig3 c
	.dbfield 510 bsBootSectSig0 c
	.dbfield 511 bsBootSectSig1 c
	.dbend
	.dbstruct 0 16 partrecord
	.dbfield 0 prIsActive c
	.dbfield 1 prStartHead c
	.dbfield 2 prStartCylSect i
	.dbfield 4 prPartType c
	.dbfield 5 prEndHead c
	.dbfield 6 prEndCylSect i
	.dbfield 8 prStartLBA l
	.dbfield 12 prSize l
	.dbend
;   CapacityDisp -> y+522
;             pr -> R14,R15
;       Capacity -> y+518
;         buffer -> y+6
;         hidsec -> y+2
;             bs -> R12,R13
;            bpb -> R10,R11
	.even
_FAT_Init::
	xcall push_gset5
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,22  ; offset = 526
	.dbline -1
	.dbline 57
; }
; 
; //FAT初始化，不含SD的初始化，用之前应先调用sd的初始化
; unsigned char FAT_Init()//Initialize of FAT  need initialize SD first
; {
	.dbline 58
; 	struct bootsector710 *bs  = 0;
	clr R12
	clr R13
	.dbline 59
; 	struct bpb710        *bpb = 0;
	clr R10
	clr R11
	.dbline 61
; //	struct partsector    *ps  = 0;
; 	struct partrecord    *pr  = 0;
	clr R14
	clr R15
	.dbline 64
; 
; 	BYTE buffer[512];
; 	DWORD hidsec=0;
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	std z+2,R20
	std z+3,R21
	std z+4,R22
	std z+5,R23
	.dbline 68
; 	DWORD Capacity,CapacityDisp;
; 
; 
; 	Capacity = mmcCapacity();
	xcall _mmcCapacity
	movw R30,R28
	subi R30,250  ; addi 518
	sbci R31,253
	std z+0,R16
	std z+1,R17
	std z+2,R18
	std z+3,R19
	.dbline 69
; 	SD_SizeDisplay(Capacity);
	movw R30,R28
	subi R30,250  ; addi 518
	sbci R31,253
	ldd R16,z+0
	ldd R17,z+1
	ldd R18,z+2
	ldd R19,z+3
	xcall _SD_SizeDisplay
	.dbline 71
; 
; 	if(Capacity<0xff)return 1;
	ldi R20,255
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	subi R30,250  ; addi 518
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brsh L11
	.dbline 71
	ldi R16,1
	xjmp L10
L11:
	.dbline 74
; 
; 
; 	if(FAT_ReadSector(0,buffer))return 1;
	movw R24,R28
	adiw R24,6
	std y+1,R25
	std y+0,R24
	ldi R16,0
	ldi R17,0
	ldi R18,0
	ldi R19,0
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L13
	.dbline 74
	ldi R16,1
	xjmp L10
L13:
	.dbline 75
; 	bs = (struct bootsector710 *)buffer;		
	movw R24,R28
	adiw R24,6
	movw R12,R24
	.dbline 76
; 	pr = (struct partrecord *)((struct partsector *)buffer)->psPart;//first partition
	movw R24,R28
	subi R24,60  ; offset = 452
	sbci R25,254
	movw R14,R24
	.dbline 77
; 	hidsec = pr->prStartLBA;//the hidden sectors
	movw R30,R24
	ldd R2,z+8
	ldd R3,z+9
	ldd R4,z+10
	ldd R5,z+11
	movw R30,R28
	std z+2,R2
	std z+3,R3
	std z+4,R4
	std z+5,R5
	.dbline 78
; 	if(hidsec >= Capacity/512)
	ldi R24,9
	ldi R25,0
	movw R30,R28
	subi R30,250  ; addi 518
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	movw R30,R28
	ldd R2,z+2
	ldd R3,z+3
	ldd R4,z+4
	ldd R5,z+5
	cp R2,R16
	cpc R3,R17
	cpc R4,R18
	cpc R5,R19
	brlo L16
	.dbline 79
; 	{
	.dbline 80
; 		hidsec = 0;
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	std z+2,R20
	std z+3,R21
	std z+4,R22
	std z+5,R23
	.dbline 81
; 	}
	xjmp L17
L16:
	.dbline 83
; 	else 
; 	{
	.dbline 84
; 		if(FAT_ReadSector(pr->prStartLBA,buffer))return 1;//read the bpb sector
	movw R24,R28
	adiw R24,6
	std y+1,R25
	std y+0,R24
	movw R30,R14
	ldd R16,z+8
	ldd R17,z+9
	ldd R18,z+10
	ldd R19,z+11
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L18
	.dbline 84
	ldi R16,1
	xjmp L10
L18:
	.dbline 85
; 		bs = (struct bootsector710 *)buffer;
	movw R24,R28
	adiw R24,6
	movw R12,R24
	.dbline 86
; 		if(bs->bsJump[0]!=0xE9 && bs->bsJump[0]!=0xEB)
	movw R30,R24
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,233
	breq L20
	cpi R24,235
	breq L20
	.dbline 87
; 		{
	.dbline 88
; 			hidsec = 0;
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	std z+2,R20
	std z+3,R21
	std z+4,R22
	std z+5,R23
	.dbline 89
; 			if(FAT_ReadSector(0,buffer))return 1;//read the bpb sector
	movw R24,R28
	adiw R24,6
	std y+1,R25
	std y+0,R24
	ldi R16,0
	ldi R17,0
	ldi R18,0
	ldi R19,0
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L22
	.dbline 89
	ldi R16,1
	xjmp L10
L22:
	.dbline 90
; 			bs = (struct bootsector710 *)buffer;	
	movw R24,R28
	adiw R24,6
	movw R12,R24
	.dbline 91
; 		}
L20:
	.dbline 92
; 	}
L17:
	.dbline 94
; 
; 	if(bs->bsJump[0]!=0xE9 && bs->bsJump[0]!=0xEB)//对付没有bootsect的sd卡	//dead with the card which has no bootsect
	movw R30,R12
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,233
	breq L24
	cpi R24,235
	breq L24
	.dbline 95
; 	{
	.dbline 96
; 		return 1;
	ldi R16,1
	xjmp L10
L24:
	.dbline 101
; 	}
; 	
; 	
; 	
; 	bpb = (struct bpb710 *)bs->bsBPB;
	movw R24,R12
	adiw R24,11
	movw R10,R24
	.dbline 104
; 
; 	
; 	if(bpb->bpbFATsecs)						//判断文件系统类型，不支持FAT12,支持FAT16和FAT32
	movw R30,R24
	ldd R2,z+11
	ldd R3,z+12
	tst R2
	brne X0
	tst R3
	breq L26
X0:
	.dbline 105
; 	{
	.dbline 106
; 		FAT32_Enable=0;						//FAT16
	clr R2
	sts _FAT32_Enable,R2
	.dbline 107
; 		FATsectors		= bpb->bpbFATsecs;	//FAT占用的扇区数	
	movw R30,R10
	ldd R2,z+11
	ldd R3,z+12
	sts _FATsectors+1,R3
	sts _FATsectors,R2
	.dbline 108
; 		FirstDirClust = 2;
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	sts _FirstDirClust+1,R21
	sts _FirstDirClust,R20
	sts _FirstDirClust+2+1,R23
	sts _FirstDirClust+2,R22
	.dbline 109
; 	}
	xjmp L27
L26:
	.dbline 111
; 	else
; 	{
	.dbline 112
; 		FAT32_Enable=1;						 //FAT32
	ldi R24,1
	sts _FAT32_Enable,R24
	.dbline 113
; 		FATsectors		= bpb->bpbBigFATsecs;//FAT占用的扇区数	//the sectors number occupied by one fat talbe
	movw R30,R10
	ldd R2,z+25
	ldd R3,z+26
	sts _FATsectors+1,R3
	sts _FATsectors,R2
	.dbline 114
; 		FirstDirClust = bpb->bpbRootClust;
	movw R30,R10
	ldd R2,z+33
	ldd R3,z+34
	ldd R4,z+35
	ldd R5,z+36
	sts _FirstDirClust+1,R3
	sts _FirstDirClust,R2
	sts _FirstDirClust+2+1,R5
	sts _FirstDirClust+2,R4
	.dbline 115
; 	}
L27:
	.dbline 117
; 
; 	BytesPerSector	= bpb->bpbBytesPerSec;	//每扇区字节数
	movw R30,R10
	ldd R2,z+0
	ldd R3,z+1
	sts _BytesPerSector+1,R3
	sts _BytesPerSector,R2
	.dbline 119
; 	
; 	SectorsPerClust	= (BYTE)bpb->bpbSecPerClust;//每簇扇区数
	ldd R2,z+2
	clr R3
	sts _SectorsPerClust+1,R3
	sts _SectorsPerClust,R2
	.dbline 121
; 	
; 	FirstFATSector	= bpb->bpbResSectors+hidsec;//第一个FAT表扇区
	movw R30,R28
	ldd R2,z+2
	ldd R3,z+3
	ldd R4,z+4
	ldd R5,z+5
	movw R30,R10
	ldd R6,z+3
	ldd R7,z+4
	clr R8
	clr R9
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	sts _FirstFATSector+1,R7
	sts _FirstFATSector,R6
	sts _FirstFATSector+2+1,R9
	sts _FirstFATSector+2,R8
	.dbline 122
; 	RootDirCount	= bpb->bpbRootDirEnts;//根目录项数
	movw R30,R10
	ldd R2,z+6
	ldd R3,z+7
	clr R4
	clr R5
	sts _RootDirCount+1,R3
	sts _RootDirCount,R2
	sts _RootDirCount+2+1,R5
	sts _RootDirCount+2,R4
	.dbline 123
; 	RootDirSectors	= (RootDirCount*32)>>9;//根目录占用的扇区数
	ldi R20,32
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	movw R16,R20
	movw R18,R22
	xcall empy32u
	ldi R24,9
	ldi R25,0
	st -y,R24
	xcall lsr32
	sts _RootDirSectors+1,R17
	sts _RootDirSectors,R16
	sts _RootDirSectors+2+1,R19
	sts _RootDirSectors+2,R18
	.dbline 124
; 	FirstDirSector	= FirstFATSector+bpb->bpbFATs*FATsectors;//第一个目录扇区
	lds R18,_FATsectors
	lds R19,_FATsectors+1
	movw R30,R10
	ldd R16,z+5
	clr R17
	xcall empy16s
	movw R2,R16
	clr R4
	clr R5
	lds R8,_FirstFATSector+2
	lds R9,_FirstFATSector+2+1
	lds R6,_FirstFATSector
	lds R7,_FirstFATSector+1
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	sts _FirstDirSector+1,R7
	sts _FirstDirSector,R6
	sts _FirstDirSector+2+1,R9
	sts _FirstDirSector+2,R8
	.dbline 125
; 	FirstDataSector	= FirstDirSector+RootDirSectors;//第一个数据扇区
	lds R4,_RootDirSectors+2
	lds R5,_RootDirSectors+2+1
	lds R2,_RootDirSectors
	lds R3,_RootDirSectors+1
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	sts _FirstDataSector+1,R7
	sts _FirstDataSector,R6
	sts _FirstDataSector+2+1,R9
	sts _FirstDataSector+2,R8
	.dbline 126
; 	return 0;
	clr R16
	.dbline -2
L10:
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,22  ; offset = 526
	xcall pop_gset5
	.dbline 0 ; func end
	ret
	.dbsym l CapacityDisp 522 l
	.dbsym r pr 14 pS[partrecord]
	.dbsym l Capacity 518 l
	.dbsym l buffer 6 A[512:512]c
	.dbsym l hidsec 2 l
	.dbsym r bs 12 pS[bootsector710]
	.dbsym r bpb 10 pS[bpb710]
	.dbend
	.dbfunc e FAT_LoadPartCluster _FAT_LoadPartCluster fc
;         sector -> y+2
;         buffer -> y+16
;           part -> y+14
;        cluster -> y+10
	.even
_FAT_LoadPartCluster::
	xcall push_arg4
	xcall push_gset2
	sbiw R28,6
	.dbline -1
	.dbline 132
; }
; 
; //读一个簇中的一个扇区
; //read one sector of one cluster, parameter part indicate which sector
; unsigned char FAT_LoadPartCluster(unsigned long cluster,unsigned part,BYTE * buffer)
; {
	.dbline 134
; 	DWORD sector;
; 	sector=FirstDataSector+(DWORD)(cluster-2)*(DWORD)SectorsPerClust;//calculate the actual sector number
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+10
	ldd R3,z+11
	ldd R4,z+12
	ldd R5,z+13
	sub R2,R20
	sbc R3,R21
	sbc R4,R22
	sbc R5,R23
	lds R6,_SectorsPerClust
	lds R7,_SectorsPerClust+1
	clr R8
	clr R9
	st -y,R9
	st -y,R8
	st -y,R7
	st -y,R6
	movw R16,R2
	movw R18,R4
	xcall empy32u
	lds R4,_FirstDataSector+2
	lds R5,_FirstDataSector+2+1
	lds R2,_FirstDataSector
	lds R3,_FirstDataSector+1
	add R2,R16
	adc R3,R17
	adc R4,R18
	adc R5,R19
	movw R30,R28
	std z+2,R2
	std z+3,R3
	std z+4,R4
	std z+5,R5
	.dbline 135
; 	if(FAT_ReadSector(sector+part,buffer))return 1;
	ldd R0,y+16
	ldd R1,y+17
	std y+1,R1
	std y+0,R0
	ldd R2,y+14
	ldd R3,y+15
	clr R4
	clr R5
	movw R30,R28
	ldd R6,z+2
	ldd R7,z+3
	ldd R8,z+4
	ldd R9,z+5
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R16,R6
	movw R18,R8
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L29
	.dbline 135
	ldi R16,1
	xjmp L28
L29:
	.dbline 136
; 	else return 0;
	clr R16
	.dbline -2
L28:
	adiw R28,6
	xcall pop_gset2
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l sector 2 l
	.dbsym l buffer 16 pc
	.dbsym l part 14 i
	.dbsym l cluster 10 l
	.dbend
	.dbfunc e FAT_NextCluster _FAT_NextCluster fl
;         buffer -> y+10
;         offset -> y+6
;         sector -> y+2
;        cluster -> y+526
	.even
_FAT_NextCluster::
	xcall push_arg4
	xcall push_gset2
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,63
	sbiw R28,18  ; offset = 522
	.dbline -1
	.dbline 144
; }
; 
; 
; //读下一簇簇号
; //Return the cluster number of next cluster of file
; //Suitable for system which has limited RAM
; unsigned long FAT_NextCluster(unsigned long cluster)
; {
	.dbline 148
; 	BYTE buffer[512];
; 	DWORD sector;
; 	DWORD offset;
; 	if(FAT32_Enable)offset = cluster/128;
	lds R2,_FAT32_Enable
	tst R2
	breq L32
	.dbline 148
	ldi R24,7
	ldi R25,0
	movw R30,R28
	subi R30,242  ; addi 526
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	xjmp L33
L32:
	.dbline 149
; 	else offset = cluster/256;
	ldi R24,8
	ldi R25,0
	movw R30,R28
	subi R30,242  ; addi 526
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
L33:
	.dbline 150
; 	if(cluster<2)return 0x0ffffff8;
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	subi R30,242  ; addi 526
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brsh L34
	.dbline 150
	ldi R16,248
	ldi R17,255
	ldi R18,255
	ldi R19,15
	xjmp L31
L34:
	.dbline 151
; 	sector=FirstFATSector+offset;//calculate the actual sector
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	lds R8,_FirstFATSector+2
	lds R9,_FirstFATSector+2+1
	lds R6,_FirstFATSector
	lds R7,_FirstFATSector+1
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R30,R28
	std z+2,R6
	std z+3,R7
	std z+4,R8
	std z+5,R9
	.dbline 152
; 	if(FAT_ReadSector(sector,buffer))return 0x0ffffff8;//read fat table / return 0xfff8 when error occured
	movw R24,R28
	adiw R24,10
	std y+1,R25
	std y+0,R24
	movw R30,R28
	ldd R16,z+2
	ldd R17,z+3
	ldd R18,z+4
	ldd R19,z+5
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L36
	.dbline 152
	ldi R16,248
	ldi R17,255
	ldi R18,255
	ldi R19,15
	xjmp L31
L36:
	.dbline 154
; 
; 	if(FAT32_Enable)
	lds R2,_FAT32_Enable
	tst R2
	brne X1
	xjmp L38
X1:
	.dbline 155
; 	{
	.dbline 156
; 		offset=cluster%128;//find the position
	ldi R20,127
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	subi R30,242  ; addi 526
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	and R2,R20
	and R3,R21
	and R4,R22
	and R5,R23
	movw R30,R28
	std z+6,R2
	std z+7,R3
	std z+8,R4
	std z+9,R5
	.dbline 157
; 		sector=((unsigned long *)buffer)[offset];	
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	ldi R20,4
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	movw R16,R20
	movw R18,R22
	xcall empy32u
	movw R30,R16
	movw R24,R28
	adiw R24,10
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	movw R30,R28
	std z+2,R2
	std z+3,R3
	std z+4,R4
	std z+5,R5
	.dbline 158
; 	}
	xjmp L39
L38:
	.dbline 160
; 	else
; 	{
	.dbline 161
; 		offset=cluster%256;//find the position
	ldi R20,255
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	subi R30,242  ; addi 526
	sbci R31,253
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	and R2,R20
	and R3,R21
	and R4,R22
	and R5,R23
	movw R30,R28
	std z+6,R2
	std z+7,R3
	std z+8,R4
	std z+9,R5
	.dbline 162
; 		sector=((unsigned int *)buffer)[offset];
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	movw R16,R20
	movw R18,R22
	xcall empy32u
	movw R30,R16
	movw R24,R28
	adiw R24,10
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	ldd R3,z+1
	clr R4
	clr R5
	movw R30,R28
	std z+2,R2
	std z+3,R3
	std z+4,R4
	std z+5,R5
	.dbline 163
; 	}
L39:
	.dbline 164
; 	return (unsigned long)sector;//return the cluste number
	movw R30,R28
	ldd R16,z+2
	ldd R17,z+3
	ldd R18,z+4
	ldd R19,z+5
	.dbline -2
L31:
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,63
	adiw R28,18  ; offset = 522
	xcall pop_gset2
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l buffer 10 A[512:512]c
	.dbsym l offset 6 l
	.dbsym l sector 2 l
	.dbsym l cluster 526 l
	.dbend
	.dbfunc e CopyDirentruyItem _CopyDirentruyItem fV
	.dbstruct 0 32 direntry
	.dbfield 0 deName A[8:8]c
	.dbfield 8 deExtension A[3:3]c
	.dbfield 11 deAttributes c
	.dbfield 12 deLowerCase c
	.dbfield 13 deCHundredth c
	.dbfield 14 deCTime A[2:2]c
	.dbfield 16 deCDate A[2:2]c
	.dbfield 18 deADate A[2:2]c
	.dbfield 20 deHighClust i
	.dbfield 22 deMTime A[2:2]c
	.dbfield 24 deMDate A[2:2]c
	.dbfield 26 deStartCluster i
	.dbfield 28 deFileSize l
	.dbend
;              i -> R20
;         Source -> R18,R19
;          Desti -> R16,R17
	.even
_CopyDirentruyItem::
	xcall push_gset1
	.dbline -1
	.dbline 304
; }
; 
; #if FIX_DIRECTORY
; //在给定目录下查找文件
; //Find a item in the directory which specify by the parameter "cluster"
; //Return the start cluster number
; unsigned int FAT_FindItem(unsigned long cluster, BYTE *name, struct FileInfoStruct *FileInfo)
; {
; 	BYTE *buffer;
; 	DWORD tempclust;
; 	DWORD sector;
; 	unsigned char cnt;
; 	unsigned int offset;
; 	unsigned char i;
; 	struct direntry *item = 0;
; 	if((cluster==0) && (FAT32_Enable == 0))// root directory
; 	{
; 		buffer=malloc(512);//apply memory
; 		if(buffer==0)return 1;//if failed
; 		for(cnt=0;cnt<RootDirSectors;cnt++)
; 		{
; 			if(FAT_ReadSector(FirstDirSector+cnt,buffer)){free(buffer);return 1;}
; 			for(offset=0;offset<512;offset+=32)
; 			{
; 				item=(struct direntry *)(&buffer[offset]);
; 				if((item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
; 				{
; 					for(i=0;i<11;i++)
; 					{
; 						if(buffer[offset+i]!=name[i])break;
; 					}
; 					if(i==11)
; 					{
; 						//return the parameter of the item
; 						FileInfo->StartCluster = item->deStartCluster + (((unsigned long)item->deHighClust)<<16);//don't care
; 						FileInfo->Size         = item->deFileSize;
; 						FileInfo->Attr         = item->deAttributes;
; 						FileInfo->Sector       = FirstDirSector+cnt;
; 						FileInfo->Offset       = offset;
; 						free(buffer);
; 						return 0;
; 					}
; 				}
; 			}
; 		}
; 		free(buffer);//release
; 	}
; 	else//other folders
; 	{
; 		tempclust=cluster;
; 		while(1)
; 		{
; 			sector=FirstDataSector+(DWORD)(tempclust-2)*(DWORD)SectorsPerClust;//calculate the actual sector number
; 			buffer=malloc(512);//apply memory
; 			if(buffer==0)return 1;//if failed
; 			for(cnt=0;cnt<SectorsPerClust;cnt++)
; 			{
; 				if(FAT_ReadSector(sector+cnt,buffer)){free(buffer);return 1;}
; 				for(offset=0;offset<512;offset+=32)
; 				{
; 					item=(struct direntry *)(&buffer[offset]);
; 					if((item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
; 					{
; 						for(i=0;i<11;i++)
; 						{
; 							if(buffer[offset+i]!=name[i])break;
; 						}
; 						if(i==11)
; 						{
; 							FileInfo->StartCluster = item->deStartCluster + (((unsigned long)item->deHighClust)<<16);//don't care
; 							FileInfo->Size         = item->deFileSize;
; 							FileInfo->Attr         = item->deAttributes;
; 							FileInfo->Sector       = sector+cnt;
; 							FileInfo->Offset       = offset;
; 							free(buffer);
; 							return 0;
; 						}
; 					}
; 				}
; 			}
; 			free(buffer);//release
; 			tempclust=FAT_NextCluster(tempclust);//next cluster
; 			if(tempclust == 0x0fffffff || tempclust == 0x0ffffff8 || (FAT32_Enable == 0 && tempclust == 0xffff))break;
; 		}
; 	}
; 	return 1;
; }
; 
; // find a directory with the given path
; unsigned long FAT_OpenDir(BYTE * dir)
; {
; 	BYTE name[11];
; 	BYTE *p=dir;
; 	BYTE deep=0;
; 	BYTE i,j;
; 	DWORD cluster=0;
; 	if(FAT32_Enable)cluster = FirstDirClust;
; 	if(*p != '\\')return 1;//invalid path
; 	while(*p)
; 	{
; 		if(*p == '\\')
; 		{
; 			deep++;
; 		}
; 		p++;
; 	}
; 	p=dir;
; 	for(i=0;i<deep-1;i++)
; 	{
; 		p++;
; 		for(j=0;j<11;j++)name[j]=0x20;
; 		j=0;
; 		while(*p != '\\')
; 		{
; 			if((*p) >= 'a' && (*p) <= 'z')name[j] = (*p++)-0x20;
; 			else name[j] = *p++;
; 			j++;
; 		}
; 		if(FAT_FindItem(cluster,name, &FileInfo))return 1;//find the directory
; 		cluster = FileInfo.StartCluster;
; 	}
; 	p++;
; 	for(j=0;j<11;j++)name[j]=0x20;
; 	j=0;
; 	while(*p)
; 	{
; 		if(*p>='a' && *p<='z')name[j]=(*p++)-0x20;
; 		else name[j]=*p++;
; 		j++;
; 	}
; 	if(j == 0)return cluster;
; 	if(FAT_FindItem(cluster,name, &FileInfo))return 1;//find the final directory
; 	cluster = FileInfo.StartCluster;
; 	return cluster;
; }
; #endif  
; 
; //复制记录项信息  //copy item
; void CopyDirentruyItem(struct direntry *Desti,struct direntry *Source)
; {
	.dbline 306
	clr R20
	xjmp L44
L41:
	.dbline 306
	mov R30,R20
	clr R31
	add R30,R18
	adc R31,R19
	ldd R2,z+0
	mov R30,R20
	clr R31
	add R30,R16
	adc R31,R17
	std z+0,R2
L42:
	.dbline 306
	inc R20
L44:
	.dbline 306
; 	BYTE i;
; 	for(i=0;i<8;i++)Desti->deName[i] = Source->deName[i];
	cpi R20,8
	brlo L41
	.dbline 307
	clr R20
	xjmp L48
L45:
	.dbline 307
	movw R24,R18
	adiw R24,8
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,8
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L46:
	.dbline 307
	inc R20
L48:
	.dbline 307
; 	for(i=0;i<3;i++)Desti->deExtension[i] = Source->deExtension[i];
	cpi R20,3
	brlo L45
	.dbline 308
; 	Desti->deAttributes = Source->deAttributes;
	movw R30,R18
	ldd R2,z+11
	movw R30,R16
	std z+11,R2
	.dbline 309
; 	Desti->deLowerCase = Source->deLowerCase;
	movw R30,R18
	ldd R2,z+12
	movw R30,R16
	std z+12,R2
	.dbline 310
; 	Desti->deCHundredth = Source->deCHundredth;
	movw R30,R18
	ldd R2,z+13
	movw R30,R16
	std z+13,R2
	.dbline 311
	clr R20
	xjmp L52
L49:
	.dbline 311
	movw R24,R18
	adiw R24,14
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,14
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L50:
	.dbline 311
	inc R20
L52:
	.dbline 311
; 	for(i=0;i<2;i++)Desti->deCTime[i] = Source->deCTime[i];
	cpi R20,2
	brlo L49
	.dbline 312
	clr R20
	xjmp L56
L53:
	.dbline 312
	movw R24,R18
	adiw R24,16
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,16
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L54:
	.dbline 312
	inc R20
L56:
	.dbline 312
; 	for(i=0;i<2;i++)Desti->deCDate[i] = Source->deCDate[i];
	cpi R20,2
	brlo L53
	.dbline 313
	clr R20
	xjmp L60
L57:
	.dbline 313
	movw R24,R18
	adiw R24,18
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,18
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L58:
	.dbline 313
	inc R20
L60:
	.dbline 313
; 	for(i=0;i<2;i++)Desti->deADate[i] = Source->deADate[i];
	cpi R20,2
	brlo L57
	.dbline 314
; 	Desti->deHighClust = Source->deHighClust;
	movw R30,R18
	ldd R2,z+20
	ldd R3,z+21
	movw R30,R16
	std z+21,R3
	std z+20,R2
	.dbline 315
	clr R20
	xjmp L64
L61:
	.dbline 315
	movw R24,R18
	adiw R24,22
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,22
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L62:
	.dbline 315
	inc R20
L64:
	.dbline 315
; 	for(i=0;i<2;i++)Desti->deMTime[i] = Source->deMTime[i];
	cpi R20,2
	brlo L61
	.dbline 316
	clr R20
	xjmp L68
L65:
	.dbline 316
	movw R24,R18
	adiw R24,24
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	movw R24,R16
	adiw R24,24
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R2
L66:
	.dbline 316
	inc R20
L68:
	.dbline 316
; 	for(i=0;i<2;i++)Desti->deMDate[i] = Source->deMDate[i];
	cpi R20,2
	brlo L65
	.dbline 317
; 	Desti->deStartCluster = Source->deStartCluster;
	movw R30,R18
	ldd R2,z+26
	ldd R3,z+27
	movw R30,R16
	std z+27,R3
	std z+26,R2
	.dbline 318
; 	Desti->deFileSize = Source->deFileSize;
	movw R30,R18
	ldd R2,z+28
	ldd R3,z+29
	ldd R4,z+30
	ldd R5,z+31
	movw R30,R16
	std z+28,R2
	std z+29,R3
	std z+30,R4
	std z+31,R5
	.dbline -2
L40:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r Source 18 pS[direntry]
	.dbsym r Desti 16 pS[direntry]
	.dbend
	.dbfunc e WriteFolderCluster _WriteFolderCluster fV
;        cluster -> y+6
;           addr -> R20,R21
	.even
_WriteFolderCluster::
	st -y,r19
	st -y,r18
	xcall push_gset1
	movw R20,R16
	sbiw R28,4
	.dbline -1
	.dbline 399
; }
; 
; 
; #if FIX_DIRECTORY
; 
; BYTE Search(BYTE *dir,struct direntry *MusicInfo,WORD *Count,BYTE *type)//当COUNT为零时，有它带回这个目录下总共有多少图片
; {                                                            //不为零时有MusicInfo带回第Count图片的详细文件信息
; 	BYTE *buffer;
; 	DWORD sector;
; 	DWORD cluster;
; 	DWORD tempclust;
; 	unsigned char cnt;
; 	unsigned int offset;
; 	unsigned int i=0;
; 	struct direntry *item = 0;
; 	cluster = FAT_OpenDir(dir);
; 	if(cluster == 1)return 1;
; 	if(cluster==0 && FAT32_Enable==0)// 根目录，FAT16文件系统
; 	{
; 		buffer=malloc(512);//动态分配内存512大小
; 		if(buffer==0)return 1;//动态分配失败
; 		for(cnt=0;cnt<RootDirSectors;cnt++)
; 		{
; 			if(FAT_ReadSector(FirstDirSector+cnt,buffer)){free(buffer);return 1;}
; 			for(offset=0;offset<512;offset+=32)
; 			{
; 				item=(struct direntry *)(&buffer[offset]);//pointer convert
; 				//find a valid item and display it
; 				if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
; 				{
; 					if((item->deExtension[0] == 'b')&&(item->deExtension[1] == 'm')&&(item->deExtension[2] == 'p'))
; 					{
; 						CopyDirentruyItem(MusicInfo,item);
; 						*type=1;
; 						i++;
; 						if(i==*Count){free(buffer);return 0;}	
; 					}
; 				}
; 			}
; 		}
; 		free(buffer);//release
; 	}
; 	else//other folders
; 	{
; 		tempclust=cluster;
; 		while(1)
; 		{
; 			sector=FirstDataSector+(DWORD)(tempclust-2)*(DWORD)SectorsPerClust;//calculate the actual sector number
; 			buffer=malloc(512);//apply memory
; 			if(buffer==0)return 1;//if failed
; 			for(cnt=0;cnt<SectorsPerClust;cnt++)
; 			{
; 				if(FAT_ReadSector(sector+cnt,buffer)){free(buffer);return 1;}
; 				for(offset=0;offset<512;offset+=32)
; 				{
; 					item=(struct direntry *)(&buffer[offset]);
; 					if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
; 					{
; 						if((item->deExtension[0] == 'b')&&(item->deExtension[1] == 'm')&&(item->deExtension[2] == 'p'))
; 						{
; 							CopyDirentruyItem(MusicInfo,item);
; 							*type=1;
; 							i++;
; 							if(i==*Count){free(buffer);return 0;}	
; 						}	
; 					}
; 				}
; 			}
; 			free(buffer);//release
; 			tempclust=FAT_NextCluster(tempclust);//next cluster
; 			if(tempclust == 0x0fffffff || tempclust == 0x0ffffff8 || (FAT32_Enable == 0 && tempclust == 0xffff))break;
; 		}
; 	}
; 	if(*Count==0)*Count=i;
; 	return 0;	
; }
; 
; #else  
; 
; void WriteFolderCluster(WORD addr,DWORD cluster)
; {
	.dbline 401
; #if FAT_DEBUG
; 	printf("\r\nWrite EEPROM address:%d with value:%ld",addr,cluster);
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	std y+0,R2
	std y+1,R3
	std y+2,R4
	std y+3,R5
	movw R18,R20
	ldi R16,<L70
	ldi R17,>L70
	xcall _printf
	.dbline 403
; #endif
; 	eeprom_write_byte(addr,cluster>>24);
	ldi R24,24
	ldi R25,0
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	mov R18,R16
	movw R16,R20
	xcall _eeprom_write_byte
	.dbline 404
; 	eeprom_write_byte(addr+1,cluster>>16);
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	movw R2,R4
	clr R4
	clr R5
	mov R18,R2
	movw R16,R20
	subi R16,255  ; offset = 1
	sbci R17,255
	xcall _eeprom_write_byte
	.dbline 405
; 	eeprom_write_byte(addr+2,cluster>>8);
	ldi R24,8
	ldi R25,0
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsr32
	mov R18,R16
	movw R16,R20
	subi R16,254  ; offset = 2
	sbci R17,255
	xcall _eeprom_write_byte
	.dbline 406
; 	eeprom_write_byte(addr+3,cluster>>0);
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	mov R18,R2
	movw R16,R20
	subi R16,253  ; offset = 3
	sbci R17,255
	xcall _eeprom_write_byte
	.dbline -2
L69:
	adiw R28,4
	xcall pop_gset1
	adiw R28,2
	.dbline 0 ; func end
	ret
	.dbsym l cluster 6 l
	.dbsym r addr 20 i
	.dbend
	.dbfunc e GetFolderCluster _GetFolderCluster fl
;           temp -> y+4
;           addr -> R10,R11
	.even
_GetFolderCluster::
	xcall push_gset3
	movw R10,R16
	sbiw R28,8
	.dbline -1
	.dbline 410
; }
; 
; DWORD GetFolderCluster(WORD addr)
; {
	.dbline 413
; 	DWORD temp;
; 	
; 	temp = eeprom_read_byte(addr);
	movw R16,R10
	xcall _eeprom_read_byte
	movw R2,R16
	clr R4
	sbrc R3,7
	com R4
	clr R5
	sbrc R4,7
	com R5
	movw R30,R28
	std z+4,R2
	std z+5,R3
	std z+6,R4
	std z+7,R5
	.dbline 414
; 	temp <<= 8;
	ldi R24,8
	ldi R25,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsl32
	movw R30,R28
	std z+4,R16
	std z+5,R17
	std z+6,R18
	std z+7,R19
	.dbline 415
; 	temp += eeprom_read_byte(addr+1);
	movw R16,R10
	subi R16,255  ; offset = 1
	sbci R17,255
	xcall _eeprom_read_byte
	movw R2,R16
	clr R4
	sbrc R3,7
	com R4
	clr R5
	sbrc R4,7
	com R5
	movw R30,R28
	ldd R6,z+4
	ldd R7,z+5
	ldd R8,z+6
	ldd R9,z+7
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R30,R28
	std z+4,R6
	std z+5,R7
	std z+6,R8
	std z+7,R9
	.dbline 416
; 	temp <<= 8;
	ldi R24,8
	ldi R25,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsl32
	movw R30,R28
	std z+4,R16
	std z+5,R17
	std z+6,R18
	std z+7,R19
	.dbline 417
; 	temp += eeprom_read_byte(addr+2);
	movw R16,R10
	subi R16,254  ; offset = 2
	sbci R17,255
	xcall _eeprom_read_byte
	movw R2,R16
	clr R4
	sbrc R3,7
	com R4
	clr R5
	sbrc R4,7
	com R5
	movw R30,R28
	ldd R6,z+4
	ldd R7,z+5
	ldd R8,z+6
	ldd R9,z+7
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R30,R28
	std z+4,R6
	std z+5,R7
	std z+6,R8
	std z+7,R9
	.dbline 418
; 	temp <<= 8;
	ldi R24,8
	ldi R25,0
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	st -y,R24
	movw R16,R2
	movw R18,R4
	xcall lsl32
	movw R30,R28
	std z+4,R16
	std z+5,R17
	std z+6,R18
	std z+7,R19
	.dbline 419
; 	temp += eeprom_read_byte(addr+3);
	movw R16,R10
	subi R16,253  ; offset = 3
	sbci R17,255
	xcall _eeprom_read_byte
	movw R2,R16
	clr R4
	sbrc R3,7
	com R4
	clr R5
	sbrc R4,7
	com R5
	movw R30,R28
	ldd R6,z+4
	ldd R7,z+5
	ldd R8,z+6
	ldd R9,z+7
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R30,R28
	std z+4,R6
	std z+5,R7
	std z+6,R8
	std z+7,R9
	.dbline 421
; #if FAT_DEBUG
; 	printf("\r\nRead EEPROM address: %d value is: %ld",addr,temp);
	movw R30,R28
	ldd R2,z+4
	ldd R3,z+5
	ldd R4,z+6
	ldd R5,z+7
	std y+0,R2
	std y+1,R3
	std y+2,R4
	std y+3,R5
	movw R18,R10
	ldi R16,<L72
	ldi R17,>L72
	xcall _printf
	.dbline 423
; #endif
; 	return temp;
	movw R30,R28
	ldd R16,z+4
	ldd R17,z+5
	ldd R18,z+6
	ldd R19,z+7
	.dbline -2
L71:
	adiw R28,8
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym l temp 4 l
	.dbsym r addr 10 i
	.dbend
	.dbfunc e SearchFolder _SearchFolder fc
;      tempclust -> y+6
;         sector -> y+2
;            cnt -> R10
;         buffer -> R12,R13
;         offset -> R14,R15
;           item -> y+10
;           addr -> y+26
;        cluster -> y+22
	.even
_SearchFolder::
	xcall push_arg4
	xcall push_gset5
	sbiw R28,12
	.dbline -1
	.dbline 427
; }
; 
; BYTE SearchFolder(DWORD cluster,WORD *addr)
; {
	.dbline 438
; 	BYTE *buffer;
; 	//BYTE buff[3];
; 	DWORD sector;
; 	//DWORD cluster;
; 	DWORD tempclust;
; 	unsigned char cnt;
; 	unsigned int offset;
; 	//unsigned int i=0;
; 	//unsigned char j;//long name buffer offset;
; //	unsigned char *p;//long name buffer pointer
; 	struct direntry *item = 0;
	clr R0
	clr R1
	std y+11,R1
	std y+10,R0
	.dbline 441
; 	//struct winentry *we =0;
; 	
; 	if(cluster==0 && FAT32_Enable==0)// root directory
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+22
	ldd R3,z+23
	ldd R4,z+24
	ldd R5,z+25
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq X4
	xjmp L74
X4:
	lds R2,_FAT32_Enable
	tst R2
	breq X5
	xjmp L74
X5:
	.dbline 442
; 	{
	.dbline 444
; 		
; 		buffer=malloc(512);//apply memory
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R12,R16
	.dbline 445
; 		if(buffer==0) {printf("Apply Memory Failure");return 1;}//if failed
	cpi R16,0
	cpc R16,R17
	brne L76
X2:
	.dbline 445
	.dbline 445
	ldi R16,<L78
	ldi R17,>L78
	xcall _printf
	.dbline 445
	ldi R16,1
	xjmp L73
L76:
	.dbline 446
; 		for(cnt=0;cnt<RootDirSectors;cnt++)
	clr R10
	xjmp L82
L79:
	.dbline 447
; 		{
	.dbline 448
; 			if(FAT_ReadSector(FirstDirSector+cnt,buffer)){free(buffer);return 1;}
	std y+1,R13
	std y+0,R12
	mov R2,R10
	clr R3
	clr R4
	clr R5
	lds R8,_FirstDirSector+2
	lds R9,_FirstDirSector+2+1
	lds R6,_FirstDirSector
	lds R7,_FirstDirSector+1
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R16,R6
	movw R18,R8
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L83
	.dbline 448
	.dbline 448
	movw R16,R12
	xcall _free
	.dbline 448
	ldi R16,1
	xjmp L73
L83:
	.dbline 449
; 			for(offset=0;offset<512;offset+=32)
	clr R14
	clr R15
	xjmp L88
L85:
	.dbline 450
; 			{
	.dbline 451
; 				item=(struct direntry *)(&buffer[offset]);//pointer convert
	movw R2,R14
	add R2,R12
	adc R3,R13
	std y+11,R3
	std y+10,R2
	.dbline 453
; 				//find a valid item and display it
; 				if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5))
	movw R30,R2
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,46
	brne X6
	xjmp L89
X6:
	tst R24
	brne X7
	xjmp L89
X7:
	cpi R24,229
	brne X8
	xjmp L89
X8:
	.dbline 454
; 				{
	.dbline 455
; 					if(item->deAttributes & ATTR_DIRECTORY )
	ldd R2,z+11
	sbrs R2,4
	rjmp L91
	.dbline 456
; 					{
	.dbline 458
; 						#if FAT_DEBUG
; 							printf("\r\nFound a folder!");
	ldi R16,<L93
	ldi R17,>L93
	xcall _printf
	.dbline 460
; 						#endif
; 						if(*addr==RECORD_ADDR_END)return 0;
	ldd R30,y+26
	ldd R31,y+27
	ldd R24,z+0
	ldd R25,z+1
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brne L94
	.dbline 460
	clr R16
	xjmp L73
L94:
	.dbline 462
; 						else
; 						{
	.dbline 463
; 							WriteFolderCluster(*addr,item->deStartCluster+(((unsigned long)item->deHighClust)<<16));
	ldd R30,y+10
	ldd R31,y+11
	ldd R2,z+20
	ldd R3,z+21
	clr R4
	clr R5
	movw R4,R2
	clr R2
	clr R3
	ldd R30,y+10
	ldd R31,y+11
	ldd R6,z+26
	ldd R7,z+27
	clr R8
	clr R9
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	std y+0,R8
	std y+1,R9
	movw R18,R6
	ldd R30,y+26
	ldd R31,y+27
	ldd R16,z+0
	ldd R17,z+1
	xcall _WriteFolderCluster
	.dbline 464
; 							*addr+=4;
	ldd R30,y+26
	ldd R31,y+27
	ldd R24,z+0
	ldd R25,z+1
	adiw R24,4
	std z+1,R25
	std z+0,R24
	.dbline 465
; 						}
	.dbline 466
; 					}
L91:
	.dbline 467
; 				}
L89:
	.dbline 468
L86:
	.dbline 449
	movw R24,R14
	adiw R24,32
	movw R14,R24
L88:
	.dbline 449
	movw R24,R14
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brsh X9
	xjmp L85
X9:
	.dbline 469
L80:
	.dbline 446
	inc R10
L82:
	.dbline 446
	lds R4,_RootDirSectors+2
	lds R5,_RootDirSectors+2+1
	lds R2,_RootDirSectors
	lds R3,_RootDirSectors+1
	mov R6,R10
	clr R7
	clr R8
	clr R9
	cp R6,R2
	cpc R7,R3
	cpc R8,R4
	cpc R9,R5
	brsh X10
	xjmp L79
X10:
	.dbline 470
; 			}
; 		}
; 		free(buffer);//release
	movw R16,R12
	xcall _free
	.dbline 471
; 	}
	xjmp L75
L74:
	.dbline 473
; 	else//other folders
; 	{
	.dbline 474
; 		tempclust=cluster;
	movw R30,R28
	ldd R2,z+22
	ldd R3,z+23
	ldd R4,z+24
	ldd R5,z+25
	movw R30,R28
	std z+6,R2
	std z+7,R3
	std z+8,R4
	std z+9,R5
	xjmp L97
L96:
	.dbline 476
; 		while(1)
; 		{
	.dbline 477
; 			sector=FirstDataSector+(DWORD)(tempclust-2)*(DWORD)SectorsPerClust;//calculate the actual sector number
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	sub R2,R20
	sbc R3,R21
	sbc R4,R22
	sbc R5,R23
	lds R6,_SectorsPerClust
	lds R7,_SectorsPerClust+1
	clr R8
	clr R9
	st -y,R9
	st -y,R8
	st -y,R7
	st -y,R6
	movw R16,R2
	movw R18,R4
	xcall empy32u
	lds R4,_FirstDataSector+2
	lds R5,_FirstDataSector+2+1
	lds R2,_FirstDataSector
	lds R3,_FirstDataSector+1
	add R2,R16
	adc R3,R17
	adc R4,R18
	adc R5,R19
	movw R30,R28
	std z+2,R2
	std z+3,R3
	std z+4,R4
	std z+5,R5
	.dbline 478
; 			buffer=malloc(512);//apply memory
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R12,R16
	.dbline 479
; 			if(buffer==0)return 1;//if failed
	cpi R16,0
	cpc R16,R17
	brne L99
X3:
	.dbline 479
	ldi R16,1
	xjmp L73
L99:
	.dbline 480
; 			for(cnt=0;cnt<SectorsPerClust;cnt++)
	clr R10
	xjmp L104
L101:
	.dbline 481
; 			{
	.dbline 482
; 				if(FAT_ReadSector(sector+cnt,buffer)){free(buffer);return 1;}
	std y+1,R13
	std y+0,R12
	mov R2,R10
	clr R3
	clr R4
	clr R5
	movw R30,R28
	ldd R6,z+2
	ldd R7,z+3
	ldd R8,z+4
	ldd R9,z+5
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R16,R6
	movw R18,R8
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L105
	.dbline 482
	.dbline 482
	movw R16,R12
	xcall _free
	.dbline 482
	ldi R16,1
	xjmp L73
L105:
	.dbline 483
; 				for(offset=0;offset<512;offset+=32)
	clr R14
	clr R15
	xjmp L110
L107:
	.dbline 484
; 				{
	.dbline 485
; 					item=(struct direntry *)(&buffer[offset]);
	movw R2,R14
	add R2,R12
	adc R3,R13
	std y+11,R3
	std y+10,R2
	.dbline 486
; 					if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5))
	movw R30,R2
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,46
	brne X11
	xjmp L111
X11:
	tst R24
	brne X12
	xjmp L111
X12:
	cpi R24,229
	brne X13
	xjmp L111
X13:
	.dbline 487
; 					{				
	.dbline 488
; 						if(item->deAttributes & ATTR_DIRECTORY )
	ldd R2,z+11
	sbrs R2,4
	rjmp L113
	.dbline 489
; 						{
	.dbline 491
; 							#if FAT_DEBUG
; 								printf("\r\nFound a folder!");
	ldi R16,<L93
	ldi R17,>L93
	xcall _printf
	.dbline 493
; 							#endif
; 							if(*addr==RECORD_ADDR_END)return 0;
	ldd R30,y+26
	ldd R31,y+27
	ldd R24,z+0
	ldd R25,z+1
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brne L115
	.dbline 493
	clr R16
	xjmp L73
L115:
	.dbline 495
; 							else
; 							{
	.dbline 496
; 								WriteFolderCluster(*addr,item->deStartCluster+(((unsigned long)item->deHighClust)<<16));
	ldd R30,y+10
	ldd R31,y+11
	ldd R2,z+20
	ldd R3,z+21
	clr R4
	clr R5
	movw R4,R2
	clr R2
	clr R3
	ldd R30,y+10
	ldd R31,y+11
	ldd R6,z+26
	ldd R7,z+27
	clr R8
	clr R9
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	std y+0,R8
	std y+1,R9
	movw R18,R6
	ldd R30,y+26
	ldd R31,y+27
	ldd R16,z+0
	ldd R17,z+1
	xcall _WriteFolderCluster
	.dbline 497
; 								*addr+=4;
	ldd R30,y+26
	ldd R31,y+27
	ldd R24,z+0
	ldd R25,z+1
	adiw R24,4
	std z+1,R25
	std z+0,R24
	.dbline 498
; 							}
	.dbline 499
; 						}
L113:
	.dbline 500
; 					}
L111:
	.dbline 501
L108:
	.dbline 483
	movw R24,R14
	adiw R24,32
	movw R14,R24
L110:
	.dbline 483
	movw R24,R14
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brsh X14
	xjmp L107
X14:
	.dbline 502
L102:
	.dbline 480
	inc R10
L104:
	.dbline 480
	lds R2,_SectorsPerClust
	lds R3,_SectorsPerClust+1
	mov R4,R10
	clr R5
	cp R4,R2
	cpc R5,R3
	brsh X15
	xjmp L101
X15:
	.dbline 503
; 				}
; 			}
; 			free(buffer);//release
	movw R16,R12
	xcall _free
	.dbline 504
; 			tempclust=FAT_NextCluster(tempclust);//next cluster
	movw R30,R28
	ldd R16,z+6
	ldd R17,z+7
	ldd R18,z+8
	ldd R19,z+9
	xcall _FAT_NextCluster
	movw R30,R28
	std z+6,R16
	std z+7,R17
	std z+8,R18
	std z+9,R19
	.dbline 505
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,15
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L120
	ldi R20,248
	ldi R21,255
	ldi R22,255
	ldi R23,15
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L120
	lds R2,_FAT32_Enable
	tst R2
	brne L117
	ldi R20,255
	ldi R21,255
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+6
	ldd R3,z+7
	ldd R4,z+8
	ldd R5,z+9
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brne L117
L120:
	.dbline 505
; 			if(tempclust == 0x0fffffff || tempclust == 0x0ffffff8 || (FAT32_Enable == 0 && tempclust == 0xffff))break;
	xjmp L98
L117:
	.dbline 506
L97:
	.dbline 475
	xjmp L96
L98:
	.dbline 507
; 		}
; 	}
L75:
	.dbline 508
; 	return 0;		
	clr R16
	.dbline -2
L73:
	adiw R28,12
	xcall pop_gset5
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l tempclust 6 l
	.dbsym l sector 2 l
	.dbsym r cnt 10 c
	.dbsym r buffer 12 pc
	.dbsym r offset 14 i
	.dbsym l item 10 pS[direntry]
	.dbsym l addr 26 pi
	.dbsym l cluster 22 l
	.dbend
	.dbfunc e SearchInit _SearchInit fc
;      temp_addr -> y+6
;        cluster -> y+2
;           addr -> R10,R11
	.even
_SearchInit::
	xcall push_gset3
	sbiw R28,8
	.dbline -1
	.dbline 514
; }
; 
; 
; 
; BYTE SearchInit()
; {	
	.dbline 515
; 	WORD addr = RECORD_ADDR_START;
	clr R10
	clr R11
	.dbline 520
; 	WORD temp_addr;
; 	DWORD cluster;
; 	
; #if FAT_DEBUG
; 	printf("\r\nSearchInit");
	ldi R16,<L122
	ldi R17,>L122
	xcall _printf
	.dbline 523
; #endif
; 
; 	if(FAT32_Enable)
	lds R2,_FAT32_Enable
	tst R2
	breq L123
	.dbline 524
; 		WriteFolderCluster(addr,FirstDirClust);
	lds R4,_FirstDirClust+2
	lds R5,_FirstDirClust+2+1
	lds R2,_FirstDirClust
	lds R3,_FirstDirClust+1
	std y+0,R4
	std y+1,R5
	movw R18,R2
	movw R16,R10
	xcall _WriteFolderCluster
	xjmp L124
L123:
	.dbline 526
; 	else 
; 		WriteFolderCluster(RECORD_ADDR_START,0);
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	std y+0,R22
	std y+1,R23
	movw R18,R20
	clr R16
	clr R17
	xcall _WriteFolderCluster
L124:
	.dbline 528
; 	
; 	addr += 4;
	movw R24,R10
	adiw R24,4
	movw R10,R24
	.dbline 530
; 	
; 	WriteFolderCluster(addr, 0xffffffff);
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	std y+0,R22
	std y+1,R23
	movw R18,R20
	movw R16,R24
	xcall _WriteFolderCluster
	.dbline 531
; 	temp_addr = addr;
	std y+7,R11
	std y+6,R10
	.dbline 532
; 	addr = RECORD_ADDR_START;
	clr R10
	clr R11
	xjmp L126
L125:
	.dbline 534
; 	while(1)
; 	{
	.dbline 535
; 		cluster = GetFolderCluster(addr);
	movw R16,R10
	xcall _GetFolderCluster
	movw R30,R28
	std z+2,R16
	std z+3,R17
	std z+4,R18
	std z+5,R19
	.dbline 536
; 		if(cluster == 0xffffffff)return 0;
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	movw R30,R28
	ldd R2,z+2
	ldd R3,z+3
	ldd R4,z+4
	ldd R5,z+5
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brne L128
	.dbline 536
	clr R16
	xjmp L121
L128:
	.dbline 538
; 		else
; 		{
	.dbline 539
; 			if(SearchFolder(cluster,&temp_addr))
	movw R24,R28
	adiw R24,6
	std y+1,R25
	std y+0,R24
	movw R30,R28
	ldd R16,z+2
	ldd R17,z+3
	ldd R18,z+4
	ldd R19,z+5
	xcall _SearchFolder
	tst R16
	breq L130
	.dbline 540
; 			{
	.dbline 542
; 				#if FAT_DEBUG
; 					printf("\r\nERROR: search folder error");
	ldi R16,<L132
	ldi R17,>L132
	xcall _printf
	.dbline 544
; 				#endif
; 			}
L130:
	.dbline 546
; 			#if FAT_DEBUG
; 				printf("\r\nSearch one folder, write the end flag if the the value is not the right value");
	ldi R16,<L133
	ldi R17,>L133
	xcall _printf
	.dbline 548
; 			#endif
; 			if(GetFolderCluster(temp_addr) != 0xffffffff)
	ldd R16,y+6
	ldd R17,y+7
	xcall _GetFolderCluster
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	cp R16,R20
	cpc R17,R21
	cpc R18,R22
	cpc R19,R23
	breq L134
	.dbline 549
; 				WriteFolderCluster(temp_addr,0XFFFFFFFF);
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	std y+0,R22
	std y+1,R23
	movw R18,R20
	ldd R16,y+6
	ldd R17,y+7
	xcall _WriteFolderCluster
L134:
	.dbline 550
; 			if(temp_addr == RECORD_ADDR_END)
	ldd R24,y+6
	ldd R25,y+7
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brne L136
	.dbline 551
; 			{
	.dbline 553
; 				#if FAT_DEBUG
; 					printf("\r\nWARNING: EEPROM is full, no more space!");
	ldi R16,<L138
	ldi R17,>L138
	xcall _printf
	.dbline 555
; 				#endif
; 				WriteFolderCluster(temp_addr - 4,0XFFFFFFFF);
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	std y+0,R22
	std y+1,R23
	movw R18,R20
	ldd R16,y+6
	ldd R17,y+7
	subi R16,4
	sbci R17,0
	xcall _WriteFolderCluster
	.dbline 556
; 				break;
	xjmp L127
L136:
	.dbline 558
	.dbline 559
	movw R24,R10
	adiw R24,4
	movw R10,R24
	.dbline 560
L126:
	.dbline 533
	xjmp L125
L127:
	.dbline 562
; 			}
; 		}
; 		addr+=4;
; 	}
; 	#if FAT_DEBUG
; 		printf("\r\nSearch Completed!");
	ldi R16,<L139
	ldi R17,>L139
	xcall _printf
	.dbline 564
; 	#endif
; return 1;
	ldi R16,1
	.dbline -2
L121:
	adiw R28,8
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym l temp_addr 6 i
	.dbsym l cluster 2 l
	.dbsym r addr 10 i
	.dbend
	.dbfunc e Search _Search fc
;           addr -> y+21
;        cluster -> y+13
;      tempclust -> y+9
;         sector -> y+5
;            cnt -> R10
;              i -> y+19
;         buffer -> R12,R13
;      file_type -> y+2
;         offset -> R14,R15
;           item -> y+17
;           type -> y+37
;          Count -> y+35
;      MusicInfo -> y+33
	.even
_Search::
	xcall push_arg4
	xcall push_gset5
	sbiw R28,23
	.dbline -1
	.dbline 570
; }
; 
; 
; 
; BYTE Search(/*BYTE *dirWORD *music_record_addr,*/struct direntry *MusicInfo,WORD *Count,BYTE *type)//当COUNT为零时，有它带回这个目录下总共有多少图片
; {                                                            //不为零时有MusicInfo带回第Count图片的详细文件信息
	.dbline 577
; 	BYTE *buffer;
; 	DWORD sector;
; 	DWORD cluster;
; 	DWORD tempclust;
; 	unsigned char cnt;
; 	unsigned int offset;
; 	unsigned int i=0;
	clr R0
	clr R1
	std y+20,R1
	std y+19,R0
	.dbline 580
; 	//unsigned char j;//long name buffer offset;
; 	//unsigned char *p;//long name buffer pointer
; 	struct direntry *item = 0;
	std y+18,R1
	std y+17,R0
	.dbline 586
; 	//struct winentry *we =0;
; 	//cluster = FAT_OpenDir(dir);
; 	//if(cluster == 1)return 1;
; 	
; 	BYTE file_type[3] ;
; 	WORD addr =RECORD_ADDR_START;
	std y+22,R1
	std y+21,R0
	.dbline 588
; 	
; 	switch(*type)
	ldd R30,y+37
	ldd R31,y+38
	ldd R10,z+0
	clr R11
	movw R24,R10
	cpi R24,1
	ldi R30,0
	cpc R25,R30
	breq L144
	cpi R24,2
	ldi R30,0
	cpc R25,R30
	breq L147
	xjmp L151
X16:
	.dbline 589
; 	  {
L144:
	.dbline 590
; 	    case  1 : file_type[0] = 'B' ;
	ldi R24,66
	std y+2,R24
	.dbline 591
;                   file_type[1] = 'M' ; 
	ldi R24,77
	std y+3,R24
	.dbline 592
; 				  file_type[2] = 'P' ;
	ldi R24,80
	std y+4,R24
	.dbline 594
; 				  
; 				  break ;
	xjmp L151
L147:
	.dbline 596
; 				  
; 		case  2 : file_type[0] = 'B' ;
	ldi R24,66
	std y+2,R24
	.dbline 597
; 		          file_type[1] = 'I' ;
	ldi R24,73
	std y+3,R24
	.dbline 598
; 				  file_type[2] = 'N' ;
	ldi R24,78
	std y+4,R24
	.dbline 600
; 				  
; 				  break;
	xjmp L151
L150:
	.dbline 608
; 				  
; 	  
; 	  }
; 	
; 	
; 	
; 	while(1)
; 	{
	.dbline 609
; 		cluster = GetFolderCluster(addr);
	ldd R16,y+21
	ldd R17,y+22
	xcall _GetFolderCluster
	movw R30,R28
	std z+13,R16
	std z+14,R17
	std z+15,R18
	std z+16,R19
	.dbline 610
; 		addr += 4;
	ldd R24,y+21
	ldd R25,y+22
	adiw R24,4
	std y+22,R25
	std y+21,R24
	.dbline 611
; 		if(cluster == 0xffffffff) break;
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,255
	movw R30,R28
	ldd R2,z+13
	ldd R3,z+14
	ldd R4,z+15
	ldd R5,z+16
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brne L153
	.dbline 611
	xjmp L152
L153:
	.dbline 614
; 		
; 		else
; 		{
	.dbline 616
; 			//*music_record_addr = addr - 4;	/* record in which record found the right file */
; 			if(cluster==0 && FAT32_Enable==0)// 根目录，FAT16文件系统
	ldi R20,0
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+13
	ldd R3,z+14
	ldd R4,z+15
	ldd R5,z+16
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq X20
	xjmp L155
X20:
	lds R2,_FAT32_Enable
	tst R2
	breq X21
	xjmp L155
X21:
	.dbline 617
; 			{
	.dbline 620
; 			
; 			
; 				buffer=malloc(512);//动态分配空间512字节
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R12,R16
	.dbline 621
; 				if(buffer==0)return 1;//if failed
	cpi R16,0
	cpc R16,R17
	brne L157
X17:
	.dbline 621
	ldi R16,1
	xjmp L140
L157:
	.dbline 624
; 				
; 				
; 				for(cnt=0;cnt<RootDirSectors;cnt++)
	clr R10
	xjmp L162
L159:
	.dbline 625
; 				{
	.dbline 626
; 					if(FAT_ReadSector(FirstDirSector+cnt,buffer)){free(buffer);return 1;}
	std y+1,R13
	std y+0,R12
	mov R2,R10
	clr R3
	clr R4
	clr R5
	lds R8,_FirstDirSector+2
	lds R9,_FirstDirSector+2+1
	lds R6,_FirstDirSector
	lds R7,_FirstDirSector+1
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R16,R6
	movw R18,R8
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L163
	.dbline 626
	.dbline 626
	movw R16,R12
	xcall _free
	.dbline 626
	ldi R16,1
	xjmp L140
L163:
	.dbline 627
; 					for(offset=0;offset<512;offset+=32)
	clr R14
	clr R15
	xjmp L168
L165:
	.dbline 628
; 					{
	.dbline 629
; 						item=(struct direntry *)(&buffer[offset]);//pointer convert
	movw R2,R14
	add R2,R12
	adc R3,R13
	std y+18,R3
	std y+17,R2
	.dbline 631
; 						//find a valid item and display it
; 						if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
	movw R30,R2
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,46
	brne X22
	xjmp L169
X22:
	tst R24
	brne X23
	xjmp L169
X23:
	cpi R24,229
	brne X24
	xjmp L169
X24:
	ldd R24,z+11
	cpi R24,15
	breq L169
	.dbline 632
; 						{
	.dbline 634
; 						
; 							if((item->deExtension[0] == file_type[0])&&(item->deExtension[1] == file_type[1])&&(item->deExtension[2] == file_type[2]))
	ldd R2,y+2
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+8
	cp R3,R2
	brne L171
	ldd R2,y+3
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+9
	cp R3,R2
	brne L171
	ldd R2,y+4
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+10
	cp R3,R2
	brne L171
	.dbline 635
; 							{
	.dbline 637
; 								
; 								CopyDirentruyItem(MusicInfo,item);
	ldd R18,y+17
	ldd R19,y+18
	ldd R16,y+33
	ldd R17,y+34
	xcall _CopyDirentruyItem
	.dbline 639
; 								
; 								i++;
	ldd R24,y+19
	ldd R25,y+20
	adiw R24,1
	std y+20,R25
	std y+19,R24
	.dbline 640
; 								if(i==*Count){free(buffer);return 0;}
	ldd R30,y+35
	ldd R31,y+36
	ldd R2,z+0
	ldd R3,z+1
	movw R0,R24
	cp R24,R2
	cpc R25,R3
	brne L175
	.dbline 640
	.dbline 640
	movw R16,R12
	xcall _free
	.dbline 640
	clr R16
	xjmp L140
L175:
	.dbline 641
; 							}							 
L171:
	.dbline 642
; 						}
L169:
	.dbline 643
L166:
	.dbline 627
	movw R24,R14
	adiw R24,32
	movw R14,R24
L168:
	.dbline 627
	movw R24,R14
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brsh X25
	xjmp L165
X25:
	.dbline 644
L160:
	.dbline 624
	inc R10
L162:
	.dbline 624
	lds R4,_RootDirSectors+2
	lds R5,_RootDirSectors+2+1
	lds R2,_RootDirSectors
	lds R3,_RootDirSectors+1
	mov R6,R10
	clr R7
	clr R8
	clr R9
	cp R6,R2
	cpc R7,R3
	cpc R8,R4
	cpc R9,R5
	brsh X26
	xjmp L159
X26:
	.dbline 645
; 					}
; 				}
; 				free(buffer);//release释放空间
	movw R16,R12
	xcall _free
	.dbline 646
; 			}
	xjmp L156
L155:
	.dbline 648
; 			else//other folders
; 			{
	.dbline 649
; 				tempclust=cluster;
	movw R30,R28
	ldd R2,z+13
	ldd R3,z+14
	ldd R4,z+15
	ldd R5,z+16
	movw R30,R28
	std z+9,R2
	std z+10,R3
	std z+11,R4
	std z+12,R5
	xjmp L178
L177:
	.dbline 651
; 				while(1)
; 				{
	.dbline 652
; 					sector=FirstDataSector+(DWORD)(tempclust-2)*(DWORD)SectorsPerClust;//calculate the actual sector number
	ldi R20,2
	ldi R21,0
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	sub R2,R20
	sbc R3,R21
	sbc R4,R22
	sbc R5,R23
	lds R6,_SectorsPerClust
	lds R7,_SectorsPerClust+1
	clr R8
	clr R9
	st -y,R9
	st -y,R8
	st -y,R7
	st -y,R6
	movw R16,R2
	movw R18,R4
	xcall empy32u
	lds R4,_FirstDataSector+2
	lds R5,_FirstDataSector+2+1
	lds R2,_FirstDataSector
	lds R3,_FirstDataSector+1
	add R2,R16
	adc R3,R17
	adc R4,R18
	adc R5,R19
	movw R30,R28
	std z+5,R2
	std z+6,R3
	std z+7,R4
	std z+8,R5
	.dbline 653
; 					buffer=malloc(512);//apply memory
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R12,R16
	.dbline 654
; 					if(buffer==0)return 1;//if failed
	cpi R16,0
	cpc R16,R17
	brne L180
X18:
	.dbline 654
	ldi R16,1
	xjmp L140
L180:
	.dbline 655
; 					for(cnt=0;cnt<SectorsPerClust;cnt++)
	clr R10
	xjmp L185
L182:
	.dbline 656
; 					{
	.dbline 657
; 						if(FAT_ReadSector(sector+cnt,buffer)){free(buffer);return 1;}
	std y+1,R13
	std y+0,R12
	mov R2,R10
	clr R3
	clr R4
	clr R5
	movw R30,R28
	ldd R6,z+5
	ldd R7,z+6
	ldd R8,z+7
	ldd R9,z+8
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	movw R16,R6
	movw R18,R8
	lds R30,_FAT_ReadSector
	lds R31,_FAT_ReadSector+1
	xcall xicall
	tst R16
	breq L186
	.dbline 657
	.dbline 657
	movw R16,R12
	xcall _free
	.dbline 657
	ldi R16,1
	xjmp L140
L186:
	.dbline 658
; 						for(offset=0;offset<512;offset+=32)
	clr R14
	clr R15
	xjmp L191
L188:
	.dbline 659
; 						{
	.dbline 660
; 							item=(struct direntry *)(&buffer[offset]);
	movw R2,R14
	add R2,R12
	adc R3,R13
	std y+18,R3
	std y+17,R2
	.dbline 661
; 							if((item->deName[0] != '.') && (item->deName[0] != 0x00) && (item->deName[0] != 0xe5) && (item->deAttributes != 0x0f))
	movw R30,R2
	ldd R2,z+0
	clr R3
	mov R24,R2
	cpi R24,46
	brne X27
	xjmp L192
X27:
	tst R24
	brne X28
	xjmp L192
X28:
	cpi R24,229
	brne X29
	xjmp L192
X29:
	ldd R24,z+11
	cpi R24,15
	breq L192
	.dbline 662
; 							{		
	.dbline 664
;                                		
; 								if((item->deExtension[0] == file_type[0])&&(item->deExtension[1] == file_type[1])&&(item->deExtension[2] == file_type[2]))
	ldd R2,y+2
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+8
	cp R3,R2
	brne L194
	ldd R2,y+3
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+9
	cp R3,R2
	brne L194
	ldd R2,y+4
	ldd R30,y+17
	ldd R31,y+18
	ldd R3,z+10
	cp R3,R2
	brne L194
	.dbline 665
; 								{
	.dbline 667
; 								    
; 									CopyDirentruyItem(MusicInfo,item);
	ldd R18,y+17
	ldd R19,y+18
	ldd R16,y+33
	ldd R17,y+34
	xcall _CopyDirentruyItem
	.dbline 669
; 									
; 									i++;
	ldd R24,y+19
	ldd R25,y+20
	adiw R24,1
	std y+20,R25
	std y+19,R24
	.dbline 670
; 									if(i==*Count){free(buffer);return 0;}
	ldd R30,y+35
	ldd R31,y+36
	ldd R2,z+0
	ldd R3,z+1
	movw R0,R24
	cp R24,R2
	cpc R25,R3
	brne L198
	.dbline 670
	.dbline 670
	movw R16,R12
	xcall _free
	.dbline 670
	clr R16
	xjmp L140
L198:
	.dbline 671
; 								}
L194:
	.dbline 672
; 							}
L192:
	.dbline 673
L189:
	.dbline 658
	movw R24,R14
	adiw R24,32
	movw R14,R24
L191:
	.dbline 658
	movw R24,R14
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brsh X30
	xjmp L188
X30:
	.dbline 674
L183:
	.dbline 655
	inc R10
L185:
	.dbline 655
	lds R2,_SectorsPerClust
	lds R3,_SectorsPerClust+1
	mov R4,R10
	clr R5
	cp R4,R2
	cpc R5,R3
	brsh X31
	xjmp L182
X31:
	.dbline 675
; 						}
; 					}
; 					free(buffer);//release
	movw R16,R12
	xcall _free
	.dbline 676
; 					tempclust=FAT_NextCluster(tempclust);//next cluster
	movw R30,R28
	ldd R16,z+9
	ldd R17,z+10
	ldd R18,z+11
	ldd R19,z+12
	xcall _FAT_NextCluster
	movw R30,R28
	std z+9,R16
	std z+10,R17
	std z+11,R18
	std z+12,R19
	.dbline 677
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,15
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L203
	ldi R20,248
	ldi R21,255
	ldi R22,255
	ldi R23,15
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L203
	lds R2,_FAT32_Enable
	tst R2
	brne L200
	ldi R20,255
	ldi R21,255
	ldi R22,0
	ldi R23,0
	movw R30,R28
	ldd R2,z+9
	ldd R3,z+10
	ldd R4,z+11
	ldd R5,z+12
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brne L200
L203:
	.dbline 677
; 					if(tempclust == 0x0fffffff || tempclust == 0x0ffffff8 || (FAT32_Enable == 0 && tempclust == 0xffff))break;
	xjmp L179
L200:
	.dbline 678
L178:
	.dbline 650
	xjmp L177
L179:
	.dbline 679
; 				}
; 			}
L156:
	.dbline 680
	.dbline 681
L151:
	.dbline 607
	xjmp L150
L152:
	.dbline 682
; 		}
; 	}
; 	if(*Count==0)*Count=i;
	ldd R30,y+35
	ldd R31,y+36
	ldd R2,z+0
	ldd R3,z+1
	tst R2
	brne L204
	tst R3
	brne L204
X19:
	.dbline 682
	ldd R30,y+35
	ldd R31,y+36
	ldd R0,y+19
	ldd R1,y+20
	std z+1,R1
	std z+0,R0
L204:
	.dbline 688
; 	/*
; 	GUI_sprintf_chartohex(130,300,*type,0xffff,0x0000) ;
; 	GUI_sprintf_chartohex(160,300,i,0xffff,0x0000) ;
; 	GUI_sprintf_chartohex(190,300,*Count,0xffff,0x0000) ;
; 	while(1) ;*/
; 	return 0;	
	clr R16
	.dbline -2
L140:
	adiw R28,23
	xcall pop_gset5
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym l addr 21 i
	.dbsym l cluster 13 l
	.dbsym l tempclust 9 l
	.dbsym l sector 5 l
	.dbsym r cnt 10 c
	.dbsym l i 19 i
	.dbsym r buffer 12 pc
	.dbsym l file_type 2 A[3:3]c
	.dbsym r offset 14 i
	.dbsym l item 17 pS[direntry]
	.dbsym l type 37 pc
	.dbsym l Count 35 pi
	.dbsym l MusicInfo 33 pS[direntry]
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
_FileInfo::
	.blkb 15
	.dbstruct 0 15 FileInfoStruct
	.dbfield 0 StartCluster l
	.dbfield 4 Size l
	.dbfield 8 Attr c
	.dbfield 9 Sector l
	.dbfield 13 Offset i
	.dbend
	.dbsym e FileInfo _FileInfo S[FileInfoStruct]
_FAT32_Enable::
	.blkb 1
	.dbsym e FAT32_Enable _FAT32_Enable c
_RootDirCount::
	.blkb 4
	.dbsym e RootDirCount _RootDirCount l
_RootDirSectors::
	.blkb 4
	.dbsym e RootDirSectors _RootDirSectors l
_FirstDirSector::
	.blkb 4
	.dbsym e FirstDirSector _FirstDirSector l
_FirstFATSector::
	.blkb 4
	.dbsym e FirstFATSector _FirstFATSector l
_SectorsPerClust::
	.blkb 2
	.dbsym e SectorsPerClust _SectorsPerClust i
_FATsectors::
	.blkb 2
	.dbsym e FATsectors _FATsectors i
_BytesPerSector::
	.blkb 2
	.dbsym e BytesPerSector _BytesPerSector i
_FirstDataSector::
	.blkb 4
	.dbsym e FirstDataSector _FirstDataSector l
_FirstDirClust::
	.blkb 4
	.dbsym e FirstDirClust _FirstDirClust l
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L139:
	.blkb 20
	.area idata
	.byte 13,10,'S,'e,'a,'r,'c,'h,32,'C,'o,'m,'p,'l,'e,'t
	.byte 'e,'d,33,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L138:
	.blkb 42
	.area idata
	.byte 13,10,'W,'A,'R,'N,'I,'N,'G,58,32,'E,'E,'P,'R,'O
	.byte 'M,32,'i,'s,32,'f,'u,'l,'l,44,32,'n,'o,32,'m,'o
	.byte 'r,'e,32,'s,'p,'a,'c,'e,33,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L133:
	.blkb 80
	.area idata
	.byte 13,10,'S,'e,'a,'r,'c,'h,32,'o,'n,'e,32,'f,'o,'l
	.byte 'd,'e,'r,44,32,'w,'r,'i,'t,'e,32,'t,'h,'e,32,'e
	.byte 'n,'d,32,'f,'l,'a,'g,32,'i,'f,32,'t,'h,'e,32,'t
	.byte 'h,'e,32,'v,'a,'l,'u,'e,32,'i,'s,32,'n,'o,'t,32
	.byte 't,'h,'e,32,'r,'i,'g,'h,'t,32,'v,'a,'l,'u,'e,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L132:
	.blkb 29
	.area idata
	.byte 13,10,'E,'R,'R,'O,'R,58,32,'s,'e,'a,'r,'c,'h,32
	.byte 'f,'o,'l,'d,'e,'r,32,'e,'r,'r,'o,'r,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L122:
	.blkb 13
	.area idata
	.byte 13,10,'S,'e,'a,'r,'c,'h,'I,'n,'i,'t,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L93:
	.blkb 18
	.area idata
	.byte 13,10,'F,'o,'u,'n,'d,32,'a,32,'f,'o,'l,'d,'e,'r
	.byte 33,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L78:
	.blkb 21
	.area idata
	.byte 'A,'p,'p,'l,'y,32,'M,'e,'m,'o,'r,'y,32,'F,'a,'i
	.byte 'l,'u,'r,'e,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L72:
	.blkb 40
	.area idata
	.byte 13,10,'R,'e,'a,'d,32,'E,'E,'P,'R,'O,'M,32,'a,'d
	.byte 'd,'r,'e,'s,'s,58,32,37,'d,32,'v,'a,'l,'u,'e,32
	.byte 'i,'s,58,32,37,'l,'d,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L70:
	.blkb 41
	.area idata
	.byte 13,10,'W,'r,'i,'t,'e,32,'E,'E,'P,'R,'O,'M,32,'a
	.byte 'd,'d,'r,'e,'s,'s,58,37,'d,32,'w,'i,'t,'h,32,'v
	.byte 'a,'l,'u,'e,58,37,'l,'d,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L9:
	.blkb 9
	.area idata
	.byte 'F,'i,'n,'d,'i,'n,'g,46,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L8:
	.blkb 9
	.area idata
	.byte 'B,'M,'P,32,'N,'u,'m,58,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L7:
	.blkb 3
	.area idata
	.byte 'M,'B,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
L6:
	.blkb 9
	.area idata
	.byte 'S,'D,32,'S,'i,'z,'e,58,0
	.area data(ram, con, rel)
	.dbfile E:\ATMEGA128开发板\我的ATMEGA128最小系统板\M128_ZZX_1配套资料\27.读取SD卡中BMP图片实验\ReadBmp\FAT.c
	.area func_lit
PL_mmcWrite:	.word `_mmcWrite
PL_mmcRead:	.word `_mmcRead
