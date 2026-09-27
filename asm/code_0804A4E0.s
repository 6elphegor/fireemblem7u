	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A4E0
sub_0804A4E0: @ 0x0804A4E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A5CE
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r6, #0
	adds r2, #0x2e
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x2f
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r4, [r6, #0x30]
	ldrb r4, [r4, #4]
	str r4, [sp]
	bl DrawUiFrame2
	movs r7, #0
	adds r0, r6, #0
	adds r0, #0x60
	mov r8, r0
	movs r0, #0x61
	adds r0, r0, r6
	mov sb, r0
	mov r1, r8
	ldrb r1, [r1]
	cmp r7, r1
	bge _0804A5BC
_0804A542:
	lsls r1, r7, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #0x10]
	cmp r2, #0
	beq _0804A55E
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r2
	b _0804A5B2
_0804A55E:
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0804A56E
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r1, #8]
	bl Text_SetColor
_0804A56E:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804A582
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl Text_SetColor
_0804A582:
	ldr r1, [r5, #0x30]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0804A5B2
	adds r4, r5, #0
	adds r4, #0x34
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0804A5DC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0804A5B2:
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804A542
_0804A5BC:
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r6, #0
	movs r2, #1
	bl sub_0804A5E0
	movs r0, #3
	bl EnableBgSync
_0804A5CE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A5DC: .4byte 0x02022C60
