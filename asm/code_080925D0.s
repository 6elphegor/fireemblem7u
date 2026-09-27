	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080925D0
sub_080925D0: @ 0x080925D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r0, _080926E0 @ =0x02022C60
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_08091944
	movs r0, #0xc0
	lsls r0, r0, #6
	movs r1, #0xa
	bl sub_08091994
	ldr r0, _080926E4 @ =0x02023460
	ldr r1, _080926E8 @ =0x08407270
	movs r2, #0xa6
	lsls r2, r2, #7
	bl sub_080AACD8
	adds r1, r6, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r7, r6, #0
	adds r7, #0x29
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
	movs r0, #7
	bl EnableBgSync
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080926EC @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080926F0 @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xac
	movs r3, #0x4e
	bl UpdatePrepItemScreenFace
	ldrb r5, [r4]
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
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
	ldr r0, _080926F4 @ =sub_08092578
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	bl UnblockUiCursorHand
	bl EndHelpPromptSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080926E0: .4byte 0x02022C60
_080926E4: .4byte 0x02023460
_080926E8: .4byte 0x08407270
_080926EC: .4byte 0x00000503
_080926F0: .4byte 0x00000502
_080926F4: .4byte sub_08092578
