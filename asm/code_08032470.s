	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelpDarkener_Init
SubtitleHelpDarkener_Init: @ 0x08032470
	push {lr}
	ldr r0, _08032484 @ =0x0202BBB8
	adds r0, #0x38
	movs r1, #8
	strb r1, [r0]
	ldr r0, _08032488 @ =SubtitleHelpDarkenerOnHBlank
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08032484: .4byte 0x0202BBB8
_08032488: .4byte SubtitleHelpDarkenerOnHBlank
