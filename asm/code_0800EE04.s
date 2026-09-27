	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800EE04
sub_0800EE04: @ 0x0800EE04
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0800AD28
	ldr r0, _0800EE24 @ =0x08B91B7C
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopup_Simple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE24: .4byte 0x08B91B7C
