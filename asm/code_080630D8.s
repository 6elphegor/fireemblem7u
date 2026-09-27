	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxLokmsunaIOBJMain
EfxLokmsunaIOBJMain: @ 0x080630D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _080630FE
	ldr r0, _08063104 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_080630FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063104: .4byte 0x0201774C
