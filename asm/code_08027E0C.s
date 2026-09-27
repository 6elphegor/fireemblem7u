	.include "macro.inc"

	.syntax unified

	thumb_func_start AttackStaffMapSelect_Init
AttackStaffMapSelect_Init: @ 0x08027E0C
	push {lr}
	bl sub_08031F5C
	pop {r1}
	bx r1
	.align 2, 0
