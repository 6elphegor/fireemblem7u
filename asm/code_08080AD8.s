	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenPageName_Init
StatScreenPageName_Init: @ 0x08080AD8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r4, _08080B68 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _08080B6C @ =0x0200310C
	ldrb r0, [r0]
	movs r1, #0x36
	add sb, r1
	mov r2, sb
	strb r0, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080B68: .4byte 0x080C5A48
_08080B6C: .4byte 0x0200310C

	thumb_func_start StatScreenPageName_Main
StatScreenPageName_Main: @ 0x08080B70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl PutUpdateStatScreenPageName
	ldr r1, _08080B94 @ =0x0200310C
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08080B98
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _08080B9C
	.align 2, 0
_08080B94: .4byte 0x0200310C
_08080B98:
	ldrb r0, [r1]
	strb r0, [r5]
_08080B9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StatScreenPageName_CloseMain
StatScreenPageName_CloseMain: @ 0x08080BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08080C68 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	bl PutUpdateStatScreenPageName
	ldrh r0, [r7, #0x38]
	subs r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08080C56
	movs r0, #1
	strh r0, [r7, #0x38]
	adds r0, r7, #0
	bl Proc_Break
_08080C56:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080C68: .4byte 0x080C5A48

	thumb_func_start StatScreenPageName_OpenMain
StatScreenPageName_OpenMain: @ 0x08080C6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08080D34 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r5
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r5, r1]
	rsbs r4, r4, #0
	lsls r4, r4, #4
	movs r2, #0x38
	ldrsh r0, [r7, r2]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r0, #0
	ldrsh r4, [r2, r0]
	lsls r4, r4, #4
	movs r1, #0x38
	ldrsh r0, [r7, r1]
	lsls r0, r0, #8
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #8
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl SetObjAffine
	ldr r4, _08080D38 @ =0x0200310C
	ldrb r0, [r4]
	bl PutUpdateStatScreenPageName
	ldrh r0, [r7, #0x38]
	adds r0, #1
	strh r0, [r7, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _08080D22
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08080D22:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080D34: .4byte 0x080C5A48
_08080D38: .4byte 0x0200310C

	thumb_func_start StatScreenSprites_Init
StatScreenSprites_Init: @ 0x08080D3C
	movs r2, #0
	movs r1, #0x69
	strh r1, [r0, #0x2a]
	movs r1, #0xca
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x32]
	bx lr
	.align 2, 0

	thumb_func_start StatScreenSprites_BumpCheck
StatScreenSprites_BumpCheck: @ 0x08080D54
	adds r1, r0, #0
	ldr r2, _08080D84 @ =0x0200310C
	movs r0, #0x20
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D6A
	movs r0, #0x1f
	strh r0, [r1, #0x32]
	movs r0, #0x63
	strh r0, [r1, #0x2a]
_08080D6A:
	movs r0, #0x10
	ldrh r3, [r2, #2]
	ands r0, r3
	cmp r0, #0
	beq _08080D7C
	movs r0, #0x1f
	strh r0, [r1, #0x34]
	movs r0, #0xd0
	strh r0, [r1, #0x2c]
_08080D7C:
	movs r0, #0
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08080D84: .4byte 0x0200310C

	thumb_func_start StatScreenSprites_PutArrows
StatScreenSprites_PutArrows: @ 0x08080D88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08080E60 @ =0x00004640
	mov sb, r0
	ldrh r1, [r7, #0x32]
	ldrh r2, [r7, #0x2e]
	adds r0, r1, r2
	strh r0, [r7, #0x2e]
	ldrh r3, [r7, #0x30]
	ldrh r2, [r7, #0x34]
	adds r0, r3, r2
	strh r0, [r7, #0x30]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08080DB4
	subs r0, r1, #1
	strh r0, [r7, #0x32]
_08080DB4:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #4
	ble _08080DC2
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_08080DC2:
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08080DEA
	ldrh r1, [r7, #0x2a]
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	cmp r0, #0x68
	bgt _08080DDC
	adds r0, r1, #1
	strh r0, [r7, #0x2a]
_08080DDC:
	ldrh r1, [r7, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	cmp r0, #0xca
	ble _08080DEA
	subs r0, r1, #1
	strh r0, [r7, #0x2c]
_08080DEA:
	ldr r6, _08080E64 @ =0x0200310C
	movs r0, #4
	ldrsh r5, [r6, r0]
	movs r1, #0x2a
	ldrsh r0, [r7, r1]
	adds r5, r5, r0
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r4, #6
	ldr r3, _08080E68 @ =0x08B905D0
	mov r8, r3
	ldrh r1, [r7, #0x2e]
	lsrs r0, r1, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSprite
	movs r2, #4
	ldrsh r5, [r6, r2]
	movs r3, #0x2c
	ldrsh r0, [r7, r3]
	adds r5, r5, r0
	movs r0, #6
	ldrsh r4, [r6, r0]
	adds r4, #6
	ldr r6, _08080E6C @ =0x08B90620
	ldrh r7, [r7, #0x30]
	lsrs r0, r7, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0x4a
	add r0, sb
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080E60: .4byte 0x00004640
_08080E64: .4byte 0x0200310C
_08080E68: .4byte 0x08B905D0
_08080E6C: .4byte 0x08B90620

	thumb_func_start StatScreenSprites_PutNumberLabel
StatScreenSprites_PutNumberLabel: @ 0x08080E70
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _08080ED0 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0xe3
	movs r3, #6
	ldrsh r2, [r4, r3]
	adds r2, #0xc
	ldr r5, _08080ED4 @ =0x08B905B0
	ldrb r6, [r4, #1]
	ldr r3, _08080ED8 @ =0x00004EA4
	adds r0, r6, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r1, #0xdd
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0xc
	ldr r0, _08080EDC @ =0x00004E45
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	movs r3, #4
	ldrsh r1, [r4, r3]
	adds r1, #0xd6
	movs r6, #6
	ldrsh r2, [r4, r6]
	adds r2, #0xc
	ldrb r4, [r4]
	ldr r3, _08080EE0 @ =0x00004EA5
	adds r0, r4, r3
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080ED0: .4byte 0x0200310C
_08080ED4: .4byte 0x08B905B0
_08080ED8: .4byte 0x00004EA4
_08080EDC: .4byte 0x00004E45
_08080EE0: .4byte 0x00004EA5

	thumb_func_start StatScreenSprites_PutMuAreaSprites
StatScreenSprites_PutMuAreaSprites: @ 0x08080EE4
	push {r4, lr}
	sub sp, #4
	ldr r4, _08080F38 @ =0x0200310C
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _08080F3C @ =0x08CC1E58
	movs r0, #0xb9
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xc
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x40
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #0x83
	ldr r3, _08080F40 @ =0x08B905F8
	ldr r0, _08080F44 @ =0x00004E90
	str r0, [sp]
	movs r0, #0xb
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x60
	ldr r0, _08080F48 @ =0x000001FF
	ands r1, r0
	ldrb r2, [r4, #6]
	ldr r3, _08080F4C @ =0x08CC1EA2
	ldr r0, _08080F50 @ =0x0000A460
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte 0x0200310C
_08080F3C: .4byte 0x08CC1E58
_08080F40: .4byte 0x08B905F8
_08080F44: .4byte 0x00004E90
_08080F48: .4byte 0x000001FF
_08080F4C: .4byte 0x08CC1EA2
_08080F50: .4byte 0x0000A460

	thumb_func_start StatScreenSprites_PutRescueMarkers
StatScreenSprites_PutRescueMarkers: @ 0x08080F54
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08080F68
	movs r2, #1
_08080F68:
	adds r5, r2, #0
	ldr r1, _08081010 @ =0x08404B70
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08081014 @ =0x0200310C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08081008
	ldrb r0, [r4]
	cmp r0, #0
	bne _08080FD0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08080FD0
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl PutSysArrow
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl PutSysArrow
	cmp r5, #0
	beq _08080FD0
	ldr r3, _08081018 @ =0x08B905B0
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_08080FD0:
	ldr r0, _08081014 @ =0x0200310C
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081008
	cmp r5, #0
	beq _08081008
	ldr r3, _08081018 @ =0x08B905B0
	ldrb r2, [r2, #0x1b]
	lsrs r0, r2, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x56
	bl PutSprite
_08081008:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081010: .4byte 0x08404B70
_08081014: .4byte 0x0200310C
_08081018: .4byte 0x08B905B0
_0808101C: .4byte 0x00000803

	thumb_func_start StatScreen_DisableScreen
StatScreen_DisableScreen: @ 0x08081020
	push {r4, lr}
	ldr r3, _0808107C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r4, #0x46
	movs r0, #0x10
	strb r0, [r4, r3]
	ldr r0, _08081080 @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081084 @ =0x02022860
	strh r2, [r0]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808107C: .4byte 0x03002870
_08081080: .4byte 0x0000FFE0
_08081084: .4byte 0x02022860

	thumb_func_start StatScreen_Init
StatScreen_Init: @ 0x08081088
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08081154 @ =0x08404B76
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _08081158 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	ldr r1, _0808115C @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackgroundAlt
	ldr r0, _08081160 @ =0x083FCE8C
	ldr r1, _08081164 @ =0x06014800
	bl Decompress
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r0, #1
	movs r1, #0x13
	bl ApplyIconPalette
	ldr r0, _08081168 @ =0x083FC9FC
	ldr r4, _0808116C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08081170 @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08081174 @ =0x083FCC90
	ldr r1, _08081178 @ =0x06008C00
	bl Decompress
	ldr r0, _0808117C @ =0x083FCE0C
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08081180 @ =0x02022880
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	movs r1, #0x14
	bl ApplyIconPalette
	ldr r0, _08081184 @ =0x083FD62C
	ldr r1, _08081188 @ =0x06004E00
	bl Decompress
	ldr r0, _0808118C @ =0x083FCBEC
	ldr r1, _08081190 @ =0x06010C00
	bl Decompress
	ldr r0, _08081194 @ =0x081D60F0
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08081198 @ =0x0200310C
	movs r0, #0
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl StatScreenUnitSlide_End
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081154: .4byte 0x08404B76
_08081158: .4byte 0x02023C60
_0808115C: .4byte 0x0600B000
_08081160: .4byte 0x083FCE8C
_08081164: .4byte 0x06014800
_08081168: .4byte 0x083FC9FC
_0808116C: .4byte 0x02020140
_08081170: .4byte 0x02023460
_08081174: .4byte 0x083FCC90
_08081178: .4byte 0x06008C00
_0808117C: .4byte 0x083FCE0C
_08081180: .4byte 0x02022880
_08081184: .4byte 0x083FD62C
_08081188: .4byte 0x06004E00
_0808118C: .4byte 0x083FCBEC
_08081190: .4byte 0x06010C00
_08081194: .4byte 0x081D60F0
_08081198: .4byte 0x0200310C

	thumb_func_start StatScreen_InitUnit
StatScreen_InitUnit: @ 0x0808119C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080811F8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080811BC
	adds r4, #1
_080811BC:
	movs r0, #3
	strb r0, [r5, #1]
	bl ResetText
	bl InitIcons
	bl InitStatScreenText
	ldr r1, _080811FC @ =0x02023CA4
	movs r3, #0x9c
	lsls r3, r3, #3
	movs r0, #0xd
	str r0, [sp]
	adds r0, r6, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetFaceInfo
	ldr r0, [r0]
	cmp r0, #0
	beq _08081204
	ldr r0, _08081200 @ =0x083FCBAC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	b _0808120E
	.align 2, 0
_080811F8: .4byte 0x0200310C
_080811FC: .4byte 0x02023CA4
_08081200: .4byte 0x083FCBAC
_08081204:
	ldr r0, _0808125C @ =0x083FCBCC
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
_0808120E:
	bl EndAllMus
	ldr r4, _08081260 @ =0x0200310C
	ldr r0, [r4, #0xc]
	movs r1, #0x50
	movs r2, #0x8a
	bl StartUiMu
	str r0, [r4, #0x10]
	bl PutStatScreenLeftPanelInfo
	ldrb r0, [r4]
	bl PutStatScreenPage
	ldr r0, _08081264 @ =0x0200323C
	ldr r1, _08081268 @ =0x02022CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _0808126C @ =0x0200373C
	ldr r1, _08081270 @ =0x020234F8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	ldr r0, _08081274 @ =0x02003C3C
	ldr r1, _08081278 @ =0x02023CF8
	movs r2, #0x12
	movs r3, #0x12
	bl TmCopyRect_thm
	movs r0, #7
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808125C: .4byte 0x083FCBCC
_08081260: .4byte 0x0200310C
_08081264: .4byte 0x0200323C
_08081268: .4byte 0x02022CF8
_0808126C: .4byte 0x0200373C
_08081270: .4byte 0x020234F8
_08081274: .4byte 0x02003C3C
_08081278: .4byte 0x02023CF8

	thumb_func_start StatScreen_Main
StatScreen_Main: @ 0x0808127C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _08081304 @ =0x08B857F8
	ldr r2, [r1]
	movs r0, #2
	ldrh r3, [r2, #8]
	ands r0, r3
	adds r3, r1, #0
	cmp r0, #0
	beq _0808131C
	ldr r3, _08081308 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r4, [r3, #1]
	ands r0, r4
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r4, r3, #0
	adds r4, #0x46
	movs r0, #0x10
	strb r0, [r4]
	ldr r0, _0808130C @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	strh r0, [r3, #0x3c]
	movs r0, #0x20
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldr r0, _08081310 @ =0x02022860
	strh r2, [r0]
	bl EnablePalSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _08081314 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080812FA
	b _08081400
_080812FA:
	ldr r0, _08081318 @ =0x0000038B
	bl m4aSongNumStart
	b _08081400
	.align 2, 0
_08081304: .4byte 0x08B857F8
_08081308: .4byte 0x03002870
_0808130C: .4byte 0x0000FFE0
_08081310: .4byte 0x02022860
_08081314: .4byte 0x0202BBF8
_08081318: .4byte 0x0000038B
_0808131C:
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081340
	ldr r4, _0808133C @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r2, [r4]
	adds r0, r2, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _0808135E
	.align 2, 0
_0808133C: .4byte 0x0200310C
_08081340:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0808136C
	ldr r4, _08081368 @ =0x0200310C
	ldrb r1, [r4, #1]
	ldrb r3, [r4]
	adds r0, r3, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_0808135E:
	adds r2, r5, #0
	bl StartStatScreenPageSlide
	b _08081400
	.align 2, 0
_08081368: .4byte 0x0200310C
_0808136C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808138C
	ldr r0, _08081388 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	adds r1, r4, #0
	b _080813D2
	.align 2, 0
_08081388: .4byte 0x0200310C
_0808138C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080813A8
	ldr r0, _080813A4 @ =0x0200310C
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl FindNextStatScreenUnit
	adds r2, r0, #0
	movs r1, #1
	b _080813D2
	.align 2, 0
_080813A4: .4byte 0x0200310C
_080813A8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080813E0
	ldr r4, _080813DC @ =0x0200310C
	ldr r2, [r4, #0xc]
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _080813E0
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080813D0
	movs r1, #1
_080813D0:
	adds r0, r2, #0
_080813D2:
	adds r2, r5, #0
	bl StartStatScreenUnitSlide
	b _08081400
	.align 2, 0
_080813DC: .4byte 0x0200310C
_080813E0:
	ldr r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081400
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08081408 @ =0x0200310C
	ldrb r0, [r0]
	adds r1, r5, #0
	bl StartStatScreenHelp
_08081400:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081408: .4byte 0x0200310C

	thumb_func_start StatScreen_BackUpStatus
StatScreen_BackUpStatus: @ 0x0808140C
	push {r4, lr}
	ldr r3, _08081438 @ =0x0202BBF8
	movs r1, #0xfc
	ldrb r0, [r3, #0x14]
	ands r1, r0
	ldr r2, _0808143C @ =0x0200310C
	movs r0, #3
	ldrb r4, [r2]
	ands r0, r4
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldr r1, _08081440 @ =0x0203E670
	ldr r0, [r2, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetOnVMatch
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081438: .4byte 0x0202BBF8
_0808143C: .4byte 0x0200310C
_08081440: .4byte 0x0203E670

	thumb_func_start StatScreen_UpdateLastHelpInfo
StatScreen_UpdateLastHelpInfo: @ 0x08081444
	push {lr}
	bl GetLastHelpBoxInfo
	ldr r1, _08081454 @ =0x0200310C
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_08081454: .4byte 0x0200310C

	thumb_func_start SyncStatScreenBgOffset
SyncStatScreenBgOffset: @ 0x08081458
	push {r4, lr}
	ldr r0, _0808148C @ =0x0200310C
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808148C: .4byte 0x0200310C

	thumb_func_start sub_08081490
sub_08081490: @ 0x08081490
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartStatScreen
StartStatScreen: @ 0x0808149C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _080814E4 @ =0x0200310C
	movs r5, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r4, _080814E8 @ =0x0202BBF8
	movs r1, #3
	ldrb r7, [r4, #0x14]
	ands r1, r7
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r5, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PidStatsAddStatView
	adds r4, #0x41
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	cmp r0, #0
	blt _080814D4
	ldr r0, _080814EC @ =0x0000038A
	bl m4aSongNumStart
_080814D4:
	ldr r0, _080814F0 @ =0x08CC1F6C
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080814E4: .4byte 0x0200310C
_080814E8: .4byte 0x0202BBF8
_080814EC: .4byte 0x0000038A
_080814F0: .4byte 0x08CC1F6C

	thumb_func_start StartStatScreenHelp
StartStatScreenHelp: @ 0x080814F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	ldr r1, _0808151C @ =0x0200310C
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0808153C
	cmp r4, #1
	beq _08081530
	cmp r4, #1
	bgt _08081520
	cmp r4, #0
	beq _08081526
	b _0808153C
	.align 2, 0
_0808151C: .4byte 0x0200310C
_08081520:
	cmp r4, #2
	beq _08081538
	b _0808153C
_08081526:
	ldr r0, _0808152C @ =0x08CC2140
	b _0808153A
	.align 2, 0
_0808152C: .4byte 0x08CC2140
_08081530:
	ldr r0, _08081534 @ =0x08CC231C
	b _0808153A
	.align 2, 0
_08081534: .4byte 0x08CC231C
_08081538:
	ldr r0, _0808154C @ =0x08CC24C0
_0808153A:
	str r0, [r1, #0x14]
_0808153C:
	ldr r0, _08081550 @ =0x0200310C
	ldr r0, [r0, #0x14]
	adds r1, r5, #0
	bl StartMovingHelpBox
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808154C: .4byte 0x08CC24C0
_08081550: .4byte 0x0200310C

	thumb_func_start HelpBoxPopulateStatScreenItem
HelpBoxPopulateStatScreenItem: @ 0x08081554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808157C @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	bl GetItemDescMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808157C: .4byte 0x0200310C

	thumb_func_start sub_08081580
sub_08081580: @ 0x08081580
	adds r2, r0, #0
	ldr r0, _0808159C @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #8
	bhi _08081632
	lsls r0, r0, #2
	ldr r1, _080815A0 @ =_080815A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808159C: .4byte 0x0200310C
_080815A0: .4byte _080815A4
_080815A4: @ jump table
	.4byte _080815C8 @ case 0
	.4byte _080815D2 @ case 1
	.4byte _080815E0 @ case 2
	.4byte _080815EC @ case 3
	.4byte _080815F6 @ case 4
	.4byte _08081604 @ case 5
	.4byte _08081610 @ case 6
	.4byte _0808161C @ case 7
	.4byte _08081628 @ case 8
_080815C8:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9c
	lsls r0, r0, #2
	b _08081630
_080815D2:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815DC @ =0x00000271
	b _08081630
	.align 2, 0
_080815DC: .4byte 0x00000271
_080815E0:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815E8 @ =0x00000272
	b _08081630
	.align 2, 0
_080815E8: .4byte 0x00000272
_080815EC:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #2
	b _08081630
_080815F6:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081600 @ =0x00000273
	b _08081630
	.align 2, 0
_08081600: .4byte 0x00000273
_08081604:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808160C @ =0x00000275
	b _08081630
	.align 2, 0
_0808160C: .4byte 0x00000275
_08081610:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081618 @ =0x00000276
	b _08081630
	.align 2, 0
_08081618: .4byte 0x00000276
_0808161C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081624 @ =0x00000277
	b _08081630
	.align 2, 0
_08081624: .4byte 0x00000277
_08081628:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #2
_08081630:
	strh r0, [r1]
_08081632:
	bx lr

	thumb_func_start sub_08081634
sub_08081634: @ 0x08081634
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081650 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08081658
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _08081654 @ =0x00000265
	b _08081660
	.align 2, 0
_08081650: .4byte 0x0200310C
_08081654: .4byte 0x00000265
_08081658:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0x99
	lsls r0, r0, #2
_08081660:
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxRedirectStatScreenItem
HelpBoxRedirectStatScreenItem: @ 0x08081668
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080816A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _0808167C
	adds r0, r4, #0
	bl HelpBoxTryRelocateLeft
_0808167C:
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x2c]
	ldrh r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _080816B6
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _080816A0
	cmp r0, #0x10
	beq _080816A0
	cmp r0, #0x40
	bne _080816AC
_080816A0:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
	b _080816B6
	.align 2, 0
_080816A8: .4byte 0x0200310C
_080816AC:
	cmp r0, #0x80
	bne _080816B6
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
_080816B6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxPopulateStatScreenWeaponExp
HelpBoxPopulateStatScreenWeaponExp: @ 0x080816BC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _080816F4 @ =0x08404B8E
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _080816F8 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080816E0
	adds r4, #4
_080816E0:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080816F4: .4byte 0x08404B8E
_080816F8: .4byte 0x0200310C

	thumb_func_start HelpBoxPopulateStatScreenPInfo
HelpBoxPopulateStatScreenPInfo: @ 0x080816FC
	adds r1, r0, #0
	ldr r0, _08081714 @ =0x0200310C
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldrh r2, [r0, #2]
	cmp r2, #0
	beq _08081718
	adds r0, r1, #0
	adds r0, #0x4c
	strh r2, [r0]
	b _0808171E
	.align 2, 0
_08081714: .4byte 0x0200310C
_08081718:
	adds r1, #0x4c
	ldr r0, _08081720 @ =0x00000396
	strh r0, [r1]
_0808171E:
	bx lr
	.align 2, 0
_08081720: .4byte 0x00000396

	thumb_func_start HelpBoxPopulateStatScreenJInfo
HelpBoxPopulateStatScreenJInfo: @ 0x08081724
	ldr r1, _08081734 @ =0x0200310C
	ldr r1, [r1, #0xc]
	ldr r1, [r1, #4]
	ldrh r1, [r1, #2]
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08081734: .4byte 0x0200310C

	thumb_func_start HelpBoxRedirectStatScreenSupports
HelpBoxRedirectStatScreenSupports: @ 0x08081738
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808175C @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl GetUnitTotalSupportLevel
	cmp r0, #0
	bne _08081766
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0x80
	bne _08081760
	adds r0, r4, #0
	bl HelpBoxTryRelocateDown
	b _08081766
	.align 2, 0
_0808175C: .4byte 0x0200310C
_08081760:
	adds r0, r4, #0
	bl HelpBoxTryRelocateUp
_08081766:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start UpdateHelpBoxDisplay
UpdateHelpBoxDisplay: @ 0x0808176C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r4, r6, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	adds r7, r6, #0
	adds r7, #0x4a
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x30]
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x32]
	adds r0, r6, #0
	adds r0, #0x40
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r3, #0
	ldrsh r0, [r7, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	strh r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x42
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r4, #0
	ldrsh r0, [r7, r4]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	strh r0, [r6, #0x36]
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0x34
	ldrsh r2, [r6, r3]
	movs r4, #0x36
	ldrsh r3, [r6, r4]
	adds r4, r6, #0
	adds r4, #0x52
	ldrb r4, [r4]
	str r4, [sp]
	bl PutSpriteTalkBox
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HelpBox_OnOpen
HelpBox_OnOpen: @ 0x08081820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808185C @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08081836
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #1
	strb r0, [r1]
_08081836:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _08081854
	ldr r0, _08081860 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081854
	movs r0, #0xe4
	lsls r0, r0, #2
	bl m4aSongNumStart
_08081854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808185C: .4byte 0x08CC209C
_08081860: .4byte 0x0202BBF8

	thumb_func_start sub_08081864
sub_08081864: @ 0x08081864
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
	bge _08081886
	adds r0, r3, #1
	strh r0, [r2]
_08081886:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start HelpBox_OnClose
HelpBox_OnClose: @ 0x0808188C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080818D8 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _080818A2
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #0
	strb r0, [r1]
_080818A2:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _080818D0
	ldr r0, _080818DC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080818BE
	ldr r0, _080818E0 @ =0x00000391
	bl m4aSongNumStart
_080818BE:
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
_080818D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080818D8: .4byte 0x08CC209C
_080818DC: .4byte 0x0202BBF8
_080818E0: .4byte 0x00000391

	thumb_func_start HelpBox_WaitClose
HelpBox_WaitClose: @ 0x080818E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08081904
	adds r0, r4, #0
	bl Proc_Break
_08081904:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartHelpBox
StartHelpBox: @ 0x0808190C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081938 @ =0x0203E674
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	ldr r1, _0808193C @ =0x0203E694
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte 0x0203E674
_0808193C: .4byte 0x0203E694

	thumb_func_start StartHelpBox_Unk
StartHelpBox_Unk: @ 0x08081940
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bge _0808195C
	cmp r3, #0
	bge _0808195C
	bl GetUiHandPrevX
	adds r4, r0, #0
	bl GetUiHandPrevY
	adds r3, r0, #0
_0808195C:
	ldr r0, _08081984 @ =0x0203E674
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r3, [r0, #0x11]
	strh r5, [r0, #0x12]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r2, _08081988 @ =0x0203E694
	strh r1, [r2]
	strh r1, [r2, #2]
	movs r1, #1
	bl StartHelpBoxExt
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081984: .4byte 0x0203E674
_08081988: .4byte 0x0203E694

	thumb_func_start StartItemHelpBox
StartItemHelpBox: @ 0x0808198C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080819BC @ =0x0203E674
	movs r3, #0
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldr r1, _080819C0 @ =HelpBoxPopulateAutoItem
	str r1, [r0, #0x18]
	ldr r1, _080819C4 @ =0x0203E694
	strh r3, [r1]
	strh r3, [r1, #2]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080819BC: .4byte 0x0203E674
_080819C0: .4byte HelpBoxPopulateAutoItem
_080819C4: .4byte 0x0203E694

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

	thumb_func_start CloseHelpBox
CloseHelpBox: @ 0x08081B44
	push {r4, lr}
	ldr r0, _08081B64 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B5E
	bl ClearHelpBoxText
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_08081B5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B64: .4byte 0x08CC2014

	thumb_func_start KillHelpBox
KillHelpBox: @ 0x08081B68
	push {r4, lr}
	ldr r0, _08081B88 @ =0x08CC2014
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08081B80
	bl ClearHelpBoxText
	adds r0, r4, #0
	bl Proc_End
_08081B80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081B88: .4byte 0x08CC2014

	thumb_func_start HelpBoxMoveControl_OnInitBox
HelpBoxMoveControl_OnInitBox: @ 0x08081B8C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081BA4
	adds r0, r4, #0
	bl _call_via_r1
_08081BA4:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HelpBoxMoveControl_OnIdle
HelpBoxMoveControl_OnIdle: @ 0x08081BB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _08081C4C @ =0x0203E694
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	ldr r2, [r5, #0x2c]
	ldrb r3, [r2, #0x10]
	adds r0, r3, r0
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r2, r1
	bl PutUiHand
	ldr r6, _08081C50 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081BEE
	adds r0, r5, #0
	bl HelpBoxTryRelocateUp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08081BEE:
	ldr r1, [r6]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C06
	adds r0, r5, #0
	bl HelpBoxTryRelocateDown
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C06:
	ldr r1, [r6]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C1E
	adds r0, r5, #0
	bl HelpBoxTryRelocateLeft
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C1E:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08081C36
	adds r0, r5, #0
	bl HelpBoxTryRelocateRight
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08081C36:
	ldr r1, [r6]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081C54
	adds r0, r5, #0
	bl Proc_Break
	b _08081C72
	.align 2, 0
_08081C4C: .4byte 0x0203E694
_08081C50: .4byte 0x08B857F8
_08081C54:
	cmp r4, #0
	beq _08081C72
	ldr r0, _08081C78 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081C6A
	ldr r0, _08081C7C @ =0x00000387
	bl m4aSongNumStart
_08081C6A:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08081C72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C78: .4byte 0x0202BBF8
_08081C7C: .4byte 0x00000387

	thumb_func_start sub_08081C80
sub_08081C80: @ 0x08081C80
	push {r4, lr}
	adds r4, r0, #0
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StartMovingHelpBox
StartMovingHelpBox: @ 0x08081C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081CB0 @ =0x08CC204C
	bl Proc_StartBlocking
	ldr r2, _08081CB4 @ =0x0203E694
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081CB0: .4byte 0x08CC204C
_08081CB4: .4byte 0x0203E694

	thumb_func_start StartMovingHelpBoxExt
StartMovingHelpBoxExt: @ 0x08081CB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _08081CD4 @ =0x08CC204C
	bl Proc_StartBlocking
	ldr r1, _08081CD8 @ =0x0203E694
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081CD4: .4byte 0x08CC204C
_08081CD8: .4byte 0x0203E694

	thumb_func_start ApplyHelpBoxContentSize
ApplyHelpBoxContentSize: @ 0x08081CDC
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
	bl GetHelpBoxItemInfoKind
	cmp r0, #2
	beq _08081D0E
	cmp r0, #2
	bgt _08081D02
	cmp r0, #1
	beq _08081D08
	b _08081D2A
_08081D02:
	cmp r0, #3
	beq _08081D16
	b _08081D2A
_08081D08:
	movs r4, #0xa0
	adds r5, #0x20
	b _08081D2A
_08081D0E:
	cmp r4, #0x5f
	bgt _08081D28
	movs r4, #0x60
	b _08081D28
_08081D16:
	ldr r0, _08081D3C @ =0x0202BBF8
	adds r0, #0x2b
	movs r1, #1
	ldrb r0, [r0]
	ands r1, r0
	movs r4, #0x40
	cmp r1, #0
	beq _08081D28
	movs r4, #0xc0
_08081D28:
	adds r5, #0x10
_08081D2A:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081D3C: .4byte 0x0202BBF8

	thumb_func_start ApplyHelpBoxPosition
ApplyHelpBoxPosition: @ 0x08081D40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	mov r8, r0
	ldr r1, _08081DC8 @ =0x0203E694
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _08081D8C
	movs r0, #0
	strh r0, [r5, #0x3c]
_08081D8C:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _08081D9C
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_08081D9C:
	adds r0, r7, #0
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r2, #0x3e
	ldrsh r0, [r5, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _08081DB2
	mov r1, r8
	subs r0, r7, r1
	strh r0, [r5, #0x3e]
_08081DB2:
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
_08081DC8: .4byte 0x0203E694

	thumb_func_start SetHelpBoxInitPosition
SetHelpBoxInitPosition: @ 0x08081DCC
	push {r4, r5, lr}
	ldr r4, _08081DEC @ =0x0203E694
	movs r5, #0
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r1, r1, r3
	movs r5, #2
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r2, r2, r3
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081DEC: .4byte 0x0203E694

	thumb_func_start ResetHelpBoxInitSize
ResetHelpBoxInitSize: @ 0x08081DF0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	thumb_func_start GetHelpBoxItemInfoKind
GetHelpBoxItemInfoKind: @ 0x08081E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081E10 @ =0x0000FFFF
	cmp r4, r0
	bne _08081E14
	movs r0, #3
	b _08081E4A
	.align 2, 0
_08081E10: .4byte 0x0000FFFF
_08081E14:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08081E44
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08081E36
	movs r0, #1
	b _08081E4A
_08081E36:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08081E48
_08081E44:
	movs r0, #0
	b _08081E4A
_08081E48:
	movs r0, #2
_08081E4A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start HelpBoxPopulateAutoItem
HelpBoxPopulateAutoItem: @ 0x08081E50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl GetHelpBoxItemInfoKind
	cmp r0, #3
	bne _08081E70
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _08081E7A
_08081E70:
	adds r0, r5, #0
	bl GetItemDescMsg
	adds r1, r4, #0
	adds r1, #0x4c
_08081E7A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateUp
HelpBoxTryRelocateUp: @ 0x08081E84
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _08081E94
	movs r0, #0
	b _08081EAE
_08081E94:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081EAC
	adds r0, r2, #0
	bl _call_via_r1
_08081EAC:
	movs r0, #1
_08081EAE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateDown
HelpBoxTryRelocateDown: @ 0x08081EB4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _08081EC4
	movs r0, #0
	b _08081EDE
_08081EC4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x80
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081EDC
	adds r0, r2, #0
	bl _call_via_r1
_08081EDC:
	movs r0, #1
_08081EDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateLeft
HelpBoxTryRelocateLeft: @ 0x08081EE4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08081EF4
	movs r0, #0
	b _08081F0E
_08081EF4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081F0C
	adds r0, r2, #0
	bl _call_via_r1
_08081F0C:
	movs r0, #1
_08081F0E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxTryRelocateRight
HelpBoxTryRelocateRight: @ 0x08081F14
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _08081F24
	movs r0, #0
	b _08081F3E
_08081F24:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081F3C
	adds r0, r2, #0
	bl _call_via_r1
_08081F3C:
	movs r0, #1
_08081F3E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start HelpBoxLockHelper_Loop
HelpBoxLockHelper_Loop: @ 0x08081F44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08081F64 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08081F5E
	adds r0, r2, #0
	bl Proc_Break
_08081F5E:
	pop {r0}
	bx r0
	.align 2, 0
_08081F64: .4byte 0x08B857F8

	thumb_func_start sub_08081F68
sub_08081F68: @ 0x08081F68
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
	bl StartHelpBox
	ldr r0, _08081F9C @ =0x08CC207C
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08081F9C: .4byte 0x08CC207C

	thumb_func_start HelpPrompt_OnIdle
HelpPrompt_OnIdle: @ 0x08081FA0
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _08081FB8 @ =0x08CC208C
	movs r0, #0
	str r0, [sp]
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08081FB8: .4byte 0x08CC208C

	thumb_func_start StartHelpPromptSprite
StartHelpPromptSprite: @ 0x08081FBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08081FE4 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08081FD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_08081FD8:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081FE4: .4byte 0x08CC209C

	thumb_func_start sub_08081FE8
sub_08081FE8: @ 0x08081FE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08082010 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08082004
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_StartBlocking
_08082004:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08082010: .4byte 0x08CC209C

	thumb_func_start EndHelpPromptSprite
EndHelpPromptSprite: @ 0x08082014
	push {lr}
	ldr r0, _08082028 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082024
	bl Proc_End
_08082024:
	pop {r0}
	bx r0
	.align 2, 0
_08082028: .4byte 0x08CC209C

	thumb_func_start MoveHelpPromptSprite
MoveHelpPromptSprite: @ 0x0808202C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08082048 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082040
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
_08082040:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082048: .4byte 0x08CC209C

	thumb_func_start GetLastHelpBoxInfo
GetLastHelpBoxInfo: @ 0x0808204C
	ldr r0, _08082054 @ =0x0203E690
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08082054: .4byte 0x0203E690

	thumb_func_start PutChapterTitlePalette
PutChapterTitlePalette: @ 0x08082058
	push {lr}
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08082074
	ldr r0, _08082070 @ =0x08402230
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080820C0
	.align 2, 0
_08082070: .4byte 0x08402230
_08082074:
	movs r0, #1
	ands r0, r2
	ldr r3, _080820C4 @ =0x083FE438
	cmp r0, #0
	beq _08082080
	ldr r3, _080820C8 @ =0x083FE2F8
_08082080:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0808208A
	adds r3, #0x40
_0808208A:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08082094
	adds r3, #0x80
_08082094:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808209E
	adds r3, #0xc0
_0808209E:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080820AC
	movs r0, #0x80
	lsls r0, r0, #1
	adds r3, r3, r0
_080820AC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080820B6
	adds r3, #0x20
_080820B6:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_080820C0:
	pop {r0}
	bx r0
	.align 2, 0
_080820C4: .4byte 0x083FE438
_080820C8: .4byte 0x083FE2F8

	thumb_func_start sub_080820CC
sub_080820CC: @ 0x080820CC
	movs r2, #0
	ldr r1, _080820E4 @ =0x08CC2784
	cmp r0, #0
	beq _080820E0
_080820D4:
	ldrb r3, [r1, #4]
	adds r2, r3, r2
	adds r1, #8
	subs r0, #1
	cmp r0, #0
	bne _080820D4
_080820E0:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_080820E4: .4byte 0x08CC2784

	thumb_func_start sub_080820E8
sub_080820E8: @ 0x080820E8
	push {lr}
	sub sp, #0x20
	adds r2, r0, #0
	ldrb r1, [r2]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082102
	adds r0, r1, #0
	subs r0, #0x41
	b _08082162
_08082102:
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08082114
	ldrb r0, [r2]
	subs r0, #0x47
	b _08082162
_08082114:
	adds r0, r1, #0
	subs r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08082126
	ldrb r0, [r2]
	adds r0, #4
	b _08082162
_08082126:
	adds r0, r1, #0
	cmp r0, #0x2d
	bne _08082130
	movs r0, #0x3e
	b _08082162
_08082130:
	cmp r0, #0x27
	bne _08082138
	movs r0, #0x3f
	b _08082162
_08082138:
	cmp r0, #0x3a
	bne _08082140
	movs r0, #0x40
	b _08082162
_08082140:
	cmp r0, #0x2e
	bne _08082148
	movs r0, #0x41
	b _08082162
_08082148:
	cmp r0, #0x20
	beq _08082160
	ldr r1, _0808215C @ =0x08404BA0
	ldrb r2, [r2]
	mov r0, sp
	bl sub_080C0088
	movs r0, #1
	rsbs r0, r0, #0
	b _08082162
	.align 2, 0
_0808215C: .4byte 0x08404BA0
_08082160:
	movs r0, #0x80
_08082162:
	add sp, #0x20
	pop {r1}
	bx r1

	thumb_func_start sub_08082168
sub_08082168: @ 0x08082168
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	str r3, [sp, #8]
	adds r0, r4, #0
	bl sub_080820CC
	movs r1, #0xff
	ands r1, r0
	str r1, [sp, #0xc]
	asrs r0, r0, #8
	lsls r0, r0, #4
	str r0, [sp, #0x10]
	lsls r4, r4, #3
	ldr r0, _08082198 @ =0x08CC2784
	adds r6, r4, r0
	ldrb r2, [r6, #6]
	b _0808220E
	.align 2, 0
_08082198: .4byte 0x08CC2784
_0808219C:
	movs r5, #0
	adds r1, r2, #1
	str r1, [sp, #0x14]
	ldrb r0, [r6, #5]
	cmp r5, r0
	bge _0808220C
	ldr r1, [sp, #0x10]
	adds r0, r1, r2
	asrs r1, r0, #3
	lsls r1, r1, #0xa
	mov sl, r1
	movs r7, #7
	ands r0, r7
	lsls r0, r0, #2
	mov sb, r0
	asrs r0, r2, #3
	lsls r0, r0, #0xa
	mov r8, r0
	ands r2, r7
	lsls r2, r2, #2
	mov ip, r2
_080821C6:
	ldr r2, [sp, #0xc]
	adds r0, r2, r5
	ldr r1, [sp, #8]
	adds r4, r1, r5
	asrs r1, r0, #3
	lsls r1, r1, #5
	ldr r2, [sp]
	adds r1, r2, r1
	add r1, sl
	add r1, sb
	ands r0, r7
	lsls r3, r0, #2
	movs r0, #0xf
	lsls r0, r3
	ldr r2, [r1]
	ands r2, r0
	cmp r2, #0
	beq _08082204
	asrs r0, r4, #3
	lsls r0, r0, #5
	ldr r1, [sp, #4]
	adds r0, r1, r0
	add r0, r8
	add r0, ip
	lsrs r2, r3
	ands r4, r7
	lsls r1, r4, #2
	lsls r2, r1
	ldr r1, [r0]
	orrs r1, r2
	str r1, [r0]
_08082204:
	adds r5, #1
	ldrb r2, [r6, #5]
	cmp r5, r2
	blt _080821C6
_0808220C:
	ldr r2, [sp, #0x14]
_0808220E:
	ldrb r0, [r6, #7]
	cmp r2, r0
	blt _0808219C
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08082224
sub_08082224: @ 0x08082224
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0
	b _08082288
_0808222E:
	adds r0, r6, #0
	bl sub_080820E8
	cmp r0, #0x80
	bne _08082250
	cmp r4, r5
	bls _08082246
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	b _08082286
_08082246:
	adds r0, r5, #3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r4, r5, #0
	b _08082286
_08082250:
	lsls r1, r0, #3
	ldr r0, _08082268 @ =0x08CC2784
	adds r2, r1, r0
	ldrb r0, [r2]
	subs r1, r4, r0
	ldrb r3, [r2, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _0808226C
	adds r5, r4, #0
	b _0808226E
	.align 2, 0
_08082268: .4byte 0x08CC2784
_0808226C:
	adds r4, r5, #0
_0808226E:
	adds r0, r4, #0
	adds r0, #0xff
	ldrb r1, [r2, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r2, [r2, #3]
	adds r0, r2, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08082286:
	adds r6, #1
_08082288:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08082292
	cmp r0, #0x1f
	bne _0808222E
_08082292:
	adds r1, r4, r5
	asrs r1, r1, #1
	movs r0, #0xc0
	subs r0, r0, r1
	asrs r0, r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080822A4
sub_080822A4: @ 0x080822A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _080822AE
	movs r4, #0x4a
_080822AE:
	cmp r4, #0x4b
	beq _080822D0
	cmp r4, #0x4b
	bgt _080822BC
	cmp r4, #0x4a
	beq _080822C2
	b _080822E8
_080822BC:
	cmp r4, #0x4c
	beq _080822DC
	b _080822E8
_080822C2:
	ldr r0, _080822CC @ =0x000005D2
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822CC: .4byte 0x000005D2
_080822D0:
	ldr r0, _080822D8 @ =0x000005D3
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822D8: .4byte 0x000005D3
_080822DC:
	ldr r0, _080822E4 @ =0x000005D4
	bl DecodeMsg
	b _08082302
	.align 2, 0
_080822E4: .4byte 0x000005D4
_080822E8:
	movs r0, #0x7f
	ands r0, r4
	bl GetChapterInfo
	asrs r1, r4, #7
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #1
	adds r0, #0x70
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
_08082302:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start PutChapterTitleGfx
PutChapterTitleGfx: @ 0x08082308
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080822A4
	adds r7, r0, #0
	lsls r0, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r1, r1, r0
	mov r8, r1
	adds r0, r7, #0
	bl sub_08082224
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	ldr r1, _08082354 @ =0x0203E698
	ldr r2, _08082358 @ =0x000003FF
	adds r0, r2, #0
	ands r4, r0
	movs r0, #0
	strh r4, [r1, #2]
	str r0, [sp]
	ldr r2, _0808235C @ =0x01000200
	mov r0, sp
	mov r1, r8
	bl CpuFastSet
	ldr r0, _08082360 @ =0x0840260C
	ldr r1, _08082364 @ =0x02020140
	bl Decompress
	b _080823C6
	.align 2, 0
_08082354: .4byte 0x0203E698
_08082358: .4byte 0x000003FF
_0808235C: .4byte 0x01000200
_08082360: .4byte 0x0840260C
_08082364: .4byte 0x02020140
_08082368:
	adds r0, r7, #0
	bl sub_080820E8
	adds r2, r0, #0
	cmp r2, #0x80
	bne _08082386
	cmp r6, r5
	bls _0808237C
	adds r0, r6, #3
	b _0808237E
_0808237C:
	adds r0, r5, #3
_0808237E:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	b _080823C4
_08082386:
	lsls r1, r2, #3
	ldr r0, _0808239C @ =0x08CC2784
	adds r4, r1, r0
	ldrb r3, [r4]
	subs r1, r6, r3
	ldrb r3, [r4, #1]
	subs r0, r5, r3
	cmp r1, r0
	ble _080823A0
	adds r5, r6, #0
	b _080823A2
	.align 2, 0
_0808239C: .4byte 0x08CC2784
_080823A0:
	adds r6, r5, #0
_080823A2:
	ldr r0, _080823DC @ =0x02020140
	mov r1, r8
	adds r3, r6, #0
	bl sub_08082168
	adds r0, r6, #0
	adds r0, #0xff
	ldrb r1, [r4, #2]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0xff
	ldrb r4, [r4, #3]
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080823C4:
	adds r7, #1
_080823C6:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080823D0
	cmp r0, #0x1f
	bne _08082368
_080823D0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080823DC: .4byte 0x02020140

	thumb_func_start PutChapterTitleBG
PutChapterTitleBG: @ 0x080823E0
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082404 @ =0x0203E698
	ldr r0, _08082408 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808240C @ =0x084017F4
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082404: .4byte 0x0203E698
_08082408: .4byte 0x000003FF
_0808240C: .4byte 0x084017F4

	thumb_func_start PutChapterTitleUnkBG
PutChapterTitleUnkBG: @ 0x08082410
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082434 @ =0x0203E698
	ldr r0, _08082438 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808243C @ =0x08401C2C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082434: .4byte 0x0203E698
_08082438: .4byte 0x000003FF
_0808243C: .4byte 0x08401C2C

	thumb_func_start PutChapterTitleNameTsa
PutChapterTitleNameTsa: @ 0x08082440
	adds r2, r0, #0
	ldr r0, _0808245C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	movs r1, #0x3f
_0808244C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808244C
	bx lr
	.align 2, 0
_0808245C: .4byte 0x0203E698

	thumb_func_start PutChapterTitleBgTsa
PutChapterTitleBgTsa: @ 0x08082460
	adds r2, r0, #0
	ldr r0, _0808247C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r0, r0, r1
	movs r1, #0x7f
_0808246C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808246C
	bx lr
	.align 2, 0
_0808247C: .4byte 0x0203E698

	thumb_func_start PutChapterTitleBgUnkTsa
PutChapterTitleBgUnkTsa: @ 0x08082480
	push {lr}
	adds r2, r1, #0
	ldr r1, _0808249C @ =0x0840213C
	ldr r3, _080824A0 @ =0x0203E698
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl TmApplyTsa_thm
	pop {r0}
	bx r0
	.align 2, 0
_0808249C: .4byte 0x0840213C
_080824A0: .4byte 0x0203E698

	thumb_func_start GetChapterTitle
GetChapterTitle: @ 0x080824A4
	adds r1, r0, #0
	cmp r1, #0
	bne _080824AE
	movs r0, #0x4a
	b _080824D0
_080824AE:
	movs r0, #0x20
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080824BC
	movs r0, #0x4b
	b _080824D0
_080824BC:
	ldrb r0, [r1, #0x1b]
	cmp r0, #3
	beq _080824C8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	b _080824D0
_080824C8:
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	movs r1, #0x80
	orrs r0, r1
_080824D0:
	bx lr
	.align 2, 0

	thumb_func_start sub_080824D4
sub_080824D4: @ 0x080824D4
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r5, [sp, #0x14]
	ldr r4, [sp, #0x18]
	asrs r1, r2, #3
	lsls r1, r1, #5
	adds r0, r0, r1
	asrs r1, r3, #3
	lsls r1, r1, #0xa
	adds r0, r0, r1
	movs r6, #7
	ands r3, r6
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r2, r6
	lsls r2, r2, #2
	movs r1, #0xf
	lsls r1, r2
	ldr r3, [r0]
	ands r3, r1
	cmp r3, #0
	beq _08082520
	asrs r1, r5, #3
	lsls r1, r1, #5
	adds r1, r7, r1
	asrs r0, r4, #3
	lsls r0, r0, #0xa
	adds r1, r1, r0
	ands r4, r6
	lsls r0, r4, #2
	adds r1, r1, r0
	lsrs r3, r2
	ands r5, r6
	lsls r0, r5, #2
	lsls r3, r0
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_08082520:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadHelpBoxGfx
LoadHelpBoxGfx: @ 0x08082528
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _08082534
	ldr r7, _080825A0 @ =0x06013000
_08082534:
	cmp r5, #0
	bge _0808253A
	movs r5, #5
_0808253A:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _080825A4 @ =0x083FD764
	adds r1, r7, #0
	bl Decompress
	ldr r0, _080825A8 @ =0x08403A6C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _080825AC @ =0x0203E6A0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x28
	bl InitSpriteText
	movs r0, #0
	bl SetTextFont
	ldr r0, _080825B0 @ =0x081946B4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080825A0: .4byte 0x06013000
_080825A4: .4byte 0x083FD764
_080825A8: .4byte 0x08403A6C
_080825AC: .4byte 0x0203E6A0
_080825B0: .4byte 0x081946B4

	thumb_func_start sub_080825B4
sub_080825B4: @ 0x080825B4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	cmp r7, #0
	bne _080825C0
	ldr r7, _08082628 @ =0x06013000
_080825C0:
	cmp r5, #0
	bge _080825C6
	movs r5, #5
_080825C6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	ldr r0, _0808262C @ =0x083FD764
	adds r1, r7, #0
	bl Decompress
	ldr r0, _08082630 @ =0x08403A6C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r7, r2
	bl Decompress
	ldr r6, _08082634 @ =0x0203E6A0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r6, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r6, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetTextFont
	ldr r0, _08082638 @ =0x081946B4
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r4
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082628: .4byte 0x06013000
_0808262C: .4byte 0x083FD764
_08082630: .4byte 0x08403A6C
_08082634: .4byte 0x0203E6A0
_08082638: .4byte 0x081946B4

	thumb_func_start PutSpriteTalkBox
PutSpriteTalkBox: @ 0x0808263C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r0
	mov sb, r1
	adds r7, r2, #0
	mov r8, r3
	cmp r7, #0x1f
	bgt _08082656
	movs r7, #0x20
_08082656:
	cmp r7, #0xc0
	ble _0808265C
	movs r7, #0xc0
_0808265C:
	mov r0, r8
	cmp r0, #0xf
	bgt _08082666
	movs r1, #0x10
	mov r8, r1
_08082666:
	mov r3, r8
	cmp r3, #0x30
	ble _08082670
	movs r0, #0x30
	mov r8, r0
_08082670:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808267A
	adds r0, #0x1f
_0808267A:
	asrs r0, r0, #5
	mov r1, r8
	adds r1, #0xf
	cmp r1, #0
	bge _08082686
	adds r1, #0xf
_08082686:
	asrs r1, r1, #4
	str r1, [sp, #4]
	subs r6, r0, #1
	str r6, [sp, #0x18]
	mov r1, sb
	subs r1, #8
	str r1, [sp, #0x14]
	mov r3, sb
	add r3, r8
	str r3, [sp, #0xc]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0x10]
	mov r1, sl
	adds r1, r1, r7
	str r1, [sp, #8]
	cmp r6, #0
	blt _080826F2
_080826AA:
	ldr r5, [sp, #4]
	subs r4, r6, #1
	cmp r5, #0
	blt _080826EC
_080826B2:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _080826BC
	adds r1, r7, #0
_080826BC:
	subs r1, #0x20
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _080826C8
	mov r0, r8
_080826C8:
	subs r0, #0x10
	add r1, sl
	mov r3, sb
	adds r2, r3, r0
	ldr r3, _080827F0 @ =0x0203E6A0
	lsls r0, r6, #2
	ldrh r3, [r3, #0x30]
	adds r0, r3, r0
	lsls r3, r5, #6
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0
	ldr r3, _080827F4 @ =0x08B905F8
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _080826B2
_080826EC:
	adds r6, r4, #0
	cmp r6, #0
	bge _080826AA
_080826F2:
	ldr r6, [sp, #0x18]
	cmp r6, #0
	blt _08082734
	ldr r5, _080827F0 @ =0x0203E6A0
_080826FA:
	adds r0, r6, #1
	lsls r1, r0, #5
	cmp r1, r7
	ble _08082704
	adds r1, r7, #0
_08082704:
	subs r1, #0x20
	mov r0, sl
	adds r4, r0, r1
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, _080827F8 @ =0x08B90608
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	ldr r3, _080827FC @ =0x08B90618
	bl PutSprite
	subs r6, #1
	cmp r6, #0
	bge _080826FA
_08082734:
	ldr r5, [sp, #4]
	cmp r5, #0
	blt _08082776
	ldr r6, _080827F0 @ =0x0203E6A0
_0808273C:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _08082746
	mov r0, r8
_08082746:
	subs r0, #0x10
	mov r1, sb
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, _08082800 @ =0x08B905D0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r4, #0
	ldr r3, _08082804 @ =0x08B90620
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808273C
_08082776:
	ldr r3, _08082808 @ =0x08B905B0
	ldr r4, _080827F0 @ =0x0203E6A0
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _0808280C @ =0x08B90628
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x14]
	bl PutSprite
	ldr r3, _08082810 @ =0x08B90630
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r3, _08082814 @ =0x08B90638
	ldrh r0, [r4, #0x30]
	adds r0, #0x3e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl PutSprite
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _080827DE
	mov r2, sb
	subs r2, #0xb
	ldr r3, _080827F4 @ =0x08B905F8
	ldr r0, _08082818 @ =0x000003FF
	ldrh r4, [r4, #0x30]
	ands r0, r4
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
_080827DE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080827F0: .4byte 0x0203E6A0
_080827F4: .4byte 0x08B905F8
_080827F8: .4byte 0x08B90608
_080827FC: .4byte 0x08B90618
_08082800: .4byte 0x08B905D0
_08082804: .4byte 0x08B90620
_08082808: .4byte 0x08B905B0
_0808280C: .4byte 0x08B90628
_08082810: .4byte 0x08B90630
_08082814: .4byte 0x08B90638
_08082818: .4byte 0x000003FF

	thumb_func_start DrawHelpBoxWeaponLabels
DrawHelpBoxWeaponLabels: @ 0x0808281C
	push {r4, lr}
	ldr r4, _08082898 @ =0x0203E6B8
	bl GetItemType
	bl GetItemKindString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _0808289C @ =0x0000110C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A0 @ =0x0000110E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	adds r4, #8
	ldr r0, _080828A4 @ =0x0000110F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828A8 @ =0x00001104
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080828AC @ =0x0000110D
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #8
	bl Text_InsertDrawString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082898: .4byte 0x0203E6B8
_0808289C: .4byte 0x0000110C
_080828A0: .4byte 0x0000110E
_080828A4: .4byte 0x0000110F
_080828A8: .4byte 0x00001104
_080828AC: .4byte 0x0000110D

	thumb_func_start DrawHelpBoxWeaponStats
DrawHelpBoxWeaponStats: @ 0x080828B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082928 @ =0x0203E6B8
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082928: .4byte 0x0203E6B8

	thumb_func_start DrawHelpBoxStaffLabels
DrawHelpBoxStaffLabels: @ 0x0808292C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082984 @ =0x0203E6B8
	ldr r0, _08082988 @ =0x00001115
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _0808298C @ =0x0000110C
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082984: .4byte 0x0203E6B8
_08082988: .4byte 0x00001115
_0808298C: .4byte 0x0000110C

	thumb_func_start DrawHelpBoxSaveMenuLabels
DrawHelpBoxSaveMenuLabels: @ 0x08082990
	push {r4, lr}
	ldr r1, _080829DC @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080829EC
	ldr r4, _080829E0 @ =0x0203E6B8
	movs r0, #0x88
	lsls r0, r0, #5
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E4 @ =0x000012AF
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #8
	bl Text_InsertDrawString
	ldr r0, _080829E8 @ =0x000010F2
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #8
	bl Text_InsertDrawString
	b _08082A00
	.align 2, 0
_080829DC: .4byte 0x0202BBF8
_080829E0: .4byte 0x0203E6B8
_080829E4: .4byte 0x000012AF
_080829E8: .4byte 0x000010F2
_080829EC:
	ldr r4, _08082A08 @ =0x0203E6B8
	ldr r0, _08082A0C @ =0x00001290
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
_08082A00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082A08: .4byte 0x0203E6B8
_08082A0C: .4byte 0x00001290

	thumb_func_start DrawHelpBoxSaveMenuStats
DrawHelpBoxSaveMenuStats: @ 0x08082A10
	push {r4, r5, r6, r7, lr}
	ldr r7, _08082A6C @ =0x0202BBF8
	adds r5, r7, #0
	adds r5, #0x2b
	movs r0, #1
	ldrb r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _08082AC8
	bl GetTacticianName
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	bne _08082A7C
	ldr r4, _08082A70 @ =0x0203E6B8
	ldr r5, _08082A74 @ =0x0000127C
	adds r0, r5, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawString
	ldr r0, _08082A78 @ =0x0000127E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawString
	b _08082AC8
	.align 2, 0
_08082A6C: .4byte 0x0202BBF8
_08082A70: .4byte 0x0203E6B8
_08082A74: .4byte 0x0000127C
_08082A78: .4byte 0x0000127E
_08082A7C:
	ldr r4, _08082AD0 @ =0x0203E6B8
	ldr r1, _08082AD4 @ =0x081C3AC0
	ldrb r5, [r5]
	lsrs r0, r5, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080A6DD0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r7, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x8a
	movs r2, #7
	adds r3, r6, #0
	bl Text_InsertDrawString
_08082AC8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082AD0: .4byte 0x0203E6B8
_08082AD4: .4byte 0x081C3AC0

	thumb_func_start HelpBoxTextScroll_OnLoop
HelpBoxTextScroll_OnLoop: @ 0x08082AD8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08082B66
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _08082B60
	adds r5, r4, #0
	adds r5, #0x5c
_08082B0E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _08082B30
	cmp r2, #1
	bgt _08082B22
	cmp r2, #0
	beq _08082B28
	b _08082B40
_08082B22:
	cmp r2, #4
	beq _08082B3C
	b _08082B40
_08082B28:
	adds r0, r4, #0
	bl Proc_Break
	b _08082B60
_08082B30:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08082B56
_08082B3C:
	adds r0, r3, #1
	b _08082B54
_08082B40:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_DrawCharacter
_08082B54:
	str r0, [r4, #0x2c]
_08082B56:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _08082B0E
_08082B60:
	movs r0, #0
	bl SetTextFont
_08082B66:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxDrawOneLineExt
HelpBoxDrawOneLineExt: @ 0x08082B6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetTextFont
	movs r6, #0
_08082B78:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r1, [r5, #4]
	lsls r0, r1, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetCursor
_08082B94:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _08082BB4
	cmp r1, #1
	bgt _08082BA6
	cmp r1, #0
	beq _08082BCC
	b _08082BC0
_08082BA6:
	cmp r1, #5
	bgt _08082BC0
	cmp r1, #4
	blt _08082BC0
	adds r0, #1
	str r0, [r4, #0x2c]
	b _08082B94
_08082BB4:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _08082B78
	b _08082BCC
_08082BC0:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_DrawCharacter
	str r0, [r4, #0x2c]
	b _08082B94
_08082BCC:
	ldr r0, [r4, #0x30]
	bl SetTextFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start HelpBoxSetupstringLines
HelpBoxSetupstringLines: @ 0x08082BD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C00 @ =0x0203E6A0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	adds r1, r0, #0
	cmp r1, #1
	beq _08082C16
	cmp r1, #1
	bgt _08082C04
	cmp r1, #0
	beq _08082C0E
	b _08082C38
	.align 2, 0
_08082C00: .4byte 0x0203E6A0
_08082C04:
	cmp r1, #2
	beq _08082C24
	cmp r1, #3
	beq _08082C2C
	b _08082C38
_08082C0E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08082C38
_08082C16:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponLabels
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _08082C36
_08082C24:
	adds r0, r4, #0
	bl DrawHelpBoxStaffLabels
	b _08082C30
_08082C2C:
	bl DrawHelpBoxSaveMenuLabels
_08082C30:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_08082C36:
	strh r0, [r1]
_08082C38:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HelpBoxDrawstring
HelpBoxDrawstring: @ 0x08082C4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08082C68 @ =0x0203E6A0
	bl SetTextFont
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	cmp r0, #1
	beq _08082C6C
	cmp r0, #3
	beq _08082C74
	b _08082C78
	.align 2, 0
_08082C68: .4byte 0x0203E6A0
_08082C6C:
	adds r0, r4, #0
	bl DrawHelpBoxWeaponStats
	b _08082C78
_08082C74:
	bl DrawHelpBoxSaveMenuStats
_08082C78:
	movs r0, #0
	bl SetTextFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

