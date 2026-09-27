	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023424
sub_08023424: @ 0x08023424
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08031DFC
	ldr r0, _08023440 @ =0x00000724
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023440: .4byte 0x00000724
