	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxDanceOBJMain
EfxDanceOBJMain: @ 0x08063348
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08063370
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08063378 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08063370:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063378: .4byte 0x0201774C
