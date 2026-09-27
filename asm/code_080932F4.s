	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_DrawLeftUnitName
PrepUnit_DrawLeftUnitName: @ 0x080932F4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _080933AC @ =0x02022D2A
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov sb, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _080933B0 @ =0x02012B38
	mov r8, r0
	bl ClearText
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, sb
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	bl PutSpecialChar
	adds r0, r4, #2
	movs r1, #3
	movs r2, #0x25
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl PutNumberOrBlank
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080933AC: .4byte 0x02022D2A
_080933B0: .4byte 0x02012B38
