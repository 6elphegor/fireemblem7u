	.include "macro.inc"

	.syntax unified

	thumb_func_start ScanlineRotation
ScanlineRotation: @ 0x080779F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r2, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	adds r6, r7, #4
	strh r5, [r6]
	adds r5, r7, #6
	strh r4, [r5]
	adds r4, r7, #0
	adds r4, #8
	strh r3, [r4]
	adds r3, r7, #0
	adds r3, #0xa
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #0xc
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xe
	strh r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #2
	str r2, [r7]
	movs r1, #1
	str r1, [r7, #0x10]
_08077A34:
	ldr r1, [r7, #0x10]
	cmp r1, #0x9f
	ble _08077A3C
	b _08077AD2
_08077A3C:
	ldr r1, _08077A98 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0x10]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	str r1, [r7, #0x14]
	adds r1, r7, #0
	adds r1, #0xe
	movs r5, #0
	ldrsh r0, [r1, r5]
	adds r1, r7, #0
	adds r1, #0xc
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	cmp r1, #0
	blt _08077A9C
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r2, [r1, r4]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	ldr r2, [r7, #0x14]
	muls r1, r2, r1
	muls r1, r0, r1
	b _08077AB0
	.align 2, 0
_08077A98: .4byte 0x080C5A48
_08077A9C:
	adds r2, r7, #0
	adds r2, #0xc
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #0x10]
	subs r2, r3, r4
	ldr r3, [r7, #0x14]
	adds r1, r2, #0
	muls r1, r3, r1
	muls r1, r0, r1
_08077AB0:
	str r1, [r7, #0x14]
	ldr r1, [r7]
	ldr r3, [r7, #0x14]
	asrs r2, r3, #0x14
	adds r3, r7, #0
	adds r3, #0xa
	ldrh r3, [r3]
	adds r2, r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, [r7]
	adds r2, r1, #4
	str r2, [r7]
	ldr r1, [r7, #0x10]
	adds r2, r1, #2
	str r2, [r7, #0x10]
	b _08077A34
_08077AD2:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
