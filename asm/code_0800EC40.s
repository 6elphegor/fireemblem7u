	.include "macro.inc"

	.syntax unified

	thumb_func_start Event00_
Event00_: @ 0x0800EC40
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0800EC5A
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x30]
	str r5, [r4, #0x34]
	str r5, [r4, #0x38]
	movs r5, #1
	b _0800EC60
_0800EC5A:
	adds r0, r4, #0
	bl Proc_Break
_0800EC60:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800EC84
	ldr r0, _0800EC80 @ =0x08B907C0
	bl Proc_Find
	cmp r0, #0
	beq _0800EC92
	bl ClearTalk
	b _0800EC92
	.align 2, 0
_0800EC80: .4byte 0x08B907C0
_0800EC84:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0800EC92
	adds r0, r4, #0
	bl EventClearTalkDisplayed
_0800EC92:
	cmp r5, #0
	bne _0800EC9A
	movs r0, #2
	b _0800EC9C
_0800EC9A:
	movs r0, #1
_0800EC9C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
