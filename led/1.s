	.thumb
	.syntax unified
        .cpu cortex-m4

	.equ STACHINIT,		0x20005000	@堆栈顶

vectors:					@向量表
	.word STACHINIT	
	.word _start + 1			@复位向量，+1 表示thumb
        .word _nmi_handler + 1 
        .word _hard_fault + 1 
        .word _memory_fault + 1 
        .word _bus_fault + 1
        .word _usage_fault + 1
_start:
	mov r0, r0
	mov r0, r0
	mov r0, # 0x1234
_nmi_handler:	
_hard_fault:	
_memory_fault:	
_bus_fault:	
_usage_fault:
	bx lr
