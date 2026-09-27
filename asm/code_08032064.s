	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitRescueInfoWindows
RefreshUnitRescueInfoWindows: @ 0x08032064
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	bl ClearUi
	ldr r6, _0803210C @ =0x0203A8E4
	ldr r0, [r6]
	ldr r5, _08032110 @ =0x03004690
	ldr r1, [r5]
	movs r7, #0xa
	str r7, [sp]
	movs r2, #1
	mov sl, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl DrawUnitAidText
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _08032114 @ =0x02022C60
	mov sb, r2
	add r1, sb
	bl PutText
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl PutUnitAidIconForTextAt
	ldr r0, [r6, #4]
	str r7, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6, #4]
	adds r0, #0x38
	mov r1, r8
	bl DrawUnitConText
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _08032118 @ =0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sb
	bl PutText
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
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803210C: .4byte 0x0203A8E4
_08032110: .4byte 0x03004690
_08032114: .4byte 0x02022C60
_08032118: .4byte 0x00000121
