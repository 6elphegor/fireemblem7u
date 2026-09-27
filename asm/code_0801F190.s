	.include "macro.inc"

	.syntax unified

	thumb_func_start NewPopup2_PlanD
NewPopup2_PlanD: @ 0x0801F190
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	bl ResetTextFont
	add r0, sp, #4
	movs r1, #0x14
	bl InitText
	cmp r4, #0
	beq _0801F1CE
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	adds r0, r4, #0
	bl DecodeMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	movs r1, #2
	bl Text_Skip
_0801F1CE:
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColor
	cmp r4, #0
	beq _0801F1E0
	adds r0, r7, #0
	movs r1, #0
	b _0801F1E4
_0801F1E0:
	adds r0, r7, #0
	movs r1, #1
_0801F1E4:
	bl GetItemNameWithArticle
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
	add r0, sp, #4
	bl Text_GetCursor
	adds r1, r0, #7
	cmp r1, #0
	bge _0801F1FE
	adds r1, #7
_0801F1FE:
	asrs r4, r1, #3
	adds r1, r4, #2
	lsls r1, r1, #3
	add r0, sp, #4
	bl Text_SetCursor
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColor
	cmp r5, #0
	beq _0801F224
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_DrawString
_0801F224:
	add r0, sp, #4
	bl Text_GetCursor
	adds r2, r0, #0
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801F238
	adds r0, #0xf
_0801F238:
	asrs r6, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801F242
	adds r0, #7
_0801F242:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #4
	bl DrawUiFrame2
	lsls r1, r6, #1
	ldr r5, _0801F290 @ =0x02022EA2
	adds r1, r1, r5
	add r0, sp, #4
	bl PutText
	adds r4, #1
	adds r4, r6, r4
	lsls r4, r4, #1
	subs r5, #2
	adds r4, r4, r5
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, _0801F294 @ =0x08B938EC
	mov r1, r8
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F290: .4byte 0x02022EA2
_0801F294: .4byte 0x08B938EC
