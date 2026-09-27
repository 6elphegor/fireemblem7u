	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080248A8
sub_080248A8: @ 0x080248A8
	push {lr}
	ldr r1, _080248C4 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080248C8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080248CC @ =sub_0802480C
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_080248C4: .4byte 0x02033E40
_080248C8: .4byte 0x0202E3E8
_080248CC: .4byte sub_0802480C
