	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMenu_CtrlLoop
PrepMenu_CtrlLoop: @ 0x0808FB98
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov sb, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl ShowSysHandCursor
	ldrb r5, [r5]
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0808FC0C
	ldr r2, _0808FC08 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	bne _0808FBFE
	b _0808FD24
_0808FBFE:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _0808FDCC
	.align 2, 0
_0808FC08: .4byte 0x08B857F8
_0808FC0C:
	ldr r1, _0808FC34 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0808FC38
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _0808FC24
	b _0808FDCC
_0808FC24:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _0808FDCC
	.align 2, 0
_0808FC34: .4byte 0x08B857F8
_0808FC38:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _0808FC84
	adds r1, r5, #0
	adds r1, #0x38
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0808FD08
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _0808FD08
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _0808FC7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808FC74
	b _0808FDCC
_0808FC74:
	ldr r0, _0808FC80 @ =0x0000038A
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FC7C: .4byte 0x0202BBF8
_0808FC80: .4byte 0x0000038A
_0808FC84:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0808FCC8
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _0808FC94
	b _0808FDCC
_0808FC94:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FD08
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0808FCC0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808FCB6
	b _0808FDCC
_0808FCB6:
	ldr r0, _0808FCC4 @ =0x0000038B
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FCC0: .4byte 0x0202BBF8
_0808FCC4: .4byte 0x0000038B
_0808FCC8:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0808FD24
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _0808FDCC
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808FD08
	ldr r0, _0808FD00 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FCF4
	ldr r0, _0808FD04 @ =0x0000038A
	bl m4aSongNumStart
_0808FCF4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _0808FDCC
	.align 2, 0
_0808FD00: .4byte 0x0202BBF8
_0808FD04: .4byte 0x0000038A
_0808FD08:
	ldr r0, _0808FD20 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FDCC
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
	b _0808FDCC
	.align 2, 0
_0808FD20: .4byte 0x0202BBF8
_0808FD24:
	ldr r3, [r1]
	movs r6, #0x40
	adds r0, r6, #0
	ldrh r2, [r3, #6]
	ands r0, r2
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _0808FD50
	ldrb r0, [r5]
	cmp r0, #0
	bne _0808FD4C
	adds r0, r6, #0
	ldrh r3, [r3, #8]
	ands r0, r3
	cmp r0, #0
	beq _0808FD50
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_0808FD4C:
	subs r0, #1
	strb r0, [r5]
_0808FD50:
	ldr r1, [r1]
	movs r2, #0x80
	adds r0, r2, #0
	ldrh r3, [r1, #6]
	ands r0, r3
	cmp r0, #0
	beq _0808FD7E
	ldrb r3, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _0808FD70
	adds r0, r3, #1
	b _0808FD7C
_0808FD70:
	adds r0, r2, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0808FD7E
	movs r0, #0
_0808FD7C:
	strb r0, [r5]
_0808FD7E:
	ldrb r0, [r5]
	cmp sb, r0
	beq _0808FDCC
	ldr r0, _0808FDD8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FD96
	ldr r0, _0808FDDC @ =0x00000386
	bl m4aSongNumStart
_0808FD96:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808FDCC
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_0808FDCC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FDD8: .4byte 0x0202BBF8
_0808FDDC: .4byte 0x00000386
