	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080232F0
sub_080232F0: @ 0x080232F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08023308 @ =0x0000071D
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023308: .4byte 0x0000071D
