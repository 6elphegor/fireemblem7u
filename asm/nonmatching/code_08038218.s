	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08038218
sub_08038218: @ 0x08038218
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _080382F4 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _080382EA
_0803823A:
	ldr r0, _080382F4 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _080382E4
	lsls r6, r5, #2
_0803824C:
	ldr r0, _080382F8 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080382DE
	ldr r0, _080382FC @ =0x0202E3E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080382DE
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080382A4
	ldr r0, _08038300 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080382A4
	ldr r0, _08038304 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080382DE
_080382A4:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080382BE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080382DE
_080382BE:
	ldr r0, _080382F8 @ =0x0202E3E8
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _080382DE
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_080382DE:
	subs r4, #1
	cmp r4, #0
	bge _0803824C
_080382E4:
	mov r5, sl
	cmp r5, #0
	bge _0803823A
_080382EA:
	mov r0, sb
	cmp r0, #0xff
	bne _08038308
	movs r0, #0
	b _0803830A
	.align 2, 0
_080382F4: .4byte 0x0202E3D8
_080382F8: .4byte 0x0202E3E8
_080382FC: .4byte 0x0202E3E0
_08038300: .4byte 0x0202E3DC
_08038304: .4byte 0x03004690
_08038308:
	movs r0, #1
_0803830A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
