	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_BeginSkip
Event_BeginSkip: @ 0x0800B308
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0800B31E
	bl _call_via_r0
_0800B31E:
	adds r5, r4, #0
	adds r5, #0x5e
	movs r0, #4
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	bl sub_0800A4E8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B372
	bl sub_080B5644
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B348
	adds r0, r4, #0
	bl sub_0800B198
	subs r5, #0x11
	b _0800B36E
_0800B348:
	movs r0, #0x20
	ldrh r5, [r5]
	ands r0, r5
	adds r5, r4, #0
	adds r5, #0x4d
	cmp r0, #0
	bne _0800B36E
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0800B366
	adds r0, r4, #0
	bl sub_0800B198
	b _0800B36E
_0800B366:
	ldr r0, _0800B38C @ =sub_0800B198
	adds r1, r4, #0
	bl Event_DarkenThenFunc
_0800B36E:
	movs r0, #1
	strb r0, [r5]
_0800B372:
	movs r0, #5
	bl Proc_BlockEachMarked
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B384
	adds r0, r4, #0
	bl _call_via_r1
_0800B384:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B38C: .4byte sub_0800B198
