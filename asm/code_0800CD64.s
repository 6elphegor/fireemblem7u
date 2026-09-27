	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_LoadUnits
EvtCmd_LoadUnits: @ 0x0800CD64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800CD90 @ =0x0202E3F4
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
	bne _0800CD98
	ldr r0, _0800CD94 @ =EventUnitLoadWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800CDA0
	.align 2, 0
_0800CD90: .4byte 0x0202E3F4
_0800CD94: .4byte EventUnitLoadWait
_0800CD98:
	adds r0, r4, #0
	bl EventUnitLoadWait
	movs r0, #0
_0800CDA0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
