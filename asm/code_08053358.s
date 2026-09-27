	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEfxHpModMaybe
GetEfxHpModMaybe: @ 0x08053358
	ldr r1, _0805336C @ =0x0203E062
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053370 @ =0xFFFFF000
	ldrh r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0805336C: .4byte 0x0203E062
_08053370: .4byte 0xFFFFF000
