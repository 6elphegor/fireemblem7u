	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitHpInfoWindow
StartUnitHpInfoWindow: @ 0x08031DFC
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0
