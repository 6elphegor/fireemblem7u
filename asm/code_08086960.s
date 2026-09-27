	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086960
sub_08086960: @ 0x08086960
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _0808697E
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808697E
_08086970:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808697E
	cmp r0, #1
	bne _08086982
	adds r0, r1, #1
	b _0808698E
_0808697E:
	movs r0, #0
	b _0808698E
_08086982:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextLen
	adds r1, r0, #0
	b _08086970
_0808698E:
	add sp, #4
	pop {r1}
	bx r1
