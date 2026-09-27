	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F06C
sub_0800F06C: @ 0x0800F06C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F088 @ =0x08B91E68
	bl StartEvent
	str r5, [r0, #0x58]
	adds r0, #0x4f
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F088: .4byte 0x08B91E68
