	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098EA8
sub_08098EA8: @ 0x08098EA8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _08098ECC @ =0x08B857F8
	ldr r1, [r6]
	ldrh r3, [r1, #8]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08098ED0
	cmp r5, #0
	bne _08098EDC
	adds r0, r2, #0
	bl sub_08098E18
	b _08098F46
	.align 2, 0
_08098ECC: .4byte 0x08B857F8
_08098ED0:
	movs r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08098F00
_08098EDC:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08098EF8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F46
	ldr r0, _08098EFC @ =0x0000038B
	bl m4aSongNumStart
	b _08098F46
	.align 2, 0
_08098EF8: .4byte 0x0202BBF8
_08098EFC: .4byte 0x0000038B
_08098F00:
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098F0C
	strb r3, [r4]
_08098F0C:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08098F1C
	movs r0, #1
	strb r0, [r4]
_08098F1C:
	ldrb r0, [r4]
	cmp r5, r0
	beq _08098F46
	ldr r0, _08098F4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F34
	ldr r0, _08098F50 @ =0x00000387
	bl m4aSongNumStart
_08098F34:
	ldrb r4, [r4]
	lsls r0, r4, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x7c
	movs r2, #0
	bl ShowSysHandCursor
_08098F46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098F4C: .4byte 0x0202BBF8
_08098F50: .4byte 0x00000387
