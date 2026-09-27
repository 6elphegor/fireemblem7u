	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitInventoryInfoWindow
StartUnitInventoryInfoWindow: @ 0x08031A74
	push {r4, r5, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r4, #0x38
	movs r5, #4
_08031A80:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08031A80
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
