	.include "macro.inc"

	.syntax unified

	thumb_func_start CharacterEnding_StartBattleDisplayText
CharacterEnding_StartBattleDisplayText: @ 0x080B8528
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x38]
	ldr r2, [r3, #0x3c]
	bl StartEndingBattleText
	pop {r0}
	bx r0
	.align 2, 0
