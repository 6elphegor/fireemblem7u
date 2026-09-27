	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080127C4
sub_080127C4: @ 0x080127C4
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080127D6
	cmp r1, #1
	beq _080127DE
	b _080127E4
_080127D6:
	movs r1, #3
	bl Proc_Goto
	b _080127E4
_080127DE:
	movs r1, #0
	bl Proc_Goto
_080127E4:
	pop {r0}
	bx r0
