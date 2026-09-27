	.include "macro.inc"

	.syntax unified

	thumb_func_start efxopThunder_Loop_Main
efxopThunder_Loop_Main: @ 0x0806441C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderBGCOL
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl StartCRSubSpell_efxopThunderOBJ
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
