	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitResChangeInfoWindow
StartUnitResChangeInfoWindow: @ 0x08031EF0
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0
