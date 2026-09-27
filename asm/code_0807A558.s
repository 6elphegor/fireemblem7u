	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A558
sub_0807A558: @ 0x0807A558
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _0807A5D0
	movs r5, #0
	ldr r0, _0807A5BC @ =0x0203E66C
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807A662
	ldr r6, _0807A5C0 @ =0x0202BBB8
_0807A574:
	adds r0, r5, #0
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	movs r3, #0xc
	ldrsh r2, [r6, r3]
	subs r4, r1, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807A5C4 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A5C8 @ =0x08CA7518
	ldr r3, _0807A5CC @ =0x00002822
	bl PutOamHiRam
	adds r5, #1
	ldr r0, _0807A5BC @ =0x0203E66C
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807A574
	b _0807A662
	.align 2, 0
_0807A5BC: .4byte 0x0203E66C
_0807A5C0: .4byte 0x0202BBB8
_0807A5C4: .4byte 0x000001FF
_0807A5C8: .4byte 0x08CA7518
_0807A5CC: .4byte 0x00002822
_0807A5D0:
	cmp r1, #1
	bne _0807A620
	ldr r0, _0807A610 @ =0x03004690
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _0807A614 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r4, r0, r1
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #1
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A618 @ =0x08CA7518
	ldr r3, _0807A61C @ =0x00002822
	bl PutOamHiRam
	b _0807A662
	.align 2, 0
_0807A610: .4byte 0x03004690
_0807A614: .4byte 0x0202BBB8
_0807A618: .4byte 0x08CA7518
_0807A61C: .4byte 0x00002822
_0807A620:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0807A662
	ldr r6, _0807A6A4 @ =0x0202BBB8
	adds r5, r1, #0
_0807A62A:
	ldrb r4, [r5]
	lsls r1, r4, #4
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	subs r4, r1, r0
	ldrb r3, [r5, #1]
	lsls r1, r3, #4
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r2, r1, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807A6A8 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A6AC @ =0x08CA7518
	ldr r3, _0807A6B0 @ =0x00002822
	bl PutOamHiRam
	adds r5, #4
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807A62A
_0807A662:
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #1
	mov sb, r0
	ands r5, r0
	cmp r5, #0
	bne _0807A6D8
	mov r6, r8
	adds r6, #0x66
	movs r1, #0
	ldrsh r7, [r6, r1]
	cmp r7, #0
	beq _0807A6B4
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0x10
	movs r1, #0
	bl ShinningEventCursor
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807A6D8
	strh r5, [r4]
	strh r5, [r6]
	b _0807A6D8
	.align 2, 0
_0807A6A4: .4byte 0x0202BBB8
_0807A6A8: .4byte 0x000001FF
_0807A6AC: .4byte 0x08CA7518
_0807A6B0: .4byte 0x00002822
_0807A6B4:
	mov r4, r8
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0
	movs r1, #0x10
	bl ShinningEventCursor
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807A6D8
	strh r7, [r4]
	mov r1, sb
	strh r1, [r6]
_0807A6D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
