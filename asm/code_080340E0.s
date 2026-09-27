	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080340E0
sub_080340E0: @ 0x080340E0
	push {lr}
	ldr r0, _080340F0 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	bne _080340F4
	movs r0, #0
	b _080340F6
	.align 2, 0
_080340F0: .4byte 0x08B90D88
_080340F4:
	movs r0, #1
_080340F6:
	pop {r1}
	bx r1
	.align 2, 0
