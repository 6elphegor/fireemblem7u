	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTemporaryLock
StartTemporaryLock: @ 0x08014494
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080144AC @ =0x08B929DC
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080144AC: .4byte 0x08B929DC
