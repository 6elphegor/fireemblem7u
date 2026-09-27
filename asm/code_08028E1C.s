	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitSilencerRate
ComputeBattleUnitSilencerRate: @ 0x08028E1C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r2, r0
	cmp r2, #0
	bne _08028E3E
	adds r0, r3, #0
	adds r0, #0x6c
	strh r2, [r0]
	b _08028E72
_08028E3E:
	adds r2, r3, #0
	adds r2, #0x6c
	movs r0, #0x32
	strh r0, [r2]
	ldr r3, [r4]
	ldr r4, [r4, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08028E5E
	movs r0, #0x19
	strh r0, [r2]
_08028E5E:
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08028E72
	movs r0, #0
	strh r0, [r2]
_08028E72:
	pop {r4}
	pop {r0}
	bx r0
