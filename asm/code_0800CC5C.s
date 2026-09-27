	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayMovement
DisplayMovement: @ 0x0800CC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	adds r0, r5, #0
	bl StartMu
	adds r6, r0, #0
	adds r4, #0x5e
	movs r7, #1
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800CC8E
	adds r0, r6, #0
	bl DisableMuCamera
_0800CC8E:
	ldr r0, _0800CD0C @ =0x08B91A08
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x54]
	adds r0, r5, #0
	bl HideUnitSprite
	ldr r0, [r5, #0xc]
	orrs r0, r7
	str r0, [r5, #0xc]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	str r2, [sp]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r7, _0800CD10 @ =0x0202E3F4
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	add r1, sp, #4
	mov r0, sp
	mov r2, r8
	bl ApplyMoveScriptToCoordinates
	ldr r0, [sp]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #4]
	str r0, [r4, #0x30]
	adds r0, r6, #0
	mov r1, r8
	bl SetMuMoveScript
	mov r0, sb
	cmp r0, #0
	beq _0800CCEA
	adds r0, r6, #0
	mov r1, sb
	bl sub_0806D4CC
_0800CCEA:
	ldr r0, [sp, #4]
	ldr r1, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r1, [r5, #0xb]
	strb r1, [r0]
	movs r0, #1
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CD0C: .4byte 0x08B91A08
_0800CD10: .4byte 0x0202E3F4
