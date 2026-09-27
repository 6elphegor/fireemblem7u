	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080918F4
sub_080918F4: @ 0x080918F4
	push {lr}
	sub sp, #4
	ldr r0, _08091910 @ =0x0000A980
	str r0, [sp]
	movs r0, #0x82
	movs r1, #0x50
	movs r2, #9
	movs r3, #6
	bl PrepItemDrawPopupBox
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08091910: .4byte 0x0000A980
