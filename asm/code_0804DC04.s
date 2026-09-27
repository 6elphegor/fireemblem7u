	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxAvoid
NewEfxAvoid: @ 0x0804DC04
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0804DC34 @ =0x02017728
	ldr r5, [r1]
	cmp r5, #0
	bne _0804DC72
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DC38 @ =0x08B9AC24
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804DC40
	ldr r0, _0804DC3C @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b _0804DC48
	.align 2, 0
_0804DC34: .4byte 0x02017728
_0804DC38: .4byte 0x08B9AC24
_0804DC3C: .4byte 0x02000000
_0804DC40:
	ldr r0, _0804DC78 @ =0x02000000
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
_0804DC48:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl NewEfxDamageMojiEffect
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0804DC72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC78: .4byte 0x02000000
