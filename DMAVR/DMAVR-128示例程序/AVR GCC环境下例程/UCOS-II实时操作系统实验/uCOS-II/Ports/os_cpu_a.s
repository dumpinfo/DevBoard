#include <avr/io.h>	
#include <avr/interrupt.h>
	.global	OSCtxSw,,OSTickISR,OSStartHighRdy, OSIntCtxSw
	.global SIG_OUTPUT_COMPARE2, OS_CPU_SR_SAVE, OS_CPU_SR_RESTORE
	.extern	OSTaskSwHook,OSTimeTick,OSIntExit,OSIntEnter
	.extern	OSTCBCur,OSPrioHighRdy,OSTCBHighRdy
	.extern	OSPrioCur,OSIntNesting

;���������ĵı���
.macro	PUSH_ALL
	PUSH	R0
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9
	PUSH	R10
	PUSH	R11
	PUSH	R12
	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R18
	PUSH	R19
	PUSH	R20
	PUSH	R21
	PUSH	R22
	PUSH	R23
	PUSH	R24
	PUSH	R25
	PUSH	R26
	PUSH	R27
	PUSH	R28
	PUSH	R29
	PUSH	R30
	PUSH	R31
.endm

;���������ĵĻָ�
.macro	POP_ALL
	POP	R0
	OUT	_SFR_IO_ADDR( SREG ), R0
	POP	R31
	POP	R30
	POP	R29
	POP	R28
	POP	R27
	POP	R26
	POP	R25
	POP	R24
	POP	R23
	POP	R22
	POP	R21
	POP	R20
	POP	R19
	POP	R18
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	POP	R12
	POP	R11
	POP	R10
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	POP	R0
.endm
	
	.text
	.section	.text

;�����ٽ���.
OS_CPU_SR_SAVE:
	IN	R24, _SFR_IO_ADDR( SREG )			;����SREG,�����ж�
	CLI
	RET

;�˳��ٽ���
OS_CPU_SR_RESTORE:
	OUT	_SFR_IO_ADDR( SREG ),R24			;�ָ�SREG���� �ж�
	RET

; OSStartHighRdy()
; ����������
OSStartHighRdy:
	CALL	OSTaskSwHook					; ����OSTaskSwHook()
	LDS	R16, OSRunning						; OSRunning <= TRUE
	INC	R16
	STS	OSRunning, R16

	LDS	R28, OSTCBHighRdy					; ȡ������ȼ������ջ��ַ���ָ���SP
	LDS	R29, OSTCBHighRdy + 1			
	LD	R30, Y+
	OUT	_SFR_IO_ADDR( SPL ),R30
	LD	R30, Y+
	OUT	_SFR_IO_ADDR( SPH ),R30
	
	POP_ALL									; �ָ�����������,��ʼ���ж�����
	RET

; OSCtxSw()
; ���񼶵��������л�
OSCtxSw:
	PUSH_ALL
	IN	R16, _SFR_IO_ADDR( SREG )
	PUSH R16
	LDS	R28, OSTCBCur						;���浱ǰ�����������,����SP��TCB
	LDS	R29, OSTCBCur + 1
	IN	R0, _SFR_IO_ADDR( SPL )
	ST	Y+, R0
	IN	R0, _SFR_IO_ADDR( SPH )
	ST	Y+, R0

	CALL	OSTaskSwHook					; OS_CPU_HOOKS_EN()

	LDS	R28, OSPrioHighRdy					; OSPrioCur <= OSTCBHighRdy
	STS	OSPrioCur, R28

	LDS	R28, OSTCBHighRdy					; OSTCBCur <= OSTCBHighRdy
	LDS	R29, OSTCBHighRdy + 1
	STS	OSTCBCur, R28
	STS	OSTCBCur + 1, R29
	
	LDS	R28, OSTCBHighRdy					; OSTCBCur <= OSTCBHighRdy
	LDS	R29, OSTCBHighRdy + 1
	LD	R30, Y+								;�ָ��������SP��SP
	LD	R31, Y+
	OUT	_SFR_IO_ADDR( SPL ), R30
	OUT	_SFR_IO_ADDR( SPH ), R31

	POP_ALL									;�ָ��������������,ʵ�������л�
	RET

; OSIntCtxSw()
; �жϼ��������л�
OSIntCtxSw:
	CALL	OSTaskSwHook					;OS_CPU_HOOKS_EN ()

	LDS	R28, OSPrioHighRdy					; OSPrioCur <= OSTCBHighRdy
	STS	OSPrioCur, R28

	LDS	R28, OSTCBHighRdy					; OSTCBCur <= OSTCBHighRdy
	LDS	R29, OSTCBHighRdy + 1
	STS	OSTCBCur, R28
	STS	OSTCBCur + 1, R29
	
	LD	R30, Y+								; �ָ��������������,ʵ�������л�
	LD	R31, Y+
	OUT	_SFR_IO_ADDR( SPL ), R30
	OUT	_SFR_IO_ADDR( SPH ), R31
	
	POP_ALL

	RETI

SIG_OUTPUT_COMPARE2:
OSTickISR:
	PUSH_ALL	
	IN	R16, _SFR_IO_ADDR( SREG )
	ORI	R16,0x80								; ���뱣֤�����ж�ʱSREG ��IλΪ1
	PUSH R16
	CALL OSIntEnter

	LDS	R28, OSTCBCur							; ��,����SP����ǰ����TCB
	LDS	R29, OSTCBCur + 1
	IN	R0, _SFR_IO_ADDR( SPL )
	ST	Y+, R0
	IN	R0, _SFR_IO_ADDR( SPH )
	ST	Y+, R0

	CALL	OSTimeTick
	CALL	OSIntExit						; ע��,�����ж�Ƕ��ʱ,�����ᷢ�������л�

	POP_ALL

	RETI
	
	.end


