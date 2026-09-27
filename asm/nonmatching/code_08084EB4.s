	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084EB4
sub_08084EB4: @ 0x08084EB4
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r3, _08084ED8 @ =0x00000121
	adds r1, r3, #0
	strh r1, [r0, #2]
	movs r2, #0
	strh r2, [r0, #4]
	adds r3, #0x1d
	adds r1, r3, #0
	strh r1, [r0, #6]
	adds r3, #1
	adds r1, r3, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.align 2, 0
_08084ED8: .4byte 0x00000121
