	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBE50
sub_080BBE50: @ 0x080BBE50
	push {lr}
	sub sp, #0xc
	movs r3, #1
	rsbs r3, r3, #0
	ldr r1, _080BBE74 @ =0x086005E4
	ldr r2, _080BBE78 @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #0
	movs r3, #0x10
	bl sub_080BD1DC
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080BBE74: .4byte 0x086005E4
_080BBE78: .4byte 0x0000FFFF
