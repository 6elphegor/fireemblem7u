	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToHammerneTargetList
TryAddUnitToHammerneTargetList: @ 0x08024970
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08024990 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsSameFaction
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080249C0
	movs r5, #0
	b _08024996
	.align 2, 0
_08024990: .4byte 0x02033E40
_08024994:
	adds r5, #1
_08024996:
	cmp r5, #4
	bgt _080249C0
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemRepairable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024994
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080249C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
