	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E8E4
sub_0803E8E4: @ 0x0803E8E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803E900 @ =0x08CC32A4
	bl Proc_Find
	cmp r0, #0
	bne _0803E8F8
	adds r0, r4, #0
	bl Proc_Break
_0803E8F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E900: .4byte 0x08CC32A4
