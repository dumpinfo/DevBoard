	.module EEPROM.C
	.area text(rom, con, rel)
	.dbfile E:\ATMEGA128������\�ҵ�ATMEGA128��Сϵͳ��\M128_ZZX_1��������\27.��ȡSD����BMPͼƬʵ��\ReadBmp\EEPROM.C
	.dbfunc e eeprom_read_byte _eeprom_read_byte fI
;       readtemp -> R20
;           addr -> R16,R17
	.even
_eeprom_read_byte::
	xcall push_gset1
	.dbline -1
	.dbline 32
; //DMAVR-128�Ķ�дEEPROMʾ�����򣬼�¼CPU�����Ĵ�����EEPROM��
; //��LED���������ʾ����������,���ø�λ��ˢ����ʾ
; //���뻷�� ICCAVR
; //ϵͳʱ��7.3728MHZ��������˿λΪ�ⲿ��ƵʯӢ�����񵴣�����ʱ��4.1ms
; //���˵���Ԫ����༭
; //���ڣ�2010.01.14
; //***********************************************************************
; //			�����ļ�
; //***********************************************************************
; 
; #include <string.h>
; #include <stdio.h>
; #define	 F_CPU	7372800							// ��Ƭ����ƵΪ7.3728MHz,������ʱ�ӳ���
; //#include <delay.h>
; #include <iom128v.h>
; 
; 
; //***********************************************************************
; //			���������
; //***********************************************************************
; 
; #define uchar           unsigned char
; #define uint            unsigned int
; 
; 
; 
; //***********************************************************************
; //                EEPROM��ȡ����*/
; //            addr����ַ��number�����ȣ�p_buff���������ݴ��ָ��
; //***********************************************************************
;  eeprom_read_byte(unsigned int addr) 
; {
L2:
	.dbline 34
L3:
	.dbline 34
;    unsigned char readtemp;
; 	while(EECR & (1 << EEWE));               //�ȴ�ǰ���д���
	sbic 0x1c,1
	rjmp L2
	.dbline 36
; 
; 	EEARH = 0x00;                           //д���ֽڵ�ַ
	clr R2
	out 0x1f,R2
	.dbline 38
; 	
; 		EEARL = addr;                 	//д��ַ���ֽ�
	out 0x1e,R16
	.dbline 39
; 		EECR |= (1 << EERE);            	//������λ��1
	sbi 0x1c,0
	.dbline 40
; 		readtemp = EEDR;               	//����EEDR�е�����
	in R20,0x1d
	.dbline 41
;    return readtemp;	
	mov R16,R20
	clr R17
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r readtemp 20 c
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
; //              EEPROMд�뺯��
; //          addr����ַ��number�����ȣ�p_buff��д�����ݴ��ָ��
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
L7:
	.dbline 54
; 	
; 	
; 		while(EECR & (1 << EEWE));       //�ȴ�ǰ���д���
	sbic 0x1c,1
	rjmp L6
	.dbline 55
; 		EEARL = addr;                 //д��ַ
	out 0x1e,R16
	.dbline 56
; 		EEDR = p_buff;               //д���ݵ�EEDR
	out 0x1d,R18
	.dbline 57
; 		EECR |= (1 << EEMWE);            //����д������λ
	sbi 0x1c,2
	.dbline 58
; 		EECR&=~(1<<EEWE);
	cbi 0x1c,1
	.dbline 59
; 		EECR |= (1 << EEWE);             //EEWEΪ1��ִ��д����
	sbi 0x1c,1
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbsym r p_buff 18 c
	.dbsym r addr 16 i
	.dbend
