	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FadeFromWhite
EvtCmd_FadeFromWhite: @ 0x0800E868
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _0800E886
	ldr r0, [r1, #0x30]
	ldrh r0, [r0, #2]
	bl StartLockingFadeFromWhite
	movs r0, #2
	b _0800E888
_0800E886:
	movs r0, #0
_0800E888:
	pop {r1}
	bx r1
