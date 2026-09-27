	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2F40
sub_080B2F40: @ 0x080B2F40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B2F60
	cmp r0, #1
	bgt _080B2F5A
	cmp r0, #0
	beq _080B2F68
	b _080B2F68
_080B2F5A:
	cmp r0, #2
	beq _080B2F64
	b _080B2F68
_080B2F60:
	movs r0, #1
	b _080B2F6C
_080B2F64:
	movs r0, #0
	b _080B2F6C
_080B2F68:
	movs r0, #0
	b _080B2F6C
_080B2F6C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
