	.include "macro.inc"

	.syntax unified

	thumb_func_start EventStartTalk
EventStartTalk: @ 0x0800B90C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _0800B922
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
_0800B922:
	adds r4, r5, #0
	adds r4, #0x5e
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B93A
	adds r0, r5, #0
	bl EventForceSlowTextSpeed
_0800B93A:
	movs r0, #1
	movs r1, #1
	adds r2, r6, #0
	bl StartTalkMsg
	movs r0, #0x80
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0800B954
	movs r0, #4
	bl SetTalkFlag
_0800B954:
	adds r0, r7, #0
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0800B964
	movs r0, #8
	bl SetTalkFlag
_0800B964:
	ldr r0, _0800B970 @ =EventEndTalk
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B970: .4byte EventEndTalk
