	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSioResultNewHighScore
StartSioResultNewHighScore: @ 0x08041FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041FD0 @ =0x08B99560
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041FD0: .4byte 0x08B99560
