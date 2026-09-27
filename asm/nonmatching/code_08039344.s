	.include "macro.inc"

	.syntax unified

	thumb_func_start AiGetFriendZoneCombatPositionScoreComponent
AiGetFriendZoneCombatPositionScoreComponent: @ 0x08039344
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _08039394 @ =0x08B98A60
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _08039398 @ =0x0000270F
	cmp r0, r1
	beq _080393B0
	mov r8, r1
_0803935E:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _0803939C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080393A6
	ldr r0, _080393A0 @ =0x0202BD48
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080393A4
	adds r5, #5
	b _080393A6
	.align 2, 0
_08039394: .4byte 0x08B98A60
_08039398: .4byte 0x0000270F
_0803939C: .4byte 0x0202E3DC
_080393A0: .4byte 0x0202BD48
_080393A4:
	subs r5, #5
_080393A6:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _0803935E
_080393B0:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
