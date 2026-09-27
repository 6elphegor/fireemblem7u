	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitStatusName
GetUnitStatusName: @ 0x08018CF0
	push {lr}
	ldr r1, _08018D08 @ =0x08B92E88
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	pop {r1}
	bx r1
	.align 2, 0
_08018D08: .4byte 0x08B92E88
