	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B915C
sub_080B915C: @ 0x080B915C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x30]
	movs r0, #0x20
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
	str r5, [r4, #0x2c]
	bl GetNextChapterStatsSlot
	adds r4, #0x38
	strb r0, [r4]
	ldr r7, _080B9234 @ =0x03002870
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r2, #3
	rsbs r2, r2, #0
	mov sl, r2
	ands r0, r2
	movs r1, #5
	rsbs r1, r1, #0
	mov sb, r1
	ands r0, r1
	subs r2, #6
	mov r8, r2
	ands r0, r2
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r7, #1]
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #0
	bl InitBgs
	ldrb r0, [r7, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r2, sb
	ands r4, r2
	mov r0, r8
	ands r4, r0
	ands r4, r6
	strb r4, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	bl ResetText
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, _080B9238 @ =0x085DFB30
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _080B923C @ =0x0866AF8C
	ldr r1, _080B9240 @ =0x06008000
	bl Decompress
	ldr r0, _080B9244 @ =0x02024460
	ldr r1, _080B9248 @ =0x085DFB70
	movs r2, #0xe0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9234: .4byte 0x03002870
_080B9238: .4byte 0x085DFB30
_080B923C: .4byte 0x0866AF8C
_080B9240: .4byte 0x06008000
_080B9244: .4byte 0x02024460
_080B9248: .4byte 0x085DFB70
