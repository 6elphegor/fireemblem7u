	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB98C
sub_080BB98C: @ 0x080BB98C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080BBA14 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r3, [r1, #0xc]
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r1, #0xc]
	adds r0, r2, #0
	ldrb r5, [r1, #0x10]
	ands r0, r5
	orrs r0, r3
	strb r0, [r1, #0x10]
	movs r0, #3
	ldrb r3, [r1, #0x14]
	orrs r0, r3
	strb r0, [r1, #0x14]
	ldrb r5, [r1, #0x18]
	ands r2, r5
	strb r2, [r1, #0x18]
	ldr r0, _080BBA18 @ =0x085ECDF4
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBA1C @ =0x085ECE14
	ldr r1, _080BBA20 @ =0x0600C000
	bl Decompress
	ldr r0, _080BBA24 @ =0x02024460
	ldr r1, _080BBA28 @ =0x085ED0DC
	movs r2, #0xa2
	lsls r2, r2, #8
	bl PutCompressedTsa
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080BBA2C @ =0x08CEFA38
	movs r2, #1
	rsbs r2, r2, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl sub_080BD764
	str r0, [r4, #0x40]
	ldr r0, _080BBA30 @ =0x08673D38
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBA34 @ =0x08673D58
	ldr r1, _080BBA38 @ =0x06013000
	bl Decompress
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BBA14: .4byte 0x03002870
_080BBA18: .4byte 0x085ECDF4
_080BBA1C: .4byte 0x085ECE14
_080BBA20: .4byte 0x0600C000
_080BBA24: .4byte 0x02024460
_080BBA28: .4byte 0x085ED0DC
_080BBA2C: .4byte 0x08CEFA38
_080BBA30: .4byte 0x08673D38
_080BBA34: .4byte 0x08673D58
_080BBA38: .4byte 0x06013000
