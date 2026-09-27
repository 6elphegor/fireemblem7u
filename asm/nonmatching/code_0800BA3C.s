	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkSetFuncBroken
EvtCmd_TalkSetFuncBroken: @ 0x0800BA3C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800BA5A
	ldr r0, [r2, #0x30]
	adds r0, #4
	bl SetTalkFunc
	movs r0, #2
	b _0800BA5C
_0800BA5A:
	movs r0, #0
_0800BA5C:
	pop {r1}
	bx r1
