	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForDoorAndBridges
MakeTargetListForDoorAndBridges: @ 0x08024298
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _080242C8 @ =0x02033E40
	str r0, [r1]
	ldr r0, _080242CC @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	cmp r4, #0x14
	beq _080242D4
	cmp r4, #0x1e
	bne _080242DE
	ldr r2, _080242D0 @ =TryAddClosedDoorToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	b _080242DE
	.align 2, 0
_080242C8: .4byte 0x02033E40
_080242CC: .4byte 0x0202E3E8
_080242D0: .4byte TryAddClosedDoorToTargetList
_080242D4:
	ldr r2, _080242E4 @ =TryAddBridgeToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
_080242DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080242E4: .4byte TryAddBridgeToTargetList
