	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleApplyItemEffect
BattleApplyItemEffect: @ 0x0802A5EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0802A660 @ =0x0203A50C
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r1, #0x80
	strb r1, [r0, #2]
	bl BattleApplyItemExpGains
	ldr r4, _0802A664 @ =0x0203A3F0
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A650
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A62A
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802A62A:
	ldrh r0, [r5]
	bl GetItemAfterUse
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x1e
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0
	beq _0802A650
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #0
	strb r0, [r1]
_0802A650:
	ldr r0, _0802A668 @ =0x08B942A0
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A660: .4byte 0x0203A50C
_0802A664: .4byte 0x0203A3F0
_0802A668: .4byte 0x08B942A0
