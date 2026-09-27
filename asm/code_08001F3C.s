	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08001F3C
sub_08001F3C: @ 0x08001F3C
	push {r4, r5, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r2, #8
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #9
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r7, #4]
	ldr r2, [r1]
	adds r1, r2, #0
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x15
	ldr r1, [r7, #4]
	ldr r2, [r1]
	lsrs r1, r2, #8
	adds r2, r1, #0
	strb r2, [r0]
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x15
	ldrb r2, [r1]
	strb r2, [r0]
_08001F82:
	adds r0, r7, #0
	adds r0, #0x17
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001F90
	b _0800200E
_08001F90:
	adds r1, r7, #0
	adds r1, #0x17
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r1, r7, #0
	adds r1, #9
	ldrb r2, [r1]
	lsls r0, r2
	ldr r1, [r7]
	adds r0, r1, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x14
	ldrb r2, [r1]
	strb r2, [r0]
_08001FB2:
	adds r0, r7, #0
	adds r0, #0x16
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08001FC0
	b _08001FF8
_08001FC0:
	adds r0, r7, #0
	adds r0, #0x10
	ldr r1, [r0]
	adds r2, r7, #0
	adds r2, #0xc
	ldr r3, [r2]
	adds r4, r7, #0
	adds r4, #8
	ldrb r5, [r3]
	ldrb r4, [r4]
	adds r5, r5, r4
	adds r4, r5, #0
	strb r4, [r1]
	adds r3, #1
	str r3, [r2]
	adds r1, #1
	str r1, [r0]
	adds r1, r7, #0
	adds r1, #0x16
	adds r0, r7, #0
	adds r0, #0x16
	adds r1, r7, #0
	adds r1, #0x16
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001FB2
_08001FF8:
	adds r1, r7, #0
	adds r1, #0x17
	adds r0, r7, #0
	adds r0, #0x17
	adds r1, r7, #0
	adds r1, #0x17
	ldrb r2, [r1]
	subs r1, r2, #1
	adds r2, r1, #0
	strb r2, [r0]
	b _08001F82
_0800200E:
	add sp, #0x18
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
