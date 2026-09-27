	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A66C4
sub_080A66C4: @ 0x080A66C4
	push {lr}
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A66D4
	bl EndSubtitleHelp
_080A66D4:
	pop {r0}
	bx r0
