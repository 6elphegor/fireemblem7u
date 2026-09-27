	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryMoveTowards
AiTryMoveTowards: @ 0x08036B00
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
	ldr r1, _08036B5C @ =0x03004690
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _08036B60
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _08036B60
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _08036CB8
	.align 2, 0
_08036B5C: .4byte 0x03004690
_08036B60:
	cmp r4, #0
	beq _08036B84
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _08036B80 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl MapFloodRange_Unitless
	b _08036B94
	.align 2, 0
_08036B80: .4byte 0x03004690
_08036B84:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08036BC4 @ =0x03004690
	ldr r2, [r2]
	bl AiMapFloodRangeFrom
_08036B94:
	ldr r4, _08036BC4 @ =0x03004690
	ldr r0, [r4]
	bl RevertMapChange
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08036BC8 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _08036BCC @ =0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _08036BD0 @ =0x0202E3D8
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _08036C90
	.align 2, 0
_08036BC4: .4byte 0x03004690
_08036BC8: .4byte 0x0202E3E8
_08036BCC: .4byte 0x0000FFFF
_08036BD0: .4byte 0x0202E3D8
_08036BD4:
	ldr r0, _08036CC8 @ =0x0202E3D8
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _08036C8C
	asrs r0, r7, #0xe
	mov r8, r0
_08036BEA:
	ldr r0, _08036CCC @ =0x0202E3E4
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	lsls r2, r4, #0x10
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036C80
	ldr r0, _08036CD0 @ =0x0202E3DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _08036C16
	ldr r0, _08036CD4 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08036C80
_08036C16:
	mov r1, sl
	cmp r1, #0
	bne _08036C4A
	ldr r0, _08036CD8 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08036CDC @ =0x0203A8EC
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _08036C4A
	ldr r0, _08036CE0 @ =0x0202E3F4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _08036C80
_08036C4A:
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
	beq _08036C80
	ldr r0, _08036CE4 @ =0x0202E3E8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, sb
	bhi _08036C80
	ldrb r0, [r0]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_08036C80:
	ldr r1, _08036CE8 @ =0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _08036BEA
_08036C8C:
	ldr r1, _08036CE8 @ =0xFFFF0000
	adds r0, r7, r1
_08036C90:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08036BD4
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08036CB8
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
_08036CB8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036CC8: .4byte 0x0202E3D8
_08036CCC: .4byte 0x0202E3E4
_08036CD0: .4byte 0x0202E3DC
_08036CD4: .4byte 0x0202BD48
_08036CD8: .4byte 0x03004690
_08036CDC: .4byte 0x0203A8EC
_08036CE0: .4byte 0x0202E3F4
_08036CE4: .4byte 0x0202E3E8
_08036CE8: .4byte 0xFFFF0000
