	.include "macro.inc"

	.syntax unified

	thumb_func_start IsSramWorking
IsSramWorking: @ 0x0809E478
	ldr r0, _0809E484 @ =0x0203E79A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0809E484: .4byte 0x0203E79A
