	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031258
sub_08031258: @ 0x08031258
	push {lr}
	ldr r0, _0803126C @ =0x08B96460
	bl Proc_Find
	cmp r0, #0
	beq _08031266
	movs r0, #1
_08031266:
	pop {r1}
	bx r1
	.align 2, 0
_0803126C: .4byte 0x08B96460
