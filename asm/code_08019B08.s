	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTerrainName
GetTerrainName: @ 0x08019B08
	push {lr}
	ldr r1, _08019B1C @ =0x08BE50E8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	pop {r1}
	bx r1
	.align 2, 0
_08019B1C: .4byte 0x08BE50E8
