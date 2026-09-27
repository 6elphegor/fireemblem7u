	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807BB18
sub_0807BB18: @ 0x0807BB18
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_0807B2F8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
