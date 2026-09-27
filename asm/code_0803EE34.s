	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803EE34
sub_0803EE34: @ 0x0803EE34
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	rsbs r1, r1, #0
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
_0803EE40:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0803EE40
	bx lr
