	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_NoSkip
EvtCmd_NoSkip: @ 0x0800E664
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x5e
	movs r0, #4
	ldrh r2, [r4]
	ands r0, r2
	cmp r0, #0
	beq _0800E67C
	adds r0, r1, #0
	bl Event_EndSkip
_0800E67C:
	movs r0, #0x40
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
