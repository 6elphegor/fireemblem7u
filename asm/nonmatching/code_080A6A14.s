	.include "macro.inc"

	.syntax unified

	thumb_func_start TactInfo_IntroDialogue1
TactInfo_IntroDialogue1: @ 0x080A6A14
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6A44
	bl EndSysHandCursor
	bl sub_080A66C4
	ldr r2, _080A6A4C @ =0x00000791
	ldr r3, _080A6A50 @ =0x06016000
	movs r0, #0xd
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x30
	movs r1, #0x5a
	bl StartBoxDialogueExt
	movs r0, #0x70
	bl SetDialogueBoxConfig
_080A6A44:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A4C: .4byte 0x00000791
_080A6A50: .4byte 0x06016000
