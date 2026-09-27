	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForSilence
MakeTargetListForSilence: @ 0x08024858
	push {lr}
	ldr r1, _08024874 @ =0x02033E40
	str r0, [r1]
	ldr r0, _08024878 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _0802487C @ =TryAddUnitToSilenceTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08024874: .4byte 0x02033E40
_08024878: .4byte 0x0202E3E8
_0802487C: .4byte TryAddUnitToSilenceTargetList
