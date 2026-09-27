	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitAid
GetUnitAid: @ 0x08018450
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801847A
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	movs r1, #0x13
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	subs r0, #1
	b _080184AC
_0801847A:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r1, r0
	cmp r1, #0
	bne _08018498
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x19
	b _080184AA
_08018498:
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x14
_080184AA:
	subs r0, r0, r1
_080184AC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
