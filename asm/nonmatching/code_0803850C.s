	.include "macro.inc"

	.syntax unified

	thumb_func_start AiDoBerserkMove
AiDoBerserkMove: @ 0x0803850C
	push {r4, lr}
	sub sp, #8
	ldr r0, _08038540 @ =AiIsUnitNonActive
	add r4, sp, #4
	adds r1, r4, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08038536
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_08038536:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038540: .4byte AiIsUnitNonActive
