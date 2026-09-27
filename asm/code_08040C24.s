	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040C24
sub_08040C24: @ 0x08040C24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _08040C64 @ =0x08B98AEC
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _08040C68
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08040CEE
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b _08040CEE
	.align 2, 0
_08040C64: .4byte 0x08B98AEC
_08040C68:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08040CEE
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040CEE
	ldr r4, _08040CF8 @ =0x0203D90C
	mov r0, sp
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl RandSetSt
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
_08040CEE:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040CF8: .4byte 0x0203D90C
