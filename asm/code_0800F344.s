	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F344
sub_0800F344: @ 0x0800F344
	push {lr}
	ldr r0, _0800F354 @ =0x03005B10
	movs r1, #3
	bl m4aMPlayFadeOutPause
	pop {r0}
	bx r0
	.align 2, 0
_0800F354: .4byte 0x03005B10
