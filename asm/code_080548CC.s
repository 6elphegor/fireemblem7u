	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080548CC
sub_080548CC: @ 0x080548CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _080548D8
	b _08054A5E
_080548D8:
	movs r5, #0xf0
	lsls r5, r5, #8
	ldrh r0, [r4, #0xc]
	ands r5, r0
	cmp r5, #0
	bne _080548E6
	b _08054A5E
_080548E6:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne _080548F2
	b _08054A20
_080548F2:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _080548FA
	b _08054A16
_080548FA:
	ldrb r1, [r4, #0x14]
	adds r0, r1, r4
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls _08054906
	b _08054A0E
_08054906:
	lsls r0, r0, #2
	ldr r1, _08054910 @ =_08054914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054910: .4byte _08054914
_08054914: @ jump table
	.4byte _08054A0E @ case 0
	.4byte _080549E0 @ case 1
	.4byte _080549E0 @ case 2
	.4byte _080549F8 @ case 3
	.4byte _080549F8 @ case 4
	.4byte _080549E8 @ case 5
	.4byte _08054A0E @ case 6
	.4byte _08054A0E @ case 7
	.4byte _08054A0E @ case 8
	.4byte _08054A0E @ case 9
	.4byte _08054A0E @ case 10
	.4byte _08054A0E @ case 11
	.4byte _08054A0E @ case 12
	.4byte _08054A00 @ case 13
	.4byte _08054A0E @ case 14
	.4byte _08054A0E @ case 15
	.4byte _08054A0E @ case 16
	.4byte _08054A0E @ case 17
	.4byte _08054A0E @ case 18
	.4byte _08054A0E @ case 19
	.4byte _08054A0E @ case 20
	.4byte _08054A0E @ case 21
	.4byte _08054A0E @ case 22
	.4byte _08054A0E @ case 23
	.4byte _08054A08 @ case 24
	.4byte _08054A0E @ case 25
	.4byte _08054A0E @ case 26
	.4byte _08054A0E @ case 27
	.4byte _08054A0E @ case 28
	.4byte _08054A0E @ case 29
	.4byte _08054A0E @ case 30
	.4byte _08054A0E @ case 31
	.4byte _08054A0E @ case 32
	.4byte _08054A0E @ case 33
	.4byte _08054A0E @ case 34
	.4byte _08054A0E @ case 35
	.4byte _08054A0E @ case 36
	.4byte _08054A0E @ case 37
	.4byte _08054A0E @ case 38
	.4byte _08054A0E @ case 39
	.4byte _08054A0E @ case 40
	.4byte _08054A0E @ case 41
	.4byte _08054A0E @ case 42
	.4byte _08054A0E @ case 43
	.4byte _08054A0E @ case 44
	.4byte _08054A0E @ case 45
	.4byte _08054A0E @ case 46
	.4byte _08054A0E @ case 47
	.4byte _08054A0E @ case 48
	.4byte _08054A0E @ case 49
	.4byte _08054A0E @ case 50
_080549E0:
	adds r0, r4, #0
	bl sub_08054A68
	b _08054A0E
_080549E8:
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _080549F8
	adds r0, r4, #0
	bl StartClassReelSpellAnim
_080549F8:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b _08054A0E
_08054A00:
	adds r0, r4, #0
	bl sub_08054A8C
	b _08054A0E
_08054A08:
	adds r0, r4, #0
	bl sub_08054A68
_08054A0E:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b _080548F2
_08054A16:
	movs r0, #0xe7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08054A20:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq _08054A50
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _08054A46
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _08054A46
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
_08054A46:
	movs r0, #0xd7
	lsls r0, r0, #8
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
_08054A50:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq _08054A5E
	ldr r0, _08054A64 @ =0x0000FFFF
	strh r0, [r4, #0xe]
_08054A5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054A64: .4byte 0x0000FFFF
