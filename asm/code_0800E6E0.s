	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_YesSkip
EvtCmd_YesSkip: @ 0x0800E6E0
	adds r2, r0, #0
	adds r2, #0x5e
	ldrh r1, [r2]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E6FC
	ldr r0, _0800E6F8 @ =0x0000FE1F
	ands r0, r1
	strh r0, [r2]
	movs r0, #2
	b _0800E6FE
	.align 2, 0
_0800E6F8: .4byte 0x0000FE1F
_0800E6FC:
	movs r0, #0
_0800E6FE:
	bx lr
