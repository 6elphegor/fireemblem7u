	.include "macro.inc"

	.syntax unified

	thumb_func_start efxThunderstormOBJ_End
efxThunderstormOBJ_End: @ 0x080591C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _080591E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591E8: .4byte 0x0201774C
