	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_01_FunctionCall
AiScriptCmd_01_FunctionCall: @ 0x080377E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803780C @ =0x030013BC
	ldr r0, _08037810 @ =0x030013B8
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, _08037814 @ =0x030013B0
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803780C: .4byte 0x030013BC
_08037810: .4byte 0x030013B8
_08037814: .4byte 0x030013B0
