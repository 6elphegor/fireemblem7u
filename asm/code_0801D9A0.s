	.include "macro.inc"

	.syntax unified

	thumb_func_start SendToConvoyMenu_NormalEffect
SendToConvoyMenu_NormalEffect: @ 0x0801D9A0
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _0801D9E8 @ =0x03004690
	ldr r1, [r5]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl AddItemToConvoy
	ldr r3, _0801D9EC @ =0x0203A85C
	ldr r0, [r5]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r3, #6]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl UnitRemoveItem
	ldr r0, [r5]
	ldr r1, _0801D9F0 @ =0x0202BBB8
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
	movs r0, #0x37
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801D9E8: .4byte 0x03004690
_0801D9EC: .4byte 0x0203A85C
_0801D9F0: .4byte 0x0202BBB8
