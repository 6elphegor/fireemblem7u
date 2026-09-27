	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A66D8
sub_080A66D8: @ 0x080A66D8
	push {r4, lr}
	adds r4, r0, #0
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A66F4
	ldr r0, _080A66FC @ =0x0000078F
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080327C4
_080A66F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A66FC: .4byte 0x0000078F
