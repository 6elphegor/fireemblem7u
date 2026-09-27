	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTerrainHealsStatus
GetTerrainHealsStatus: @ 0x08019B30
	ldr r1, _08019B3C @ =0x08BE4805
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019B3C: .4byte 0x08BE4805
