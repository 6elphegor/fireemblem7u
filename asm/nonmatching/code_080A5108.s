	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5108
sub_080A5108: @ 0x080A5108
	push {lr}
	ldr r0, _080A5118 @ =0x08CE40F4
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080A5118: .4byte 0x08CE40F4
