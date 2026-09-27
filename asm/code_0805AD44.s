	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AD44
sub_0805AD44: @ 0x0805AD44
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r0, _0805AD78 @ =0x0202003C
	ldr r0, [r0]
	cmp r0, #1
	beq _0805AD60
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0805AD80
_0805AD60:
	ldr r1, _0805AD7C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
	b _0805ADE4
	.align 2, 0
_0805AD78: .4byte 0x0202003C
_0805AD7C: .4byte 0x0201774C
_0805AD80:
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x70
	bl Interpolate
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	ldr r4, _0805ADEC @ =0x080C5A48
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x1a
	ldrh r1, [r5, #0x30]
	adds r1, #6
	movs r2, #0xff
	ands r1, r2
	strh r1, [r5, #0x30]
	ldr r2, [r5, #0x44]
	movs r1, #0xff
	ands r2, r1
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r7, #0
	ldrsh r1, [r1, r7]
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r2, [r2, r4]
	muls r1, r0, r1
	muls r0, r2, r0
	asrs r1, r1, #0xc
	asrs r0, r0, #0xc
	ldrh r7, [r5, #0x32]
	adds r3, r7, r3
	subs r3, r3, r1
	strh r3, [r6, #2]
	ldrh r5, [r5, #0x3a]
	subs r0, r5, r0
	strh r0, [r6, #4]
_0805ADE4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADEC: .4byte 0x080C5A48
