	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetWeatherWithFade
EvtCmd_SetWeatherWithFade: @ 0x0800EB70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0800EB8C @ =0x08B91A78
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EB8C: .4byte 0x08B91A78
