	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7C08
sub_080A7C08: @ 0x080A7C08
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080A7C20 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7C1A
	strh r4, [r0, #0x3e]
_080A7C1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C20: .4byte 0x08CE48F0
