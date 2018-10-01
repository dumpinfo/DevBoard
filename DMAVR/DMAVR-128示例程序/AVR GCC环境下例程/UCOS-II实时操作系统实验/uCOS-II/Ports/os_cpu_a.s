#include <avr/io.h>	
#include <avr/interrupt.h>
	.global	OSCtxSw,,OSTickISR,OSStartHighRdy, OSIntCtxSw
	.global SIG_OUTPUT_COMPARE2, OS_CPU_SR_SAVE, OS_CPU_SR_RESTORE
	.extern	OSTaskSwHook,OSTimeTick,OSIntExit,OSIntEnter
	.extern	OSTCBCur,OSPrioHighRdy,OSTCBHighRdy
	.extern	OSPrioCur,OSIntNesting

;任务上下文的保护
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

;任务上下文的恢复
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

;进入临界区.
OS_CPU_SR_SAVE:
	IN	R24, _SFR_IO_ADDR( SREG )			;保存SREG,并关中断
	CLI
	RET

;退出临界区
OS_CPU_SR_RESTORE:
	OUT	_SFR_IO_ADDR( SREG ),R24			;恢复SREG并开 中断
	RET

; OSStartHighRdy()
; 启动多任务
OSStartHighRdy:
	CALL	OSTaskSwHook					; 调用OSTaskSwHook()
	LDS	R16, OSRunning						; OSRunning <= TRUE
	INC	R16
	STS	OSRunning, R16

	LDS	R28, OSTCBHighRdy					; 取最高优先级任务堆栈地址并恢复至SP
	LDS	R29, OSTCBHighRdy + 1			
	LD	R30, Y+
	OUT	_SFR_IO_ADDR( SPL ),R30
	LD	R30, Y+
	OUT	_SFR_IO_ADDR( SPH ),R30
	
	POP_ALL									; 恢复任务上下文,开始运行多任务
	RET

; OSCtxSw()
; 任务级的上下文切换
OSCtxSw:
	PUSH_ALL
	IN	R16, _SFR_IO_ADDR( SREG )
	PUSH R16
	LDS	R28, OSTCBCur						;保存当前任务的上下文,保存SP至TCB
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
	LD	R30, Y+								;恢复新任务的SP至SP
	LD	R31, Y+
	OUT	_SFR_IO_ADDR( SPL ), R30
	OUT	_SFR_IO_ADDR( SPH ), R31

	POP_ALL									;恢复新任务的上下文,实现任务切换
	RET

; OSIntCtxSw()
; 中断级的任务切换
OSIntCtxSw:
	CALL	OSTaskSwHook					;OS_CPU_HOOKS_EN ()

	LDS	R28, OSPrioHighRdy					; OSPrioCur <= OSTCBHighRdy
	STS	OSPrioCur, R28

	LDS	R28, OSTCBHighRdy					; OSTCBCur <= OSTCBHighRdy
	LDS	R29, OSTCBHighRdy + 1
	STS	OSTCBCur, R28
	STS	OSTCBCur + 1, R29
	
	LD	R30, Y+								; 恢复新任务的上下文,实现任务切换
	LD	R31, Y+
	OUT	_SFR_IO_ADDR( SPL ), R30
	OUT	_SFR_IO_ADDR( SPH ), R31
	
	POP_ALL

	RETI

SIG_OUTPUT_COMPARE2:
OSTickISR:
	PUSH_ALL	
	IN	R16, _SFR_IO_ADDR( SREG )
	ORI	R16,0x80								; 必须保证任务被中断时SREG 的I位为1
	PUSH R16
	CALL OSIntEnter

	LDS	R28, OSTCBCur							; 是,保存SP至当前任务TCB
	LDS	R29, OSTCBCur + 1
	IN	R0, _SFR_IO_ADDR( SPL )
	ST	Y+, R0
	IN	R0, _SFR_IO_ADDR( SPH )
	ST	Y+, R0

	CALL	OSTimeTick
	CALL	OSIntExit						; 注意,当有中断嵌套时,并不会发生任务切换

	POP_ALL

	RETI
	
	.end


