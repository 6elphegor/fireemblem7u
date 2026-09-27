	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080375B8
sub_080375B8: @ 0x080375B8
	push {r4, lr}
	ldr r3, _080375F8 @ =0x030013B8
	ldr r1, _080375FC @ =0x08B989F0
	ldr r0, _08037600 @ =0x03004690
	ldr r0, [r0]
	adds r4, r0, #0
	adds r4, #0x42
	ldr r2, [r1]
	ldrb r4, [r4]
	lsls r1, r4, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x43
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037604 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037608 @ =0x030013B4
	movs r1, #0
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080375F8: .4byte 0x030013B8
_080375FC: .4byte 0x08B989F0
_08037600: .4byte 0x03004690
_08037604: .4byte 0x030013B0
_08037608: .4byte 0x030013B4
