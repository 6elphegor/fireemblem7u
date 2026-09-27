	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082E80
sub_08082E80: @ 0x08082E80
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _08082EC4 @ =0x08CC29E4
	adds r0, r4, #0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	bne _08082ECC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _08082EC8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08082EB2
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_08082EB2:
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_080830C0
	adds r0, r5, #0
	bl SetHelpBoxDefaultRect
	b _08082EE8
	.align 2, 0
_08082EC4: .4byte 0x08CC29E4
_08082EC8: .4byte 0x0202BBF8
_08082ECC:
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x3a]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r0, #6
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
_08082EE8:
	str r6, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc
	strh r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r4, r5, #0
	adds r4, #0x4c
	strh r0, [r4]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r4]
	bl DecodeMsg
	add r2, sp, #4
	mov r1, sp
	bl GetStringTextBox
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_08083008
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_08083048
	bl ClearHelpBoxText
	adds r0, r5, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	ldrh r1, [r4]
	bl StartHelpBoxTextInit
	ldr r0, _08082F4C @ =0x0203E6F0
	str r6, [r0]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082F4C: .4byte 0x0203E6F0
