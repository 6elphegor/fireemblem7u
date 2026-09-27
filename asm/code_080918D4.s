	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080918D4
sub_080918D4: @ 0x080918D4
	push {lr}
	sub sp, #4
	ldr r0, _080918F0 @ =0x0000A580
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080918F0: .4byte 0x0000A580
