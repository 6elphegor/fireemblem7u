	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A73C
sub_0804A73C: @ 0x0804A73C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x61
	ldrb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x62
	strb r0, [r1]
	ldr r1, _0804A814 @ =0x08B857F8
	ldr r3, [r1]
	ldrh r4, [r3, #6]
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0804A774
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804A76E
	ldrh r3, [r3, #8]
	cmp r4, r3
	bne _0804A80C
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
_0804A76E:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0804A774:
	ldr r1, [r1]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	ands r0, r3
	adds r4, r6, #0
	adds r4, #0x61
	cmp r0, #0
	beq _0804A7A2
	ldrb r2, [r4]
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _0804A79C
	ldrh r1, [r1, #8]
	cmp r3, r1
	bne _0804A80C
	movs r0, #0xff
	strb r0, [r4]
_0804A79C:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0804A7A2:
	adds r0, r6, #0
	adds r0, #0x62
	adds r5, r0, #0
	ldrb r0, [r5]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0804A7D6
	ldrb r1, [r5]
	adds r0, r6, #0
	movs r2, #0
	bl sub_0804A5E0
	ldrb r1, [r4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_0804A5E0
	ldr r0, _0804A818 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A7D6
	ldr r0, _0804A81C @ =0x00000386
	bl m4aSongNumStart
_0804A7D6:
	ldrb r0, [r4]
	ldrb r1, [r5]
	cmp r0, r1
	beq _0804A80C
	lsls r0, r1, #2
	adds r5, r6, #0
	adds r5, #0x34
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804A7F6
	adds r0, r6, #0
	bl _call_via_r2
_0804A7F6:
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804A80C
	adds r0, r6, #0
	bl _call_via_r2
_0804A80C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A814: .4byte 0x08B857F8
_0804A818: .4byte 0x0202BBF8
_0804A81C: .4byte 0x00000386
