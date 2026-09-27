	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A444
sub_0806A444: @ 0x0806A444
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _0806A454
	bl Proc_Break
	b _0806A476
_0806A454:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806A476
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl PutEkrLvupStatGainLabelGfx2
	adds r0, r4, #0
	bl Proc_Break
_0806A476:
	pop {r4}
	pop {r0}
	bx r0
