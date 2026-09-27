	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FadeToWhite
EvtCmd_FadeToWhite: @ 0x0800E844
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E862
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeToWhite
	movs r0, #2
	b _0800E864
_0800E862:
	movs r0, #0
_0800E864:
	pop {r1}
	bx r1
