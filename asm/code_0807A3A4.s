	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A3A4
sub_0807A3A4: @ 0x0807A3A4
	push {lr}
	bl GetTalkChoiceResult
	movs r1, #0
	cmp r0, #1
	bne _0807A3B2
	movs r1, #1
_0807A3B2:
	adds r0, r1, #0
	pop {r1}
	bx r1
