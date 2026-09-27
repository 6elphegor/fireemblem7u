	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTeyariObjMain
EfxTeyariObjMain: @ 0x08056E4C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08056E72
	ldr r0, _08056E78 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08056E72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056E78: .4byte 0x0201774C
