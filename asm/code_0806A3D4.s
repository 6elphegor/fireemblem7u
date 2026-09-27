	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A3D4
sub_0806A3D4: @ 0x0806A3D4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _0806A3E8
	adds r0, r4, #0
	bl Proc_Break
	b _0806A436
_0806A3E8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806A436
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _0806A440 @ =0x08B9E374
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl PutEkrLvupStatGainLabelGfx1
	adds r0, r4, #0
	bl Proc_Break
_0806A436:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A440: .4byte 0x08B9E374
