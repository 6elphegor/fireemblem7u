	.include "macro.inc"

	.syntax unified

	thumb_func_start PutModeSelectDifficultyText
PutModeSelectDifficultyText: @ 0x080A76F8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x41
	adds r0, #0x43
	ldrb r1, [r6]
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, _080A7758 @ =0x020000BC
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	adds r0, #8
	bl ClearText
	ldr r0, _080A775C @ =0x000012BA
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, _080A7760 @ =0x0202377E
	movs r2, #1
	cmp r7, #0
	bne _080A772C
	movs r2, #3
_080A772C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r6, [r6]
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A7772
	cmp r0, #1
	bgt _080A7764
	cmp r0, #0
	beq _080A776A
	b _080A7788
	.align 2, 0
_080A7758: .4byte 0x020000BC
_080A775C: .4byte 0x000012BA
_080A7760: .4byte 0x0202377E
_080A7764:
	cmp r0, #2
	beq _080A777A
	b _080A7788
_080A776A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	b _080A7780
_080A7772:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #4
	b _080A7780
_080A777A:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x10
_080A7780:
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A77AA
_080A7788:
	ldr r0, _080A77B4 @ =0x000012BB
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, _080A77B8 @ =0x020000C4
	ldr r1, _080A77BC @ =0x020237FE
	movs r2, #1
	cmp r7, #1
	bne _080A779C
	movs r2, #3
_080A779C:
	movs r0, #0
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r4, #0
	movs r3, #0
	bl PutDrawText
_080A77AA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A77B4: .4byte 0x000012BB
_080A77B8: .4byte 0x020000C4
_080A77BC: .4byte 0x020237FE
