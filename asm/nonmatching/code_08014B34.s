	.include "macro.inc"

	.syntax unified

	thumb_func_start CallDelayed
CallDelayed: @ 0x08014B34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08014B4C @ =0x08B92A08
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014B4C: .4byte 0x08B92A08
