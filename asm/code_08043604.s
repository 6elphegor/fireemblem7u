	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043604
sub_08043604: @ 0x08043604
	push {lr}
	ldr r2, _08043614 @ =0x081D546C
	movs r0, #8
	movs r1, #0x10
	bl sub_0800530C
	pop {r0}
	bx r0
	.align 2, 0
_08043614: .4byte 0x081D546C
