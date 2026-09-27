	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A928C
sub_080A928C: @ 0x080A928C
	push {lr}
	ldr r0, _080A92A4 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A929E
	movs r1, #1
	bl Proc_Goto
_080A929E:
	pop {r0}
	bx r0
	.align 2, 0
_080A92A4: .4byte 0x08CE4A80
