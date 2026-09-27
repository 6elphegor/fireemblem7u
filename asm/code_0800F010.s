	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F010
sub_0800F010: @ 0x0800F010
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800F024 @ =0x08B91E28
	bl sub_0800AF5C
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F024: .4byte 0x08B91E28
