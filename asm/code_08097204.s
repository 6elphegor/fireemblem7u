	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097204
sub_08097204: @ 0x08097204
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r1, [r7]
	lsls r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r0, [r5, #0x2c]
	ldrb r2, [r7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl GetPrepPageForItem
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_08096A98
	bl InitIcons
	ldr r0, _080972CC @ =0x02022EA4
	ldr r4, _080972D0 @ =0x02012B78
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _080972D4 @ =0x02023C7E
	ldrb r6, [r6]
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _080972D8 @ =sub_08096C54
	movs r1, #1
	adds r2, r5, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _080972DC @ =0x0203A85C
	movs r0, #0x19
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _080972AE
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080972E8
_080972AE:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080972E0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08097314
	ldr r0, _080972E4 @ =0x0000038B
	bl m4aSongNumStart
	b _08097314
	.align 2, 0
_080972CC: .4byte 0x02022EA4
_080972D0: .4byte 0x02012B78
_080972D4: .4byte 0x02023C7E
_080972D8: .4byte sub_08096C54
_080972DC: .4byte 0x0203A85C
_080972E0: .4byte 0x0202BBF8
_080972E4: .4byte 0x0000038B
_080972E8:
	ldr r0, _0809731C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080972FA
	ldr r0, _08097320 @ =0x0000038A
	bl m4aSongNumStart
_080972FA:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _08097314
	subs r0, r4, #1
	strb r0, [r7]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
_08097314:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809731C: .4byte 0x0202BBF8
_08097320: .4byte 0x0000038A
