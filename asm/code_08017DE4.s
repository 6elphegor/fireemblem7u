	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitRescue
UnitRescue: @ 0x08017DE4
	ldr r2, [r0, #0xc]
	movs r3, #0x10
	orrs r2, r3
	str r2, [r0, #0xc]
	ldr r2, [r1, #0xc]
	movs r3, #0x21
	orrs r2, r3
	str r2, [r1, #0xc]
	ldrb r2, [r1, #0xb]
	strb r2, [r0, #0x1b]
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #0x1b]
	ldrb r2, [r0, #0x10]
	strb r2, [r1, #0x10]
	ldrb r0, [r0, #0x11]
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
