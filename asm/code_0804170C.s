	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804170C
sub_0804170C: @ 0x0804170C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041728 @ =0x08CC3BDC
	bl Proc_Find
	cmp r0, #0
	bne _08041720
	adds r0, r4, #0
	bl Proc_Break
_08041720:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041728: .4byte 0x08CC3BDC
