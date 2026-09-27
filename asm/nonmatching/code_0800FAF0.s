	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FAF0
sub_0800FAF0: @ 0x0800FAF0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FB10
	ldr r4, _0800FB0C @ =0x0000FFFF
	ands r4, r2
	b _0800FB14
	.align 2, 0
_0800FB0C: .4byte 0x0000FFFF
_0800FB10:
	movs r4, #1
	rsbs r4, r4, #0
_0800FB14:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FB28
	adds r5, r2, #0
_0800FB28:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800FB3C
	movs r0, #0
	b _0800FB5E
_0800FB3C:
	cmp r3, #0
	beq _0800FB54
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	adds r0, r3, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl WmMergeFace
	b _0800FB5C
_0800FB54:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4F9C
_0800FB5C:
	movs r0, #2
_0800FB5E:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
