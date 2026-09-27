	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802474C
sub_0802474C: @ 0x0802474C
	push {lr}
	ldr r1, _08024768 @ =0x02033E40
	str r0, [r1]
	ldr r0, _0802476C @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08024770 @ =sub_08024714
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08024768: .4byte 0x02033E40
_0802476C: .4byte 0x0202E3E8
_08024770: .4byte sub_08024714
