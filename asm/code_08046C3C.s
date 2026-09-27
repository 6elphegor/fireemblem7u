	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046C3C
sub_08046C3C: @ 0x08046C3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _08046C50 @ =0x0203D90C
	ldrb r0, [r1]
	cmp r0, #1
	bne _08046C54
	strb r0, [r1, #0xb]
	b _08046CA6
	.align 2, 0
_08046C50: .4byte 0x0203D90C
_08046C54:
	ldr r2, _08046CB8 @ =0x0203DC9C
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _08046CBC @ =0x0202BBF8
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
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _08046CC0
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge _08046CA4
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_08046C94:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046C9E
	adds r6, r1, #0
_08046C9E:
	adds r1, #1
	cmp r1, r3
	blt _08046C94
_08046CA4:
	strb r6, [r2, #0xf]
_08046CA6:
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _08046CCE
	.align 2, 0
_08046CB8: .4byte 0x0203DC9C
_08046CBC: .4byte 0x0202BBF8
_08046CC0:
	ldrb r0, [r3, #0xf]
	bl sub_08044B34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_08046CCE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
