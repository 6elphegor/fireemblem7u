	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SilentSkip
EvtCmd_SilentSkip: @ 0x0800E700
	adds r1, r0, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r2, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0800E716
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #2
	b _0800E718
_0800E716:
	movs r0, #0
_0800E718:
	bx lr
	.align 2, 0
