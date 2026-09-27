	.include "macro.inc"

	.syntax unified

	thumb_func_start OpAnim_DrawCloud
OpAnim_DrawCloud: @ 0x080BC30C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	ldr r7, _080BC434 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, _080BC438 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r6, _080BC43C @ =0x02023460
	adds r0, r6, #0
	movs r1, #0
	bl TmFill
	ldr r0, _080BC440 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BC444 @ =0x02024460
	movs r1, #0
	bl TmFill
	bl EndAllParallelWorkers
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	strb r0, [r7, #0xc]
	adds r0, r2, #0
	ldrb r1, [r7, #0x10]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r7, #0x10]
	movs r0, #3
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BC448 @ =0x08CF0004
	movs r5, #0
	str r5, [sp]
	movs r1, #0x80
	lsls r1, r1, #7
	str r1, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	ldr r1, _080BC44C @ =sub_080BC2D8
	str r1, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl StartBmBgfx
	ldr r1, _080BC450 @ =0x03001620
	ldr r0, [r1]
	movs r4, #0x10
	orrs r0, r4
	str r0, [r1]
	ldr r0, _080BC454 @ =0x086727E0
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC458 @ =0x08672800
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r1, _080BC45C @ =0x08673AD8
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r6, #0
	bl sub_080AACD8
	ldr r0, _080BC460 @ =0x085ED1C4
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC464 @ =0x085ED1E4
	ldr r1, _080BC468 @ =0x06010000
	bl Decompress
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080BC46C @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _080BC470 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, r8
	str r5, [r0, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC434: .4byte 0x03002870
_080BC438: .4byte 0x02022C60
_080BC43C: .4byte 0x02023460
_080BC440: .4byte 0x02023C60
_080BC444: .4byte 0x02024460
_080BC448: .4byte 0x08CF0004
_080BC44C: .4byte sub_080BC2D8
_080BC450: .4byte 0x03001620
_080BC454: .4byte 0x086727E0
_080BC458: .4byte 0x08672800
_080BC45C: .4byte 0x08673AD8
_080BC460: .4byte 0x085ED1C4
_080BC464: .4byte 0x085ED1E4
_080BC468: .4byte 0x06010000
_080BC46C: .4byte 0x0000FFE0
_080BC470: .4byte 0x0000E0FF
