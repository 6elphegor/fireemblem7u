	.include "macro.inc"

	.syntax unified

	thumb_func_start DoItemAction
DoItemAction: @ 0x0802D00C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802D040 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r4, [r4, #0x12]
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	ldr r1, _0802D044 @ =0x0203A3F0
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	subs r0, #0x4a
	cmp r0, #0x50
	bls _0802D036
	b _0802D234
_0802D036:
	lsls r0, r0, #2
	ldr r1, _0802D048 @ =_0802D04C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802D040: .4byte 0x0203A85C
_0802D044: .4byte 0x0203A3F0
_0802D048: .4byte _0802D04C
_0802D04C: @ jump table
	.4byte _0802D190 @ case 0
	.4byte _0802D190 @ case 1
	.4byte _0802D190 @ case 2
	.4byte _0802D190 @ case 3
	.4byte _0802D1A0 @ case 4
	.4byte _0802D1A8 @ case 5
	.4byte _0802D198 @ case 6
	.4byte _0802D198 @ case 7
	.4byte _0802D198 @ case 8
	.4byte _0802D1C0 @ case 9
	.4byte _0802D1B0 @ case 10
	.4byte _0802D226 @ case 11
	.4byte _0802D1D0 @ case 12
	.4byte _0802D1C8 @ case 13
	.4byte _0802D1B8 @ case 14
	.4byte _0802D234 @ case 15
	.4byte _0802D20E @ case 16
	.4byte _0802D20E @ case 17
	.4byte _0802D20E @ case 18
	.4byte _0802D20E @ case 19
	.4byte _0802D20E @ case 20
	.4byte _0802D20E @ case 21
	.4byte _0802D20E @ case 22
	.4byte _0802D20E @ case 23
	.4byte _0802D20E @ case 24
	.4byte _0802D208 @ case 25
	.4byte _0802D208 @ case 26
	.4byte _0802D208 @ case 27
	.4byte _0802D208 @ case 28
	.4byte _0802D208 @ case 29
	.4byte _0802D202 @ case 30
	.4byte _0802D202 @ case 31
	.4byte _0802D202 @ case 32
	.4byte _0802D1E0 @ case 33
	.4byte _0802D1EA @ case 34
	.4byte _0802D1F2 @ case 35
	.4byte _0802D1FA @ case 36
	.4byte _0802D1D8 @ case 37
	.4byte _0802D234 @ case 38
	.4byte _0802D234 @ case 39
	.4byte _0802D234 @ case 40
	.4byte _0802D234 @ case 41
	.4byte _0802D234 @ case 42
	.4byte _0802D234 @ case 43
	.4byte _0802D234 @ case 44
	.4byte _0802D234 @ case 45
	.4byte _0802D202 @ case 46
	.4byte _0802D216 @ case 47
	.4byte _0802D21E @ case 48
	.4byte _0802D234 @ case 49
	.4byte _0802D22E @ case 50
	.4byte _0802D22E @ case 51
	.4byte _0802D22E @ case 52
	.4byte _0802D22E @ case 53
	.4byte _0802D234 @ case 54
	.4byte _0802D234 @ case 55
	.4byte _0802D234 @ case 56
	.4byte _0802D234 @ case 57
	.4byte _0802D234 @ case 58
	.4byte _0802D234 @ case 59
	.4byte _0802D234 @ case 60
	.4byte _0802D208 @ case 61
	.4byte _0802D20E @ case 62
	.4byte _0802D208 @ case 63
	.4byte _0802D234 @ case 64
	.4byte _0802D208 @ case 65
	.4byte _0802D234 @ case 66
	.4byte _0802D234 @ case 67
	.4byte _0802D234 @ case 68
	.4byte _0802D234 @ case 69
	.4byte _0802D234 @ case 70
	.4byte _0802D234 @ case 71
	.4byte _0802D234 @ case 72
	.4byte _0802D234 @ case 73
	.4byte _0802D234 @ case 74
	.4byte _0802D234 @ case 75
	.4byte _0802D208 @ case 76
	.4byte _0802D234 @ case 77
	.4byte _0802D234 @ case 78
	.4byte _0802D234 @ case 79
	.4byte _0802D1E0 @ case 80
_0802D190:
	adds r0, r5, #0
	bl DoItemHealStaffAction
	b _0802D234
_0802D198:
	adds r0, r5, #0
	bl DoItemAttackStaffAction
	b _0802D234
_0802D1A0:
	adds r0, r5, #0
	bl DoItemFortifyStaffAction
	b _0802D234
_0802D1A8:
	adds r0, r5, #0
	bl DoItemRestoreStaffAction
	b _0802D234
_0802D1B0:
	adds r0, r5, #0
	bl DoItemRescueStaffAction
	b _0802D234
_0802D1B8:
	adds r0, r5, #0
	bl sub_0802C3E8
	b _0802D234
_0802D1C0:
	adds r0, r5, #0
	bl ExecWarpStaff
	b _0802D234
_0802D1C8:
	adds r0, r5, #0
	bl ExecUnlockStaff
	b _0802D234
_0802D1D0:
	adds r0, r5, #0
	bl sub_0802C8D4
	b _0802D234
_0802D1D8:
	adds r0, r5, #0
	bl sub_0802CAA0
	b _0802D234
_0802D1E0:
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_0802C994
	b _0802D234
_0802D1EA:
	adds r0, r5, #0
	bl sub_0802C9F8
	b _0802D234
_0802D1F2:
	adds r0, r5, #0
	bl sub_0802CA64
	b _0802D234
_0802D1FA:
	adds r0, r5, #0
	bl ExecAntitoxinItem
	b _0802D234
_0802D202:
	bl ExecKeyItem
	b _0802D234
_0802D208:
	bl DoItemPromoteAction
	b _0802D234
_0802D20E:
	adds r0, r5, #0
	bl DoItemStatBoostAction
	b _0802D234
_0802D216:
	adds r0, r5, #0
	bl ExecMine
	b _0802D234
_0802D21E:
	adds r0, r5, #0
	bl ExecLightRune
	b _0802D234
_0802D226:
	adds r0, r5, #0
	bl ExecTorchStaff
	b _0802D234
_0802D22E:
	adds r0, r5, #0
	bl sub_0802CF80
_0802D234:
	ldr r0, _0802D250 @ =0x0203A470
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802D24A
	ldr r0, _0802D254 @ =0x08B945E8
	adds r1, r5, #0
	bl Proc_StartBlocking
_0802D24A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D250: .4byte 0x0203A470
_0802D254: .4byte 0x08B945E8
