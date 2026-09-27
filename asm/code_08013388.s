	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013388
sub_08013388: @ 0x08013388
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _08013398 @ =0x00007FFF
	ands r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013398: .4byte 0x00007FFF
