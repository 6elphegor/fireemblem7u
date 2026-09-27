	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_HandleIntroDialoguePrompt
TactInfo_HandleIntroDialoguePrompt: @ 0x080A6A90
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A6AA4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6AA4:
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6AB4
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6ABC
_080A6AB4:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6ABC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
