	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TalkOpaque
EvtCmd_TalkOpaque: @ 0x0800B9A8
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0800B9D8 @ =0x0000FFFD
	ldrh r3, [r1]
	ands r0, r3
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800B9DC
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	movs r2, #1
	bl EventStartTalk
	movs r0, #0x80
	lsls r0, r0, #1
	bl SetTalkFlag
	movs r0, #2
	b _0800B9DE
	.align 2, 0
_0800B9D8: .4byte 0x0000FFFD
_0800B9DC:
	movs r0, #0
_0800B9DE:
	pop {r1}
	bx r1
	.align 2, 0
