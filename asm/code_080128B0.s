	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080128B0
sub_080128B0: @ 0x080128B0
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #5
	bne _080128C2
	movs r1, #3
	bl Proc_Goto
_080128C2:
	pop {r0}
	bx r0
	.align 2, 0
