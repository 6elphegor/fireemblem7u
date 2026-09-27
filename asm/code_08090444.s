	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090444
sub_08090444: @ 0x08090444
	push {lr}
	ldr r0, _0809045C @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _08090456
	movs r1, #1
	bl Proc_Goto
_08090456:
	pop {r0}
	bx r0
	.align 2, 0
_0809045C: .4byte 0x08CC4334
