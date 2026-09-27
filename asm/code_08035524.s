	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035524
sub_08035524: @ 0x08035524
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _08035550 @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1b
	bne _0803553A
	b _08035628
_0803553A:
	ldr r0, _08035554 @ =0x0203A97C
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0xa
	bhi _08035612
	lsls r0, r1, #2
	ldr r1, _08035558 @ =_0803555C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035550: .4byte 0x0203A85C
_08035554: .4byte 0x0203A97C
_08035558: .4byte _0803555C
_0803555C: @ jump table
	.4byte _08035628 @ case 0
	.4byte _08035588 @ case 1
	.4byte _08035628 @ case 2
	.4byte _080355F4 @ case 3
	.4byte _08035628 @ case 4
	.4byte _08035600 @ case 5
	.4byte _08035628 @ case 6
	.4byte _080355F8 @ case 7
	.4byte _080355FC @ case 8
	.4byte _08035628 @ case 9
	.4byte _08035628 @ case 10
_08035588:
	ldr r1, _08035598 @ =0x0203A97C
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0803559C
	ldrb r6, [r1, #8]
	ldrb r5, [r1, #9]
	b _080355AA
	.align 2, 0
_08035598: .4byte 0x0203A97C
_0803559C:
	ldrb r0, [r1, #6]
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_080355AA:
	ldr r7, _080355EC @ =0x0203A97C
	movs r1, #7
	ldrsb r1, [r7, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08035612
	ldr r4, _080355F0 @ =0x03004690
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08035612
	bl EndAllMus
	ldr r1, [r4]
	ldrb r0, [r7, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r7, #3]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl RideBallista
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	b _08035612
	.align 2, 0
_080355EC: .4byte 0x0203A97C
_080355F0: .4byte 0x03004690
_080355F4:
	ldrb r0, [r2, #6]
	b _08035606
_080355F8:
	ldrb r0, [r2, #6]
	b _08035606
_080355FC:
	ldrb r0, [r2, #9]
	b _08035606
_08035600:
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _08035628
_08035606:
	bl GetUnit
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
_08035612:
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	lsls r0, r6, #4
	lsls r1, r5, #4
	movs r2, #2
	mov r3, r8
	bl StartAiTargetCursor
_08035628:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
