	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024880
sub_08024880: @ 0x08024880
	push {lr}
	ldr r1, _0802489C @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248A0 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080248A4 @ =sub_080247C0
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_0802489C: .4byte 0x02033E40
_080248A0: .4byte 0x0202E3E8
_080248A4: .4byte sub_080247C0
