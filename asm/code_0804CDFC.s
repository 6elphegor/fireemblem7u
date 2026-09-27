	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDispUP_SetPositionSync
EkrDispUP_SetPositionSync: @ 0x0804CDFC
	ldr r2, _0804CE0C @ =0x0200006C
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_0804CE0C: .4byte 0x0200006C
