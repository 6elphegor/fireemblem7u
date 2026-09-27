	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnitsAlive
EvtCmd_LoadUnitsAlive: @ 0x0800CDA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CDD4 @ =0x0202E3F4
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800CDDC
	ldr r0, _0800CDD8 @ =EventUnitLoadAliveWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CDE4
	.align 2, 0
_0800CDD4: .4byte 0x0202E3F4
_0800CDD8: .4byte EventUnitLoadAliveWait
_0800CDDC:
	adds r0, r4, #0
	bl EventUnitLoadAliveWait
	movs r0, #0
_0800CDE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
