	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_IntroDialogue2
TactInfo_IntroDialogue2: @ 0x080A6A54
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl EndSysHandCursor
	bl sub_080A66C4
	ldr r2, _080A6A88 @ =0x00000792
	ldr r3, _080A6A8C @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x70
	movs r1, #0x5a
	bl StartBoxDialogueExt
	movs r0, #0x70
	bl SetDialogueBoxConfig
	movs r0, #1
	bl SetTalkChoiceResult
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A88: .4byte 0x00000792
_080A6A8C: .4byte 0x06016000
