	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021948
sub_08021948: @ 0x08021948
	push {lr}
	ldr r0, _08021960 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024018
	ldr r0, _08021964 @ =0x08B95CB8
	bl StartMapSelect
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08021960: .4byte 0x03004690
_08021964: .4byte 0x08B95CB8
