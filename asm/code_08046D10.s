	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046D10
sub_08046D10: @ 0x08046D10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _08046D7C @ =0x0203DC9C
	ldr r0, _08046D80 @ =0x0203D90C
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _08046D84 @ =0x0202BBF8
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _08046D88
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge _08046D68
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_08046D58:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046D62
	adds r5, r1, #0
_08046D62:
	adds r1, #1
	cmp r1, r3
	blt _08046D58
_08046D68:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08046D96
	.align 2, 0
_08046D7C: .4byte 0x0203DC9C
_08046D80: .4byte 0x0203D90C
_08046D84: .4byte 0x0202BBF8
_08046D88:
	ldrb r0, [r3, #0xf]
	bl sub_08044B34
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
_08046D96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
