	.include "macro.inc"

	.syntax unified

	thumb_func_start TryMoveUnitDisplayed
TryMoveUnitDisplayed: @ 0x0800CB74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r0, #0
	mov sb, r0
	cmp r5, #0xff
	bne _0800CB9C
	movs r5, #1
	rsbs r5, r5, #0
_0800CB9C:
	cmp r4, #0xff
	bne _0800CBA4
	movs r4, #1
	rsbs r4, r4, #0
_0800CBA4:
	bl DisableAllLightRunes
	lsls r7, r5, #0x10
	lsls r2, r4, #0x10
	lsrs r0, r7, #0x10
	orrs r0, r2
	str r0, [sp]
	ldr r0, _0800CBD0 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r3, r0, r5
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, #0
	bne _0800CBD4
	movs r1, #1
	mov sb, r1
	mov r2, sb
	strb r2, [r3]
	b _0800CBE0
	.align 2, 0
_0800CBD0: .4byte 0x0202E3E0
_0800CBD4:
	asrs r1, r7, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	mov r3, sp
	bl AiGetUnitClosestValidPosition
_0800CBE0:
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r2, [r6, #4]
	ldr r2, [r2, #0x38]
	bl MapFloodRange_Unitless
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, sp
	movs r2, #2
	ldrsh r1, [r1, r2]
	ldr r7, _0800CC54 @ =0x02033E00
	adds r2, r7, #0
	bl BuildBestMoveScript
	mov r0, sb
	cmp r0, #0
	beq _0800CC18
	ldr r0, _0800CC58 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_0800CC18:
	mov r1, sl
	adds r1, #0x5e
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800CC30
	movs r0, #0x40
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800CC30:
	bl EnableAllLightRunes
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl DisplayMovement
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CC54: .4byte 0x02033E00
_0800CC58: .4byte 0x0202E3E0
