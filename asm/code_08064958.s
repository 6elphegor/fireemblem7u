	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08064958
sub_08064958: @ 0x08064958
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopLightningBG
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
