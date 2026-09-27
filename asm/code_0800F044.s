	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F044
sub_0800F044: @ 0x0800F044
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0800F068 @ =0x08B91E4C
	bl sub_0800AF5C
	adds r1, r0, #0
	adds r1, #0x5c
	strh r4, [r1]
	adds r0, #0x4f
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F068: .4byte 0x08B91E4C
