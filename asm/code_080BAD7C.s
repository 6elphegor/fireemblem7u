	.include "macro.inc"

	.syntax unified

	thumb_func_start TitleFlame_Init
TitleFlame_Init: @ 0x080BAD7C
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r1, _080BAD9C @ =0x02000004
	movs r0, #3
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	movs r0, #4
	str r0, [r1, #0xc]
	str r2, [r1, #0x10]
	bx lr
	.align 2, 0
_080BAD9C: .4byte 0x02000004
