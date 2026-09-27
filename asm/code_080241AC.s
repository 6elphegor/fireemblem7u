	.include "macro.inc"

	.syntax unified

	thumb_func_start FillBallistaRangeMaybe
FillBallistaRangeMaybe: @ 0x080241AC
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _0802420C @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSomeBallistaItemAt
	adds r7, r0, #0
	cmp r7, #0
	beq _08024206
	ldr r0, _08024210 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08024214 @ =AddUnitToTargetListIfAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
_08024206:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802420C: .4byte 0x02033E40
_08024210: .4byte 0x0202E3E8
_08024214: .4byte AddUnitToTargetListIfAllied
