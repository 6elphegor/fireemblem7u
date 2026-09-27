	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804B008
sub_0804B008: @ 0x0804B008
	push {lr}
	ldr r0, _0804B024 @ =0x08B9A92C
	bl Proc_Find
	cmp r0, #0
	beq _0804B01E
	adds r0, #0x34
	movs r1, #0x40
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
_0804B01E:
	pop {r0}
	bx r0
	.align 2, 0
_0804B024: .4byte 0x08B9A92C
