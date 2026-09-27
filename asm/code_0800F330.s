	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F330
sub_0800F330: @ 0x0800F330
	push {lr}
	ldr r0, _0800F340 @ =0x03005D20
	movs r1, #3
	bl m4aMPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0
_0800F340: .4byte 0x03005D20
