	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForAdjacentHeal
MakeTargetListForAdjacentHeal: @ 0x0802458C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080245B4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080245B8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _080245BC @ =TryAddUnitToHealTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080245B4: .4byte 0x02033E40
_080245B8: .4byte 0x0202E3E8
_080245BC: .4byte TryAddUnitToHealTargetList
