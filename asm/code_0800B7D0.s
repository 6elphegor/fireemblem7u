	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FadeFromOpening
EvtCmd_FadeFromOpening: @ 0x0800B7D0
	push {r4, lr}
	adds r4, r0, #0
	bl LockBmDisplay
	bl LockMus
	adds r0, r4, #0
	bl Event_FadeOutOfBackgroundTalk
	adds r4, #0x4c
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
