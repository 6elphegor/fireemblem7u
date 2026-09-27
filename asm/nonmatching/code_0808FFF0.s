	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawPrepScreenMenuFrameAt
DrawPrepScreenMenuFrameAt: @ 0x0808FFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _08090094 @ =0x08CC416C
	bl Proc_Find
	mov sb, r0
	cmp r0, #0
	beq _08090086
	movs r0, #0
	mov r1, sb
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, sb
	adds r4, #0x2b
	ldrb r1, [r4]
	lsls r3, r1, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	mov r8, r4
	ldrb r0, [r4]
	cmp r0, #1
	bls _08090080
	movs r7, #0
	adds r1, r0, #0
	cmp r7, r1
	bge _08090080
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_08090040:
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl ClearText
	ldr r0, [r4, #0x34]
	bl DecodeMsg
	lsls r1, r6, #1
	ldr r2, _08090098 @ =0x02022C60
	adds r1, r1, r2
	adds r4, #0x38
	movs r2, #1
	ldrb r4, [r4]
	ands r2, r4
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	adds r6, #0x40
	adds r7, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _08090040
_08090080:
	movs r0, #3
	bl EnableBgSync
_08090086:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090094: .4byte 0x08CC416C
_08090098: .4byte 0x02022C60
