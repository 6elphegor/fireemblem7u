	.include "macro.inc"

	.syntax unified

	thumb_func_start LockMus
LockMus: @ 0x0806CD30
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_BlockEachMarked
	pop {r7}
	pop {r0}
	bx r0
