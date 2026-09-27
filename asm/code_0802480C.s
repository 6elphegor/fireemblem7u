	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToBerserkTargetList
TryAddUnitToBerserkTargetList: @ 0x0802480C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024854 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802484C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0802483A
	cmp r1, #4
	bne _0802484C
_0802483A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802484C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024854: .4byte 0x02033E40
