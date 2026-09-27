	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806EC18
sub_0806EC18: @ 0x0806EC18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #1
	beq _0806ECB0
	cmp r0, #1
	bgt _0806EC34
	cmp r0, #0
	beq _0806EC3A
	b _0806ED1A
_0806EC34:
	cmp r0, #2
	beq _0806ECD0
	b _0806ED1A
_0806EC3A:
	ldr r0, _0806ECAC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806ECAC @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _0806ECAC @ =0x0203E0FC
	ldr r3, [r7, #4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r3, _0806ECAC @ =0x0203E0FC
	ldr r4, [r7, #4]
	adds r6, r4, #0
	lsls r5, r6, #2
	adds r5, r5, r4
	lsls r4, r5, #2
	adds r3, r3, r4
	ldr r4, [r3]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806ECAC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl SetMuFacing
	b _0806ED1A
	.align 2, 0
_0806ECAC: .4byte 0x0203E0FC
_0806ECB0:
	ldr r0, _0806ECCC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806BFA4
	b _0806ED1A
	.align 2, 0
_0806ECCC: .4byte 0x0203E0FC
_0806ECD0:
	ldr r0, _0806ED24 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _0806ED24 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0
	movs r3, #0
	bl GetFacingFromTo
	str r0, [r7, #0xc]
	ldr r0, _0806ED24 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r7, #0xc]
	bl SetMuFacing
_0806ED1A:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED24: .4byte 0x0203E0FC
