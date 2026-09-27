	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080128D4
sub_080128D4: @ 0x080128D4
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080128EA
	cmp r1, #1
	bne _080128EA
	movs r1, #0x10
	bl Proc_Goto
_080128EA:
	pop {r0}
	bx r0
	.align 2, 0
