	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_IsSkipAllowed
Event_IsSkipAllowed: @ 0x0800B1C4
	push {lr}
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B1E8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800B1E8
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B1E8
	movs r0, #1
	b _0800B1EA
_0800B1E8:
	movs r0, #0
_0800B1EA:
	pop {r1}
	bx r1
	.align 2, 0
