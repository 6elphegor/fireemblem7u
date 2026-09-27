	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelpDarkener_FadeIn
SubtitleHelpDarkener_FadeIn: @ 0x0803248C
	ldr r0, _080324A0 @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x38
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803249C
	subs r0, #1
	strb r0, [r1]
_0803249C:
	bx lr
	.align 2, 0
_080324A0: .4byte 0x0202BBB8
