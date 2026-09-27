	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800EFCC
sub_0800EFCC: @ 0x0800EFCC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0800EFE4 @ =0x08B91DF4
	bl StartEvent
	adds r0, #0x5c
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EFE4: .4byte 0x08B91DF4
