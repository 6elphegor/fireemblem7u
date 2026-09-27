	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitStatusBonuses
ComputeBattleUnitStatusBonuses: @ 0x08028EB4
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _08028EDA
	cmp r0, #6
	bgt _08028ECC
	cmp r0, #5
	beq _08028ED6
	b _08028EEA
_08028ECC:
	cmp r0, #7
	beq _08028EDE
	cmp r0, #8
	beq _08028EE2
	b _08028EEA
_08028ED6:
	adds r1, #0x5a
	b _08028EE4
_08028EDA:
	adds r1, #0x5c
	b _08028EE4
_08028EDE:
	adds r1, #0x66
	b _08028EE4
_08028EE2:
	adds r1, #0x62
_08028EE4:
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028EEA:
	bx lr
