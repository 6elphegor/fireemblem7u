	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803B83C
sub_0803B83C: @ 0x0803B83C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0803B910 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetActiveFactionAlliance
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt _0803B876
	b _0803B99E
_0803B876:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne _0803B88E
	b _0803B994
_0803B88E:
	ldr r0, [r7]
	cmp r0, #0
	bne _0803B896
	b _0803B994
_0803B896:
	ldr r0, [r7, #0xc]
	ldr r1, _0803B914 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803B994
	adds r0, r7, #0
	bl sub_0803C08C
	ldr r0, _0803B918 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803B96E
_0803B8B2:
	ldr r0, _0803B918 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov sb, r0
	cmp r4, #0
	blt _0803B968
	ldr r3, _0803B91C @ =0x0202E3E8
	lsls r5, r6, #2
_0803B8C6:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r1, [r2]
	cmp r1, #0x78
	bhi _0803B962
	ldr r0, _0803B920 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B924
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0803B962
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble _0803B962
	ldrb r1, [r1]
	mov r8, r1
	b _0803B962
	.align 2, 0
_0803B910: .4byte 0x03004690
_0803B914: .4byte 0x00010025
_0803B918: .4byte 0x0202E3D8
_0803B91C: .4byte 0x0202E3E8
_0803B920: .4byte 0x0202E3DC
_0803B924:
	ldr r0, _0803B9A8 @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803B962
	ldr r0, _0803B9AC @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble _0803B962
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble _0803B962
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
_0803B962:
	subs r4, #1
	cmp r4, #0
	bge _0803B8C6
_0803B968:
	mov r6, sb
	cmp r6, #0
	bge _0803B8B2
_0803B96E:
	mov r0, r8
	cmp r0, #0xff
	beq _0803B994
	ldr r1, [sp, #4]
	cmp r1, r8
	blo _0803B994
	mov r0, sl
	cmp r0, #0xff
	beq _0803B994
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
_0803B994:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge _0803B99E
	b _0803B876
_0803B99E:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _0803B9B0
	movs r0, #0
	b _0803B9B2
	.align 2, 0
_0803B9A8: .4byte 0x0202E3E0
_0803B9AC: .4byte 0x0202E3E4
_0803B9B0:
	movs r0, #1
_0803B9B2:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
