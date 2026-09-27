	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetWeather
EvtCmd_SetWeather: @ 0x0800EB90
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800EBAC
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #2]
	bl SetWeather
	b _0800EBBC
_0800EBAC:
	ldr r0, _0800EBC4 @ =0x08B91A78
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r1, [r4, #0x30]
	ldrh r1, [r1, #2]
	adds r0, #0x64
	strh r1, [r0]
_0800EBBC:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800EBC4: .4byte 0x08B91A78
