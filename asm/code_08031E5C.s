	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitHpStatusInfoWindow
StartUnitHpStatusInfoWindow: @ 0x08031E5C
	push {r4, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	pop {r4}
	pop {r0}
	bx r0
