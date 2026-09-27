	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F358
sub_0800F358: @ 0x0800F358
	push {lr}
	ldr r0, _0800F368 @ =0x03005B10
	movs r1, #2
	bl m4aMPlayFadeInContinue
	pop {r0}
	bx r0
	.align 2, 0
_0800F368: .4byte 0x03005B10
