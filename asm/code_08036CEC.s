	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryMoveTowardsNeglectWall
AiTryMoveTowardsNeglectWall: @ 0x08036CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _08036D48 @ =0x03004690
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08036D4C
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08036D4C
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _08036EA4
	.align 2, 0
_08036D48: .4byte 0x03004690
_08036D4C:
	cmp r4, #0
	beq _08036D70
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08036D6C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GenerateExtendedMovementMapOnRangeNeglectWall
	b _08036D80
	.align 2, 0
_08036D6C: .4byte 0x03004690
_08036D70:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08036DB0 @ =0x03004690
	ldr r2, [r2]
	bl sub_0803BF8C
_08036D80:
	ldr r4, _08036DB0 @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08036DB4 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _08036DB8 @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _08036DBC @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036E7C
	.align 2, 0
_08036DB0: .4byte 0x03004690
_08036DB4: .4byte 0x0202E3E8
_08036DB8: .4byte 0x0000FFFF
_08036DBC: .4byte 0x0202E3D8
_08036DC0:
	ldr r0, _08036EB4 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08036E78
	asrs r0, r7, #0xe
	mov r8, r0
_08036DD6:
	ldr r0, _08036EB8 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036E6C
	ldr r0, _08036EBC @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _08036E02
	ldr r0, _08036EC0 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08036E6C
_08036E02:
	mov r1, sl
	cmp r1, #0
	bne _08036E36
	ldr r0, _08036EC4 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08036EC8 @ =0x0203A8EC
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _08036E36
	ldr r0, _08036ECC @ =0x0202E3F4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08036E6C
_08036E36:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl AiCheckDangerAt
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _08036E6C
	ldr r0, _08036ED0 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08036E6C
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08036E6C:
	ldr r1, _08036ED4 @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036DD6
_08036E78:
	ldr r1, _08036ED4 @ =0xFFFF0000
	adds r0, r7, r1
_08036E7C:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08036DC0
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08036EA4
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_08036EA4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036EB4: .4byte 0x0202E3D8
_08036EB8: .4byte 0x0202E3E4
_08036EBC: .4byte 0x0202E3DC
_08036EC0: .4byte 0x0202BD48
_08036EC4: .4byte 0x03004690
_08036EC8: .4byte 0x0203A8EC
_08036ECC: .4byte 0x0202E3F4
_08036ED0: .4byte 0x0202E3E8
_08036ED4: .4byte 0xFFFF0000
