	.include "macro.inc"

	.syntax unified

	thumb_func_start GetDialogueBoxConfig
GetDialogueBoxConfig: @ 0x080831A8
	ldr r0, _080831B0 @ =0x0203E6F4
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080831B0: .4byte 0x0203E6F4
