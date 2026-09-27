	.include "macro.inc"

	.syntax unified

	thumb_func_start AiExecFallbackScriptA
AiExecFallbackScriptA: @ 0x0803760C
	push {r4, lr}
	ldr r1, _08037634 @ =0x030013B8
	ldr r0, _08037638 @ =0x08B970A4
	str r0, [r1]
	ldr r4, _0803763C @ =0x030013B0
	movs r0, #1
	strb r0, [r4]
	ldr r1, _08037640 @ =0x030013B4
	movs r0, #0
	str r0, [r1]
	ldr r0, _08037644 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x43
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037634: .4byte 0x030013B8
_08037638: .4byte 0x08B970A4
_0803763C: .4byte 0x030013B0
_08037640: .4byte 0x030013B4
_08037644: .4byte 0x03004690
