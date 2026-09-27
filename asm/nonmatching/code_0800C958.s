	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MovePidInstant
EvtCmd_MovePidInstant: @ 0x0800C958
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800C980
	ldr r1, _0800C97C @ =0x0000FFFF
	ands r1, r2
	b _0800C984
	.align 2, 0
_0800C97C: .4byte 0x0000FFFF
_0800C980:
	movs r1, #1
	rsbs r1, r1, #0
_0800C984:
	ldr r0, [r4, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, #0
	bne _0800C998
	adds r2, r3, #0
_0800C998:
	adds r0, r5, #0
	movs r3, #1
	bl TryMoveUnit
	bl RefreshUnitSprites
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
