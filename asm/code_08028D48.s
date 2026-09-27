	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitEffectiveHitRate
ComputeBattleUnitEffectiveHitRate: @ 0x08028D48
	adds r2, r0, #0
	adds r2, #0x60
	adds r1, #0x62
	ldrh r2, [r2]
	ldrh r1, [r1]
	subs r1, r2, r1
	adds r2, r0, #0
	adds r2, #0x64
	strh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x64
	ble _08028D66
	movs r0, #0x64
	strh r0, [r2]
_08028D66:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08028D72
	movs r0, #0
	strh r0, [r2]
_08028D72:
	bx lr
