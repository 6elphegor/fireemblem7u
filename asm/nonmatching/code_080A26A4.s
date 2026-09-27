	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawMinimapInternal
DrawMinimapInternal: @ 0x080A26A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp]
	cmp r4, #0
	bne _080A26BA
	ldr r4, _080A26CC @ =0x06000020
_080A26BA:
	lsls r0, r4, #0xf
	lsrs r7, r0, #0x14
	ldr r0, [sp]
	cmp r0, #0
	bge _080A26C8
	movs r1, #3
	str r1, [sp]
_080A26C8:
	movs r2, #0
	b _080A289E
	.align 2, 0
_080A26CC: .4byte 0x06000020
_080A26D0:
	movs r6, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov r3, r8
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r6, r0
	blt _080A26E2
	b _080A289C
_080A26E2:
	movs r0, #1
	add r0, r8
	mov sb, r0
	mov r1, r8
	lsrs r0, r1, #0x1f
	add r0, r8
	asrs r0, r0, #1
	lsls r0, r0, #5
	str r0, [sp, #4]
	movs r2, #1
	mov sl, r2
_080A26F8:
	adds r0, r6, #0
	mov r1, r8
	bl GetMinimapTerrainCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl GetMinimapTerrainCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl GetMinimapTerrainCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl GetMinimapTerrainCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28BC @ =0x02023460
	asrs r2, r6, #0x1f
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r3, [sp]
	lsls r0, r3, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
	ldr r0, _080A28C0 @ =0x0202E3DC
	ldr r1, [r0]
	mov r3, r8
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r0, [r3]
	adds r1, r0, r6
	ldrb r0, [r1]
	str r2, [sp, #8]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A27D6
	ldr r0, [r3, #4]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A27D6
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _080A288A
_080A27D6:
	adds r0, r6, #0
	mov r1, r8
	bl GetMinimapObjectCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, r8
	bl GetMinimapObjectCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	adds r0, r6, #0
	mov r1, sb
	bl GetMinimapObjectCellAt
	adds r5, r0, #0
	mov r0, sl
	mov r1, sb
	bl GetMinimapObjectCellAt
	adds r1, r0, #0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	adds r5, #4
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	adds r1, #4
	ldrh r0, [r5]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r5, #4]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r1, #4]
	strh r0, [r4]
	adds r4, #2
	ldr r0, _080A28C4 @ =0x02022C60
	ldr r2, [sp, #8]
	subs r1, r6, r2
	asrs r1, r1, #1
	ldr r3, [sp, #4]
	adds r1, r3, r1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0xc
	adds r0, r7, r0
	strh r0, [r1]
	adds r7, #1
_080A288A:
	movs r0, #2
	add sl, r0
	adds r6, #2
	ldr r0, _080A28C8 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r6, r0
	bge _080A289C
	b _080A26F8
_080A289C:
	ldr r2, [sp, #0xc]
_080A289E:
	mov r8, r2
	ldr r1, _080A28C8 @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r8, r0
	bge _080A28AC
	b _080A26D0
_080A28AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A28BC: .4byte 0x02023460
_080A28C0: .4byte 0x0202E3DC
_080A28C4: .4byte 0x02022C60
_080A28C8: .4byte 0x0202E3D8
