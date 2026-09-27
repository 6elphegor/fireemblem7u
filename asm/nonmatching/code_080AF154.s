	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF154
sub_080AF154: @ 0x080AF154
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r3, _080AF214 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r6, #0x2a]
	ldr r0, _080AF218 @ =0x08420608
	ldr r2, _080AF21C @ =0x02000000
	movs r3, #0
	adds r1, r2, #0
	adds r1, #0x3c
_080AF19A:
	str r3, [r1]
	subs r1, #4
	cmp r1, r2
	bge _080AF19A
	movs r5, #0
	str r5, [r6, #0x3c]
	ldr r1, _080AF220 @ =0x06010000
	bl Decompress
	ldr r0, _080AF224 @ =0x084205E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _080AF228 @ =0x0841ED84
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080AF22C @ =0x0841E3F8
	ldr r1, _080AF230 @ =0x06016000
	bl Decompress
	ldr r0, [r6, #0x44]
	ldr r0, [r0]
	str r0, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, [r6, #0x30]
	bl sub_080AEF88
	movs r1, #0xf0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	subs r1, #8
	strh r1, [r6, #0x2c]
	adds r0, r6, #0
	bl sub_080AF0FC
	ldr r0, [r6, #0x44]
	ldrb r1, [r0, #0xb]
	adds r0, r6, #0
	bl sub_080AF844
	str r0, [r6, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF214: .4byte 0x03002870
_080AF218: .4byte 0x08420608
_080AF21C: .4byte 0x02000000
_080AF220: .4byte 0x06010000
_080AF224: .4byte 0x084205E8
_080AF228: .4byte 0x0841ED84
_080AF22C: .4byte 0x0841E3F8
_080AF230: .4byte 0x06016000
