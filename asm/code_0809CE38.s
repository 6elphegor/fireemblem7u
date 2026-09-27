	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CE38
sub_0809CE38: @ 0x0809CE38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0809CE6C @ =0x08B857F8
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809CE78
	ldr r0, _0809CE70 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CE60
	ldr r0, _0809CE74 @ =0x0000038B
	bl m4aSongNumStart
_0809CE60:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0809CFE8
	.align 2, 0
_0809CE6C: .4byte 0x08B857F8
_0809CE70: .4byte 0x0202BBF8
_0809CE74: .4byte 0x0000038B
_0809CE78:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0809CE8E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0809CFE8
_0809CE8E:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809CEA2
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0809CFE8
_0809CEA2:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809CEB2
	b _0809CFE8
_0809CEB2:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809CEBE
	b _0809CFCC
_0809CEBE:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _0809CEF4
	ldr r0, _0809CEEC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CEE0
	ldr r0, _0809CEF0 @ =0x0000038A
	bl m4aSongNumStart
_0809CEE0:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0809CFE8
	.align 2, 0
_0809CEEC: .4byte 0x0202BBF8
_0809CEF0: .4byte 0x0000038A
_0809CEF4:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809CF0E
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _0809CF0E
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_0809CF0E:
	ldr r0, _0809CFC0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF48
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl GetSupportScreenPartnerSupportLevel
	subs r0, #1
	cmp r4, r0
	bge _0809CF48
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_0809CF48:
	ldr r4, _0809CFC0 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF6A
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r6, #0
	bl sub_0809CB10
_0809CF6A:
	ldr r1, [r4]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0809CF88
	ldrb r0, [r5]
	lsrs r1, r0, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_0809CB10
_0809CF88:
	ldrb r1, [r5]
	cmp r7, r1
	beq _0809CFE8
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl ShowSysHandCursor
	ldr r0, _0809CFC4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CFE8
	ldr r0, _0809CFC8 @ =0x00000385
	bl m4aSongNumStart
	b _0809CFE8
	.align 2, 0
_0809CFC0: .4byte 0x08B857F8
_0809CFC4: .4byte 0x0202BBF8
_0809CFC8: .4byte 0x00000385
_0809CFCC:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809CFE8
	ldr r0, _0809CFF4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CFE8
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0809CFE8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CFF4: .4byte 0x0202BBF8
