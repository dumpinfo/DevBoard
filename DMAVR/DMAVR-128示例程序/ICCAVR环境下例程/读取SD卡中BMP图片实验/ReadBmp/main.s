	.module main.c
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 20
; //********************************************************************
; /*函 数 名：delay_us
; 建立日期：2010年1月28日
; 编译环境：ICCAVR7.16A
; 函数作用：微秒级的延时程序
; 说    明：7.3728M晶振下
; ********************************************************************/
; void delay_1us(void);
; void delay_3us(void);
; void delay_10us(void);
; void delay_50us(void);
; void delay_100us(void);
; void delay_n100us(unsigned char n100us);
; void delay_1ms(void);
; void delay_nms(unsigned int nms);
; void delay_ns(unsigned char ns);
; 
; 
; void delay_1us(void)                 //1us延时函数，不能连续调用， 
; { 
	.dbline 21
;    asm("nop");                       //1时钟周期
	nop
	.dbline 22
;    asm("nop");
	nop
	.dbline 23
;    asm("nop");
	nop
	.dbline 24
;    asm("nop");
	nop
	.dbline 25
;    asm("nop");                       //1T
	nop
	.dbline 26
;    asm("nop");
	nop
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_3us _delay_3us fV
	.even
_delay_3us::
	.dbline -1
	.dbline 30
; 
; }
; void delay_3us(void)                 //3us延时函数,,可重复调用不影响精度
; { 
	.dbline 32
;    
;    asm("nop");
	nop
	.dbline 33
;    asm("nop");
	nop
	.dbline 34
;    asm("nop");                       
	nop
	.dbline 35
;    asm("nop");
	nop
	.dbline 36
;    asm("nop");
	nop
	.dbline 37
;    asm("nop");
	nop
	.dbline 38
;    asm("nop");                       
	nop
	.dbline 39
;    asm("nop");
	nop
	.dbline 40
;    asm("nop");
	nop
	.dbline 41
;    asm("nop");
	nop
	.dbline 42
;    asm("nop");                       
	nop
	.dbline 43
;    asm("nop");
	nop
	.dbline 44
;    asm("nop");
	nop
	.dbline 45
;    asm("nop");
	nop
	.dbline 46
;    asm("nop");                       
	nop
	.dbline 47
;    asm("nop");
	nop
	.dbline 48
;    asm("nop");
	nop
	.dbline 49
;    asm("nop");
	nop
	.dbline 50
;    asm("nop");
	nop
	.dbline 51
;    asm("nop");
	nop
	.dbline 52
;    asm("nop");                       
	nop
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_10us _delay_10us fV
	.even
_delay_10us::
	.dbline -1
	.dbline 56
; } 
; 
; void delay_10us(void)                 //10us延时函数,,可重复调用不影响精度
; {
	.dbline 57
;    delay_3us();
	xcall _delay_3us
	.dbline 58
;    delay_3us(); 
	xcall _delay_3us
	.dbline 59
;    delay_3us();  
	.dbline -2
L3:
	.dbline 0 ; func end
	xjmp _delay_3us
	.dbend
	.dbfunc e delay_50us _delay_50us fV
	.even
_delay_50us::
	.dbline -1
	.dbline 63
; }
;   
; void delay_50us(void)                 //48us延时函数,,可重复调用不影响精度
; { 
	.dbline 64
;    delay_10us();
	xcall _delay_10us
	.dbline 65
;    delay_10us(); 
	xcall _delay_10us
	.dbline 66
;    delay_10us();
	xcall _delay_10us
	.dbline 67
;    delay_10us();
	.dbline -2
L4:
	.dbline 0 ; func end
	xjmp _delay_10us
	.dbend
	.dbfunc e delay_100us _delay_100us fV
	.even
_delay_100us::
	.dbline -1
	.dbline 70
; }
; void delay_100us(void)     //exactly 98us延时函数,,可重复调用不影响精度
; {
	.dbline 71
;  delay_50us();
	xcall _delay_50us
	.dbline 72
;  delay_50us();
	.dbline -2
L5:
	.dbline 0 ; func end
	xjmp _delay_50us
	.dbend
	.dbfunc e delay_n100us _delay_n100us fV
;         n100us -> R20
	.even
_delay_n100us::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 75
; }
; void delay_n100us(unsigned char n100us)
; {
	xjmp L8
L7:
	.dbline 77
;  while(n100us--)                          
;  delay_100us();
	xcall _delay_100us
L8:
	.dbline 76
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L7
X0:
	.dbline -2
L6:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r n100us 20 c
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
	.even
_delay_1ms::
	.dbline -1
	.dbline 89
; }
; /*delay_n100us(2)        250us
; delay_n100us(3)          360us
; delay_n100us(4)          470us
; delay_n100us(5)          580us
; delay_n100us(6)          690us
; delay_n100us(7)       800us
; delay_n100us(8)          900us              主要是由于函数声明及while,,,大概6us
; 
; */
; void delay_1ms()
; {
	.dbline 90
;  delay_100us();
	xcall _delay_100us
	.dbline 91
;  delay_100us();
	xcall _delay_100us
	.dbline 92
;  delay_100us();
	xcall _delay_100us
	.dbline 93
;  delay_100us();
	xcall _delay_100us
	.dbline 94
;  delay_100us();
	xcall _delay_100us
	.dbline 95
;  delay_100us();
	xcall _delay_100us
	.dbline 96
;  delay_100us();
	xcall _delay_100us
	.dbline 97
;  delay_100us();
	xcall _delay_100us
	.dbline 98
;  delay_100us();
	xcall _delay_100us
	.dbline 99
;  delay_100us();
	.dbline -2
L10:
	.dbline 0 ; func end
	xjmp _delay_100us
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;            nms -> R20,R21
	.even
_delay_nms::
	st -y,R20
	st -y,R21
	movw R20,R16
	.dbline -1
	.dbline 109
; }
; /********************************************************************
; 函 数 名：Delay_ms
; 建立日期：2010年1月28日
; 修改日期：
; 函数作用：毫秒级的精确延时程序
; 说    明：
; ********************************************************************/
; void delay_nms(unsigned int nms)
; {
	xjmp L13
L12:
	.dbline 111
;  while(nms--) 
;  delay_1ms();
	xcall _delay_1ms
L13:
	.dbline 110
	movw R2,R20
	subi R20,1
	sbci R21,0
	tst R2
	brne L12
	tst R3
	brne L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ld R21,y+
	ld R20,y+
	ret
	.dbsym r nms 20 i
	.dbend
	.dbfunc e delay_ns _delay_ns fV
;             ns -> R20
	.even
_delay_ns::
	st -y,R20
	mov R20,R16
	.dbline -1
	.dbline 114
; }
; void delay_ns(unsigned char ns)
; {
	xjmp L17
L16:
	.dbline 116
;  while(ns--) 
;  delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
L17:
	.dbline 115
	mov R2,R20
	clr R3
	subi R20,1
	tst R2
	brne L16
X2:
	.dbline -2
L15:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r ns 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
_image_count::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile F:\PROGRA~1\iccavr\include\delay.h
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
	.dbsym e image_count _image_count i
_image_all::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
	.dbsym e image_all _image_all i
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
	.dbfunc e disp_image _disp_image fV
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
	.dbstruct 0 15 FileInfoStruct
	.dbfield 0 StartCluster l
	.dbfield 4 Size l
	.dbfield 8 Attr c
	.dbfield 9 Sector l
	.dbfield 13 Offset i
	.dbend
;       FileInfo -> y+41
;           type -> y+40
;        BMPInfo -> y+8
;          byte3 -> y+70
;          byte2 -> y+69
;          byte1 -> y+68
;              p -> y+4
;          first -> y+67
;              i -> y+65
;      tmp_color -> R14,R15
;         buffer -> R10,R11
;              y -> y+63
;          color -> y+61
;              x -> y+60
;          count -> y+58
;     color_byte -> y+57
;            rgb -> y+56
	.even
_disp_image::
	xcall push_xgsetF0FC
	sbiw R28,63
	sbiw R28,8  ; offset = 71
	.dbline -1
	.dbline 25
; //DMAVR-M128读取SD卡中BMP图片实验，基于FAT16/32文件系统
; //SD卡中图片文件为BMP形式，用Img2LCD将JPG图片转换为24位BMP图形式即可
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <BMP_main.h>
; 
; int i;
; WORD image_count = 0 ,image_all = 0 ;
; 
; extern u16 SectorsPerClust;//每簇扇区数
; 
; extern u08  FAT32_Enable;
;  extern char _bss_end;
; 
; //***********************************************************************
; //			显示图片函数，每张图片轮流显示，文件位于根目录下，24位色
; //***********************************************************************
; void disp_image(void)
;   {
	.dbline 26
;     WORD count= 1 ,i =0   ;
	ldi R24,1
	ldi R25,0
	std y+59,R25
	std y+58,R24
	.dbline 26
	clr R0
	clr R1
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	std z+1,R1
	std z+0,R0
	.dbline 33
; 	u08 *buffer ;
; 	u08 type ,x , rgb,first ,color_byte,byte1,byte2,byte3 ;
; 	u16 y ,color,tmp_color ;
;     u32 p;							//簇指示值		
; 	struct FileInfoStruct FileInfo;	//文件信息	
; 	struct direntry BMPInfo;		//要显示的BMP文件信息	
; 	type = 1 ;
	std y+40,R24
	.dbline 38
; 	
; 	
; 	
; 	
; 	if( image_all == 0 )    		//读取总图片数
	lds R2,_image_all
	lds R3,_image_all+1
	tst R2
	breq X28
	xjmp L20
X28:
	tst R3
	breq X29
	xjmp L20
X29:
X3:
	.dbline 39
; 	  {
	.dbline 40
;          image_count =  0 ;
	clr R2
	clr R3
	sts _image_count+1,R3
	sts _image_count,R2
	.dbline 41
; 	     byte1 = Search(&BMPInfo,&image_count,&type) ;
	movw R24,R28
	adiw R24,40
	std y+1,R25
	std y+0,R24
	ldi R18,<_image_count
	ldi R19,>_image_count
	movw R16,R28
	subi R16,248  ; offset = 8
	sbci R17,255
	xcall _Search
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	std z+0,R16
	.dbline 42
; 		 image_all = image_count ;
	lds R2,_image_count
	lds R3,_image_count+1
	sts _image_all+1,R3
	sts _image_all,R2
	.dbline 43
;  		 DisplayChar(image_all/10+'0',8,9,0xffff);  //BMP图片数量显示
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,8
	ldi R24,10
	ldi R25,0
	lds R16,_image_all
	lds R17,_image_all+1
	push R18
	push R19
	movw R18,R24
	xcall div16u
	pop R19
	pop R18
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 44
; 		 DisplayChar(image_all%10+'0',9,9,0xffff);  //BMP图片数量显示
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,9
	ldi R24,10
	ldi R25,0
	lds R16,_image_all
	lds R17,_image_all+1
	push R18
	push R19
	movw R18,R24
	xcall mod16u
	pop R19
	pop R18
	subi R16,208  ; offset = 48
	sbci R17,255
	xcall _DisplayChar
	.dbline 45
; 		 DisplayString("       ",10,9,0xffff);  	//BMP图片数量，最大显示99张，可以更改算法
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,9
	std y+0,R24
	ldi R18,10
	ldi R16,<L22
	ldi R17,>L22
	xcall _DisplayString
	.dbline 46
; 		 delay_nms(1000);
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 47
; 		 image_count = 1 ;
	ldi R24,1
	ldi R25,0
	sts _image_count+1,R25
	sts _image_count,R24
	.dbline 49
; 		 		 
; 	  }
	xjmp L21
L20:
	.dbline 51
; 	else  
;       {		
	.dbline 52
;           byte1 = Search(&BMPInfo,&image_count,&type) ;
	movw R24,R28
	adiw R24,40
	std y+1,R25
	std y+0,R24
	ldi R18,<_image_count
	ldi R19,>_image_count
	movw R16,R28
	subi R16,248  ; offset = 8
	sbci R17,255
	xcall _Search
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	std z+0,R16
	.dbline 53
;       }	
L21:
	.dbline 57
; 	 
; 	 
; 	 
; 	p = BMPInfo.deStartCluster+(((u32)BMPInfo.deHighClust)<<16);//读文件首簇
	ldd R2,y+28
	ldd R3,y+29
	clr R4
	clr R5
	movw R4,R2
	clr R2
	clr R3
	ldd R6,y+34
	ldd R7,y+35
	clr R8
	clr R9
	add R6,R2
	adc R7,R3
	adc R8,R4
	adc R9,R5
	std y+4,R6
	std y+5,R7
	std y+6,R8
	std y+7,R9
	.dbline 59
; 	
; 	x = 0 ;
	clr R0
	std y+60,R0
	.dbline 60
; 	y = 159 ;
	ldi R24,159
	ldi R25,0
	movw R30,R28
	adiw R30,63
	std z+1,R25
	std z+0,R24
	.dbline 61
; 	rgb = 0 ;
	std y+56,R0
	.dbline 62
; 	count = 0 ;
	clr R1
	std y+59,R1
	std y+58,R0
	.dbline 63
; 	first = 0 ;
	movw R30,R28
	subi R30,189  ; addi 67
	sbci R31,255
	std z+0,R0
	.dbline 64
; 	buffer=malloc(512);	
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R10,R16
	xjmp L26
L25:
	.dbline 66
; 	while(1)
; 	 {
	.dbline 67
; 		i = 0 ;
	clr R0
	clr R1
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	std z+1,R1
	std z+0,R0
	.dbline 69
; 	
; 	    for( ; i < SectorsPerClust ; i++ )      //簇
	xjmp L31
L28:
	.dbline 70
; 	     {
	.dbline 72
; 	 
; 	        FAT_LoadPartCluster(p,i,buffer);	//读一个扇区	
	std y+3,R11
	std y+2,R10
	movw R26,R28
	subi R26,191  ; addi 65
	sbci R27,255
	ld R0,x+
	ld R1,x
	std y+1,R1
	std y+0,R0
	ldd R16,y+4
	ldd R17,y+5
	ldd R18,y+6
	ldd R19,y+7
	xcall _FAT_LoadPartCluster
	.dbline 74
; 	   
; 	        if(i==0 && first==0) { count= buffer[0x0a] ; color_byte = buffer[0x1c] / 8  ;  first = 1 ; } 
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	ldd R0,z+0
	ldd R1,z+1
	tst R0
	brne L32
	tst R1
	brne L32
X4:
	movw R30,R28
	subi R30,189  ; addi 67
	sbci R31,255
	ldd R0,z+0
	tst R0
	brne L32
X5:
	.dbline 74
	.dbline 74
	movw R30,R10
	ldd R2,z+10
	clr R3
	std y+59,R3
	std y+58,R2
	.dbline 74
	ldd R2,z+28
	lsr R2
	lsr R2
	lsr R2
	std y+57,R2
	.dbline 74
	clr R0
	inc R0
	movw R30,R28
	subi R30,189  ; addi 67
	sbci R31,255
	std z+0,R0
	.dbline 74
	xjmp L35
L32:
	.dbline 75
; 	        else { count=0 ; }
	.dbline 75
	clr R0
	clr R1
	std y+59,R1
	std y+58,R0
	.dbline 75
	xjmp L35
L34:
	.dbline 80
; 	   
; 	        
; 			
; 			while(count<512)  //读取一簇512扇区 (SectorsPerClust 每簇扇区数)
; 	          {
	.dbline 82
; 		   
; 		        if(color_byte == 3)   //24位颜色图
	ldd R24,y+57
	cpi R24,3
	breq X30
	xjmp L37
X30:
X6:
	.dbline 83
; 		          {
	.dbline 84
;                       switch ( rgb ) 
	ldd R12,y+56
	clr R13
	tst R12
	brne X7
	tst R13
	breq L42
X7:
	movw R24,R12
	cpi R24,1
	ldi R30,0
	cpc R25,R30
	breq L43
X8:
	cpi R24,2
	ldi R30,0
	cpc R25,R30
	brne X31
	xjmp L44
X31:
X9:
	xjmp L39
L42:
	.dbline 86
;                         {
; 			               case 0 : tmp_color = buffer[count]>>3 ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 87
; 			                        color |= tmp_color;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R14
	or R1,R15
	std y+62,R1
	std y+61,R0
	.dbline 88
; 					                break ;
	xjmp L40
L43:
	.dbline 90
; 					  
; 			               case 1 : tmp_color = buffer[count]>>2 ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 91
; 			                        tmp_color <<= 5 ;
	ldi R18,5
	ldi R19,0
	movw R16,R14
	xcall lsl16
	movw R14,R16
	.dbline 92
; 			                        color |= tmp_color ;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R16
	or R1,R17
	std y+62,R1
	std y+61,R0
	.dbline 93
; 					                break ;
	xjmp L40
L44:
	.dbline 95
; 					   
;        			           case 2 : tmp_color = buffer[count]>>3 ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 96
; 			                        tmp_color <<= 11 ;
	ldi R18,11
	ldi R19,0
	movw R16,R14
	xcall lsl16
	movw R14,R16
	.dbline 97
; 			                        color |= tmp_color ;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R16
	or R1,R17
	std y+62,R1
	std y+61,R0
	.dbline 98
; 					                 break ;			
L39:
L40:
	.dbline 101
; 			            }
; 			
;                       rgb ++ ;
	ldd R0,y+56
	inc R0
	std y+56,R0
	.dbline 102
; 			      }
	xjmp L38
L37:
	.dbline 104
; 		        else
; 		          {
	.dbline 105
; 			          if(color_byte==2)  //16位颜色图
	ldd R24,y+57
	cpi R24,2
	breq X32
	xjmp L45
X32:
X10:
	.dbline 106
; 				        {
	.dbline 107
; 				          switch ( rgb )
	ldd R12,y+56
	clr R13
	tst R12
	brne X11
	tst R13
	breq L50
X11:
	movw R24,R12
	cpi R24,1
	ldi R30,0
	cpc R25,R30
	breq L51
X12:
	xjmp L47
L50:
	.dbline 109
; 					        {
; 					          case 0 : byte1 = buffer[count] ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	std z+0,R2
	.dbline 110
; 								       break ; 
	xjmp L48
L51:
	.dbline 113
; 								   
; 						      case 1 :    
; 								       color = buffer[count] ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	clr R3
	std y+62,R3
	std y+61,R2
	.dbline 114
; 								       color<<=8 ;
	movw R0,R2
	mov R1,R0
	clr R0
	std y+62,R1
	std y+61,R0
	.dbline 115
; 								       color |= byte1 ;
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	ldd R2,z+0
	clr R3
	or R0,R2
	or R1,R3
	std y+62,R1
	std y+61,R0
	.dbline 116
; 								       break ;
L47:
L48:
	.dbline 119
; 					     
; 					        }
; 					      rgb ++ ;
	ldd R0,y+56
	inc R0
	std y+56,R0
	.dbline 121
; 				    
; 				        }
	xjmp L46
L45:
	.dbline 123
; 				      else 
; 				        {
	.dbline 124
; 				          if(color_byte==4) //32位颜色图
	ldd R24,y+57
	cpi R24,4
	breq X33
	xjmp L52
X33:
X13:
	.dbline 125
; 				            {
	.dbline 126
; 				              switch ( rgb )
	ldd R12,y+56
	clr R13
	tst R12
	brne X14
	tst R13
	breq L57
X14:
	movw R24,R12
	cpi R24,1
	ldi R30,0
	cpc R25,R30
	breq L58
X15:
	cpi R24,2
	ldi R30,0
	cpc R25,R30
	breq L59
X16:
	cpi R24,3
	ldi R30,0
	cpc R25,R30
	breq L60
X17:
	xjmp L54
L57:
	.dbline 128
; 					            {
; 					              case 0 :  byte1 = buffer[count] ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	std z+0,R2
	.dbline 129
; 								            break ; 
	xjmp L55
L58:
	.dbline 131
; 								   
; 						          case 1 :  byte2 = buffer[count] ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	movw R30,R28
	subi R30,187  ; addi 69
	sbci R31,255
	std z+0,R2
	.dbline 132
;                                             break ;
	xjmp L55
L59:
	.dbline 134
; 									   
; 							      case 2 :  byte3 = buffer[count] ;
	ldd R30,y+58
	ldd R31,y+59
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	movw R30,R28
	subi R30,186  ; addi 70
	sbci R31,255
	std z+0,R2
	.dbline 135
; 							                break ;
	xjmp L55
L60:
	.dbline 137
; 									   
; 							      case 3 :  tmp_color = byte1 >> 3 ;
	movw R30,R28
	subi R30,188  ; addi 68
	sbci R31,255
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 138
; 			                                color |= tmp_color;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R14
	or R1,R15
	std y+62,R1
	std y+61,R0
	.dbline 139
; 									        tmp_color = byte2 >>2 ;
	movw R30,R28
	subi R30,187  ; addi 69
	sbci R31,255
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 140
; 			                                tmp_color <<= 5 ;
	ldi R18,5
	ldi R19,0
	movw R16,R14
	xcall lsl16
	.dbline 141
; 			                                color |= tmp_color ;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R16
	or R1,R17
	std y+62,R1
	std y+61,R0
	.dbline 142
; 									        tmp_color = byte3 >>3 ;
	movw R30,R28
	subi R30,186  ; addi 70
	sbci R31,255
	ldd R14,z+0
	clr R15
	asr R15
	ror R14
	asr R15
	ror R14
	asr R15
	ror R14
	.dbline 143
; 			                                tmp_color <<= 11 ;
	ldi R18,11
	ldi R19,0
	movw R16,R14
	xcall lsl16
	movw R14,R16
	.dbline 144
; 			                                color |= tmp_color ;
	ldd R0,y+61
	ldd R1,y+62
	or R0,R16
	or R1,R17
	std y+62,R1
	std y+61,R0
	.dbline 145
; 									        break ;
L54:
L55:
	.dbline 148
; 					     
; 					            }
; 					           rgb ++ ;
	ldd R0,y+56
	inc R0
	std y+56,R0
	.dbline 150
; 				    
; 				            }
L52:
	.dbline 152
; 				     
; 				        }   
L46:
	.dbline 154
; 			 
; 			       }
L38:
	.dbline 156
;            
; 		   count ++ ;
	ldd R24,y+58
	ldd R25,y+59
	adiw R24,1
	std y+59,R25
	std y+58,R24
	.dbline 158
; 		   
; 		   if(rgb == color_byte)        //读取1像素数数据后显示
	ldd R0,y+56
	ldd R16,y+57
	cp R0,R16
	brne L61
X18:
	.dbline 159
; 		     {
	.dbline 160
; 			    GUIpoint(x, y,color) ;
	ldd R0,y+61
	ldd R1,y+62
	std y+1,R1
	std y+0,R0
	movw R30,R28
	adiw R30,63
	ldd R18,z+0
	ldd R19,z+1
	ldd R16,y+60
	xcall _GUIpoint
	.dbline 161
; 				color = 0x00 ;
	clr R0
	clr R1
	std y+62,R1
	std y+61,R0
	.dbline 162
; 			    x++ ;
	ldd R0,y+60
	inc R0
	std y+60,R0
	.dbline 163
; 			    if(x>=128)
	mov R24,R0
	cpi R24,128
	brlo L63
X19:
	.dbline 164
; 				  {
	.dbline 165
; 				    y-- ;
	movw R30,R28
	adiw R30,63
	ldd R24,z+0
	ldd R25,z+1
	sbiw R24,1
	movw R30,R28
	adiw R30,63
	std z+1,R25
	std z+0,R24
	.dbline 167
; 					
; 					if( (y+1)<=0 )
	adiw R24,1
	brne L65
X20:
	.dbline 168
; 		              {
	.dbline 170
; 					    
; 						free(buffer) ;
	movw R16,R10
	xcall _free
	.dbline 171
; 			            return ;
	xjmp L19
L65:
	.dbline 173
; 			          }
; 					x = 0 ;
	clr R0
	std y+60,R0
	.dbline 174
; 				  }
L63:
	.dbline 176
; 		        
; 				rgb = 0 ;
	clr R0
	std y+56,R0
	.dbline 177
; 			 }
L61:
	.dbline 180
; 			 
; 			
; 		}
L35:
	.dbline 79
	ldd R24,y+58
	ldd R25,y+59
	cpi R24,0
	ldi R30,2
	cpc R25,R30
	brsh X34
	xjmp L34
X34:
X21:
	.dbline 182
; 	   
; 	 }  // 读取完一簇数据
L29:
	.dbline 69
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	ldd R24,z+0
	ldd R25,z+1
	adiw R24,1
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	std z+1,R25
	std z+0,R24
L31:
	.dbline 69
	lds R2,_SectorsPerClust
	lds R3,_SectorsPerClust+1
	movw R30,R28
	subi R30,191  ; addi 65
	sbci R31,255
	ldd R0,z+0
	ldd R1,z+1
	cp R0,R2
	cpc R1,R3
	brsh X35
	xjmp L28
X35:
X22:
	.dbline 184
; 	 
; 	 free(buffer) ;
	movw R16,R10
	xcall _free
	.dbline 185
; 	 p=FAT_NextCluster(p);//读下一簇数据			
	ldd R16,y+4
	ldd R17,y+5
	ldd R18,y+6
	ldd R19,y+7
	xcall _FAT_NextCluster
	std y+4,R16
	std y+5,R17
	std y+6,R18
	std y+7,R19
	.dbline 186
; 	 buffer=malloc(512);	
	ldi R16,512
	ldi R17,2
	xcall _malloc
	movw R14,R16
	movw R10,R14
	.dbline 188
; 	
; 	if(p == 0x0fffffff || p == 0x0ffffff8 || (FAT32_Enable == 0 && p == 0xffff))//如果无后续簇则结束
	ldi R20,255
	ldi R21,255
	ldi R22,255
	ldi R23,15
	ldd R2,y+4
	ldd R3,y+5
	ldd R4,y+6
	ldd R5,y+7
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L70
X23:
	ldi R20,248
	ldi R21,255
	ldi R22,255
	ldi R23,15
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	breq L70
X24:
	lds R2,_FAT32_Enable
	tst R2
	brne L67
X25:
	ldi R20,255
	ldi R21,255
	ldi R22,0
	ldi R23,0
	ldd R2,y+4
	ldd R3,y+5
	ldd R4,y+6
	ldd R5,y+7
	cp R2,R20
	cpc R3,R21
	cpc R4,R22
	cpc R5,R23
	brne L67
X26:
L70:
	.dbline 189
; 		{
	.dbline 190
; 		        free(buffer) ;
	movw R16,R10
	xcall _free
	.dbline 191
; 				return ;
	xjmp L19
L67:
	.dbline 194
; 		}
; 	 
;   }
L26:
	.dbline 65
	xjmp L25
X27:
	.dbline -2
L19:
	.dbline 0 ; func end
	adiw R28,63
	adiw R28,8  ; offset = 71
	xjmp pop_xgsetF0FC
	.dbsym l FileInfo 41 S[FileInfoStruct]
	.dbsym l type 40 c
	.dbsym l BMPInfo 8 S[direntry]
	.dbsym l byte3 70 c
	.dbsym l byte2 69 c
	.dbsym l byte1 68 c
	.dbsym l p 4 l
	.dbsym l first 67 c
	.dbsym l i 65 i
	.dbsym r tmp_color 14 s
	.dbsym r buffer 10 pc
	.dbsym l y 63 s
	.dbsym l color 61 s
	.dbsym l x 60 c
	.dbsym l count 58 i
	.dbsym l color_byte 57 c
	.dbsym l rgb 56 c
	.dbend
	.dbfunc e LED_Off _LED_Off fV
	.even
_LED_Off::
	.dbline -1
	.dbline 203
; 		
; 	free(buffer) ;
;   
;  }
; //***********************************************************************
; //			关闭数码管，防止显示乱码
; //***********************************************************************
; void LED_Off()
; {
	.dbline 204
;     PORTD=0xFF;
	ldi R24,255
	out 0x12,R24
	.dbline 205
; 	DDRD=0xFF;
	out 0x11,R24
	.dbline 206
; 	D_LE1;                             				//关掉数码管，以免显示乱码                   
	sbi 0x12,4
	.dbline 207
;     W_LE1;                     
	sbi 0x12,5
	.dbline 208
;     Data_IO=0xFF;                      				//关数码管            
	out 0x1b,R24
	.dbline 209
;     W_LE0; 
	cbi 0x12,5
	.dbline -2
L71:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              y -> R12,R13
;             er -> R12
;             ok -> R12
;              x -> R20
;          retry -> R10
;              i -> R20
	.even
_main::
	sbiw R28,6
	.dbline -1
	.dbline 215
; }
; //***********************************************************************
; //			主函数，初始化及函数调用
; //***********************************************************************
; void main(void)
; {
	.dbline 216
;   unsigned char i, x,retry=0;
	clr R10
	.dbline 219
;   u08 ok,er ;
;   unsigned int y ;
;   delay_nms(10);
	ldi R16,10
	ldi R17,0
	xcall _delay_nms
	.dbline 220
;   McuInit();
	xcall _McuInit
	.dbline 221
;   UART_Init();
	xcall _UART_Init
	.dbline 222
;   LCD_RD1; 
	lds R24,101
	ori R24,16
	sts 101,R24
	.dbline 223
;   LCD_Init();     									//LCD初始化
	xcall _LCD_Init
	.dbline 224
;   x = 1 ;
	.dbline 225
;   y = 0 ;
	clr R12
	clr R13
	.dbline 226
;   LCD_clear(0) ;
	clr R16
	clr R17
	xcall _LCD_clear
	.dbline 228
;   	
;   for(i=0; i<5 ;i++)
	clr R20
	xjmp L76
L73:
	.dbline 229
;    {
	.dbline 230
; 	DisplayGB2312(i+18,i+1,0,0x07E0) ;    			//显示欣世纪电子
	ldi R24,2016
	ldi R25,7
	std y+3,R25
	std y+2,R24
	clr R2
	std y+0,R2
	mov R18,R20
	subi R18,255    ; addi 1
	mov R16,R20
	subi R16,238    ; addi 18
	xcall _DisplayGB2312
	.dbline 231
;    }
L74:
	.dbline 228
	inc R20
L76:
	.dbline 228
	cpi R20,5
	brlo L73
X36:
	.dbline 232
; 	DisplayString("DMAVR-128 Board",0,1,0xf800);  	//字符串显示调用
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,1
	std y+0,R24
	clr R18
	ldi R16,<L77
	ldi R17,>L77
	xcall _DisplayString
	.dbline 233
; 	DisplayString("Show BMP from SD",0,2,0xeee);  	//字符串显示调用
	ldi R24,3822
	ldi R25,14
	std y+3,R25
	std y+2,R24
	ldi R24,2
	std y+0,R24
	clr R18
	ldi R16,<L78
	ldi R17,>L78
	xcall _DisplayString
	.dbline 234
; 	GUIline(0,49,127,49,0xe387);
	ldi R24,58247
	ldi R25,227
	std y+5,R25
	std y+4,R24
	ldi R24,49
	std y+2,R24
	ldi R24,127
	std y+0,R24
	ldi R18,49
	clr R16
	xcall _GUIline
	.dbline 235
; 	GUIline(0,51,127,51,0xfef);
	ldi R24,4079
	ldi R25,15
	std y+5,R25
	std y+4,R24
	ldi R24,51
	std y+2,R24
	ldi R24,127
	std y+0,R24
	ldi R18,51
	clr R16
	xcall _GUIline
	.dbline 237
; 		
;  	ok = 0 ;
	.dbline 238
;  	er = 0 ;
	clr R12
	.dbline 239
; 	DisplayString("Starting Init SD",0,4,0xffff);  //字符串显示调用
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,4
	std y+0,R24
	clr R18
	ldi R16,<L79
	ldi R17,>L79
	xcall _DisplayString
	.dbline 240
; 	DisplayString("Waiting...",0,5,0xffff);  		//字符串显示调用
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,5
	std y+0,R24
	clr R18
	ldi R16,<L80
	ldi R17,>L80
	xcall _DisplayString
	.dbline 241
;   	mmcInit();
	xcall _mmcInit
	.dbline 242
;   	delay_nms(1);
	ldi R16,1
	ldi R17,0
	xcall _delay_nms
	xjmp L82
L81:
	.dbline 246
;   
; 	  
;   while(mmcReset())									//初始化SD卡					
; 	{
	.dbline 247
; 		retry++;
	inc R10
	.dbline 248
; 		if(retry>20)
	ldi R24,20
	cp R24,R10
	brsh L84
X37:
	.dbline 249
; 		{
	xjmp L87
L86:
	.dbline 251
; 			while(1)   											//初始化失败显示
; 			{
	.dbline 252
; 				DisplayString("Init Failure",0,7,0xf800);  		//字符串显示调用
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,7
	std y+0,R24
	clr R18
	ldi R16,<L89
	ldi R17,>L89
	xcall _DisplayString
	.dbline 253
; 	            DisplayString("Please Check SD",0,8,0xf800);  	//字符串显示调用
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,8
	std y+0,R24
	clr R18
	ldi R16,<L90
	ldi R17,>L90
	xcall _DisplayString
	.dbline 254
; 			}
L87:
	.dbline 250
	xjmp L86
L84:
	.dbline 256
; 		}
; 	} 
L82:
	.dbline 245
	xcall _mmcReset
	tst R16
	brne L81
X38:
	.dbline 258
; 	  	  
; 	DisplayString("Init SD Success!",0,6,0xffff);  				//字符串显示调用
	ldi R24,65535
	ldi R25,255
	std y+3,R25
	std y+2,R24
	ldi R24,6
	std y+0,R24
	clr R18
	ldi R16,<L91
	ldi R17,>L91
	xcall _DisplayString
	.dbline 261
; 	 
; 	
; 	if(FAT_Init())												//初始化文件系统 支持FAT16和FAT32	
	xcall _FAT_Init
	tst R16
	breq L92
X39:
	.dbline 262
; 	{
	xjmp L95
L97:
	.dbline 266
; 		while(1)
; 		{
; 			while(1)
; 			{
	.dbline 267
; 				DisplayString("Init FAT Failure",0,7,0xf800);  //字符串显示调用
	ldi R24,63488
	ldi R25,248
	std y+3,R25
	std y+2,R24
	ldi R24,7
	std y+0,R24
	clr R18
	ldi R16,<L100
	ldi R17,>L100
	xcall _DisplayString
	.dbline 268
; 			}
L98:
	.dbline 265
	xjmp L97
L95:
	.dbline 263
	xjmp L98
L92:
	.dbline 272
; 		}
; 
; 	}
; 	printf("Begin initing\r\n");
	ldi R16,<L101
	ldi R17,>L101
	xcall _printf
	.dbline 273
; 	_NewHeap(&_bss_end+1, &_bss_end + 550);                     //动态分配内存(malloc(512))需要初始化，空间比需要分配的要大才行
	ldi R18,<__bss_end+550
	ldi R19,>__bss_end+550
	ldi R16,<__bss_end+1
	ldi R17,>__bss_end+1
	xcall __NewHeap
	.dbline 274
; 	SearchInit();  												//搜索文件初始化
	xcall _SearchInit
	xjmp L105
L104:
	.dbline 278
; 
; 	
; 	while(1)                               						//轮流显示SD卡中的图片
; 	 {
	.dbline 279
; 	    disp_image() ;
	xcall _disp_image
	.dbline 280
; 		delay_nms(1000) ;
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 281
; 		delay_nms(1000) ;
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 282
; 		delay_nms(1000) ;
	ldi R16,1000
	ldi R17,3
	xcall _delay_nms
	.dbline 284
; 		                              			
; 		if(image_count<image_all)								//轮流显示SD卡中的BMP图片
	lds R2,_image_all
	lds R3,_image_all+1
	lds R4,_image_count
	lds R5,_image_count+1
	cp R4,R2
	cpc R5,R3
	brsh L107
X40:
	.dbline 285
; 		    {
	.dbline 286
; 		      image_count ++ ;
	movw R24,R4
	adiw R24,1
	sts _image_count+1,R25
	sts _image_count,R24
	.dbline 287
; 		    }
	xjmp L108
L107:
	.dbline 289
; 		 else 
; 		    {
	.dbline 290
; 			  image_count = 1 ;
	ldi R24,1
	ldi R25,0
	sts _image_count+1,R25
	sts _image_count,R24
	.dbline 291
; 			} 
L108:
	.dbline 294
; 		
; 		
; 	 }
L105:
	.dbline 277
	xjmp L104
X41:
	.dbline -2
L72:
	.dbline 0 ; func end
	adiw R28,6
	ret
	.dbsym r y 12 i
	.dbsym r er 12 c
	.dbsym r ok 12 c
	.dbsym r x 20 c
	.dbsym r retry 10 c
	.dbsym r i 20 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
_i::
	.blkb 2
	.dbsym e i _i I
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L101:
	.blkb 16
	.area idata
	.byte 'B,'e,'g,'i,'n,32,'i,'n,'i,'t,'i,'n,'g,13,10,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L100:
	.blkb 17
	.area idata
	.byte 'I,'n,'i,'t,32,'F,'A,'T,32,'F,'a,'i,'l,'u,'r,'e
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L91:
	.blkb 17
	.area idata
	.byte 'I,'n,'i,'t,32,'S,'D,32,'S,'u,'c,'c,'e,'s,'s,33
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L90:
	.blkb 16
	.area idata
	.byte 'P,'l,'e,'a,'s,'e,32,'C,'h,'e,'c,'k,32,'S,'D,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L89:
	.blkb 13
	.area idata
	.byte 'I,'n,'i,'t,32,'F,'a,'i,'l,'u,'r,'e,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L80:
	.blkb 11
	.area idata
	.byte 'W,'a,'i,'t,'i,'n,'g,46,46,46,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L79:
	.blkb 17
	.area idata
	.byte 'S,'t,'a,'r,'t,'i,'n,'g,32,'I,'n,'i,'t,32,'S,'D
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L78:
	.blkb 17
	.area idata
	.byte 'S,'h,'o,'w,32,'B,'M,'P,32,'f,'r,'o,'m,32,'S,'D
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L77:
	.blkb 16
	.area idata
	.byte 'D,'M,'A,'V,'R,45,49,50,56,32,'B,'o,'a,'r,'d,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
L22:
	.blkb 8
	.area idata
	.byte 32,32,32,32,32,32,32,0
	.area data(ram, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\main.c
; 
; }
; 
