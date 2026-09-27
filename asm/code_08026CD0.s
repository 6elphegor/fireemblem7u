	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseItem
CanUnitUseItem: @ 0x08026CD0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08026CF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026CF4
	b _08026F44
_08026CF4:
	adds r0, r5, #0
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0x50
	bls _08026D02
	b _08026F44
_08026D02:
	lsls r0, r0, #2
	ldr r1, _08026D0C @ =_08026D10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026D0C: .4byte _08026D10
_08026D10: @ jump table
	.4byte _08026E54 @ case 0
	.4byte _08026E54 @ case 1
	.4byte _08026E54 @ case 2
	.4byte _08026E5C @ case 3
	.4byte _08026E64 @ case 4
	.4byte _08026E6C @ case 5
	.4byte _08026E84 @ case 6
	.4byte _08026E8C @ case 7
	.4byte _08026E94 @ case 8
	.4byte _08026E9C @ case 9
	.4byte _08026E74 @ case 10
	.4byte _08026F10 @ case 11
	.4byte _08026EA4 @ case 12
	.4byte _08026EAC @ case 13
	.4byte _08026E7C @ case 14
	.4byte _08026F44 @ case 15
	.4byte _08026EB4 @ case 16
	.4byte _08026EB4 @ case 17
	.4byte _08026EB4 @ case 18
	.4byte _08026EB4 @ case 19
	.4byte _08026EB4 @ case 20
	.4byte _08026EB4 @ case 21
	.4byte _08026EB4 @ case 22
	.4byte _08026EB4 @ case 23
	.4byte _08026EB4 @ case 24
	.4byte _08026EBE @ case 25
	.4byte _08026EBE @ case 26
	.4byte _08026EBE @ case 27
	.4byte _08026EBE @ case 28
	.4byte _08026EBE @ case 29
	.4byte _08026EE8 @ case 30
	.4byte _08026EF0 @ case 31
	.4byte _08026EF8 @ case 32
	.4byte _08026EC8 @ case 33
	.4byte _08026EC8 @ case 34
	.4byte _08026ED0 @ case 35
	.4byte _08026EE0 @ case 36
	.4byte _08026ED8 @ case 37
	.4byte _08026F44 @ case 38
	.4byte _08026F44 @ case 39
	.4byte _08026F44 @ case 40
	.4byte _08026F44 @ case 41
	.4byte _08026F44 @ case 42
	.4byte _08026F44 @ case 43
	.4byte _08026F44 @ case 44
	.4byte _08026F44 @ case 45
	.4byte _08026EE8 @ case 46
	.4byte _08026F00 @ case 47
	.4byte _08026F08 @ case 48
	.4byte _08026F44 @ case 49
	.4byte _08026F20 @ case 50
	.4byte _08026F20 @ case 51
	.4byte _08026F20 @ case 52
	.4byte _08026F20 @ case 53
	.4byte _08026F44 @ case 54
	.4byte _08026F44 @ case 55
	.4byte _08026F44 @ case 56
	.4byte _08026F44 @ case 57
	.4byte _08026F44 @ case 58
	.4byte _08026F44 @ case 59
	.4byte _08026F44 @ case 60
	.4byte _08026EBE @ case 61
	.4byte _08026F34 @ case 62
	.4byte _08026EBE @ case 63
	.4byte _08026F44 @ case 64
	.4byte _08026EBE @ case 65
	.4byte _08026F44 @ case 66
	.4byte _08026F44 @ case 67
	.4byte _08026F44 @ case 68
	.4byte _08026F44 @ case 69
	.4byte _08026F44 @ case 70
	.4byte _08026F44 @ case 71
	.4byte _08026F44 @ case 72
	.4byte _08026F44 @ case 73
	.4byte _08026F44 @ case 74
	.4byte _08026F44 @ case 75
	.4byte _08026EBE @ case 76
	.4byte _08026F44 @ case 77
	.4byte _08026F44 @ case 78
	.4byte _08026F44 @ case 79
	.4byte _08026EC8 @ case 80
_08026E54:
	ldr r1, _08026E58 @ =MakeTargetListForAdjacentHeal
	b _08026F22
	.align 2, 0
_08026E58: .4byte MakeTargetListForAdjacentHeal
_08026E5C:
	ldr r1, _08026E60 @ =MakeTargetListForRangedHeal
	b _08026F22
	.align 2, 0
_08026E60: .4byte MakeTargetListForRangedHeal
_08026E64:
	ldr r1, _08026E68 @ =MakeTargetListForRangedHeal
	b _08026F22
	.align 2, 0
_08026E68: .4byte MakeTargetListForRangedHeal
_08026E6C:
	ldr r1, _08026E70 @ =MakeTargetListForRestore
	b _08026F22
	.align 2, 0
_08026E70: .4byte MakeTargetListForRestore
_08026E74:
	ldr r1, _08026E78 @ =MakeTargetListForRescueStaff
	b _08026F22
	.align 2, 0
_08026E78: .4byte MakeTargetListForRescueStaff
_08026E7C:
	ldr r1, _08026E80 @ =MakeTargetListForBarrier
	b _08026F22
	.align 2, 0
_08026E80: .4byte MakeTargetListForBarrier
_08026E84:
	ldr r1, _08026E88 @ =MakeTargetListForSilence
	b _08026F22
	.align 2, 0
_08026E88: .4byte MakeTargetListForSilence
_08026E8C:
	ldr r1, _08026E90 @ =MakeTargetListForSleep
	b _08026F22
	.align 2, 0
_08026E90: .4byte MakeTargetListForSleep
_08026E94:
	ldr r1, _08026E98 @ =MakeTargetListForBerserk
	b _08026F22
	.align 2, 0
_08026E98: .4byte MakeTargetListForBerserk
_08026E9C:
	ldr r1, _08026EA0 @ =MakeTargetListForWarp
	b _08026F22
	.align 2, 0
_08026EA0: .4byte MakeTargetListForWarp
_08026EA4:
	ldr r1, _08026EA8 @ =MakeTargetListForHammerne
	b _08026F22
	.align 2, 0
_08026EA8: .4byte MakeTargetListForHammerne
_08026EAC:
	ldr r1, _08026EB0 @ =MakeTargetListForUnlock
	b _08026F22
	.align 2, 0
_08026EB0: .4byte MakeTargetListForUnlock
_08026EB4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUseStatGainItem
	b _08026F28
_08026EBE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl CanUnitUsePromotionItem
	b _08026F28
_08026EC8:
	adds r0, r4, #0
	bl CanUnitUseHealItem
	b _08026F28
_08026ED0:
	adds r0, r4, #0
	bl CanUnitUsePureWaterItem
	b _08026F28
_08026ED8:
	adds r0, r4, #0
	bl CanUnitUseTorchItem
	b _08026F28
_08026EE0:
	adds r0, r4, #0
	bl CanUnitUseAntitoxinItem
	b _08026F28
_08026EE8:
	adds r0, r4, #0
	bl CanUnitUseChestKeyItem
	b _08026F28
_08026EF0:
	adds r0, r4, #0
	bl CanUnitUseDoorKeyItem
	b _08026F28
_08026EF8:
	adds r0, r4, #0
	bl CanUnitUseLockpickItem
	b _08026F28
_08026F00:
	ldr r1, _08026F04 @ =MakeTargetListForMine
	b _08026F22
	.align 2, 0
_08026F04: .4byte MakeTargetListForMine
_08026F08:
	ldr r1, _08026F0C @ =MakeTargetListForLightRune
	b _08026F22
	.align 2, 0
_08026F0C: .4byte MakeTargetListForLightRune
_08026F10:
	ldr r1, _08026F1C @ =0x0202BBF8
	ldrb r2, [r1, #0xd]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	b _08026F46
	.align 2, 0
_08026F1C: .4byte 0x0202BBF8
_08026F20:
	ldr r1, _08026F30 @ =MakeTargetListForDanceRing
_08026F22:
	adds r0, r4, #0
	bl HasSelectTarget
_08026F28:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08026F46
	.align 2, 0
_08026F30: .4byte MakeTargetListForDanceRing
_08026F34:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _08026F44
	movs r0, #1
	b _08026F46
_08026F44:
	movs r0, #0
_08026F46:
	pop {r4, r5}
	pop {r1}
	bx r1
