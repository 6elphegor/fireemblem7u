	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToRefreshTargetList
TryAddUnitToRefreshTargetList: @ 0x08024434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024474 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802446C
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802446C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_0802446C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024474: .4byte 0x02033E40
