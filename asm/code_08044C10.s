	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044C10
sub_08044C10: @ 0x08044C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08044D04 @ =0x081D54EC
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, _08044D08 @ =0x081D54F4
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl sub_08044BF0
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, _08044D0C @ =0x03001400
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _08044C8C
	adds r0, r5, #0
	bl StartMu
	ldr r1, _08044D10 @ =0x03001420
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl SetMuMoveScript
_08044C8C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshUnitSprites
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, sb
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08044CF4
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, sb
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, sb
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _08044D10 @ =0x03001420
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
_08044CF4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044D04: .4byte 0x081D54EC
_08044D08: .4byte 0x081D54F4
_08044D0C: .4byte 0x03001400
_08044D10: .4byte 0x03001420
