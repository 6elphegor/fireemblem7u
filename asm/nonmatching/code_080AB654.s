	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB654
sub_080AB654: @ 0x080AB654
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	lsrs r0, r1, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080AB670 @ =0x02023C60
	movs r1, #0
	bl TmFill
	adds r4, r7, #0
	adds r0, r4, #0
	b _080AB734
	.align 2, 0
_080AB670: .4byte 0x02023C60
_080AB674:
	adds r0, r6, #0
	adds r1, r4, #0
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB686
	movs r5, #0
	b _080AB6CC
_080AB686:
	ldr r0, _080AB6C4 @ =0x08CE4D28
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080AB6CC
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB69C
	adds r2, r4, #3
_080AB69C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB6C8 @ =0x02023C60
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080AB730
	.align 2, 0
_080AB6C4: .4byte 0x08CE4D28
_080AB6C8: .4byte 0x02023C60
_080AB6CC:
	cmp r4, #0x62
	ble _080AB704
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB6D8
	adds r2, r4, #3
_080AB6D8:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB700 @ =0x02023C60
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl PutNumber
	b _080AB730
	.align 2, 0
_080AB700: .4byte 0x02023C60
_080AB704:
	adds r2, r4, #0
	cmp r4, #0
	bge _080AB70C
	adds r2, r4, #3
_080AB70C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AB758 @ =0x02023C60
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_080063CC
_080AB730:
	adds r4, #1
	adds r0, r7, #0
_080AB734:
	adds r0, #0x1c
	cmp r4, r0
	bge _080AB74A
	movs r5, #1
	cmp r4, #0
	blt _080AB730
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080AB674
_080AB74A:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB758: .4byte 0x02023C60
