	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D8D4
sub_0807D8D4: @ 0x0807D8D4
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0807D8E6
	bl ClearEmitedStars
_0807D8E6:
	pop {r0}
	bx r0
	.align 2, 0
