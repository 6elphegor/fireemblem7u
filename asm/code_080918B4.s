	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080918B4
sub_080918B4: @ 0x080918B4
	push {lr}
	sub sp, #4
	ldr r0, _080918D0 @ =0x0000A580
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x58
	movs r2, #9
	movs r3, #4
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080918D0: .4byte 0x0000A580
