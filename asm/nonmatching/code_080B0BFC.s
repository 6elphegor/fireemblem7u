	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0BFC
sub_080B0BFC: @ 0x080B0BFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _080B0C14
	ldr r0, [r7]
	movs r1, #0xa
	bl Proc_Goto
_080B0C14:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
