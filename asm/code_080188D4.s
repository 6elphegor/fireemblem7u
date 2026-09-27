	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080188D4
sub_080188D4: @ 0x080188D4
	push {r4, r5, lr}
	movs r3, #1
	ldr r5, _08018904 @ =0x0202BBF8
	ldr r4, _08018908 @ =0x08B92EB0
_080188DC:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018932
	ldr r0, [r2]
	cmp r0, #0
	beq _08018932
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801890C
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _08018910
	.align 2, 0
_08018904: .4byte 0x0202BBF8
_08018908: .4byte 0x08B92EB0
_0801890C:
	ldr r0, _08018928 @ =0xFFDFFFFF
	ands r1, r0
_08018910:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0801892C
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	b _08018930
	.align 2, 0
_08018928: .4byte 0xFFDFFFFF
_0801892C:
	ldr r0, _08018978 @ =0xFBFFFFFF
	ands r1, r0
_08018930:
	str r1, [r2, #0xc]
_08018932:
	adds r3, #1
	cmp r3, #0x3f
	ble _080188DC
	movs r0, #0x10
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _0801896E
	movs r3, #1
	ldr r5, _0801897C @ =0x08B92EB0
	movs r4, #0xff
_08018948:
	adds r0, r3, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018968
	ldr r0, [r2]
	cmp r0, #0
	beq _08018968
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r2, #0x10]
	strb r1, [r0]
	ldrb r1, [r2, #0x11]
	strb r1, [r0, #1]
_08018968:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018948
_0801896E:
	bl sub_0807A8B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018978: .4byte 0xFBFFFFFF
_0801897C: .4byte 0x08B92EB0
