	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800EF3C
sub_0800EF3C: @ 0x0800EF3C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0800EF50 @ =0x08B91DA4
	movs r1, #0x60
	movs r2, #0
	bl NewPopup_Simple
	pop {r0}
	bx r0
	.align 2, 0
_0800EF50: .4byte 0x08B91DA4
