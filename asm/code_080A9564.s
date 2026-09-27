	.include "macro.inc"

	.syntax unified

	thumb_func_start HideSysHandCursor
HideSysHandCursor: @ 0x080A9564
	push {lr}
	ldr r0, _080A957C @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9576
	movs r1, #0
	bl Proc_Goto
_080A9576:
	pop {r0}
	bx r0
	.align 2, 0
_080A957C: .4byte 0x08CE4AC8
