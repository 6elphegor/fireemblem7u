	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitGiveInfoWindows
RefreshUnitGiveInfoWindows: @ 0x08032218
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	ldr r0, _080322CC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl ClearUi
	ldr r5, _080322D0 @ =0x0203A8E4
	ldr r0, [r5]
	movs r1, #0xa
	mov sl, r1
	str r1, [sp]
	movs r2, #1
	mov sb, r2
	str r2, [sp, #4]
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r6, #0
	bl DrawUnitConText
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _080322D4 @ =0x02022C60
	adds r1, r1, r6
	bl PutText
	ldr r0, [r5, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, sb
	str r2, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5, #4]
	adds r0, #0x38
	mov r1, r8
	bl DrawUnitAidText
	ldr r0, [r5, #4]
	adds r0, #0x38
	ldr r2, _080322D8 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r6
	bl PutText
	adds r1, r4, #1
	mov r0, r8
	movs r2, #9
	bl PutUnitAidIconForTextAt
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080322CC: .4byte 0x03004690
_080322D0: .4byte 0x0203A8E4
_080322D4: .4byte 0x02022C60
_080322D8: .4byte 0x00000121
