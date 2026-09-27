	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxIntroDrawTexts
HelpBoxIntroDrawTexts: @ 0x08082C8C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r5, _08082D34 @ =0x0203E6A0
	adds r0, r5, #0
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	movs r0, #0x18
	adds r0, r0, r5
	mov sb, r0
	movs r1, #6
	bl Text_SetColor
	movs r1, #0x20
	adds r1, r1, r5
	mov r8, r1
	mov r0, r8
	movs r1, #6
	bl Text_SetColor
	adds r6, r5, #0
	adds r6, #0x28
	adds r0, r6, #0
	movs r1, #6
	bl Text_SetColor
	movs r0, #0
	bl SetTextFont
	ldr r4, _08082D38 @ =0x08CC2994
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x30]
	mov r0, sb
	str r0, [r4, #0x34]
	mov r1, r8
	str r1, [r4, #0x38]
	str r6, [r4, #0x3c]
	mov r0, sl
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r5, #0
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl DecodeMsg
	bl MsgExpand
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x5e
	strh r5, [r0]
	ldr r0, _08082D3C @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	cmp r2, #1
	beq _08082D52
	cmp r2, #1
	bgt _08082D40
	cmp r2, #0
	beq _08082D4A
	b _08082D6E
	.align 2, 0
_08082D34: .4byte 0x0203E6A0
_08082D38: .4byte 0x08CC2994
_08082D3C: .4byte 0x0202BBF8
_08082D40:
	cmp r2, #2
	beq _08082D5A
	cmp r2, #3
	beq _08082D64
	b _08082D6E
_08082D4A:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #2
	b _08082D6C
_08082D52:
	adds r0, r4, #0
	adds r0, #0x60
	strh r2, [r0]
	b _08082D6E
_08082D5A:
	adds r0, r4, #0
	adds r0, #0x60
	strh r3, [r0]
	strh r2, [r1]
	b _08082D6E
_08082D64:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
	movs r0, #0x7f
_08082D6C:
	strh r0, [r1]
_08082D6E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StartHelpBoxTextInit
StartHelpBoxTextInit: @ 0x08082D7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08082D94 @ =0x08CC29BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082D94: .4byte 0x08CC29BC

	thumb_func_start ClearHelpBoxText
ClearHelpBoxText: @ 0x08082D98
	push {r4, lr}
	ldr r4, _08082DD4 @ =0x0203E6A0
	adds r0, r4, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r4, #0x28
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	ldr r0, _08082DD8 @ =0x08CC2994
	bl Proc_EndEach
	ldr r0, _08082DDC @ =0x08CC29BC
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082DD4: .4byte 0x0203E6A0
_08082DD8: .4byte 0x08CC2994
_08082DDC: .4byte 0x08CC29BC

	thumb_func_start sub_08082DE0
sub_08082DE0: @ 0x08082DE0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08082E02
	adds r0, r3, #1
	strh r0, [r2]
_08082E02:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08082E08
sub_08082E08: @ 0x08082E08
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetHelpBoxDefaultRect
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_080830C0
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08082E38
sub_08082E38: @ 0x08082E38
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08082E58
	adds r0, r4, #0
	bl Proc_Break
_08082E58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08082E60
sub_08082E60: @ 0x08082E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08082E7C @ =0x0203E6D4
	movs r3, #0
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	bl sub_08082FD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082E7C: .4byte 0x0203E6D4

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

	thumb_func_start sub_08082F50
sub_08082F50: @ 0x08082F50
	push {lr}
	ldr r0, _08082F74 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08082F64
	ldr r0, _08082F78 @ =0x00000391
	bl m4aSongNumStart
_08082F64:
	bl ClearHelpBoxText
	ldr r0, _08082F7C @ =0x08CC29E4
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_08082F74: .4byte 0x0202BBF8
_08082F78: .4byte 0x00000391
_08082F7C: .4byte 0x08CC29E4

	thumb_func_start sub_08082F80
sub_08082F80: @ 0x08082F80
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08082F98
	adds r0, r4, #0
	bl _call_via_r1
_08082F98:
	ldr r0, [r4, #0x2c]
	bl sub_08082E80
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08082FA4
sub_08082FA4: @ 0x08082FA4
	push {lr}
	adds r2, r0, #0
	ldr r0, _08082FC0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08082FBC
	adds r0, r2, #0
	bl Proc_Break
_08082FBC:
	pop {r0}
	bx r0
	.align 2, 0
_08082FC0: .4byte 0x08B857F8

	thumb_func_start sub_08082FC4
sub_08082FC4: @ 0x08082FC4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08082F50
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08082FD8
sub_08082FD8: @ 0x08082FD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08082FEC @ =0x08CC2A04
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082FEC: .4byte 0x08CC2A04

	thumb_func_start sub_08082FF0
sub_08082FF0: @ 0x08082FF0
	push {lr}
	ldr r0, _08083004 @ =0x08CC2A04
	bl Proc_Find
	cmp r0, #0
	beq _08082FFE
	movs r0, #1
_08082FFE:
	pop {r1}
	bx r1
	.align 2, 0
_08083004: .4byte 0x08CC2A04

	thumb_func_start sub_08083008
sub_08083008: @ 0x08083008
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_080830D8
	cmp r0, #1
	beq _0808302A
	cmp r0, #2
	beq _08083030
	b _08083038
_0808302A:
	movs r4, #0xa0
	adds r5, #0x20
	b _08083038
_08083030:
	cmp r4, #0x5f
	bgt _08083036
	movs r4, #0x60
_08083036:
	adds r5, #0x10
_08083038:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08083048
sub_08083048: @ 0x08083048
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _08083082
	movs r0, #0
	strh r0, [r5, #0x3c]
_08083082:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _08083092
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_08083092:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble _080830A8
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
_080830A8:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080830C0
sub_080830C0: @ 0x080830C0
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0

	thumb_func_start SetHelpBoxDefaultRect
SetHelpBoxDefaultRect: @ 0x080830C8
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start sub_080830D8
sub_080830D8: @ 0x080830D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080830E8 @ =0x0000FFFF
	cmp r4, r0
	bne _080830EC
	movs r0, #3
	b _08083122
	.align 2, 0
_080830E8: .4byte 0x0000FFFF
_080830EC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808311C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808310E
	movs r0, #1
	b _08083122
_0808310E:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08083120
_0808311C:
	movs r0, #0
	b _08083122
_08083120:
	movs r0, #2
_08083122:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08083128
sub_08083128: @ 0x08083128
	push {lr}
	adds r2, r0, #0
	ldr r0, _08083144 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08083140
	adds r0, r2, #0
	bl Proc_Break
_08083140:
	pop {r0}
	bx r0
	.align 2, 0
_08083144: .4byte 0x08B857F8

	thumb_func_start sub_08083148
sub_08083148: @ 0x08083148
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08082E60
	ldr r0, _0808317C @ =0x08CC2A34
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808317C: .4byte 0x08CC2A34

	thumb_func_start BoxTalkActive
BoxTalkActive: @ 0x08083180
	push {lr}
	ldr r0, _08083190 @ =0x08CC2A4C
	bl Proc_Find
	cmp r0, #0
	bne _08083194
	movs r0, #0
	b _08083196
	.align 2, 0
_08083190: .4byte 0x08CC2A4C
_08083194:
	movs r0, #1
_08083196:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetDialogueBoxConfig
SetDialogueBoxConfig: @ 0x0808319C
	ldr r1, _080831A4 @ =0x0203E6F4
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_080831A4: .4byte 0x0203E6F4

	thumb_func_start GetDialogueBoxConfig
GetDialogueBoxConfig: @ 0x080831A8
	ldr r0, _080831B0 @ =0x0203E6F4
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080831B0: .4byte 0x0203E6F4

	thumb_func_start sub_080831B4
sub_080831B4: @ 0x080831B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r3, _08083214 @ =0x0203E6F4
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _08083218 @ =0x000003FF
	ldrh r2, [r2]
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r3, r0
	lsls r0, r0, #5
	ldr r2, _0808321C @ =0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge _08083246
	adds r3, r0, #0
_080831E0:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, sb
	bge _0808323A
_080831EC:
	adds r6, r2, #1
	movs r1, #6
_080831F0:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _080831F0
	subs r0, r3, #1
	cmp r7, r0
	bne _08083228
	str r3, [sp]
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne _08083224
	ldr r0, _08083220 @ =0x44444444
	b _08083232
	.align 2, 0
_08083214: .4byte 0x0203E6F4
_08083218: .4byte 0x000003FF
_0808321C: .4byte 0x06010000
_08083220: .4byte 0x44444444
_08083224:
	movs r0, #0
	b _08083232
_08083228:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
_08083232:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, sb
	blt _080831EC
_0808323A:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt _080831E0
_08083246:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start InitBoxDialogue
InitBoxDialogue: @ 0x08083254
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	bne _08083260
	ldr r6, _08083284 @ =0x06013000
_08083260:
	cmp r5, #0
	bge _08083266
	movs r5, #5
_08083266:
	movs r0, #0xf
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808328C
	ldr r0, _08083288 @ =0x083FD884
	adds r1, r6, #0
	bl Decompress
	b _08083294
	.align 2, 0
_08083284: .4byte 0x06013000
_08083288: .4byte 0x083FD884
_0808328C:
	ldr r0, _08083308 @ =0x083FD764
	adds r1, r6, #0
	bl Decompress
_08083294:
	bl ClearAllTalkFlags
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083324
	ldr r4, _0808330C @ =0x0203E6F4
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080832F0
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _080832F0
	adds r0, r4, #0
	adds r0, #0x30
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x38
	bl InitSpriteText
_080832F0:
	movs r0, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083314
	ldr r0, _08083310 @ =0x081946F4
	b _08083316
	.align 2, 0
_08083308: .4byte 0x083FD764
_0808330C: .4byte 0x0203E6F4
_08083310: .4byte 0x081946F4
_08083314:
	ldr r0, _08083320 @ =0x081946D4
_08083316:
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08083360
	.align 2, 0
_08083320: .4byte 0x081946D4
_08083324:
	ldr r0, _08083334 @ =0x0203E6F4
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r4, #0
	lsls r7, r5, #5
	b _08083344
	.align 2, 0
_08083334: .4byte 0x0203E6F4
_08083338:
	lsls r0, r4, #3
	ldr r1, _08083398 @ =0x0203E70C
	adds r0, r0, r1
	bl InitSpriteText
	adds r4, #1
_08083344:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08083338
	movs r0, #0
	bl SetTextFont
	ldr r0, _0808339C @ =0x08194674
	adds r1, r7, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_08083360:
	ldr r2, _080833A0 @ =0x0203E6F4
	lsls r1, r6, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083390
	ldr r0, _080833A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083390
	ldr r0, _080833A8 @ =0x000002E6
	bl m4aSongNumStart
_08083390:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083398: .4byte 0x0203E70C
_0808339C: .4byte 0x08194674
_080833A0: .4byte 0x0203E6F4
_080833A4: .4byte 0x0202BBF8
_080833A8: .4byte 0x000002E6

	thumb_func_start sub_080833AC
sub_080833AC: @ 0x080833AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble _080833D2
	movs r0, #0xc0
	strh r0, [r1]
_080833D2:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083424
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl GetDialogueBoxConfig
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0808341C
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble _0808340A
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
_0808340A:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _0808341C
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
_0808341C:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b _08083428
_08083424:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
_08083428:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SetBoxDialogueSize
SetBoxDialogueSize: @ 0x08083434
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr

	thumb_func_start sub_08083444
sub_08083444: @ 0x08083444
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0808345E
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl InitBoxDialogue
	b _08083466
_0808345E:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl InitBoxDialogue
_08083466:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl DrawBoxDialogueText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08083478
sub_08083478: @ 0x08083478
	push {r4, lr}
	adds r4, r0, #0
	bl GetDialogueBoxConfig
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _0808349E
	ldr r0, _080834A4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808349E
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0808349E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080834A4: .4byte 0x08B857F8

	thumb_func_start sub_080834A8
sub_080834A8: @ 0x080834A8
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080834C8
	ldr r0, _080834D8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080834C8
	ldr r0, _080834DC @ =0x000002E7
	bl m4aSongNumStart
_080834C8:
	movs r0, #0
	bl SetTextFontGlyphs
	bl EndMergeBoxDialogue
	pop {r0}
	bx r0
	.align 2, 0
_080834D8: .4byte 0x0202BBF8
_080834DC: .4byte 0x000002E7

	thumb_func_start sub_080834E0
sub_080834E0: @ 0x080834E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	mov r8, r0
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	mov sb, r2
	adds r0, r7, #0
	adds r0, #0x40
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #4
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r4, r7, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r6, #0x4a
	adds r6, r6, r7
	mov sl, r6
	movs r3, #0
	ldrsh r0, [r6, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x42
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	mov r4, sl
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r7, #0x30]
	mov r1, sb
	strh r1, [r7, #0x32]
	mov r0, r8
	mov r1, sb
	ldr r2, [sp, #4]
	bl sub_080838FC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08083570
sub_08083570: @ 0x08083570
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_080834E0
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08083592
	adds r0, r3, #1
	strh r0, [r2]
_08083592:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start MergeBoxDialogue2
MergeBoxDialogue2: @ 0x08083598
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ResetHelpBoxInitSize
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MergeBoxDialogue3
MergeBoxDialogue3: @ 0x080835BC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_080834E0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080835E2
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080835E8 @ =0x08CC2B84
	bl Proc_EndEach
_080835E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080835E8: .4byte 0x08CC2B84

	thumb_func_start EndMergeBoxDialogue
EndMergeBoxDialogue: @ 0x080835EC
	push {lr}
	bl sub_0808460C
	ldr r0, _080835FC @ =0x08CC2AAC
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_080835FC: .4byte 0x08CC2AAC

	thumb_func_start StartBoxDialogueSimple
StartBoxDialogueSimple: @ 0x08083600
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808362C @ =0x08CC2A4C
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne _08083630
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _08083638
	.align 2, 0
_0808362C: .4byte 0x08CC2A4C
_08083630:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_08083638:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08083664 @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083664: .4byte 0x08CC2B84

	thumb_func_start StartBoxDialogueExt
StartBoxDialogueExt: @ 0x08083668
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x20]
	ldr r4, _08083698 @ =0x08CC2A4C
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl SetDialogueBoxConfig
	cmp r5, #0
	bne _0808369C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _080836A4
	.align 2, 0
_08083698: .4byte 0x08CC2A4C
_0808369C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_080836A4:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, sb
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080836D4 @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836D4: .4byte 0x08CC2B84

	thumb_func_start GetBoxDialogueSize
GetBoxDialogueSize: @ 0x080836D8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	movs r5, #0
	movs r7, #0x10
	str r5, [r4]
	str r5, [r6]
_080836EA:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808370C
	cmp r0, #4
	bge _0808372A
	cmp r0, #1
	beq _0808372E
	cmp r0, #1
	bgt _08083702
	cmp r0, #0
	beq _0808376E
	b _08083780
_08083702:
	cmp r0, #2
	beq _0808373C
	cmp r0, #3
	beq _08083752
	b _08083780
_0808370C:
	cmp r0, #0x19
	ble _08083716
	cmp r0, #0x80
	beq _08083724
	b _08083780
_08083716:
	cmp r0, #0x18
	bge _08083728
	cmp r0, #0x14
	bgt _08083780
	cmp r0, #0x12
	blt _08083780
	b _0808376E
_08083724:
	adds r3, #2
	b _080836EA
_08083728:
	movs r5, #0x40
_0808372A:
	adds r3, #1
	b _080836EA
_0808372E:
	adds r7, #0x10
	ldr r0, [r4]
	cmp r0, r5
	bge _08083738
	str r5, [r4]
_08083738:
	movs r5, #0
	b _0808372A
_0808373C:
	adds r3, #1
	ldr r0, [r6]
	cmp r0, r7
	bge _08083746
	str r7, [r6]
_08083746:
	movs r7, #0
	ldr r0, [r4]
	cmp r0, r5
	bge _0808376A
	str r5, [r4]
	b _0808376A
_08083752:
	adds r3, #1
	ldr r0, [r6]
	cmp r0, r7
	bge _0808375C
	str r7, [r6]
_0808375C:
	movs r7, #0
	adds r1, r5, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _0808376A
	str r1, [r4]
_0808376A:
	movs r5, #0
	b _080836EA
_0808376E:
	ldr r0, [r4]
	cmp r0, r5
	bge _08083776
	str r5, [r4]
_08083776:
	ldr r0, [r6]
	cmp r0, r7
	bge _08083790
	str r7, [r6]
	b _08083790
_08083780:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextLen
	adds r3, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080836EA
_08083790:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DialogBoxGetGlyphLen
DialogBoxGetGlyphLen: @ 0x08083798
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetTextFontGlyphs
_080837AA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _080837CC
	cmp r0, #4
	bge _080837E2
	cmp r0, #1
	beq _080837E6
	cmp r0, #1
	bgt _080837C2
	cmp r0, #0
	beq _08083800
	b _080837F0
_080837C2:
	cmp r0, #2
	beq _080837E2
	cmp r0, #3
	beq _08083800
	b _080837F0
_080837CC:
	cmp r0, #0x19
	ble _080837D6
	cmp r0, #0x80
	beq _080837EC
	b _080837F0
_080837D6:
	cmp r0, #0x18
	bge _080837E6
	cmp r0, #0x14
	bgt _080837F0
	cmp r0, #0x12
	blt _080837F0
_080837E2:
	adds r4, #1
	b _080837AA
_080837E6:
	adds r4, #1
	movs r5, #0
	b _080837AA
_080837EC:
	adds r4, #2
	b _080837AA
_080837F0:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080837AA
_08083800:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

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

	thumb_func_start sub_080838FC
sub_080838FC: @ 0x080838FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov sb, r0
	str r1, [sp, #4]
	adds r4, r2, #0
	mov r8, r3
	cmp r4, #0x1f
	bgt _08083916
	movs r4, #0x20
_08083916:
	cmp r4, #0xc0
	ble _0808391C
	movs r4, #0xc0
_0808391C:
	mov r0, r8
	cmp r0, #0xf
	bgt _08083926
	movs r1, #0x10
	mov r8, r1
_08083926:
	mov r2, r8
	cmp r2, #0x50
	ble _08083930
	movs r3, #0x50
	mov r8, r3
_08083930:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808393E
	b _08083B90
_0808393E:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _08083948
	adds r0, #0xf
_08083948:
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	adds r0, r4, #7
	cmp r0, #0
	bge _08083954
	adds r0, #7
_08083954:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #8]
	movs r6, #0
	subs r0, #3
	ldr r2, [sp, #4]
	subs r2, #8
	str r2, [sp, #0x14]
	ldr r3, [sp, #4]
	add r3, r8
	str r3, [sp, #0x20]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x10]
	cmp r6, r0
	bge _080839BA
	str r0, [sp, #0x18]
_08083976:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #4
	cmp r5, #0
	blt _080839B2
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_08083984:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808398E
	mov r0, r8
_0808398E:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B64 @ =0x08B905F8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083984
_080839B2:
	adds r6, r4, #0
	ldr r0, [sp, #0x18]
	cmp r6, r0
	blt _08083976
_080839BA:
	ldr r1, [sp, #8]
	subs r1, #2
	str r1, [sp, #0x1c]
	cmp r6, r1
	bge _08083A08
_080839C4:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #2
	cmp r5, #0
	blt _08083A00
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_080839D2:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080839DC
	mov r0, r8
_080839DC:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B68 @ =0x08B905B8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080839D2
_08083A00:
	adds r6, r4, #0
	ldr r0, [sp, #0x1c]
	cmp r6, r0
	blt _080839C4
_08083A08:
	ldr r1, [sp, #8]
	cmp r6, r1
	bge _08083A52
_08083A0E:
	lsls r7, r6, #3
	ldr r5, [sp, #0xc]
	adds r4, r6, #1
	cmp r5, #0
	blt _08083A4A
	ldr r2, _08083B60 @ =0x0203E734
	mov sl, r2
_08083A1C:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083A26
	mov r0, r8
_08083A26:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r2, r3, r0
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r1, r6
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r3, sb
	adds r1, r3, r7
	ldr r3, _08083B6C @ =0x08B905D0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083A1C
_08083A4A:
	adds r6, r4, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _08083A0E
_08083A52:
	movs r6, #0
	ldr r1, [sp, #0x1c]
	cmp r6, r1
	bge _08083A8C
	ldr r5, _08083B60 @ =0x0203E734
	mov r4, sb
_08083A5E:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08083B70 @ =0x08B905E8
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08083B74 @ =0x08B905F0
	bl PutSprite
	adds r4, #0x10
	adds r6, #2
	ldr r2, [sp, #0x1c]
	cmp r6, r2
	blt _08083A5E
_08083A8C:
	ldr r3, [sp, #8]
	cmp r6, r3
	bge _08083AC8
	ldr r5, _08083B60 @ =0x0203E734
	lsls r0, r6, #3
	mov r1, sb
	adds r4, r0, r1
_08083A9A:
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _08083B78 @ =0x08B905B0
	bl PutSprite
	ldrh r0, [r5]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x20]
	ldr r3, _08083B7C @ =0x08B90630
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r2, [sp, #8]
	cmp r6, r2
	blt _08083A9A
_08083AC8:
	ldr r5, [sp, #0xc]
	lsls r6, r6, #3
	cmp r5, #0
	blt _08083B0E
	ldr r7, _08083B60 @ =0x0203E734
_08083AD2:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08083ADC
	mov r0, r8
_08083ADC:
	subs r0, #0x10
	ldr r3, [sp, #4]
	adds r4, r3, r0
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08083B6C @ =0x08B905D0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r6
	adds r2, r4, #0
	ldr r3, _08083B80 @ =0x08B90620
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _08083AD2
_08083B0E:
	ldr r3, _08083B78 @ =0x08B905B0
	ldr r4, _08083B84 @ =0x0203E6F4
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	mov r3, sb
	adds r5, r3, r6
	ldr r3, _08083B88 @ =0x08B90628
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08083B7C @ =0x08B90630
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x20]
	bl PutSprite
	ldr r3, _08083B8C @ =0x08B90638
	ldrh r0, [r4]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	ldr r2, [sp, #0x20]
	bl PutSprite
	b _08083BF2
	.align 2, 0
_08083B60: .4byte 0x0203E734
_08083B64: .4byte 0x08B905F8
_08083B68: .4byte 0x08B905B8
_08083B6C: .4byte 0x08B905D0
_08083B70: .4byte 0x08B905E8
_08083B74: .4byte 0x08B905F0
_08083B78: .4byte 0x08B905B0
_08083B7C: .4byte 0x08B90630
_08083B80: .4byte 0x08B90620
_08083B84: .4byte 0x0203E6F4
_08083B88: .4byte 0x08B90628
_08083B8C: .4byte 0x08B90638
_08083B90:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _08083B9A
	adds r0, #0x1f
_08083B9A:
	asrs r0, r0, #5
	str r0, [sp, #8]
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0xc]
	ldr r6, [sp, #8]
	subs r6, #1
	cmp r6, #0
	blt _08083BF2
_08083BB2:
	ldr r5, [sp, #0xc]
	subs r0, r6, #1
	mov r8, r0
	cmp r5, #0
	blt _08083BEC
	lsls r7, r6, #5
	ldr r1, _08083C04 @ =0x0203E734
	mov sl, r1
	lsls r0, r5, #4
	ldr r2, [sp, #4]
	adds r4, r0, r2
_08083BC8:
	lsls r0, r6, #2
	mov r3, sl
	ldrh r3, [r3]
	adds r0, r3, r0
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	mov r2, sb
	adds r1, r2, r7
	adds r2, r4, #0
	ldr r3, _08083C08 @ =0x08B905F8
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _08083BC8
_08083BEC:
	mov r6, r8
	cmp r6, #0
	bge _08083BB2
_08083BF2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083C04: .4byte 0x0203E734
_08083C08: .4byte 0x08B905F8

	thumb_func_start sub_08083C0C
sub_08083C0C: @ 0x08083C0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08083C40 @ =0x08CC2AAC
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r2, [r0, #0x30]
	subs r2, #8
	adds r1, r4, #0
	adds r1, #0x50
	strb r2, [r1]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, #1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl DialogBoxGetGlyphLen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083C40: .4byte 0x08CC2AAC

	thumb_func_start sub_08083C44
sub_08083C44: @ 0x08083C44
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08083C64
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
_08083C64:
	pop {r0}
	bx r0

	thumb_func_start sub_08083C68
sub_08083C68: @ 0x08083C68
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08083C86
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDispById
_08083C86:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08083C8C
sub_08083C8C: @ 0x08083C8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08083CE4 @ =0x0203E70C
	adds r0, r4, #0
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #8
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x10
	bl SpriteText_DrawBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083CD0
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08083CD0
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
_08083CD0:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083CE4: .4byte 0x0203E70C

	thumb_func_start sub_08083CE8
sub_08083CE8: @ 0x08083CE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _08083D1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08083D6A
	bl GetDialogueBoxConfig
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08083D6A
	movs r3, #0x80
	mov r8, r3
	b _08083D84
	.align 2, 0
_08083D1C: .4byte 0x08B857F8
_08083D20:
	bl sub_08083C44
	ldr r0, _08083D40 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08083D44 @ =0x08CC2B84
	bl Proc_EndEach
	b _08084028
	.align 2, 0
_08083D40: .4byte 0x08CC2A4C
_08083D44: .4byte 0x08CC2B84
_08083D48:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080842D6
_08083D5A:
	adds r0, r6, #0
	bl Proc_Break
	b _080842D6
_08083D62:
	adds r0, r6, #0
	bl sub_08083C8C
	b _080842D6
_08083D6A:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08083D7C
	b _080842DC
_08083D7C:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_08083D84:
	bl sub_08083C68
	ldr r0, [r6, #0x30]
	bl SetTextFont
	movs r7, #0
	cmp r7, r8
	blt _08083D96
	b _080842D6
_08083D96:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _08083DA2
	b _0808420C
_08083DA2:
	lsls r0, r1, #2
	ldr r1, _08083DAC @ =_08083DB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083DAC: .4byte _08083DB0
_08083DB0: @ jump table
	.4byte _080840D0 @ case 0
	.4byte _080840D6 @ case 1
	.4byte _0808414E @ case 2
	.4byte _080841C8 @ case 3
	.4byte _080840FE @ case 4
	.4byte _08084112 @ case 5
	.4byte _08084126 @ case 6
	.4byte _0808413A @ case 7
	.4byte _0808420C @ case 8
	.4byte _0808420C @ case 9
	.4byte _0808420C @ case 10
	.4byte _0808420C @ case 11
	.4byte _0808420C @ case 12
	.4byte _0808420C @ case 13
	.4byte _0808420C @ case 14
	.4byte _0808420C @ case 15
	.4byte _0808420C @ case 16
	.4byte _0808420C @ case 17
	.4byte _08084060 @ case 18
	.4byte _08084060 @ case 19
	.4byte _08084060 @ case 20
	.4byte _0808420C @ case 21
	.4byte _0808420C @ case 22
	.4byte _0808420C @ case 23
	.4byte _08083FB4 @ case 24
	.4byte _08083FF0 @ case 25
	.4byte _0808420C @ case 26
	.4byte _0808420C @ case 27
	.4byte _0808420C @ case 28
	.4byte _0808420C @ case 29
	.4byte _0808420C @ case 30
	.4byte _0808420C @ case 31
	.4byte _0808420C @ case 32
	.4byte _0808420C @ case 33
	.4byte _0808420C @ case 34
	.4byte _0808420C @ case 35
	.4byte _0808420C @ case 36
	.4byte _0808420C @ case 37
	.4byte _0808420C @ case 38
	.4byte _0808420C @ case 39
	.4byte _0808420C @ case 40
	.4byte _0808420C @ case 41
	.4byte _0808420C @ case 42
	.4byte _0808420C @ case 43
	.4byte _0808420C @ case 44
	.4byte _0808420C @ case 45
	.4byte _0808420C @ case 46
	.4byte _0808420C @ case 47
	.4byte _0808420C @ case 48
	.4byte _0808420C @ case 49
	.4byte _0808420C @ case 50
	.4byte _0808420C @ case 51
	.4byte _0808420C @ case 52
	.4byte _0808420C @ case 53
	.4byte _0808420C @ case 54
	.4byte _0808420C @ case 55
	.4byte _0808420C @ case 56
	.4byte _0808420C @ case 57
	.4byte _0808420C @ case 58
	.4byte _0808420C @ case 59
	.4byte _0808420C @ case 60
	.4byte _0808420C @ case 61
	.4byte _0808420C @ case 62
	.4byte _0808420C @ case 63
	.4byte _0808420C @ case 64
	.4byte _0808420C @ case 65
	.4byte _0808420C @ case 66
	.4byte _0808420C @ case 67
	.4byte _0808420C @ case 68
	.4byte _0808420C @ case 69
	.4byte _0808420C @ case 70
	.4byte _0808420C @ case 71
	.4byte _0808420C @ case 72
	.4byte _0808420C @ case 73
	.4byte _0808420C @ case 74
	.4byte _0808420C @ case 75
	.4byte _0808420C @ case 76
	.4byte _0808420C @ case 77
	.4byte _0808420C @ case 78
	.4byte _0808420C @ case 79
	.4byte _0808420C @ case 80
	.4byte _0808420C @ case 81
	.4byte _0808420C @ case 82
	.4byte _0808420C @ case 83
	.4byte _0808420C @ case 84
	.4byte _0808420C @ case 85
	.4byte _0808420C @ case 86
	.4byte _0808420C @ case 87
	.4byte _0808420C @ case 88
	.4byte _0808420C @ case 89
	.4byte _0808420C @ case 90
	.4byte _0808420C @ case 91
	.4byte _0808420C @ case 92
	.4byte _0808420C @ case 93
	.4byte _0808420C @ case 94
	.4byte _0808420C @ case 95
	.4byte _0808420C @ case 96
	.4byte _0808420C @ case 97
	.4byte _0808420C @ case 98
	.4byte _0808420C @ case 99
	.4byte _0808420C @ case 100
	.4byte _0808420C @ case 101
	.4byte _0808420C @ case 102
	.4byte _0808420C @ case 103
	.4byte _0808420C @ case 104
	.4byte _0808420C @ case 105
	.4byte _0808420C @ case 106
	.4byte _0808420C @ case 107
	.4byte _0808420C @ case 108
	.4byte _0808420C @ case 109
	.4byte _0808420C @ case 110
	.4byte _0808420C @ case 111
	.4byte _0808420C @ case 112
	.4byte _0808420C @ case 113
	.4byte _0808420C @ case 114
	.4byte _0808420C @ case 115
	.4byte _0808420C @ case 116
	.4byte _0808420C @ case 117
	.4byte _0808420C @ case 118
	.4byte _0808420C @ case 119
	.4byte _0808420C @ case 120
	.4byte _0808420C @ case 121
	.4byte _0808420C @ case 122
	.4byte _0808420C @ case 123
	.4byte _0808420C @ case 124
	.4byte _0808420C @ case 125
	.4byte _0808420C @ case 126
	.4byte _0808420C @ case 127
	.4byte _08084038 @ case 128
_08083FB4:
	bl sub_08083C44
	ldr r0, _08083FE8 @ =0x08CC2AAC
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _08083FEC @ =0x08CC2A44
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _08084020
	.align 2, 0
_08083FE8: .4byte 0x08CC2AAC
_08083FEC: .4byte 0x08CC2A44
_08083FF0:
	bl sub_08083C44
	ldr r0, _08084030 @ =0x08CC2AAC
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _08084034 @ =0x08CC2A44
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_08084020:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl StartYesNoChoice
_08084028:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _080842D6
	.align 2, 0
_08084030: .4byte 0x08CC2AAC
_08084034: .4byte 0x08CC2A44
_08084038:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _0808405A
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _080842CE
_0808405A:
	cmp r0, #4
	bne _08084060
	b _08083D20
_08084060:
	ldr r0, _080840CC @ =0x08CC2AAC
	bl Proc_Find
	adds r4, r0, #0
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808407C
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808407C:
	cmp r4, #0
	bne _08084082
	b _080842D6
_08084082:
	adds r0, r6, #0
	bl sub_08083C8C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl GetBoxDialogueSize
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _080842D6
	.align 2, 0
_080840CC: .4byte 0x08CC2AAC
_080840D0:
	bl sub_08083C44
	b _0808416A
_080840D6:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _080840F6
	b _08083D48
_080840F6:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _080842CE
_080840FE:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _080842D6
_08084112:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _080842D6
_08084126:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _080842D6
_0808413A:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _080842D6
_0808414E:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _08084162
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_08084162:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808419C
_0808416A:
	bl GetDialogueBoxConfig
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _08084178
	b _08083D5A
_08084178:
	ldr r0, _08084194 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08084198 @ =0x08CC2B84
	bl Proc_EndEach
	b _080842D6
	.align 2, 0
_08084194: .4byte 0x08CC2A4C
_08084198: .4byte 0x08CC2B84
_0808419C:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _080841AE
	b _08083D62
_080841AE:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _080841B8
	b _080842D6
_080841B8:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080842D6
_080841C8:
	bl sub_08083C44
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _08084208 @ =0x08CC2AAC
	bl Proc_Find
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r2, [r4]
	adds r1, r2, r1
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl StartTalkWaitForInput
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl DialogBoxGetGlyphLen
	b _080842D6
	.align 2, 0
_08084208: .4byte 0x08CC2AAC
_0808420C:
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08084232
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColor
	b _0808426E
_08084232:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _08084256
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColor
	b _0808426E
_08084256:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColor
_0808426E:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_DrawCharacter
	str r0, [r6, #0x2c]
	bl GetTextPrintDelay
	adds r4, r0, #0
	cmp r4, #1
	bne _08084294
	bl GetGameTime
	ands r0, r4
	cmp r0, #0
	beq _080842CE
_08084294:
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080842BC
	ldr r0, _080842B4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080842CE
	ldr r0, _080842B8 @ =0x000002E5
	bl m4aSongNumStart
	b _080842CE
	.align 2, 0
_080842B4: .4byte 0x0202BBF8
_080842B8: .4byte 0x000002E5
_080842BC:
	ldr r0, _080842E8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080842CE
	ldr r0, _080842EC @ =0x0000038E
	bl m4aSongNumStart
_080842CE:
	adds r7, #1
	cmp r7, r8
	bge _080842D6
	b _08083D96
_080842D6:
	movs r0, #0
	bl SetTextFont
_080842DC:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080842E8: .4byte 0x0202BBF8
_080842EC: .4byte 0x0000038E

	thumb_func_start sub_080842F0
sub_080842F0: @ 0x080842F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08084318 @ =0x08CC2B84
	bl Proc_Find
	cmp r0, #0
	beq _08084312
	ldr r0, _0808431C @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08084312:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084318: .4byte 0x08CC2B84
_0808431C: .4byte 0x08CC2A4C

	thumb_func_start sub_08084320
sub_08084320: @ 0x08084320
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl sub_080831B4
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _08084360
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _08084368 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	bl Proc_Break
_08084360:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084368: .4byte 0x0203E70C

	thumb_func_start sub_0808436C
sub_0808436C: @ 0x0808436C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08084382
	adds r0, r4, #0
	bl Proc_Break
	b _0808438A
_08084382:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0808438A:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0808439C
	subs r0, r2, #1
	strh r0, [r1]
_0808439C:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080843AC
sub_080843AC: @ 0x080843AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080843D4 @ =0x08CC2A4C
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080843D4: .4byte 0x08CC2A4C

	thumb_func_start sub_080843D8
sub_080843D8: @ 0x080843D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08084468 @ =0x08CC2AAC
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _08084430
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl SetBoxDialogueSize
_08084430:
	ldrb r5, [r5]
	cmp r5, #2
	bne _08084460
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _08084454
	movs r1, #5
_08084454:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08084460:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084468: .4byte 0x08CC2AAC

	thumb_func_start sub_0808446C
sub_0808446C: @ 0x0808446C
	push {lr}
	ldr r0, _08084484 @ =0x08CC2A4C
	bl Proc_Find
	cmp r0, #0
	beq _08084488
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084488
	movs r0, #0
	b _0808448A
	.align 2, 0
_08084484: .4byte 0x08CC2A4C
_08084488:
	movs r0, #1
_0808448A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08084490
sub_08084490: @ 0x08084490
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08084500 @ =0x0203E6F4
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #1
	bl SetTextFontGlyphs
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08084504
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColor
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084522
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08084522
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColor
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColor
	b _08084522
	.align 2, 0
_08084500: .4byte 0x0203E6F4
_08084504:
	movs r4, #0
	b _08084516
_08084508:
	lsls r0, r4, #3
	ldr r1, _080845A0 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColor
	adds r4, #1
_08084516:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08084508
_08084522:
	movs r0, #0
	bl SetTextFont
	ldr r4, _080845A4 @ =0x08CC2ACC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _080845A8 @ =0x0203E6F4
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl DecodeMsg
	bl MsgExpand
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_0808446C
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080845AC
	bl GetTextPrintDelay
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _08084598
	movs r1, #1
_08084598:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _080845BA
	.align 2, 0
_080845A0: .4byte 0x0203E70C
_080845A4: .4byte 0x08CC2ACC
_080845A8: .4byte 0x0203E6F4
_080845AC:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_080845BA:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080845C8
sub_080845C8: @ 0x080845C8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080845FC @ =0x08CC2B6C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _080845E2
	adds r5, #7
_080845E2:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _080845EE
	adds r0, #0xf
_080845EE:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _08084600
	cmp r0, #0
	bge _08084602
	movs r0, #0
	b _08084602
	.align 2, 0
_080845FC: .4byte 0x08CC2B6C
_08084600:
	movs r0, #5
_08084602:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0808460C
sub_0808460C: @ 0x0808460C
	push {r4, lr}
	ldr r4, _08084664 @ =0x0203E6F4
	adds r0, r4, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08084668
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x28
	bl SpriteText_DrawBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084686
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08084686
	adds r0, r4, #0
	adds r0, #0x30
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x38
	bl SpriteText_DrawBackground
	b _08084686
	.align 2, 0
_08084664: .4byte 0x0203E6F4
_08084668:
	movs r4, #0
	b _0808467A
_0808466C:
	lsls r0, r4, #3
	ldr r1, _080846A0 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
_0808467A:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808466C
_08084686:
	ldr r0, _080846A4 @ =0x08CC2ACC
	bl Proc_EndEach
	ldr r0, _080846A8 @ =0x08CC2B6C
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080846A0: .4byte 0x0203E70C
_080846A4: .4byte 0x08CC2ACC
_080846A8: .4byte 0x08CC2B6C

	thumb_func_start StartNoBoxTalk
StartNoBoxTalk: @ 0x080846AC
	push {lr}
	ldr r0, _080846BC @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080846BC: .4byte 0x08CC2B84

	thumb_func_start sub_080846C0
sub_080846C0: @ 0x080846C0
	push {lr}
	ldr r0, _080846D0 @ =0x08CC2B84
	bl Proc_Find
	cmp r0, #0
	bne _080846D4
	movs r0, #0
	b _080846D6
	.align 2, 0
_080846D0: .4byte 0x08CC2B84
_080846D4:
	movs r0, #1
_080846D6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080846DC
sub_080846DC: @ 0x080846DC
	push {lr}
	ldr r0, _08084700 @ =0x08CC2A4C
	bl Proc_EndEach
	ldr r0, _08084704 @ =0x08CC2B84
	bl Proc_EndEach
	ldr r0, _08084708 @ =0x08CC2AAC
	bl Proc_EndEach
	ldr r0, _0808470C @ =0x08CC2ACC
	bl Proc_EndEach
	ldr r0, _08084710 @ =0x08CC2B6C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08084700: .4byte 0x08CC2A4C
_08084704: .4byte 0x08CC2B84
_08084708: .4byte 0x08CC2AAC
_0808470C: .4byte 0x08CC2ACC
_08084710: .4byte 0x08CC2B6C

	thumb_func_start GetWindowQuadrant
GetWindowQuadrant: @ 0x08084714
	cmp r0, #0
	bge _08084724
	cmp r1, #0
	bge _08084720
	movs r0, #0
	b _0808472E
_08084720:
	movs r0, #1
	b _0808472E
_08084724:
	cmp r1, #0
	blt _0808472C
	movs r0, #3
	b _0808472E
_0808472C:
	movs r0, #2
_0808472E:
	bx lr

	thumb_func_start GetCursorQuadrant
GetCursorQuadrant: @ 0x08084730
	push {r4, lr}
	ldr r2, _0808475C @ =0x0202BBB8
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x68
	bgt _08084760
	cmp r1, #0x50
	bgt _08084768
	movs r0, #0
	b _0808476E
	.align 2, 0
_0808475C: .4byte 0x0202BBB8
_08084760:
	cmp r1, #0x50
	bgt _0808476C
	movs r0, #1
	b _0808476E
_08084768:
	movs r0, #2
	b _0808476E
_0808476C:
	movs r0, #3
_0808476E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PutMapUiHpBarLeft
PutMapUiHpBarLeft: @ 0x08084774
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _08084782
	movs r0, #5
_08084782:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	bx lr

	thumb_func_start PutMapUiHpBarMid
PutMapUiHpBarMid: @ 0x0808478C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_080847A6:
	cmp r1, r4
	bge _080847AE
	strh r5, [r3]
	b _080847B8
_080847AE:
	cmp r1, r4
	bne _080847B6
	strh r0, [r3]
	b _080847B8
_080847B6:
	strh r2, [r3]
_080847B8:
	adds r3, #2
	adds r1, #1
	cmp r1, #3
	ble _080847A6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutMapUiHpBarRight
PutMapUiHpBarRight: @ 0x080847C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080847D8
	movs r3, #5
_080847D8:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _080847E0
	movs r3, #0
_080847E0:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PutMapUiHpBar
PutMapUiHpBar: @ 0x080847F4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x2a
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl PutMapUiHpBarLeft
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl PutMapUiHpBarMid
	adds r5, #0xa
	subs r4, #0x25
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl PutMapUiHpBarRight
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08084858
sub_08084858: @ 0x08084858
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _080848A4 @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _0808487A
	movs r4, #0xe
_0808487A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080848B0
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _080848A8 @ =0x02022C60
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080848AC @ =0x02023460
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _080848D0
	.align 2, 0
_080848A4: .4byte 0x08CC2B94
_080848A8: .4byte 0x02022C60
_080848AC: .4byte 0x02023460
_080848B0:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084928 @ =0x02022C84
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _0808492C @ =0x02023484
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_080848D0:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084930 @ =0x08CC2BF0
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084934 @ =0x08CC2B94
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084948
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084938 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _0808493C @ =0x02022C60
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084940 @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084944 @ =0x02023460
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _0808496E
	.align 2, 0
_08084928: .4byte 0x02022C84
_0808492C: .4byte 0x02023484
_08084930: .4byte 0x08CC2BF0
_08084934: .4byte 0x08CC2B94
_08084938: .4byte 0x0200323C
_0808493C: .4byte 0x02022C60
_08084940: .4byte 0x0200373C
_08084944: .4byte 0x02023460
_08084948:
	ldr r0, _080849B8 @ =0x0200323C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _080849BC @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _080849C0 @ =0x0200373C
	ldr r1, _080849C4 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_0808496E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _080849AC
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _080849C8 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _080849CC @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl UnitMapUiUpdate
_080849AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080849B8: .4byte 0x0200323C
_080849BC: .4byte 0x02022C60
_080849C0: .4byte 0x0200373C
_080849C4: .4byte 0x02023460
_080849C8: .4byte 0x0202BBB8
_080849CC: .4byte 0x0202E3DC

	thumb_func_start sub_080849D0
sub_080849D0: @ 0x080849D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _08084A30 @ =0x08CC2B94
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _080849F4
	movs r4, #0xe
_080849F4:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084A3C
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084A34 @ =0x02022C60
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084A38 @ =0x02023460
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	b _08084A5C
	.align 2, 0
_08084A30: .4byte 0x08CC2B94
_08084A34: .4byte 0x02022C60
_08084A38: .4byte 0x02023460
_08084A3C:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _08084AB4 @ =0x02022C84
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084AB8 @ =0x02023484
	adds r0, r4, r0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
_08084A5C:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084ABC @ =0x08CC2BF4
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084AC0 @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084AD4
	movs r4, #0xc
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084AC4 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084AC8 @ =0x02022C60
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084ACC @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084AD0 @ =0x02023460
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	b _08084AFA
	.align 2, 0
_08084AB4: .4byte 0x02022C84
_08084AB8: .4byte 0x02023484
_08084ABC: .4byte 0x08CC2BF4
_08084AC0: .4byte 0x08CC2B94
_08084AC4: .4byte 0x0200323C
_08084AC8: .4byte 0x02022C60
_08084ACC: .4byte 0x0200373C
_08084AD0: .4byte 0x02023460
_08084AD4:
	ldr r0, _08084B24 @ =0x0200323C
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084B28 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
	ldr r0, _08084B2C @ =0x0200373C
	ldr r1, _08084B30 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TmCopyRect_thm
_08084AFA:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084B1A
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084B1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B24: .4byte 0x0200323C
_08084B28: .4byte 0x02022C60
_08084B2C: .4byte 0x0200373C
_08084B30: .4byte 0x02023460

	thumb_func_start sub_08084B34
sub_08084B34: @ 0x08084B34
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08084B6C @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084B78
	ldr r0, _08084B70 @ =0x02022FA0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084B74 @ =0x020237A0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _08084B90
	.align 2, 0
_08084B6C: .4byte 0x08CC2B94
_08084B70: .4byte 0x02022FA0
_08084B74: .4byte 0x020237A0
_08084B78:
	ldr r0, _08084BE4 @ =0x02022FD0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084BE8 @ =0x020237D0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_08084B90:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084BEC @ =0x08CC2BF7
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084BF0 @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084C04
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084BF4 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084BF8 @ =0x02022FA0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084BFC @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084C00 @ =0x020237A0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08084C2A
	.align 2, 0
_08084BE4: .4byte 0x02022FD0
_08084BE8: .4byte 0x020237D0
_08084BEC: .4byte 0x08CC2BF7
_08084BF0: .4byte 0x08CC2B94
_08084BF4: .4byte 0x0200323C
_08084BF8: .4byte 0x02022FA0
_08084BFC: .4byte 0x0200373C
_08084C00: .4byte 0x020237A0
_08084C04:
	ldr r0, _08084C4C @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084C50 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084C54 @ =0x020039BC
	ldr r1, _08084C58 @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08084C2A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084C44
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084C44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C4C: .4byte 0x020034BC
_08084C50: .4byte 0x02022C60
_08084C54: .4byte 0x020039BC
_08084C58: .4byte 0x02023460

	thumb_func_start sub_08084C5C
sub_08084C5C: @ 0x08084C5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08084C9C @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084CA8
	ldr r0, _08084CA0 @ =0x02022FA0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084CA4 @ =0x020237A0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	b _08084CC0
	.align 2, 0
_08084C9C: .4byte 0x08CC2B94
_08084CA0: .4byte 0x02022FA0
_08084CA4: .4byte 0x020237A0
_08084CA8:
	ldr r0, _08084D14 @ =0x02022FD0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08084D18 @ =0x020237D0
	movs r1, #6
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
_08084CC0:
	movs r0, #3
	bl EnableBgSync
	ldr r1, _08084D1C @ =0x08CC2BFA
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _08084D20 @ =0x08CC2B94
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08084D34
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _08084D24 @ =0x0200323C
	adds r0, r4, r0
	ldr r1, _08084D28 @ =0x02022FA0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084D2C @ =0x0200373C
	adds r4, r4, r0
	ldr r1, _08084D30 @ =0x020237A0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	b _08084D5A
	.align 2, 0
_08084D14: .4byte 0x02022FD0
_08084D18: .4byte 0x020237D0
_08084D1C: .4byte 0x08CC2BFA
_08084D20: .4byte 0x08CC2B94
_08084D24: .4byte 0x0200323C
_08084D28: .4byte 0x02022FA0
_08084D2C: .4byte 0x0200373C
_08084D30: .4byte 0x020237A0
_08084D34:
	ldr r0, _08084D80 @ =0x020034BC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08084D84 @ =0x02022C60
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
	ldr r0, _08084D88 @ =0x020039BC
	ldr r1, _08084D8C @ =0x02023460
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TmCopyRect_thm
_08084D5A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _08084D78
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08084D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084D80: .4byte 0x020034BC
_08084D84: .4byte 0x02022C60
_08084D88: .4byte 0x020039BC
_08084D8C: .4byte 0x02023460

	thumb_func_start sub_08084D90
sub_08084D90: @ 0x08084D90
	push {lr}
	ldr r1, _08084DD8 @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _08084DAC
	movs r2, #0
_08084DAC:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _08084DB8
	movs r1, #0
_08084DB8:
	ldr r0, _08084DDC @ =0x0200323C
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _08084DE0 @ =0x02022C60
	adds r1, r1, r2
	movs r2, #0xc
	movs r3, #6
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08084DD8: .4byte 0x08CC2B94
_08084DDC: .4byte 0x0200323C
_08084DE0: .4byte 0x02022C60

	thumb_func_start sub_08084DE4
sub_08084DE4: @ 0x08084DE4
	push {lr}
	ldr r1, _08084E1C @ =0x08CC2B94
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	cmp r0, #0
	bge _08084E02
	movs r1, #0
_08084E02:
	ldr r0, _08084E20 @ =0x020034BC
	lsls r1, r1, #1
	ldr r2, _08084E24 @ =0x02022FA0
	adds r1, r1, r2
	movs r2, #6
	movs r3, #7
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08084E1C: .4byte 0x08CC2B94
_08084E20: .4byte 0x020034BC
_08084E24: .4byte 0x02022FA0

	thumb_func_start ApplyUnitMapUiFramePal
ApplyUnitMapUiFramePal: @ 0x08084E28
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _08084E54
	cmp r0, #0x40
	bgt _08084E3C
	cmp r0, #0
	beq _08084E42
	b _08084E5C
_08084E3C:
	cmp r0, #0x80
	beq _08084E4C
	b _08084E5C
_08084E42:
	ldr r4, _08084E48 @ =0x0840453C
	b _08084E60
	.align 2, 0
_08084E48: .4byte 0x0840453C
_08084E4C:
	ldr r4, _08084E50 @ =0x0840455C
	b _08084E60
	.align 2, 0
_08084E50: .4byte 0x0840455C
_08084E54:
	ldr r4, _08084E58 @ =0x0840457C
	b _08084E60
	.align 2, 0
_08084E58: .4byte 0x0840457C
_08084E5C:
	bl nullsub_7
_08084E60:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08084E70
sub_08084E70: @ 0x08084E70
	ldr r0, _08084E88 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _08084E8C
	movs r0, #1
	rsbs r0, r0, #0
	b _08084E8E
	.align 2, 0
_08084E88: .4byte 0x0202BBB8
_08084E8C:
	movs r0, #1
_08084E8E:
	bx lr

	thumb_func_start sub_08084E90
sub_08084E90: @ 0x08084E90
	ldr r0, _08084EA8 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _08084EAC
	movs r0, #1
	b _08084EB0
	.align 2, 0
_08084EA8: .4byte 0x0202BBB8
_08084EAC:
	movs r0, #1
	rsbs r0, r0, #0
_08084EB0:
	bx lr
	.align 2, 0

	thumb_func_start sub_08084EB4
sub_08084EB4: @ 0x08084EB4
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r3, _08084ED8 @ =0x00000121
	adds r1, r3, #0
	strh r1, [r0, #2]
	movs r2, #0
	strh r2, [r0, #4]
	adds r3, #0x1d
	adds r1, r3, #0
	strh r1, [r0, #6]
	adds r3, #1
	adds r1, r3, #0
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.align 2, 0
_08084ED8: .4byte 0x00000121

	thumb_func_start sub_08084EDC
sub_08084EDC: @ 0x08084EDC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r1, #0
	beq _08084FA4
	adds r1, #0x30
	ldrb r2, [r1]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #8
	bhi _08084F3A
	lsls r0, r0, #2
	ldr r1, _08084F00 @ =_08084F04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084F00: .4byte _08084F04
_08084F04: @ jump table
	.4byte _08084FA4 @ case 0
	.4byte _08084F2C @ case 1
	.4byte _08084F28 @ case 2
	.4byte _08084F34 @ case 3
	.4byte _08084F30 @ case 4
	.4byte _08084F38 @ case 5
	.4byte _08084F38 @ case 6
	.4byte _08084F38 @ case 7
	.4byte _08084F38 @ case 8
_08084F28:
	adds r4, #0x60
	b _08084F3A
_08084F2C:
	adds r4, #0x64
	b _08084F3A
_08084F30:
	adds r4, #0x68
	b _08084F3A
_08084F34:
	adds r4, #0x6c
	b _08084F3A
_08084F38:
	adds r4, #0x70
_08084F3A:
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _08084F60
	cmp r0, #6
	bgt _08084F4E
	cmp r0, #5
	beq _08084F58
	b _08084F86
_08084F4E:
	cmp r0, #7
	beq _08084F68
	cmp r0, #8
	beq _08084F7C
	b _08084F86
_08084F58:
	ldr r0, _08084F5C @ =0x0840433C
	b _08084F6A
	.align 2, 0
_08084F5C: .4byte 0x0840433C
_08084F60:
	ldr r0, _08084F64 @ =0x084043BC
	b _08084F6A
	.align 2, 0
_08084F64: .4byte 0x084043BC
_08084F68:
	ldr r0, _08084F74 @ =0x0840443C
_08084F6A:
	ldr r1, _08084F78 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
	b _08084F86
	.align 2, 0
_08084F74: .4byte 0x0840443C
_08084F78: .4byte 0x06002E00
_08084F7C:
	ldr r0, _08084FAC @ =0x084044BC
	ldr r1, _08084FB0 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
_08084F86:
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	movs r0, #0
	strh r0, [r5, #8]
	ldrb r6, [r6]
	lsrs r0, r6, #4
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r5, #0xa]
_08084FA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084FAC: .4byte 0x084044BC
_08084FB0: .4byte 0x06002E00

	thumb_func_start UnitMapUiUpdate
UnitMapUiUpdate: @ 0x08084FB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08085058
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084FE2
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_08084EDC
	movs r0, #1
	bl EnableBgSync
	b _08085058
_08084FE2:
	ldr r0, [r6, #0x40]
	adds r1, r4, #0
	bl sub_08084EB4
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _08085002
	movs r0, #0xff
	bl sub_08005080
	b _0808500C
_08085002:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	bl sub_08005080
_0808500C:
	ldr r1, _08085034 @ =0x02028D44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r4, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _08085038
	movs r0, #0xff
	bl sub_08005080
	b _08085042
	.align 2, 0
_08085034: .4byte 0x02028D44
_08085038:
	adds r0, r4, #0
	bl GetUnitMaxHp
	bl sub_08005080
_08085042:
	ldr r1, _08085104 @ =0x02028D44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r6, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r1, [r1, #7]
	subs r1, #0x30
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
_08085058:
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080850F8
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08085082
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080850F8
_08085082:
	adds r0, r6, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #3
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #3
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r4, [r0]
	cmp r4, #0xf0
	beq _080850B4
	ldr r2, _08085108 @ =0x08B905B0
	adds r0, r4, #0
	ldr r4, _0808510C @ =0x000082E0
	adds r3, r0, r4
	adds r0, r1, #0
	adds r1, r5, #0
	bl PutOamHiRam
_080850B4:
	adds r0, r7, #0
	adds r0, #0x17
	ldr r1, _08085108 @ =0x08B905B0
	mov r8, r1
	adds r1, r6, #0
	adds r1, #0x52
	ldr r4, _0808510C @ =0x000082E0
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x22
	adds r1, r6, #0
	adds r1, #0x53
	ldrb r1, [r1]
	adds r3, r1, r4
	adds r1, r5, #0
	mov r2, r8
	bl PutOamHiRam
	adds r0, r7, #0
	adds r0, #0x29
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	adds r4, r1, r4
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutOamHiRam
_080850F8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085104: .4byte 0x02028D44
_08085108: .4byte 0x08B905B0
_0808510C: .4byte 0x000082E0

	thumb_func_start DrawUnitMapUi
DrawUnitMapUi: @ 0x08085110
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _080851C8 @ =0x0200323C
	mov sb, r1
	ldr r2, _080851CC @ =0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r6, r0, #0
	movs r0, #0x30
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawString
	mov r1, sb
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08085186
	adds r2, #1
_08085186:
	mov r1, sb
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl PutFaceChibi
	mov r0, sb
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _080851D0 @ =0x08CC2B94
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080851D4
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _080851DA
	.align 2, 0
_080851C8: .4byte 0x0200323C
_080851CC: .4byte 0x01000060
_080851D0: .4byte 0x08CC2B94
_080851D4:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_080851DA:
	strh r0, [r2]
	ldr r0, _080851F8 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080851FC
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _08085202
	.align 2, 0
_080851F8: .4byte 0x08CC2B94
_080851FC:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_08085202:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl UnitMapUiUpdate
	ldr r0, _08085244 @ =0x02003346
	movs r2, #0xc5
	lsls r2, r2, #6
	mov r1, r8
	bl PutMapUiHpBar
	ldr r0, _08085248 @ =0x0200373C
	ldr r1, _0808524C @ =0x084045F4
	movs r2, #0xc4
	lsls r2, r2, #6
	bl TmApplyTsa_thm
	movs r0, #0xc0
	mov r2, r8
	ldrb r2, [r2, #0xb]
	ands r0, r2
	movs r1, #3
	bl ApplyUnitMapUiFramePal
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085244: .4byte 0x02003346
_08085248: .4byte 0x0200373C
_0808524C: .4byte 0x084045F4

	thumb_func_start GetUnitBurstMapUiOrientationAt
GetUnitBurstMapUiOrientationAt: @ 0x08085250
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCursorQuadrant
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _08085274
	cmp r4, #0xb
	bgt _08085276
	ldr r0, _0808528C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08085276
_08085274:
	movs r2, #4
_08085276:
	cmp r5, #1
	bgt _0808527C
	subs r2, #1
_0808527C:
	cmp r5, #0x16
	ble _08085282
	adds r2, #1
_08085282:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808528C: .4byte 0x08CC2B94

	thumb_func_start DrawUnitBurstMapUi
DrawUnitBurstMapUi: @ 0x08085290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _080853D8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _080852B4
	adds r0, #7
_080852B4:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _080852CC
	adds r0, #7
_080852CC:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl GetUnitBurstMapUiOrientationAt
	mov r8, r0
	ldr r0, _080853DC @ =0x08CC2BCC
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _080853E0 @ =0x08CC2BD2
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl DecodeMsg
	mov sb, r0
	movs r0, #0x30
	mov r1, sb
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParams
	adds r0, r5, #0
	mov r1, sb
	bl Text_DrawString
	ldr r0, _080853E4 @ =0x08CC2BBA
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _080853E8 @ =0x08CC2BB4
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _080853EC @ =0x02022C60
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl UnitMapUiUpdate
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _080853F0 @ =0x02023460
	adds r4, r4, r0
	ldr r0, _080853F4 @ =0x08CC2BD8
	mov r1, r8
	lsls r1, r1, #2
	mov r8, r1
	add r8, r0
	mov r2, r8
	ldr r1, [r2]
	movs r2, #0xc4
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xc0
	ldr r3, [sp]
	ldrb r3, [r3, #0xb]
	ands r0, r3
	movs r1, #3
	bl ApplyUnitMapUiFramePal
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080853D8: .4byte 0x0202BBB8
_080853DC: .4byte 0x08CC2BCC
_080853E0: .4byte 0x08CC2BD2
_080853E4: .4byte 0x08CC2BBA
_080853E8: .4byte 0x08CC2BB4
_080853EC: .4byte 0x02022C60
_080853F0: .4byte 0x02023460
_080853F4: .4byte 0x08CC2BD8

	thumb_func_start ClearUnitBurstMapUi
ClearUnitBurstMapUi: @ 0x080853F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #3
	ldrh r1, [r2, #0x3e]
	cmp r1, r0
	bne _0808546A
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085470 @ =0x02022C60
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r1, #1
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	subs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08085474 @ =0x02023460
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r1, #1
	movs r2, #0
	ldrsb r2, [r4, r2]
	subs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_0808546A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085470: .4byte 0x02022C60
_08085474: .4byte 0x02023460

	thumb_func_start DrawTerrainDisplayWindow
DrawTerrainDisplayWindow: @ 0x08085478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r0, _08085564 @ =0x0202BBB8
	mov sb, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _08085568 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, _0808556C @ =0x020034BC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08085570 @ =0x020039BC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r7, #0
	bl GetTerrainName
	adds r5, r0, #0
	movs r0, #0x20
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParams
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_DrawString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _08085574 @ =0x08404880
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	adds r0, r6, #0
	bl TmApplyTsa_thm
	ldr r0, _08085578 @ =0x08BE398C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08085554
	ldr r0, _0808557C @ =0x08BE453A
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08005044
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _08085580 @ =0x02028D4B
	movs r5, #0x94
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
	ldr r0, _08085584 @ =0x08BE44F9
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08005044
	movs r0, #0xa4
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
_08085554:
	cmp r7, #0x29
	bgt _08085588
	cmp r7, #0x27
	bge _080855EC
	cmp r7, #0x1b
	beq _0808558C
	b _0808561A
	.align 2, 0
_08085564: .4byte 0x0202BBB8
_08085568: .4byte 0x0202E3E0
_0808556C: .4byte 0x020034BC
_08085570: .4byte 0x020039BC
_08085574: .4byte 0x08404880
_08085578: .4byte 0x08BE398C
_0808557C: .4byte 0x08BE453A
_08085580: .4byte 0x02028D4B
_08085584: .4byte 0x08BE44F9
_08085588:
	cmp r7, #0x33
	bne _0808561A
_0808558C:
	ldr r4, _080855C0 @ =0x020035BE
	ldr r1, _080855C4 @ =0x08404894
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl TmApplyTsa_thm
	ldr r1, _080855C8 @ =0x0202BBB8
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_0802BCBC
	adds r6, r0, #0
	cmp r6, #0x64
	bne _080855D0
	adds r0, r4, #0
	adds r0, #0x44
	ldr r1, _080855CC @ =0x084048A0
	movs r2, #0x80
	lsls r2, r2, #1
	bl TmApplyTsa_thm
	b _0808561A
	.align 2, 0
_080855C0: .4byte 0x020035BE
_080855C4: .4byte 0x08404894
_080855C8: .4byte 0x0202BBB8
_080855CC: .4byte 0x084048A0
_080855D0:
	adds r0, r6, #0
	bl sub_08005044
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _080855E8 @ =0x02028D4B
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
	b _0808561A
	.align 2, 0
_080855E8: .4byte 0x02028D4B
_080855EC:
	ldr r1, _08085634 @ =0x0840488C
	adds r0, r6, #0
	mov r2, sl
	bl TmApplyTsa_thm
	mov r3, sb
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	movs r2, #0x16
	ldrsh r1, [r3, r2]
	bl sub_0802BCBC
	bl sub_08005044
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _08085638 @ =0x02028D4B
	movs r2, #0x94
	lsls r2, r2, #1
	movs r3, #2
	bl PutDigits
_0808561A:
	ldr r0, _0808563C @ =0x020039BC
	ldr r1, _08085640 @ =0x0840459C
	movs r2, #0x88
	lsls r2, r2, #5
	bl TmApplyTsa_thm
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085634: .4byte 0x0840488C
_08085638: .4byte 0x02028D4B
_0808563C: .4byte 0x020039BC
_08085640: .4byte 0x0840459C

	thumb_func_start sub_08085644
sub_08085644: @ 0x08085644
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #4
	bl InitTextDb
	pop {r0}
	bx r0

	thumb_func_start TerrainDisplay_Loop_OnSideChange
TerrainDisplay_Loop_OnSideChange: @ 0x0808566C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085700 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r6, r0, #0
	ldr r0, _08085704 @ =0x08CC2C60
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080856BA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080856BA
	cmp r0, r6
	beq _080856F8
_080856BA:
	ldr r0, _08085708 @ =0x08CC2D38
	bl Proc_Find
	cmp r4, #0
	beq _080856D4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080856D4
	cmp r0, r6
	beq _080856F8
_080856D4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl DrawTerrainDisplayWindow
	ldr r0, _0808570C @ =0x0202BBB8
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080856F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085700: .4byte 0x08CC2B94
_08085704: .4byte 0x08CC2C60
_08085708: .4byte 0x08CC2D38
_0808570C: .4byte 0x0202BBB8

	thumb_func_start sub_08085710
sub_08085710: @ 0x08085710
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _08085790 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08085794 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080857AE
	ldr r0, _08085798 @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _080857A0
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08085780
	ldr r0, _0808579C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3]
	ldrb r0, [r1]
	cmp r2, r0
	bne _080857A0
	ldrb r3, [r3, #1]
	ldrb r1, [r1, #1]
	cmp r3, r1
	bne _080857A0
_08085780:
	adds r0, r4, #0
	bl DrawTerrainDisplayWindow
	adds r0, r4, #0
	bl sub_08084DE4
	b _080857AE
	.align 2, 0
_08085790: .4byte 0x0202BBB8
_08085794: .4byte 0x0000FFFF
_08085798: .4byte 0x08B92E38
_0808579C: .4byte 0x08CC2B94
_080857A0:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080857AE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080857B4
sub_080857B4: @ 0x080857B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #6
	bl InitTextDb
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MMB_Loop_OnSideChange
MMB_Loop_OnSideChange: @ 0x080857DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _08085878 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808587C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08085870
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085880 @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r5, r0, #0
	ldr r0, _08085884 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _0808584A
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808584A
	cmp r0, r5
	beq _08085870
_0808584A:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _08085878 @ =0x0202BBB8
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl DrawUnitMapUi
	adds r0, r4, #0
	bl Proc_Break
_08085870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085878: .4byte 0x0202BBB8
_0808587C: .4byte 0x0202E3DC
_08085880: .4byte 0x08CC2B94
_08085884: .4byte 0x08CC2C00

	thumb_func_start sub_08085888
sub_08085888: @ 0x08085888
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08085940 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08085944 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl UnitMapUiUpdate
	movs r0, #0x3f
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _080858CC
	adds r0, r5, #0
	bl sub_08084D90
_080858CC:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x4c
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldr r0, _08085948 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _08085962
	cmp r7, #0
	beq _08085954
	ldr r0, _0808594C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _08085954
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _08085936
	ldr r0, _08085950 @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r0, [r3, #2]
	ldrb r2, [r1, #2]
	cmp r0, r2
	bne _08085954
	ldrb r3, [r3, #3]
	ldrb r1, [r1, #3]
	cmp r3, r1
	bne _08085954
_08085936:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08085962
	.align 2, 0
_08085940: .4byte 0x0202BBB8
_08085944: .4byte 0x0202E3DC
_08085948: .4byte 0x0000FFFF
_0808594C: .4byte 0x08B92E38
_08085950: .4byte 0x08CC2B94
_08085954:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08085962:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MMB_CheckForUnit
MMB_CheckForUnit: @ 0x08085968
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08085998 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808599C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _080859A0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080859AC
	.align 2, 0
_08085998: .4byte 0x0202BBB8
_0808599C: .4byte 0x0202E3DC
_080859A0:
	adds r0, r4, #0
	bl DrawUnitMapUi
	adds r0, r4, #0
	bl sub_08084D90
_080859AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080859B4
sub_080859B4: @ 0x080859B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #6
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start BurstDisplay_Loop_Display
BurstDisplay_Loop_Display: @ 0x080859E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _08085A24 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08085A28 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _08085A2C
	cmp r1, #0
	beq _08085A2C
	adds r0, r4, #0
	bl ClearUnitBurstMapUi
	movs r0, #0
	str r0, [r4, #0x58]
	b _08085AD4
	.align 2, 0
_08085A24: .4byte 0x0202BBB8
_08085A28: .4byte 0x0202E3DC
_08085A2C:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _08085AD4
	ldr r0, _08085A7C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _08085AD4
	ldr r0, _08085A80 @ =0x08CC2C00
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _08085A5A
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08085A70
_08085A5A:
	ldr r0, _08085A84 @ =0x08CC2D38
	bl Proc_Find
	cmp r0, #0
	beq _08085A88
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08085A88
_08085A70:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _08085AD4
	adds r0, #1
	str r0, [r4, #0x58]
	b _08085AD4
	.align 2, 0
_08085A7C: .4byte 0x08B92E38
_08085A80: .4byte 0x08CC2C00
_08085A84: .4byte 0x08CC2D38
_08085A88:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _08085AD4
	cmp r0, #8
	bne _08085AA6
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl DrawUnitBurstMapUi
	b _08085AD4
_08085AA6:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _08085ABE
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _08085AC4
_08085ABE:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_08085AC4:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitMapUiUpdate
_08085AD4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08085ADC
sub_08085ADC: @ 0x08085ADC
	push {r4, r5, lr}
	ldr r5, _08085BDC @ =0x03002870
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r2, r5, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xf
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _08085BE0 @ =0x0000FFE0
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldrb r0, [r2]
	ands r4, r0
	strb r4, [r2]
	ldr r0, _08085BE4 @ =0x0000E0FF
	ldrh r1, [r5, #0x3c]
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #0x3c]
	ldr r0, _08085BE8 @ =0x08403BC4
	ldr r1, _08085BEC @ =0x06002000
	bl Decompress
	ldr r0, _08085BF0 @ =0x06002500
	ldr r1, _08085BF4 @ =0x06015C00
	movs r2, #0x50
	bl CpuFastSet
	ldr r0, _08085BF8 @ =0x06002EA0
	ldr r1, _08085BFC @ =0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08085C00 @ =0x02022860
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #1
	movs r1, #2
	bl ApplyIconPalette
	bl ResetTextFont
	ldr r4, _08085C04 @ =0x0202BBF8
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08085BC6
	ldr r0, _08085C08 @ =0x08CC2C00
	movs r1, #3
	bl Proc_Start
_08085BC6:
	ldr r1, _08085C0C @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08085C14
	ldr r0, _08085C10 @ =0x08CC2D98
	movs r1, #3
	bl Proc_Start
	b _08085C28
	.align 2, 0
_08085BDC: .4byte 0x03002870
_08085BE0: .4byte 0x0000FFE0
_08085BE4: .4byte 0x0000E0FF
_08085BE8: .4byte 0x08403BC4
_08085BEC: .4byte 0x06002000
_08085BF0: .4byte 0x06002500
_08085BF4: .4byte 0x06015C00
_08085BF8: .4byte 0x06002EA0
_08085BFC: .4byte 0x06015D40
_08085C00: .4byte 0x02022860
_08085C04: .4byte 0x0202BBF8
_08085C08: .4byte 0x08CC2C00
_08085C0C: .4byte 0x0202BBB8
_08085C10: .4byte 0x08CC2D98
_08085C14:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08085C28
	ldr r0, _08085C58 @ =0x08CC2D38
	movs r1, #3
	bl Proc_Start
_08085C28:
	ldr r0, _08085C5C @ =0x0202BBF8
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r1, [r4]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _08085C40
	ldr r0, _08085C60 @ =0x08CC2C60
	movs r1, #3
	bl Proc_Start
_08085C40:
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _08085C52
	ldr r0, _08085C64 @ =0x08CC2CE8
	movs r1, #3
	bl Proc_Start
_08085C52:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085C58: .4byte 0x08CC2D38
_08085C5C: .4byte 0x0202BBF8
_08085C60: .4byte 0x08CC2C60
_08085C64: .4byte 0x08CC2CE8

	thumb_func_start StartMapWindows
StartMapWindows: @ 0x08085C68
	push {lr}
	ldr r0, _08085C78 @ =0x08CC2D18
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08085C78: .4byte 0x08CC2D18

	thumb_func_start EndPlayerPhaseSideWindows
EndPlayerPhaseSideWindows: @ 0x08085C7C
	push {lr}
	ldr r0, _08085CC4 @ =0x08CC2C60
	bl Proc_EndEach
	ldr r0, _08085CC8 @ =0x08CC2CE8
	bl Proc_EndEach
	ldr r0, _08085CCC @ =0x08CC2C00
	bl Proc_EndEach
	ldr r0, _08085CD0 @ =0x08CC2D38
	bl Proc_EndEach
	ldr r0, _08085CD4 @ =0x08CC2D98
	bl Proc_EndEach
	ldr r3, _08085CD8 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08085CC4: .4byte 0x08CC2C60
_08085CC8: .4byte 0x08CC2CE8
_08085CCC: .4byte 0x08CC2C00
_08085CD0: .4byte 0x08CC2D38
_08085CD4: .4byte 0x08CC2D98
_08085CD8: .4byte 0x03002870

	thumb_func_start sub_08085CDC
sub_08085CDC: @ 0x08085CDC
	ldr r0, _08085CF4 @ =0x0202BBB8
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _08085CF8
	movs r0, #0
	b _08085CFA
	.align 2, 0
_08085CF4: .4byte 0x0202BBB8
_08085CF8:
	movs r0, #1
_08085CFA:
	bx lr

	thumb_func_start sub_08085CFC
sub_08085CFC: @ 0x08085CFC
	push {lr}
	bl sub_08085CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085D24
	bl sub_08084E70
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08085D18
	movs r0, #2
	b _08085D42
_08085D18:
	bl sub_08084E70
	cmp r0, #1
	bne _08085D40
	movs r0, #1
	b _08085D42
_08085D24:
	bl sub_08084E90
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08085D34
	movs r0, #4
	b _08085D42
_08085D34:
	bl sub_08084E90
	cmp r0, #1
	bne _08085D40
	movs r0, #3
	b _08085D42
_08085D40:
	movs r0, #0
_08085D42:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08085D48
sub_08085D48: @ 0x08085D48
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _08085DBC @ =0x020039E4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _08085DC0 @ =0x02003564
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TmFillRect_thm
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08085D8C
	ldr r1, _08085DC4 @ =0x0840493C
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
_08085D8C:
	ldrh r5, [r5]
	cmp r5, #1
	bne _08085DB6
	ldr r1, _08085DC8 @ =0x084048B4
	movs r2, #0x88
	lsls r2, r2, #5
	adds r0, r7, #0
	bl TmApplyTsa_thm
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl PutText
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl PutText
_08085DB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085DBC: .4byte 0x020039E4
_08085DC0: .4byte 0x02003564
_08085DC4: .4byte 0x0840493C
_08085DC8: .4byte 0x084048B4

	thumb_func_start sub_08085DCC
sub_08085DCC: @ 0x08085DCC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0
	str r1, [r7, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #9
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r7, #0
	bl StartGreenText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	ldr r6, _08085E54 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	movs r0, #0x48
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetChapterInfo
	adds r0, #0x90
	ldrb r0, [r0]
	cmp r0, #4
	bls _08085E48
	b _08085F60
_08085E48:
	lsls r0, r0, #2
	ldr r1, _08085E58 @ =_08085E5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085E54: .4byte 0x0202BBF8
_08085E58: .4byte _08085E5C
_08085E5C: @ jump table
	.4byte _08085E70 @ case 0
	.4byte _08085E78 @ case 1
	.4byte _08085ECC @ case 2
	.4byte _08085E70 @ case 3
	.4byte _08085E70 @ case 4
_08085E70:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0
	b _08085F5E
_08085E78:
	adds r4, r7, #0
	adds r4, #0x34
	ldr r0, _08085EAC @ =0x0000128D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08085EB0 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08085EB8
	ldr r0, _08085EB4 @ =0x0000127C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl Text_InsertDrawString
	b _08085F58
	.align 2, 0
_08085EAC: .4byte 0x0000128D
_08085EB0: .4byte 0x0202BBF8
_08085EB4: .4byte 0x0000127C
_08085EB8:
	movs r0, #0x80
	bl CountUnitsByFaction
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	b _08085F58
_08085ECC:
	ldr r5, _08085F04 @ =0x0202BBF8
	ldrh r4, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x91
	ldrb r0, [r0]
	subs r0, #1
	cmp r4, r0
	blt _08085F0C
	ldr r0, _08085F08 @ =0x0000128E
	bl DecodeMsg
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertDrawString
	b _08085F58
	.align 2, 0
_08085F04: .4byte 0x0202BBF8
_08085F08: .4byte 0x0000128E
_08085F0C:
	adds r4, r7, #0
	adds r4, #0x34
	ldrh r3, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08085F68 @ =0x000012B0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x91
	ldrb r3, [r0]
	subs r3, #1
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	ldr r0, _08085F6C @ =0x0000128F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2b
	movs r2, #0
	bl Text_InsertDrawString
_08085F58:
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #1
_08085F5E:
	strh r0, [r1]
_08085F60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085F68: .4byte 0x000012B0
_08085F6C: .4byte 0x0000128F

	thumb_func_start GoalDisplay_Loop_OnSideChange
GoalDisplay_Loop_OnSideChange: @ 0x08085F70
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _08085FFC @ =0x08CC2B94
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetWindowQuadrant
	adds r5, r0, #0
	ldr r0, _08086000 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _08085FC0
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08085FC0
	cmp r0, r5
	beq _08085FF4
_08085FC0:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_08085D48
	ldr r1, _08086004 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08085FF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085FFC: .4byte 0x08CC2B94
_08086000: .4byte 0x08CC2C00
_08086004: .4byte 0x0202BBB8

	thumb_func_start sub_08086008
sub_08086008: @ 0x08086008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _08086190 @ =0x08CC2B94
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	cmp r1, #0
	bge _08086076
	cmp r0, #0
	bge _08086076
	ldr r4, _08086194 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _08086198 @ =0x02022C60
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808619C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _080861A0 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086076:
	mov r0, r8
	cmp r0, #0
	ble _080860C6
	mov r1, sb
	cmp r1, #0
	bge _080860C6
	ldr r4, _080861A4 @ =0x02023486
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r5, _080861A8 @ =0x02022C86
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808619C @ =0x02003764
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _080861A0 @ =0x02003264
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_080860C6:
	mov r0, r8
	cmp r0, #0
	bge _08086120
	mov r1, sb
	cmp r1, #0
	ble _08086120
	ldr r5, _080861AC @ =0x020237E0
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080861B0 @ =0x02022FE0
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080861B4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _080861BC @ =0x02003564
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_08086120:
	mov r0, r8
	cmp r0, #0
	ble _0808617A
	mov r1, sb
	cmp r1, #0
	ble _0808617A
	ldr r5, _080861C0 @ =0x02023806
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r6, _080861C4 @ =0x02023006
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _080861B4 @ =0x020039E4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
	ldr r0, _080861BC @ =0x02003564
	ldr r1, _080861B8 @ =0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TmCopyRect_thm
_0808617A:
	movs r0, #3
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086190: .4byte 0x08CC2B94
_08086194: .4byte 0x02023460
_08086198: .4byte 0x02022C60
_0808619C: .4byte 0x02003764
_080861A0: .4byte 0x02003264
_080861A4: .4byte 0x02023486
_080861A8: .4byte 0x02022C86
_080861AC: .4byte 0x020237E0
_080861B0: .4byte 0x02022FE0
_080861B4: .4byte 0x020039E4
_080861B8: .4byte 0xFFFFFC80
_080861BC: .4byte 0x02003564
_080861C0: .4byte 0x02023806
_080861C4: .4byte 0x02023006

	thumb_func_start GoalDisplay_Loop_SlideIn
GoalDisplay_Loop_SlideIn: @ 0x080861C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0808620C @ =0x08CC2D30
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_08086008
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _08086206
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086206:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808620C: .4byte 0x08CC2D30

	thumb_func_start GoalDisplay_Loop_SlideOut
GoalDisplay_Loop_SlideOut: @ 0x08086210
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _08086268 @ =0x08CC2D35
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_08086008
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _08086260
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086260:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086268: .4byte 0x08CC2D35

	thumb_func_start sub_0808626C
sub_0808626C: @ 0x0808626C
	bx lr
	.align 2, 0

	thumb_func_start sub_08086270
sub_08086270: @ 0x08086270
	bx lr
	.align 2, 0

	thumb_func_start sub_08086274
sub_08086274: @ 0x08086274
	bx lr
	.align 2, 0

	thumb_func_start sub_08086278
sub_08086278: @ 0x08086278
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _080862FC @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _08086300 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080862F6
	ldr r0, _08086304 @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _080862E8
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _080862F6
	ldr r0, _08086308 @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _080862E8
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _080862F6
_080862E8:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080862F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080862FC: .4byte 0x0202BBB8
_08086300: .4byte 0x0000FFFF
_08086304: .4byte 0x08B92E38
_08086308: .4byte 0x08CC2B94

	thumb_func_start IsAnyPlayerSideWindowRetracting
IsAnyPlayerSideWindowRetracting: @ 0x0808630C
	push {lr}
	ldr r0, _08086354 @ =0x08CC2C60
	bl Proc_Find
	cmp r0, #0
	beq _08086324
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086350
_08086324:
	ldr r0, _08086358 @ =0x08CC2C00
	bl Proc_Find
	cmp r0, #0
	beq _0808633A
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08086350
_0808633A:
	ldr r0, _0808635C @ =0x08CC2D38
	bl Proc_Find
	cmp r0, #0
	beq _08086360
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08086360
_08086350:
	movs r0, #1
	b _08086362
	.align 2, 0
_08086354: .4byte 0x08CC2C60
_08086358: .4byte 0x08CC2C00
_0808635C: .4byte 0x08CC2D38
_08086360:
	movs r0, #0
_08086362:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08086368
sub_08086368: @ 0x08086368
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086390 @ =0x08405170
	ldr r1, _08086394 @ =0x06015000
	bl Decompress
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086390: .4byte 0x08405170
_08086394: .4byte 0x06015000

	thumb_func_start UpdateMenuButtonPos
UpdateMenuButtonPos: @ 0x08086398
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _0808641C @ =0x08CC2B94
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _080863C6
	cmp r4, #0
	bge _080863C6
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_080863C6:
	cmp r2, #0
	ble _080863E0
	cmp r4, #0
	bge _080863E0
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x18
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_080863E0:
	cmp r2, #0
	bge _080863F8
	cmp r4, #0
	ble _080863F8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa0
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_080863F8:
	cmp r2, #0
	ble _08086416
	cmp r4, #0
	ble _08086416
	movs r0, #0x46
	adds r0, r0, r3
	mov ip, r0
	movs r0, #0xa0
	movs r1, #0xa0
	mov r2, ip
	strh r1, [r2]
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x48
	strh r0, [r1]
_08086416:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808641C: .4byte 0x08CC2B94

	thumb_func_start DrawMenuButtonAt
DrawMenuButtonAt: @ 0x08086420
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080864A0 @ =0x000001FF
	mov r8, r0
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0xff
	ands r5, r0
	ldr r6, _080864A4 @ =0x08B905F8
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x20
	mov r0, r8
	ands r1, r0
	movs r0, #0xa1
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x40
	mov r0, r8
	ands r1, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSprite
	adds r4, #0x60
	mov r0, r8
	ands r4, r0
	ldr r3, _080864A8 @ =0x08B905D0
	movs r0, #0xa3
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080864A0: .4byte 0x000001FF
_080864A4: .4byte 0x08B905F8
_080864A8: .4byte 0x08B905D0

	thumb_func_start MenuButtonDisp_UpdateCursorPos
MenuButtonDisp_UpdateCursorPos: @ 0x080864AC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCursorQuadrant
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	str r5, [r4, #0x58]
	ldr r1, _080864E4 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080864E4: .4byte 0x0202BBB8

	thumb_func_start MenuButtonDisp_Loop_OnSlideIn
MenuButtonDisp_Loop_OnSlideIn: @ 0x080864E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl DrawMenuButtonAt
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08086526
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_08086526:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0808652C
sub_0808652C: @ 0x0808652C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl DrawMenuButtonAt
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _080865C4 @ =0x0202BBB8
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldr r0, _080865C8 @ =0x0000FFFF
	adds r1, r0, #0
	ldrh r3, [r3]
	ands r1, r3
	ldrh r2, [r2]
	ands r0, r2
	cmp r1, r0
	beq _080865BC
	ldr r0, _080865CC @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _080865AE
	bl GetCursorQuadrant
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r1, r2
	beq _080865BC
	ldr r0, _080865D0 @ =0x08CC2B94
	lsls r1, r1, #3
	adds r3, r1, r0
	lsls r1, r2, #3
	adds r1, r1, r0
	ldrb r2, [r3, #4]
	ldrb r0, [r1, #4]
	cmp r2, r0
	bne _080865AE
	ldrb r3, [r3, #5]
	ldrb r1, [r1, #5]
	cmp r3, r1
	beq _080865BC
_080865AE:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080865BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865C4: .4byte 0x0202BBB8
_080865C8: .4byte 0x0000FFFF
_080865CC: .4byte 0x08B92E38
_080865D0: .4byte 0x08CC2B94

	thumb_func_start MenuButtonDisp_Loop_OnSlideOut
MenuButtonDisp_Loop_OnSlideOut: @ 0x080865D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl DrawMenuButtonAt
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08086610
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08086610:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
