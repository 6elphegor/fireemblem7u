	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_11_MoveTowardsSafety
AiScriptCmd_11_MoveTowardsSafety: @ 0x08037EC8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08037F08 @ =0x03004690
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037EFA
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl AiSetDecision
_08037EFA:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037F08: .4byte 0x03004690
