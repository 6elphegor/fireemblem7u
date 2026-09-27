	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031DFC
sub_08031DFC: @ 0x08031DFC
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0
