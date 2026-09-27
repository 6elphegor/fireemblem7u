	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_WaitForFaceEnd
Event_WaitForFaceEnd: @ 0x0800B4A0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800B4BC
	bl FaceExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B4C2
_0800B4BC:
	adds r0, r4, #0
	bl Proc_Break
_0800B4C2:
	pop {r4}
	pop {r0}
	bx r0
