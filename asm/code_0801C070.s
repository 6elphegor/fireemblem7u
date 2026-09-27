	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C070
sub_0801C070: @ 0x0801C070
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0801C13C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	movs r0, #0xcd
	lsls r0, r0, #2
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0801C15A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0801C0B4
	ldr r3, _0801C140 @ =0x0202BBF8
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	cmp r0, #0
	ble _0801C0B4
	subs r1, r0, #1
	cmp r1, #0xff
	ble _0801C0A4
	movs r1, #0xff
_0801C0A4:
	ldr r7, _0801C144 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C148 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C0B4:
	ldr r1, [r4]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C0E0
	ldr r3, _0801C140 @ =0x0202BBF8
	ldrh r2, [r3, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	adds r1, r0, #1
	cmp r1, #0xff
	ble _0801C0D0
	movs r1, #0xff
_0801C0D0:
	ldr r7, _0801C144 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _0801C148 @ =0xFFFFE00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0x2c]
_0801C0E0:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801C0FC
	ldr r1, _0801C140 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0801C0FC:
	ldr r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r3, [r2, #6]
	ands r0, r3
	cmp r0, #0
	beq _0801C116
	ldr r1, _0801C140 @ =0x0202BBF8
	adds r1, #0x2b
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
	strb r0, [r1]
_0801C116:
	movs r0, #4
	ldrh r2, [r2, #6]
	ands r0, r2
	cmp r0, #0
	beq _0801C152
	ldr r0, _0801C140 @ =0x0202BBF8
	adds r3, r0, #0
	adds r3, #0x2b
	ldrb r2, [r3]
	lsrs r1, r2, #4
	cmp r1, #0xa
	bgt _0801C14C
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	b _0801C150
	.align 2, 0
_0801C13C: .4byte 0x08B857F8
_0801C140: .4byte 0x0202BBF8
_0801C144: .4byte 0x000001FF
_0801C148: .4byte 0xFFFFE00F
_0801C14C:
	movs r0, #0xf
	ands r0, r2
_0801C150:
	strb r0, [r3]
_0801C152:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801BF54
_0801C15A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
