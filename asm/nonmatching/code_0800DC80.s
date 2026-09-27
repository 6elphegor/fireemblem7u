	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetFaction
EvtCmd_SetFaction: @ 0x0800DC80
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x30]
	ldrb r6, [r0, #4]
	ldr r5, [r0, #8]
	movs r4, #1
_0800DC8A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800DCB4
	ldr r3, [r2]
	cmp r3, #0
	beq _0800DCB4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800DCB4
	ldrb r3, [r3, #4]
	cmp r3, r6
	bne _0800DCB4
	adds r0, r2, #0
	adds r1, r5, #0
	bl UnitChangeFaction
_0800DCB4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0800DC8A
	bl RefreshUnitSprites
	movs r0, #2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
