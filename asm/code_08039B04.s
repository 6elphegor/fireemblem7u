	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEquipGetDanger
AiEquipGetDanger: @ 0x08039B04
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _08039C48 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r4, #1
_08039B32:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _08039C22
	ldr r0, [r5]
	cmp r0, #0
	beq _08039C22
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _08039C22
	ldr r0, _08039C4C @ =0x0202BD48
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039C22
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl AiIsWithinFlyingDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039C22
	adds r0, r5, #0
	bl RevertMapChange
	ldr r4, _08039C50 @ =0x0202E3E4
	ldr r1, [r4]
	ldr r7, [sp, #8]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08039C22
	adds r0, r5, #0
	mov r1, sp
	bl StoreItemAndGetUnitAttack
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble _08039BB0
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r2, r6
	ldr r3, [sp, #0xc]
	strh r0, [r3]
_08039BB0:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne _08039BC6
	ldr r7, [sp, #0x10]
	ldrh r7, [r7]
	adds r0, r7, r6
	ldr r1, [sp, #0x10]
	strh r0, [r1]
_08039BC6:
	ldr r1, _08039C54 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _08039C22
	mov sb, r4
	ldr r3, _08039C48 @ =0x0202E3F4
	mov r8, r3
_08039BDA:
	mov r7, sl
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r3, r0, #1
	subs r7, r2, #1
	str r7, [sp, #0x18]
	cmp r3, #0
	blt _08039C1C
	lsls r4, r2, #2
	mov r1, sb
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_08039BF4:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08039C16
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r7, [r0]
	adds r2, r7, r6
	cmp r2, #0xff
	ble _08039C14
	mov r2, ip
_08039C14:
	strb r2, [r0]
_08039C16:
	subs r3, #1
	cmp r3, #0
	bge _08039BF4
_08039C1C:
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bge _08039BDA
_08039C22:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _08039B32
	ldr r3, [sp, #0xc]
	ldrh r7, [r3]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3]
	adds r0, r7, r3
	ldr r7, [sp, #0x3c]
	strh r0, [r7]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039C48: .4byte 0x0202E3F4
_08039C4C: .4byte 0x0202BD48
_08039C50: .4byte 0x0202E3E4
_08039C54: .4byte 0x0202E3D8
