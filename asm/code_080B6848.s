	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6848
sub_080B6848: @ 0x080B6848
	push {r4, r5, r6, lr}
	bl GetPartyTotalGoldValue
	ldr r1, _080B6890 @ =0x0202BBF8
	ldr r5, [r1, #0x30]
	subs r5, r0, r5
	str r0, [r1, #0x30]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl GetChapterStats
	adds r6, r0, #0
	ldr r4, _080B6894 @ =0x08C9A200
	bl sub_080315E8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x98
	muls r1, r2, r1
	adds r0, r0, r1
	adds r4, #0x60
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0x64
	muls r5, r0, r5
	lsls r0, r1, #2
	adds r2, r0, r1
	lsls r0, r2, #4
	cmp r5, r0
	blt _080B6898
	movs r0, #4
	b _080B68BC
	.align 2, 0
_080B6890: .4byte 0x0202BBF8
_080B6894: .4byte 0x08C9A200
_080B6898:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	cmp r5, r0
	blt _080B68A6
	movs r0, #3
	b _080B68BC
_080B68A6:
	lsls r0, r2, #3
	cmp r5, r0
	blt _080B68B0
	movs r0, #2
	b _080B68BC
_080B68B0:
	lsls r0, r2, #2
	cmp r5, r0
	bge _080B68BA
	movs r0, #0
	b _080B68BC
_080B68BA:
	movs r0, #1
_080B68BC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
