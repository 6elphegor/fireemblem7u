	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpBoxExt_Unk
StartHelpBoxExt_Unk: @ 0x08081A94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov sb, r2
	ldr r0, _08081B40 @ =0x08CC2014
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	cmp r7, #0
	bge _08081ACA
	cmp r6, #0
	bge _08081ACA
	bl GetUiHandPrevX
	adds r7, r0, #0
	bl GetUiHandPrevY
	adds r6, r0, #0
_08081ACA:
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r5, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	movs r0, #0x4e
	adds r0, r0, r5
	mov r8, r0
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x4c
	mov r1, sb
	strh r1, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl DecodeMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #0
	bl ResetHelpBoxInitSize
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ApplyHelpBoxContentSize
	adds r1, r7, #0
	adds r1, #8
	strh r1, [r5, #0x38]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r5, #0x3a]
	strh r1, [r5, #0x3c]
	strh r0, [r5, #0x3e]
	bl ClearHelpBoxText
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r4]
	bl StartHelpBoxTextInit
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081B40: .4byte 0x08CC2014
