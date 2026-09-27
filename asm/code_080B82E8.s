	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitForCharacterEnding
GetUnitForCharacterEnding: @ 0x080B82E8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080B82EE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B8316
	ldr r0, [r2]
	cmp r0, #0
	beq _080B8316
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080B8316
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080B831C
	adds r0, r2, #0
	b _080B831E
_080B8316:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B82EE
_080B831C:
	movs r0, #0
_080B831E:
	pop {r4, r5}
	pop {r1}
	bx r1
