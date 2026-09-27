	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreen_RandomScroll_Init
GameOverScreen_RandomScroll_Init: @ 0x08020118
	adds r2, r0, #0
	movs r0, #0x2e
	str r0, [r2, #0x34]
	subs r0, #0x88
	str r0, [r2, #0x38]
	adds r0, #0x4a
	str r0, [r2, #0x3c]
	subs r0, #0x25
	str r0, [r2, #0x40]
	adds r1, r2, #0
	adds r1, #0x64
	ldr r0, _08020148 @ =0x000004D2
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0802014C @ =0x0000162E
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08020150 @ =0x000018CA
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08020154 @ =0x00002158
	strh r0, [r1]
	bx lr
	.align 2, 0
_08020148: .4byte 0x000004D2
_0802014C: .4byte 0x0000162E
_08020150: .4byte 0x000018CA
_08020154: .4byte 0x00002158
