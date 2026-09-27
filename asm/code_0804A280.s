	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingMenuExt
StartLockingMenuExt: @ 0x0804A280
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	mov sl, r1
	adds r4, r2, #0
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	str r0, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	adds r0, #1
	mov sb, r0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0804A2E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A2CA
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0804A2CA:
	cmp r4, #0
	beq _0804A2E8
	ldr r0, _0804A2E4 @ =0x08B9A8A0
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0
	b _0804A2FC
	.align 2, 0
_0804A2E0: .4byte 0x0202BBF8
_0804A2E4: .4byte 0x08B9A8A0
_0804A2E8:
	bl LockGame
	ldr r0, _0804A418 @ =0x08B9A8A0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #1
_0804A2FC:
	strb r0, [r1]
	mov r1, sl
	asrs r0, r1, #0x18
	str r0, [sp, #8]
	cmp r0, #0
	bge _0804A314
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0804A314:
	movs r7, #0
	movs r3, #0
	str r3, [sp]
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0xc]
	mov r2, sl
	lsls r2, r2, #0x10
	str r2, [sp, #0x18]
	adds r3, r5, #0
	adds r3, #0x60
	str r3, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x61
	str r2, [sp, #0x10]
	adds r3, #2
	str r3, [sp, #0x14]
	cmp r0, #0
	beq _0804A3CA
	movs r6, #0
_0804A33C:
	adds r0, r1, r6
	adds r1, r7, #0
	bl OverriddenMenuAvailability
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0804A35E
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r6, r0
	ldr r2, [r0, #0xc]
	adds r1, r7, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804A35E:
	cmp r4, #3
	beq _0804A3BA
	ldr r0, _0804A41C @ =0x08B9A8E0
	adds r1, r5, #0
	bl Proc_Start
	adds r2, r0, #0
	ldr r3, [sp]
	lsls r1, r3, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
	adds r3, #1
	str r3, [sp]
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r2, #0x30]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r7, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r3, sp
	ldrh r3, [r3, #4]
	strh r3, [r2, #0x2a]
	mov r0, sb
	strh r0, [r2, #0x2c]
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804A3B6
	adds r0, r2, #0
	adds r0, #0x34
	mov r2, sl
	lsls r1, r2, #8
	asrs r1, r1, #0x18
	subs r1, #2
	bl InitText
_0804A3B6:
	movs r3, #2
	add sb, r3
_0804A3BA:
	adds r6, #0x24
	adds r7, #1
	mov r0, r8
	ldr r1, [r0, #8]
	adds r0, r6, r1
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0804A33C
_0804A3CA:
	mov r1, r8
	str r1, [r5, #0x30]
	mov r2, sl
	str r2, [r5, #0x2c]
	movs r2, #0
	mov r3, sp
	ldrb r0, [r3]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r1, [sp, #0x10]
	strb r2, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r0, [sp, #0x18]
	asrs r1, r0, #0x18
	ldr r3, [sp, #8]
	adds r0, r1, r3
	cmp r0, sb
	bge _0804A3FE
	subs r0, r1, #1
	mov r1, sb
	subs r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0804A3FE:
	ldr r0, _0804A420 @ =0x08B857F8
	ldr r0, [r0]
	strh r2, [r0, #8]
	adds r0, r5, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804A418: .4byte 0x08B9A8A0
_0804A41C: .4byte 0x08B9A8E0
_0804A420: .4byte 0x08B857F8
