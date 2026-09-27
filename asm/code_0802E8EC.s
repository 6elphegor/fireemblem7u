	.include "macro.inc"

	.syntax unified

	thumb_func_start PushUnit
PushUnit: @ 0x0802E8EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802E918 @ =0x0203A7EC
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1]
	bl CopyUnit
	ldr r2, [r4]
	ldr r1, _0802E91C @ =0x0203A7F0
	ldrb r0, [r1]
	strb r0, [r2, #0xb]
	strb r5, [r6, #0x12]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x48
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E918: .4byte 0x0203A7EC
_0802E91C: .4byte 0x0203A7F0
