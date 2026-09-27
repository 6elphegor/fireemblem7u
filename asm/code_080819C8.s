	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpBoxExt
StartHelpBoxExt: @ 0x080819C8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r6, _08081A00 @ =0x08CC2014
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _08081A04
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x52
	strb r7, [r0]
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	b _08081A1C
	.align 2, 0
_08081A00: .4byte 0x08CC2014
_08081A04:
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x3a]
	ldrh r1, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r4, #0x36]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
_08081A1C:
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x4a
	movs r0, #0xc
	strh r0, [r2]
	adds r7, r4, #0
	adds r7, #0x4e
	strh r1, [r7]
	ldrh r0, [r5, #0x12]
	adds r6, r4, #0
	adds r6, #0x4c
	strh r0, [r6]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _08081A4A
	adds r0, r4, #0
	bl _call_via_r1
_08081A4A:
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r6]
	bl DecodeMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl ApplyHelpBoxContentSize
	ldrb r1, [r5, #0x10]
	ldrb r2, [r5, #0x11]
	adds r0, r4, #0
	bl ApplyHelpBoxPosition
	bl ClearHelpBoxText
	ldrh r0, [r7]
	ldrh r1, [r6]
	bl StartHelpBoxTextInit
	ldr r0, _08081A90 @ =0x0203E690
	str r5, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081A90: .4byte 0x0203E690
