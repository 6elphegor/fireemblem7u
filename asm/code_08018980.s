	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08018980
sub_08018980: @ 0x08018980
	push {r4, r5, r6, lr}
	bl sub_0807A8B8
	movs r4, #1
	ldr r5, _080189B4 @ =0x08B92EB0
_0801898A:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _080189F2
	ldr r0, [r2]
	cmp r0, #0
	beq _080189F2
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080189B8
	adds r0, r2, #0
	bl ClearUnit
	b _080189F2
	.align 2, 0
_080189B4: .4byte 0x08B92EB0
_080189B8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080189C8
	movs r0, #8
	orrs r1, r0
	b _080189CE
_080189C8:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
_080189CE:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _080189E4
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r1, r0
	b _080189E8
_080189E4:
	ldr r0, _08018A64 @ =0xFFFEFFFF
	ands r1, r0
_080189E8:
	str r1, [r2, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
_080189F2:
	adds r4, #1
	cmp r4, #0x3f
	ble _0801898A
	ldr r1, _08018A68 @ =0x0202BBF8
	movs r0, #0x10
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08018A34
	movs r3, #1
	ldr r6, _08018A6C @ =0x08B92EB0
	movs r5, #0xff
	movs r4, #0
_08018A0C:
	adds r0, r3, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018A2E
	ldr r0, [r2]
	cmp r0, #0
	beq _08018A2E
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r0]
	strb r1, [r2, #0x10]
	ldrb r1, [r0, #1]
	strb r1, [r2, #0x11]
	strh r4, [r0]
_08018A2E:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018A0C
_08018A34:
	movs r4, #0x41
	ldr r5, _08018A6C @ =0x08B92EB0
_08018A38:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018A52
	ldr r0, [r1]
	cmp r0, #0
	beq _08018A52
	adds r0, r1, #0
	bl ClearUnit
_08018A52:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018A38
	bl sub_08079214
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018A64: .4byte 0xFFFEFFFF
_08018A68: .4byte 0x0202BBF8
_08018A6C: .4byte 0x08B92EB0
