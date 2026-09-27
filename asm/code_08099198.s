	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099198
sub_08099198: @ 0x08099198
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	beq _080991D0
	cmp r1, #1
	bgt _080991AE
	cmp r1, #0
	beq _080991B8
	b _080991D6
_080991AE:
	cmp r1, #2
	beq _080991C0
	cmp r1, #3
	beq _080991C8
	b _080991D6
_080991B8:
	movs r1, #2
	bl Proc_Goto
	b _080991D6
_080991C0:
	movs r1, #3
	bl Proc_Goto
	b _080991D6
_080991C8:
	movs r1, #4
	bl Proc_Goto
	b _080991D6
_080991D0:
	movs r1, #5
	bl Proc_Goto
_080991D6:
	pop {r0}
	bx r0
	.align 2, 0
