	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080232AC
sub_080232AC: @ 0x080232AC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _080232C8 @ =0x0000071C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080232C8: .4byte 0x0000071C
