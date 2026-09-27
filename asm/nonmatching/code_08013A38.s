	.include "macro.inc"

	.syntax unified

	thumb_func_start SpacialSeTest_OnInit
SpacialSeTest_OnInit: @ 0x08013A38
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x66
	movs r1, #0x5a
	strh r1, [r0]
	bx lr
