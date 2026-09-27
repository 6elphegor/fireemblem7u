	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F0A0
sub_0809F0A0: @ 0x0809F0A0
	asrs r2, r1, #5
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r1, #1
	lsls r1, r2
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
