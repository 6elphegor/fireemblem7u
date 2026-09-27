	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForRangedHeal
MakeTargetListForRangedHeal: @ 0x080245C0
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08024600 @ =0x02033E40
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08024604 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl GetUnitMagRange
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08024608 @ =TryAddUnitToHealTargetList
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024600: .4byte 0x02033E40
_08024604: .4byte 0x0202E3E8
_08024608: .4byte TryAddUnitToHealTargetList
