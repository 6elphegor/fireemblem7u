	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A19D8
sub_080A19D8: @ 0x080A19D8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080A1AA0 @ =0x0202BD50
	movs r5, #0x33
_080A19E0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A19F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A19F8:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A19E0
	ldr r4, _080A1AA4 @ =0x0202CEC0
	movs r5, #0x31
_080A1A04:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A1C
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A1C:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A04
	ldr r4, _080A1AA8 @ =0x0202DCD0
	movs r5, #9
_080A1A28:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A1A40
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A1A40:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A1A28
	bl GetPermanentFlagBits
	adds r4, r0, #0
	bl GetPermanentFlagBitsSize
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl GetChapterFlagBits
	adds r4, r0, #0
	bl GetChapterFlagBitsSize
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl GetTrap
	movs r1, #0x80
	lsls r1, r1, #1
	bl SramChecksum32
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A1AA0: .4byte 0x0202BD50
_080A1AA4: .4byte 0x0202CEC0
_080A1AA8: .4byte 0x0202DCD0
