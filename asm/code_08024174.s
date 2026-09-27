	.include "macro.inc"

	.syntax unified

	thumb_func_start AddUnitToTargetListIfAllied
AddUnitToTargetListIfAllied: @ 0x08024174
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080241A8 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080241A2
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl EnlistTarget
_080241A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080241A8: .4byte 0x02033E40
