	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_Init
PrepItemScreen_Init: @ 0x08091354
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x2a
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x32]
	str r0, [r4, #0x44]
	str r0, [r4, #0x40]
	bl HasConvoyAccess_
	adds r1, r4, #0
	adds r1, #0x2b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
