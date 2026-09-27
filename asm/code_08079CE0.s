	.include "macro.inc"

	.syntax unified

	thumb_func_start IsPidBlueDeployed
IsPidBlueDeployed: @ 0x08079CE0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079CE8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079D10
	ldr r2, [r0]
	cmp r2, #0
	beq _08079D10
	ldr r0, [r0, #0xc]
	ldr r1, _08079D0C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08079D10
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _08079D10
	movs r0, #1
	b _08079D18
	.align 2, 0
_08079D0C: .4byte 0x0001000C
_08079D10:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079CE8
	movs r0, #0
_08079D18:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
