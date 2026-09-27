	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9F84
sub_080B9F84: @ 0x080B9F84
	push {lr}
	adds r2, r0, #0
	ldr r1, _080B9FA0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080B9FA4
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	b _080B9FAC
	.align 2, 0
_080B9FA0: .4byte 0x0202BBF8
_080B9FA4:
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080B9FAC:
	pop {r0}
	bx r0
