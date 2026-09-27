	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809835C
sub_0809835C: @ 0x0809835C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r2, r6, #0
	adds r2, #0x38
	adds r2, r2, r0
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _080983FC @ =0x020117E4
	ldrh r2, [r2]
	lsls r4, r2, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_0809120C
	cmp r5, #0
	bne _080983A4
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_080983A4:
	adds r0, r6, #0
	bl sub_08097CAC
	ldr r0, _08098400 @ =0x02022EA4
	ldr r4, _08098404 @ =0x02012B78
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl DrawPrepScreenItems
	adds r4, #0x28
	ldr r1, _08098408 @ =0x02023C7E
	ldrb r7, [r7]
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r2, r0, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_08095CA8
	ldr r0, _0809840C @ =PrepItemList_DrawCurrentOwnerText
	movs r1, #1
	adds r2, r6, #0
	bl StartParallelFiniteLoop
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08098410 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080983F4
	ldr r0, _08098414 @ =0x0000038A
	bl m4aSongNumStart
_080983F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080983FC: .4byte 0x020117E4
_08098400: .4byte 0x02022EA4
_08098404: .4byte 0x02012B78
_08098408: .4byte 0x02023C7E
_0809840C: .4byte PrepItemList_DrawCurrentOwnerText
_08098410: .4byte 0x0202BBF8
_08098414: .4byte 0x0000038A
