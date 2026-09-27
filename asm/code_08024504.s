	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForSteal
MakeTargetListForSteal: @ 0x08024504
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802452C @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024530 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024534 @ =AddAsTarget_IfCanStealFrom
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802452C: .4byte 0x02033E40
_08024530: .4byte 0x0202E3E8
_08024534: .4byte AddAsTarget_IfCanStealFrom
