	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetChapterFlags
ResetChapterFlags: @ 0x0807980C
	ldr r1, _0807981C @ =0x03004AD8
	movs r2, #0
	adds r0, r1, #5
_08079812:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08079812
	bx lr
	.align 2, 0
_0807981C: .4byte 0x03004AD8
