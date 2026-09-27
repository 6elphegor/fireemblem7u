	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeGiveTargetList
MakeGiveTargetList: @ 0x08024018
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08024040 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024044 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r2, _08024048 @ =TryAddUnitToGiveTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024040: .4byte 0x02033E40
_08024044: .4byte 0x0202E3E8
_08024048: .4byte TryAddUnitToGiveTargetList
