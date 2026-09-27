	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023354
sub_08023354: @ 0x08023354
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803202C
	ldr r0, _08023370 @ =0x0000071E
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023370: .4byte 0x0000071E
