	.include "macro.inc"

	.syntax unified

	thumb_func_start ReleaseMus
ReleaseMus: @ 0x0806CD40
	push {r7, lr}
	mov r7, sp
	movs r0, #4
	bl Proc_UnblockEachMarked
	pop {r7}
	pop {r0}
	bx r0
