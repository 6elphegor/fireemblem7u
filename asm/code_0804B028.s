	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804B028
sub_0804B028: @ 0x0804B028
	push {lr}
	ldr r0, _0804B044 @ =0x08B9A92C
	bl Proc_Find
	cmp r0, #0
	beq _0804B040
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0xbf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0804B040:
	pop {r0}
	bx r0
	.align 2, 0
_0804B044: .4byte 0x08B9A92C
