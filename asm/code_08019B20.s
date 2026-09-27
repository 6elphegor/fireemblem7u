	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTerrainHealAmount
GetTerrainHealAmount: @ 0x08019B20
	ldr r1, _08019B2C @ =0x08BE47C4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019B2C: .4byte 0x08BE47C4
