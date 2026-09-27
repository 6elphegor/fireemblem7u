	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047F6C
sub_08047F6C: @ 0x08047F6C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08047F88 @ =0x08B9A3D0
	bl Proc_Find
	str r4, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x38]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047F88: .4byte 0x08B9A3D0
