	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4D54
sub_080A4D54: @ 0x080A4D54
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	cmp r1, #3
	bne _080A4D68
	movs r1, #2
	bl Proc_Goto
	b _080A4D6E
_080A4D68:
	movs r1, #5
	bl Proc_Goto
_080A4D6E:
	pop {r0}
	bx r0
	.align 2, 0
