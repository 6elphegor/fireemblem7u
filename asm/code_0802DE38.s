	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxUpdate
WfxUpdate: @ 0x0802DE38
	push {lr}
	ldr r0, _0802DE4C @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _0802DE46
	bl WfxClouds_Update
_0802DE46:
	pop {r0}
	bx r0
	.align 2, 0
_0802DE4C: .4byte 0x0202BBF8
