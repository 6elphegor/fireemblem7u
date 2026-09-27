	.include "macro.inc"

	.syntax unified

	thumb_func_start EventForceSlowTextSpeed
EventForceSlowTextSpeed: @ 0x0800AEF0
	adds r3, r0, #0
	adds r3, #0x68
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800AF18
	ldr r2, _0800AF1C @ =0x0202BBF8
	adds r2, #0x40
	ldrb r1, [r2]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1e
	strb r0, [r3]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
_0800AF18:
	bx lr
	.align 2, 0
_0800AF1C: .4byte 0x0202BBF8
