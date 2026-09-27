	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FadeBgmIn
EvtCmd_FadeBgmIn: @ 0x0800E460
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E47E
	ldr r1, [r2, #0x30]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #4]
	movs r2, #0
	bl StartBgmFadeIn
_0800E47E:
	movs r0, #0
	pop {r1}
	bx r1
