	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08004028
sub_08004028: @ 0x08004028
	push {r7, lr}
	mov r7, sp
	ldr r1, _0800403C @ =0x08B8583C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _08004040
	movs r0, #1
	b _08004044
	.align 2, 0
_0800403C: .4byte 0x08B8583C
_08004040:
	movs r0, #0
	b _08004044
_08004044:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
