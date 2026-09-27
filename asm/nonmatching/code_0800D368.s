	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_UnitCameraOff
EvtCmd_UnitCameraOff: @ 0x0800D368
	adds r0, #0x5e
	ldr r1, _0800D378 @ =0x0000FFFE
	ldrh r2, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800D378: .4byte 0x0000FFFE
