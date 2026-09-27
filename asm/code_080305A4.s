	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080305A4
sub_080305A4: @ 0x080305A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb0
	movs r1, #0x8c
	adds r2, r4, #0
	bl StartHelpPromptSprite
	ldr r0, _080305C4 @ =0x08405170
	ldr r1, _080305C8 @ =0x06017000
	bl Decompress
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080305C4: .4byte 0x08405170
_080305C8: .4byte 0x06017000
