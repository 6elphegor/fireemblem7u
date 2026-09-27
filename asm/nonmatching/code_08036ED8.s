	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetUnitClosestValidPosition
AiGetUnitClosestValidPosition: @ 0x08036ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	adds r6, r3, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r5, r2, #0x10
	ldr r2, _08036F2C @ =0x0202E3DC
	ldr r0, [r2]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, _08036F30 @ =0x0202E3F4
	ldr r0, [r7]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, _08036F34 @ =0x0202E3F0
	ldr r0, [r0]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _08036F38
	mov r1, r8
	strh r1, [r6]
	strh r3, [r6, #2]
	b _08037030
	.align 2, 0
_08036F2C: .4byte 0x0202E3DC
_08036F30: .4byte 0x0202E3F4
_08036F34: .4byte 0x0202E3F0
_08036F38:
	ldr r0, [sp, #8]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MapFloodRange_Unitless
	ldr r0, [sp, #8]
	bl MapFloodUnitExtended
	movs r2, #0x7c
	str r2, [sp]
	ldr r0, _08036F60 @ =0x0000FFFF
	strh r0, [r6]
	ldr r1, _08036F64 @ =0x0202E3D8
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036FFE
	.align 2, 0
_08036F60: .4byte 0x0000FFFF
_08036F64: .4byte 0x0202E3D8
_08036F68:
	ldr r4, _08037014 @ =0x0202E3D8
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r5, #0x10
	str r7, [sp, #8]
	cmp r1, #0
	blt _08036FF8
	asrs r3, r7, #0xe
	ldr r0, _08037018 @ =0x0202E3E4
	str r0, [sp, #4]
	ldr r2, _0803701C @ =0x0202E3DC
	mov sl, r2
	ldr r7, _08037020 @ =0x0202E3F4
	mov sb, r7
	ldr r0, _08037024 @ =0x0202E3F0
	mov r8, r0
	ldr r2, _08037028 @ =0x0202E3E8
	mov ip, r2
_08036F92:
	ldr r7, [sp, #4]
	ldr r0, [r7]
	adds r0, r3, r0
	asrs r2, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036FEA
	mov r1, sl
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, sb
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _08036FEA
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r7, [sp]
	cmp r2, r7
	bhi _08036FEA
	ldrb r0, [r0]
	str r0, [sp]
	strh r4, [r6]
	strh r5, [r6, #2]
_08036FEA:
	lsls r0, r4, #0x10
	ldr r1, _0803702C @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036F92
_08036FF8:
	ldr r2, [sp, #8]
	ldr r4, _0803702C @ =0xFFFF0000
	adds r0, r2, r4
_08036FFE:
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _08036F68
	movs r7, #0
	ldrsh r1, [r6, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08037030
	movs r0, #0
	b _08037032
	.align 2, 0
_08037014: .4byte 0x0202E3D8
_08037018: .4byte 0x0202E3E4
_0803701C: .4byte 0x0202E3DC
_08037020: .4byte 0x0202E3F4
_08037024: .4byte 0x0202E3F0
_08037028: .4byte 0x0202E3E8
_0803702C: .4byte 0xFFFF0000
_08037030:
	movs r0, #1
_08037032:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
