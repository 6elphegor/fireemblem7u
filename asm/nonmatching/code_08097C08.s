	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097C08
sub_08097C08: @ 0x08097C08
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _08097C36
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r3, r1, r0
_08097C36:
	adds r5, r6, #0
	adds r5, #0x33
	cmp r4, #4
	bne _08097C56
	ldrb r0, [r5]
	cmp r0, #8
	bne _08097C48
	movs r0, #0
	b _08097C4A
_08097C48:
	adds r0, #1
_08097C4A:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_08097A9C
	ldr r3, [sp]
_08097C56:
	adds r4, r6, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r7
	blt _08097C76
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
_08097C76:
	movs r0, #0xff
	ands r3, r0
	ldrb r5, [r5]
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x4a
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
	bne _08097CA4
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_08097CA4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
