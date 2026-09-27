	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBattleForecastItemName
PutBattleForecastItemName: @ 0x080334A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	adds r0, r2, #0
	bl GetItemName
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r0, r6, #0
	bl ClearText
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl PutDrawText
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
