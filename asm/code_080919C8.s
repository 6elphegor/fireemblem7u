	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_Reinit
PrepItemScreen_Reinit: @ 0x080919C8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_08092AE4
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _08091AC0 @ =0x02023460
	ldr r1, _08091AC4 @ =0x084070BC
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	adds r7, r6, #0
	adds r7, #0x29
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08091AC8 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldr r5, _08091ACC @ =0x02012A20
	ldr r4, _08091AD0 @ =0x02022EA4
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_080929D0
	adds r4, #0x60
	adds r0, r4, #0
	bl sub_08091868
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	ldrb r5, [r7]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl ShowSysHandCursor
	adds r0, r6, #0
	movs r1, #0
	bl sub_08092ED4
	bl UnblockUiCursorHand
	bl DisableAllUiCursorHand
	movs r0, #0xc9
	movs r1, #0x7b
	adds r2, r6, #0
	bl StartHelpPromptSprite
	bl sub_08091914
	ldr r0, _08091AD4 @ =sub_080918B4
	adds r1, r6, #0
	bl StartParallelWorker
	bl PrepItemScreen_DrawFunds
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091AC0: .4byte 0x02023460
_08091AC4: .4byte 0x084070BC
_08091AC8: .4byte 0x00000503
_08091ACC: .4byte 0x02012A20
_08091AD0: .4byte 0x02022EA4
_08091AD4: .4byte sub_080918B4
