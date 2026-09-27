	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A63C
sub_0804A63C: @ 0x0804A63C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804A662
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl sub_0804A8B0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	b _0804A726
_0804A662:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804A672
	adds r0, r5, #0
	bl EndMenu
	b _0804A726
_0804A672:
	adds r0, r5, #0
	bl sub_0804A73C
	adds r0, r5, #0
	bl sub_0804A820
	adds r4, r0, #0
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0804A68E
	adds r0, r5, #0
	bl EndMenu
_0804A68E:
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0804A6A8
	ldr r0, _0804A730 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A6A8
	ldr r0, _0804A734 @ =0x0000038A
	bl m4aSongNumStart
_0804A6A8:
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0804A6C2
	ldr r0, _0804A730 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A6C2
	ldr r0, _0804A738 @ =0x0000038B
	bl m4aSongNumStart
_0804A6C2:
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0804A6CE
	bl ClearUi
_0804A6CE:
	movs r6, #0x20
	adds r0, r4, #0
	ands r0, r6
	cmp r0, #0
	beq _0804A6DE
	movs r0, #0
	bl EndFaceById
_0804A6DE:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0804A6F2
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0x80
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804A6F2:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _0804A726
	adds r1, r5, #0
	adds r1, #0x63
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A726
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804A8B0
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_0804AB58
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl PutUiHand
_0804A726:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A730: .4byte 0x0202BBF8
_0804A734: .4byte 0x0000038A
_0804A738: .4byte 0x0000038B
