	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemDrawPopupBox
PrepItemDrawPopupBox: @ 0x08092CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r2, #0
	bgt _08092CD2
	b _08092EB2
_08092CD2:
	cmp r3, #0
	bgt _08092CD8
	b _08092EB2
_08092CD8:
	ldr r5, _08092EC4 @ =0x08B905B0
	ldr r0, [sp, #0x3c]
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [sp, #8]
	lsls r1, r1, #3
	mov sb, r1
	ldr r4, [sp, #4]
	add r4, sb
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, r2
	ldr r3, [sp, #0x3c]
	str r3, [sp]
	movs r0, #4
	mov r2, sl
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r4, r4, r0
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r6, sl
	add r6, r8
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r3, r0
	ldr r2, [sp, #0x3c]
	str r2, [sp]
	movs r0, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #1
	mov r3, sb
	str r3, [sp, #0x18]
	mov sb, r8
	ldr r0, [sp, #8]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r5, r0
	bge _08092D8C
	ldr r1, _08092EC8 @ =0x08B905E8
	mov r8, r1
	ldr r7, [sp, #0x3c]
	adds r7, #1
	ldr r2, [sp, #4]
	ldr r3, _08092ECC @ =0x00002008
	adds r6, r2, r3
	adds r4, r2, #0
	adds r4, #8
_08092D62:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #0x10
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08092D62
_08092D8C:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _08092DD4
	ldr r2, _08092EC4 @ =0x08B905B0
	mov r8, r2
	ldr r7, [sp, #0x3c]
	adds r7, #1
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r1, r3
	ldr r2, [sp, #4]
	adds r6, r0, r2
	adds r4, r1, r2
	ldr r3, [sp, #8]
	subs r5, r3, r5
_08092DAC:
	str r7, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	add r2, sb
	mov r3, r8
	bl PutSpriteExt
	adds r6, #8
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08092DAC
_08092DD4:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _08092E18
	ldr r7, _08092EC4 @ =0x08B905B0
	ldr r5, [sp, #0x3c]
	adds r5, #3
	mov r4, sl
	adds r4, #8
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x18]
	adds r1, r1, r2
	mov r8, r1
	adds r6, r0, #0
	subs r6, #1
_08092DF0:
	str r5, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	str r5, [sp]
	movs r0, #4
	movs r1, #0x80
	lsls r1, r1, #5
	add r1, r8
	adds r2, r4, #0
	adds r3, r7, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _08092DF0
_08092E18:
	movs r6, #1
	ldr r3, [sp, #0xc]
	cmp r6, r3
	bge _08092EB2
	ldr r0, [sp, #8]
	subs r0, #3
	mov sb, r0
	ldr r1, [sp, #0x3c]
	adds r1, #4
	mov r8, r1
_08092E2C:
	movs r5, #1
	adds r2, r6, #1
	str r2, [sp, #0x14]
	cmp r5, sb
	bge _08092E56
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_08092E3C:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _08092ED0 @ =0x08B90608
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, sb
	blt _08092E3C
_08092E56:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _08092E80
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_08092E64:
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _08092EC8 @ =0x08B905E8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _08092E64
_08092E80:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _08092EAA
	lsls r0, r5, #3
	ldr r2, [sp, #4]
	adds r4, r0, r2
	lsls r6, r6, #3
	subs r5, r1, r5
_08092E90:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _08092EC4 @ =0x08B905B0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08092E90
_08092EAA:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _08092E2C
_08092EB2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092EC4: .4byte 0x08B905B0
_08092EC8: .4byte 0x08B905E8
_08092ECC: .4byte 0x00002008
_08092ED0: .4byte 0x08B90608
