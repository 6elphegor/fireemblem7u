	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08039510
sub_08039510: @ 0x08039510
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0803952C @ =0x0202E3F4
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, r2
	bhi _08039530
	movs r0, #1
	b _08039532
	.align 2, 0
_0803952C: .4byte 0x0202E3F4
_08039530:
	movs r0, #0
_08039532:
	bx lr
