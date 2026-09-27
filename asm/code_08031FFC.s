	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUnitRescueInfoWindowsCore
StartUnitRescueInfoWindowsCore: @ 0x08031FFC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewUnitInfoWindow
	ldr r4, _08032028 @ =0x0203A8E4
	str r0, [r4]
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r0, r5, #0
	bl NewUnitInfoWindow
	str r0, [r4, #4]
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032028: .4byte 0x0203A8E4
