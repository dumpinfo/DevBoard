	.module EEPROM.C
	.area text(rom, con, rel)
	.dbfile E:\DMAVR-~3\ReadBmp\EEPROM.C
	.dbfunc e eeprom_read_byte _eeprom_read_byte fI
;       readtemp -> R10
;           addr -> R16,R17
	.even
_eeprom_read_byte::
	st -y,R10
	.dbline -1
	.dbline 32
; //DMAVR-128的读写EEPROM示例程序，记录CPU启动的次数到EEPROM中
; //在LED数码管上显示读出的数据,可用复位键刷新显示
; //编译环境 ICCAVR 7.16A
; //系统时钟7.3728MHZ，设置熔丝位为外部高频石英晶体振荡，启动时间4.1ms
; //作者：阿迪 www.avrgcc.com
; //日期：2010.01.14
; //***********************************************************************
; //			包含文件
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #define	 F_CPU	7372800							// 单片机主频为7.3728MHz,用于延时子程序
; //#include <delay.h>
; #include <iom128v.h>
; 
; 
; //***********************************************************************
; //			定义变量区
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; 
; 
; //***********************************************************************
; //                EEPROM读取函数*/
; //            addr：地址；number：长度；p_buff：读出数据存放指针
; //***********************************************************************
;  eeprom_read_byte(unsigned int addr) 
; {
L2:
	.dbline 34
;    unsigned char readtemp;
; 	while(EECR & (1 << EEWE));               //等待前面的写完成
L3:
	.dbline 34
	sbic 0x1c,1
	rjmp L2
X0:
	.dbline 36
; 
; 	EEARH = 0x00;                           //写高字节地址
	clr R2
	out 0x1f,R2
	.dbline 38
; 	
; 		EEARL = addr;                 	//写地址低字节
	out 0x1e,R16
	.dbline 39
; 		EECR |= (1 << EERE);            	//读允许位置1
	sbi 0x1c,0
	.dbline 40
; 		readtemp = EEDR;               	//读出EEDR中的数据
	in R10,0x1d
	.dbline 41
;    return readtemp;	
	mov R16,R10
	clr R17
	.dbline -2
L1:
	.dbline 0 ; func end
	ld R10,y+
	ret
	.dbsym r readtemp 10 c
	.dbsym r addr 16 i
	.dbend
	.dbfunc e eeprom_write_byte _eeprom_write_byte fV
;         p_buff -> R18
;           addr -> R16,R17
	.even
_eeprom_write_byte::
	.dbline -1
	.dbline 49
; }
; 
; //***********************************************************************
; //              EEPROM写入函数
; //          addr：地址；number：长度；p_buff：写入数据存放指针
; //***********************************************************************
; void eeprom_write_byte(unsigned int addr, unsigned char p_buff) 
; {
	.dbline 51
; 
; 	EEARH = 0x00;
	clr R2
	out 0x1f,R2
L6:
	.dbline 54
; 	
; 	
; 		while(EECR & (1 << EEWE));       //等待前面的写完成
L7:
	.dbline 54
	sbic 0x1c,1
	rjmp L6
X1:
	.dbline 55
; 		EEARL = addr;                 //写地址
	out 0x1e,R16
	.dbline 56
; 		EEDR = p_buff;               //写数据到EEDR
	out 0x1d,R18
	.dbline 57
; 		EECR |= (1 << EEMWE);            //主机写入允许位
	sbi 0x1c,2
	.dbline 58
; 		EECR&=~(1<<EEWE);
	cbi 0x1c,1
	.dbline 59
; 		EECR |= (1 << EEWE);             //EEWE为1，执行写操作
	sbi 0x1c,1
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbsym r p_buff 18 c
	.dbsym r addr 16 i
	.dbend
; 		
; }
; 
; 
