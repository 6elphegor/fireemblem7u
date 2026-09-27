	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089CA8
sub_08089CA8: @ 0x08089CA8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08089D30
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _08089CF8
_08089CDA:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08089D20 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_08089CF8:
	cmp r4, r0
	bge _08089D04
	ldr r0, _08089D24 @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089CDA
_08089D04:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _08089D28 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089D44
	ldr r0, _08089D2C @ =0x0000038B
	bl m4aSongNumStart
	b _08089D44
	.align 2, 0
_08089D20: .4byte 0x02022C60
_08089D24: .4byte 0x0200E668
_08089D28: .4byte 0x0202BBF8
_08089D2C: .4byte 0x0000038B
_08089D30:
	ldr r0, _08089D4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089D44
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08089D44:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089D4C: .4byte 0x0202BBF8
