	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F6B8
sub_0800F6B8: @ 0x0800F6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r7, [r0, #4]
	ldr r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	bne _0800F6D8
	ldr r4, _0800F6D4 @ =0x0000FFFF
	ands r4, r3
	b _0800F6DC
	.align 2, 0
_0800F6D4: .4byte 0x0000FFFF
_0800F6D8:
	movs r4, #1
	rsbs r4, r4, #0
_0800F6DC:
	ldr r1, [r2, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800F6F0
	adds r5, r3, #0
_0800F6F0:
	ldr r6, [r1, #0xc]
	ldr r3, [r1, #0x10]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800F726
	cmp r3, #0
	beq _0800F71A
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	adds r0, r3, #0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0
	bl WmMergeFace
	b _0800F726
_0800F71A:
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080B4904
_0800F726:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
