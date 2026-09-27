	.include "macro.inc"

	.syntax unified

	thumb_func_start NewUnitInfoWindow
NewUnitInfoWindow: @ 0x0803168C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080316B4 @ =0x08B96998
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #6
	bl InitTextDb
	bl ClearIcons
	movs r0, #4
	bl ApplyIconPalettes
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080316B4: .4byte 0x08B96998
