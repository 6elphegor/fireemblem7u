	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxArrowObjMain
EfxArrowObjMain: @ 0x08056908
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0805692E
	ldr r0, _08056934 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805692E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056934: .4byte 0x0201774C
