	.include "macro.inc"

	.syntax unified

	thumb_func_start CharacterEnding_80B69D4
CharacterEnding_80B69D4: @ 0x080B82AC
	push {lr}
	ldr r0, _080B82DC @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080B82E0 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080B82E4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	bl ClearTalk
	bl EndEndingBattleText
	bl sub_080B80F0
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080B82DC: .4byte 0x02022C60
_080B82E0: .4byte 0x02023460
_080B82E4: .4byte 0x02023C60
