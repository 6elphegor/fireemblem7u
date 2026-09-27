	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037648
sub_08037648: @ 0x08037648
	push {r4, lr}
	ldr r3, _08037688 @ =0x030013B8
	ldr r2, _0803768C @ =0x08B989E4
	ldr r0, _08037690 @ =0x03004690
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldr r2, [r2]
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r3]
	adds r0, #0x45
	ldrb r4, [r0]
	lsls r2, r4, #4
	adds r1, r1, r2
	str r1, [r3]
	ldr r4, _08037694 @ =0x030013B0
	movs r1, #1
	strb r1, [r4]
	ldr r2, _08037698 @ =0x030013B4
	movs r1, #1
	str r1, [r2]
	bl AiScript_Exec
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037688: .4byte 0x030013B8
_0803768C: .4byte 0x08B989E4
_08037690: .4byte 0x03004690
_08037694: .4byte 0x030013B0
_08037698: .4byte 0x030013B4
