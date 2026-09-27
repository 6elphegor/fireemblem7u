	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawBoxDialogueText
DrawBoxDialogueText: @ 0x0808380C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _0808385C @ =0x08CC2AAC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08083860
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b _08083868
	.align 2, 0
_0808385C: .4byte 0x08CC2AAC
_08083860:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
_08083868:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r5]
	bl DecodeMsg
	bl MsgExpand
	add r2, sp, #4
	mov r1, sp
	bl GetBoxDialogueSize
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl SetBoxDialogueSize
	bl GetDialogueBoxConfig
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080838D6
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
_080838D6:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_080833AC
	bl sub_0808460C
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_080845C8
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
