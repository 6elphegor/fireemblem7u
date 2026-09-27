	.include "macro.inc"

	.syntax unified

	thumb_func_start MoveLimitView_OnInit
MoveLimitView_OnInit: @ 0x0801D108
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0801D1D0 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0801D1D4 @ =0x0202BBB8
	movs r0, #1
	ldrb r2, [r4, #4]
	orrs r0, r2
	strb r0, [r4, #4]
	bl RenderMap
	movs r5, #9
	adds r7, r4, #0
_0801D134:
	movs r4, #0xe
	subs r6, r5, #1
_0801D138:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, _0801D1D8 @ =0x02023C60
	adds r3, r4, #0
	bl PutLimitViewSquare
	subs r4, #1
	cmp r4, #0
	bge _0801D138
	adds r5, r6, #0
	cmp r5, #0
	bge _0801D134
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _0801D1D0 @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _0801D1DC @ =0x0000FFE0
	ldrh r1, [r4, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0801D1E0 @ =0x0000E0FF
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl InitBmBgLayers
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D1D0: .4byte 0x03002870
_0801D1D4: .4byte 0x0202BBB8
_0801D1D8: .4byte 0x02023C60
_0801D1DC: .4byte 0x0000FFE0
_0801D1E0: .4byte 0x0000E0FF
