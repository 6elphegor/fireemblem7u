	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4D74
sub_080A4D74: @ 0x080A4D74
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080A4D8E
	movs r0, #0xc0
	movs r1, #8
	bl StartHelpPromptSprite
_080A4D8E:
	pop {r0}
	bx r0
	.align 2, 0
