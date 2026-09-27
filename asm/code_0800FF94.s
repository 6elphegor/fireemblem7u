	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_CgTalk
EvtCmd_CgTalk: @ 0x0800FF94
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0800FFC4 @ =0x0000FFFD
	ldrh r5, [r1]
	ands r0, r5
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800FFC8
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl EventStartCgTalk
	movs r0, #2
	b _0800FFCA
	.align 2, 0
_0800FFC4: .4byte 0x0000FFFD
_0800FFC8:
	movs r0, #0
_0800FFCA:
	pop {r4, r5}
	pop {r1}
	bx r1
