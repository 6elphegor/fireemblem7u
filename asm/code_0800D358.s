	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_UnitCameraOn
EvtCmd_UnitCameraOn: @ 0x0800D358
	adds r0, #0x5e
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
