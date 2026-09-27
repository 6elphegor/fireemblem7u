	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F028
sub_0800F028: @ 0x0800F028
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F040 @ =0x08B91E40
	bl StartEvent
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F040: .4byte 0x08B91E40
