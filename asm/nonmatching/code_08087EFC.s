	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCgTextBoxDimensions
GetCgTextBoxDimensions: @ 0x08087EFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08087F18:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _08087FA4
	lsls r0, r2, #2
	ldr r1, _08087F28 @ =_08087F2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087F28: .4byte _08087F2C
_08087F2C: @ jump table
	.4byte _08087F96 @ case 0
	.4byte _08087F96 @ case 1
	.4byte _08087F96 @ case 2
	.4byte _08087F94 @ case 3
	.4byte _08087FA4 @ case 4
	.4byte _08087FA4 @ case 5
	.4byte _08087FA4 @ case 6
	.4byte _08087FA4 @ case 7
	.4byte _08087FA4 @ case 8
	.4byte _08087FA4 @ case 9
	.4byte _08087FA4 @ case 10
	.4byte _08087FA4 @ case 11
	.4byte _08087FA4 @ case 12
	.4byte _08087FA4 @ case 13
	.4byte _08087FA4 @ case 14
	.4byte _08087FA4 @ case 15
	.4byte _08087FA4 @ case 16
	.4byte _08087FA4 @ case 17
	.4byte _08087FA4 @ case 18
	.4byte _08087FA4 @ case 19
	.4byte _08087FA4 @ case 20
	.4byte _08087FA4 @ case 21
	.4byte _08087FA4 @ case 22
	.4byte _08087FA4 @ case 23
	.4byte _08087F96 @ case 24
	.4byte _08087F96 @ case 25
_08087F94:
	adds r5, #8
_08087F96:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _08087FA0
	str r5, [r1]
_08087FA0:
	movs r5, #0
	ldrb r2, [r4]
_08087FA4:
	cmp r2, #0x19
	bhi _08088030
	lsls r0, r2, #2
	ldr r1, _08087FB4 @ =_08087FB8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087FB4: .4byte _08087FB8
_08087FB8: @ jump table
	.4byte _08088024 @ case 0
	.4byte _08088020 @ case 1
	.4byte _08088024 @ case 2
	.4byte _08088030 @ case 3
	.4byte _08088030 @ case 4
	.4byte _08088030 @ case 5
	.4byte _08088030 @ case 6
	.4byte _08088030 @ case 7
	.4byte _08088030 @ case 8
	.4byte _08088030 @ case 9
	.4byte _08088030 @ case 10
	.4byte _08088030 @ case 11
	.4byte _08088030 @ case 12
	.4byte _08088030 @ case 13
	.4byte _08088030 @ case 14
	.4byte _08088030 @ case 15
	.4byte _08088030 @ case 16
	.4byte _08088030 @ case 17
	.4byte _08088030 @ case 18
	.4byte _08088030 @ case 19
	.4byte _08088030 @ case 20
	.4byte _08088030 @ case 21
	.4byte _08088030 @ case 22
	.4byte _08088030 @ case 23
	.4byte _08088020 @ case 24
	.4byte _08088020 @ case 25
_08088020:
	adds r6, #0x10
	b _08088030
_08088024:
	ldr r0, [r7]
	cmp r0, r6
	bge _0808802C
	str r6, [r7]
_0808802C:
	movs r6, #0
	ldrb r2, [r4]
_08088030:
	adds r0, r2, #0
	cmp r0, #7
	bgt _08088040
	cmp r0, #1
	bge _0808804E
	cmp r0, #0
	beq _08088066
	b _08088056
_08088040:
	cmp r2, #0x16
	blt _08088056
	cmp r2, #0x19
	ble _0808804E
	cmp r2, #0x80
	beq _08088052
	b _08088056
_0808804E:
	adds r4, #1
	b _08087F18
_08088052:
	adds r4, #2
	b _08087F18
_08088056:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _08087F18
_08088066:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
