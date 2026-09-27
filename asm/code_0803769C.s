	.include "macro.inc"

	.syntax unified

	thumb_func_start AiExecFallbackScriptB
AiExecFallbackScriptB: @ 0x0803769C
	push {r4, lr}
	ldr r1, _080376C4 @ =0x030013B8
	ldr r0, _080376C8 @ =0x08B970B4
	str r0, [r1]
	ldr r4, _080376CC @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _080376D0 @ =0x030013B4
	movs r0, #1
	str r0, [r1]
	ldr r0, _080376D4 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x45
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080376C4: .4byte 0x030013B8
_080376C8: .4byte 0x08B970B4
_080376CC: .4byte 0x030013B0
_080376D0: .4byte 0x030013B4
_080376D4: .4byte 0x03004690
