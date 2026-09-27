	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEfxHp
GetEfxHp: @ 0x08053340
	ldr r1, _08053350 @ =0x0203E062
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, _08053354 @ =0x00000FFF
	ldrh r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_08053350: .4byte 0x0203E062
_08053354: .4byte 0x00000FFF
