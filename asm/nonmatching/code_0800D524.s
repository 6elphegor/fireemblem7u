	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnInTeam
EvtCmd_GotoIfnInTeam: @ 0x0800D524
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r6, [r0, #8]
	movs r4, #1
_0800D52E:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800D552
	ldr r2, [r0]
	cmp r2, #0
	beq _0800D552
	ldr r0, [r0, #0xc]
	movs r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800D552
	ldrb r0, [r2, #4]
	cmp r0, r6
	bne _0800D552
	movs r0, #0
	b _0800D562
_0800D552:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D52E
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	adds r0, r5, #0
	bl EventGotoLabel
_0800D562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
