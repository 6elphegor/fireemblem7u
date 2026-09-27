	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F9B0
sub_0800F9B0: @ 0x0800F9B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F9D0
	ldr r5, _0800F9CC @ =0x0000FFFF
	ands r5, r2
	b _0800F9D4
	.align 2, 0
_0800F9CC: .4byte 0x0000FFFF
_0800F9D0:
	movs r5, #1
	rsbs r5, r5, #0
_0800F9D4:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F9E8
	adds r6, r3, #0
_0800F9E8:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FA24
	cmp r2, #0
	beq _0800FA12
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #5
	adds r2, r7, #0
	movs r3, #0
	bl WmMergeFace
	b _0800FA24
_0800FA12:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl StartWmIcon2
_0800FA24:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
