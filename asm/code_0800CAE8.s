	.include "macro.inc"

	.syntax unified

	thumb_func_start TryMoveUnit
TryMoveUnit: @ 0x0800CAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	cmp r5, #0xff
	bne _0800CAFC
	movs r5, #1
	rsbs r5, r5, #0
_0800CAFC:
	cmp r2, #0xff
	bne _0800CB04
	movs r2, #1
	rsbs r2, r2, #0
_0800CB04:
	lsls r6, r5, #0x10
	lsls r3, r2, #0x10
	lsrs r0, r6, #0x10
	orrs r0, r3
	str r0, [sp]
	ldr r0, _0800CB70 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CB40
	cmp r7, #0
	beq _0800CB40
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, r5
	bne _0800CB34
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, r2
	beq _0800CB40
_0800CB34:
	asrs r1, r6, #0x10
	asrs r2, r3, #0x10
	adds r0, r4, #0
	mov r3, sp
	bl AiGetUnitClosestValidPosition
_0800CB40:
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitSyncMovement
	ldr r1, [r4, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CB68
	movs r0, #0xa
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
	bl RefreshEntityMaps
_0800CB68:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB70: .4byte 0x0202E3E0
