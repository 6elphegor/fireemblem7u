	.include "macro.inc"

	.syntax unified

	thumb_func_start KillAllRedUnits_Init
KillAllRedUnits_Init: @ 0x08032970
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	movs r4, #0x81
_0803297E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080329AE
	ldr r0, [r2]
	cmp r0, #0
	beq _080329AE
	ldr r0, [r2, #0xc]
	ldr r1, _080329C4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080329AE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0xb]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0
	bl EnlistTarget
_080329AE:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803297E
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080329C4: .4byte 0x0001000C
