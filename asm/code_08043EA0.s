	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043EA0
sub_08043EA0: @ 0x08043EA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043EB0 @ =0x08B9998C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08043EB0: .4byte 0x08B9998C
