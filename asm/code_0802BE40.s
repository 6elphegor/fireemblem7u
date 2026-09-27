	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateRoofedUnits
UpdateRoofedUnits: @ 0x0802BE40
	push {r4, r5, lr}
	movs r5, #1
_0802BE44:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802BE88
	ldr r0, [r4]
	cmp r0, #0
	beq _0802BE88
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0802BE88
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0802BE9C @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _0802BE88
	movs r0, #0x82
	rsbs r0, r0, #0
	ands r3, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r3, r0
	str r3, [r4, #0xc]
_0802BE88:
	adds r5, #1
	cmp r5, #0xbf
	ble _0802BE44
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BE9C: .4byte 0x0202E3E0
