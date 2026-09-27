	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080962A0
sub_080962A0: @ 0x080962A0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r5, _0809636C @ =0x03002870
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	mov sl, r1
	ands r0, r1
	subs r1, #2
	mov sb, r1
	ands r0, r1
	subs r1, #4
	mov r8, r1
	ands r0, r1
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r5, #1]
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl InitBgs
	movs r0, #0
	bl SetOnHBlankA
	ldrb r0, [r5, #1]
	ands r4, r0
	mov r1, sl
	ands r4, r1
	mov r0, sb
	ands r4, r0
	mov r1, r8
	ands r4, r1
	ands r4, r6
	strb r4, [r5, #1]
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r5, #0xc]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0xc]
	adds r0, r2, #0
	ldrb r1, [r5, #0x10]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r2, r0
	strb r2, [r5, #0x14]
	movs r0, #3
	ldrb r1, [r5, #0x18]
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl InitFaces
	bl ResetText
	bl InitIcons
	bl UnpackUiWindowFrameGraphics
	bl PrepRestartMuralBackground
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809636C: .4byte 0x03002870
