	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemList_DrawCurrentOwnerText
PrepItemList_DrawCurrentOwnerText: @ 0x0809759C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _080975E8 @ =0x02022CD0
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r7, _080975EC @ =0x02012B70
	adds r0, r7, #0
	bl ClearText
	ldr r0, _080975F0 @ =0x02012466
	ldrh r0, [r0]
	cmp r0, r4
	bgt _080975F8
	ldr r0, _080975F4 @ =0x0000127D
	bl DecodeMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _0809761C
	.align 2, 0
_080975E8: .4byte 0x02022CD0
_080975EC: .4byte 0x02012B70
_080975F0: .4byte 0x02012466
_080975F4: .4byte 0x0000127D
_080975F8:
	ldr r0, _08097624 @ =0x020117E4
	ldrb r6, [r6]
	lsls r1, r6, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _0809762C
	ldr r0, _08097628 @ =0x0000125A
	bl DecodeMsg
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_0809761C:
	movs r3, #0
	bl PutDrawText
	b _0809764C
	.align 2, 0
_08097624: .4byte 0x020117E4
_08097628: .4byte 0x0000125A
_0809762C:
	adds r0, r4, #0
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl PutDrawText
_0809764C:
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
