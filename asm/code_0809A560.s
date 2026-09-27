	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A560
sub_0809A560: @ 0x0809A560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r5, #0
	muls r1, r0, r1
	mov r8, r1
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r4, _0809A64C @ =0x03002870
	adds r2, r4, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	strb r3, [r0]
	movs r0, #0x10
	subs r0, r0, r3
	adds r2, #9
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x46
	strb r1, [r0]
	mov r0, r8
	lsls r5, r0, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetBgOffset
	adds r2, r7, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r5, #0
	bl SetBgOffset
	mov r1, r8
	rsbs r0, r1, #0
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	rsbs r1, r7, #0
	adds r2, r6, #0
	adds r2, #0x54
	strh r1, [r2]
	bl sub_0809A504
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A634
	movs r1, #0xd8
	mov r0, r8
	subs r1, r1, r0
	movs r2, #0x58
	subs r2, r2, r7
	movs r0, #0
	bl SetFacePosition
_0809A634:
	ldr r0, [r6, #0x2c]
	cmp r0, #0xa
	bne _0809A640
	adds r0, r6, #0
	bl Proc_Break
_0809A640:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A64C: .4byte 0x03002870
