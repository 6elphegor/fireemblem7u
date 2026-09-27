	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FE80
sub_0800FE80: @ 0x0800FE80
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FE9C
	ldr r2, _0800FE98 @ =0x0000FFFF
	ands r2, r1
	b _0800FEA0
	.align 2, 0
_0800FE98: .4byte 0x0000FFFF
_0800FE9C:
	movs r2, #1
	rsbs r2, r2, #0
_0800FEA0:
	ldr r3, [r5, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800FEB4
	adds r7, r1, #0
_0800FEB4:
	ldr r6, [r3, #8]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FEE8
	adds r0, r2, #0
	bl sub_080B6278
	adds r4, r0, #0
	subs r4, #0x10
	adds r0, r7, #0
	bl sub_080B6288
	adds r2, r0, #0
	subs r2, #0x28
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartWarpEffect_08020A64
	movs r0, #2
	b _0800FEEA
_0800FEE8:
	movs r0, #0
_0800FEEA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
