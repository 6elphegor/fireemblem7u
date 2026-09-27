	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBBB8
sub_080BBBB8: @ 0x080BBBB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x5c
	movs r1, #0x1e
	movs r2, #0
	bl StartBgmExt
	ldr r6, _080BBC4C @ =0x03002870
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r1, [r6, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6, #0xc]
	movs r0, #3
	ldrb r1, [r6, #0x10]
	orrs r1, r0
	strb r1, [r6, #0x10]
	ldrb r1, [r6, #0x14]
	orrs r1, r0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x18]
	orrs r0, r2
	strb r0, [r6, #0x18]
	ldr r0, _080BBC50 @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #4
	bl EnableBgSync
	movs r4, #0
	str r4, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x3c
	strb r4, [r0]
	bl sub_080BCAFC
	bl EndAllParallelWorkers
	ldr r0, _080BBC54 @ =sub_080BB76C
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl sub_080BCE20
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BBC58 @ =0x03001620
	ldr r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2]
	str r4, [r5, #0x30]
	str r4, [r5, #0x38]
	str r4, [r5, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC4C: .4byte 0x03002870
_080BBC50: .4byte 0x085E9D2C
_080BBC54: .4byte sub_080BB76C
_080BBC58: .4byte 0x03001620
