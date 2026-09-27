	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040640
sub_08040640: @ 0x08040640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _080406BC @ =0x0203D90C
	mov sb, r0
	movs r1, #0x98
	lsls r1, r1, #2
	mov r8, r1
	movs r0, #0xa1
	add r0, sb
	mov sl, r0
	movs r7, #5
_08040660:
	mov r0, sb
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _080406C0 @ =0x08B98AEC
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r0, [r0]
	ldrb r1, [r5]
	cmp r1, r0
	beq _080406F0
	strb r0, [r5]
	lsls r1, r6, #3
	mov r0, sb
	adds r0, #0xc
	adds r4, r1, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi _080406CC
	ldr r1, _080406C4 @ =0x081D5204
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	bl PutDrawTextCentered
	ldr r0, _080406C8 @ =0x081C8164
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080406EA
	.align 2, 0
_080406BC: .4byte 0x0203D90C
_080406C0: .4byte 0x08B98AEC
_080406C4: .4byte 0x081D5204
_080406C8: .4byte 0x081C8164
_080406CC:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	mov r3, sl
	bl PutDrawTextCentered
	lsls r0, r6, #5
	ldr r1, _08040710 @ =0x081C7F04
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
_080406EA:
	movs r0, #1
	bl EnableBgSync
_080406F0:
	movs r1, #0x20
	add r8, r1
	movs r0, #0x13
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08040660
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040710: .4byte 0x081C7F04
