	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_Init
Title_Init: @ 0x080BA564
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _080BA698 @ =0x086772EC
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	strb r7, [r0]
	ldr r5, _080BA69C @ =0x03002870
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r5, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	mov r0, sp
	bl InitBgs
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	strb r0, [r5]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r5, #1]
	ands r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r5, #1]
	movs r3, #3
	ldrb r0, [r5, #0xc]
	orrs r0, r3
	strb r0, [r5, #0xc]
	adds r1, #0xd
	adds r0, r1, #0
	ldrb r2, [r5, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	orrs r3, r1
	strb r3, [r5, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _080BA6A0 @ =0x0000FFCC
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080BA6A4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6A8 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6AC @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _080BA6B0 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl ResetTitleBgAffin
	adds r2, r5, #0
	adds r2, #0x3c
	adds r1, r4, #0
	ldrb r3, [r2]
	ands r1, r3
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r3, [r0]
	ands r4, r3
	strb r4, [r0]
	movs r0, #0x3f
	ands r1, r0
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x45
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	movs r0, #0xf
	bl EnableBgSync
	adds r0, r6, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080BA67C
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BA67C:
	str r7, [r6, #0x54]
	adds r1, r6, #0
	adds r1, #0x30
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x44
_080BA688:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _080BA688
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA698: .4byte 0x086772EC
_080BA69C: .4byte 0x03002870
_080BA6A0: .4byte 0x0000FFCC
_080BA6A4: .4byte 0x02022C60
_080BA6A8: .4byte 0x02023460
_080BA6AC: .4byte 0x02023C60
_080BA6B0: .4byte 0x02024460
