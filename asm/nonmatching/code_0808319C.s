	.include "macro.inc"

	.syntax unified

	thumb_func_start SetDialogueBoxConfig
SetDialogueBoxConfig: @ 0x0808319C
	ldr r1, _080831A4 @ =0x0203E6F4
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_080831A4: .4byte 0x0203E6F4
