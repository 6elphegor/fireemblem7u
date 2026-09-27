	.include "macro.inc"

	.syntax unified

	thumb_func_start EventEndTalk
EventEndTalk: @ 0x0800BE2C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0800BE52
	bl EndTalk
	adds r0, r4, #0
	bl sub_0800AF20
	movs r0, #0
	str r0, [r4, #0x40]
	b _0800BE6E
_0800BE52:
	bl IsTalkActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BE66
	bl IsTalkLocked
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800BE6E
_0800BE66:
	adds r0, r4, #0
	bl sub_0800AF20
	str r5, [r4, #0x40]
_0800BE6E:
	pop {r4, r5}
	pop {r0}
	bx r0
