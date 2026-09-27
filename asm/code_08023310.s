	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023310
sub_08023310: @ 0x08023310
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080321E0
	ldr r0, _0802332C @ =0x0000071F
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802332C: .4byte 0x0000071F
