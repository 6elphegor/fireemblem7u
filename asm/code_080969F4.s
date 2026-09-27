	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080969F4
sub_080969F4: @ 0x080969F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r0, #0x34
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r4, [r0]
	cmp r4, #4
	bge _08096A20
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r3, r1, r0
_08096A20:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _08096A40
	ldrb r0, [r5]
	cmp r0, #8
	bne _08096A32
	movs r0, #0
	b _08096A34
_08096A32:
	adds r0, #1
_08096A34:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_0809689C
	ldr r3, [sp]
_08096A40:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _08096A60
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	rsbs r3, r0, #0
_08096A60:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl SetBgOffset
	lsls r0, r7, #1
	ldrb r4, [r4]
	cmp r4, r0
	bne _08096A8E
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08096A8E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
