	.include "macro.inc"

	.syntax unified

	thumb_func_start EventStartCgTalk
EventStartCgTalk: @ 0x0800FEF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl ApplySystemObjectsGraphics
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl InitTalk
	movs r0, #1
	bl EnableBgSync
	cmp r4, #0
	beq _0800FF1A
	cmp r4, #1
	beq _0800FF34
	b _0800FF50
_0800FF1A:
	str r7, [sp]
	ldr r0, _0800FF88 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #3
	movs r1, #2
	movs r2, #0x14
	movs r3, #4
	bl StartCgText
_0800FF34:
	str r7, [sp]
	ldr r0, _0800FF88 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl StartCgText
_0800FF50:
	ldr r0, _0800FF8C @ =Event_CgTalkOnSkip
	str r0, [r6, #0x40]
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FF66
	movs r0, #0x40
	orrs r5, r0
_0800FF66:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FF7A
	ldr r0, _0800FF90 @ =0x00002820
	orrs r5, r0
	adds r0, r6, #0
	bl EventForceSlowTextSpeed
_0800FF7A:
	adds r0, r5, #0
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF88: .4byte 0x06011000
_0800FF8C: .4byte Event_CgTalkOnSkip
_0800FF90: .4byte 0x00002820
