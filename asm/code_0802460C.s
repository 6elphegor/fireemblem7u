	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToRestoreTargetList
TryAddUnitToRestoreTargetList: @ 0x0802460C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024658 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024652
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024652
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024652
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08024652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024658: .4byte 0x02033E40
