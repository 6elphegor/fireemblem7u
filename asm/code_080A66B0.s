	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_CloseHelpbox
TactInfo_CloseHelpbox: @ 0x080A66B0
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r4, #0x30
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
