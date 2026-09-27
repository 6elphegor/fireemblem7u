	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076FC4
sub_08076FC4: @ 0x08076FC4
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_08076FEC:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08076FF4
	b _08077044
_08076FF4:
	ldr r0, [r7]
	ldr r1, _08077040 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
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
	adds r2, r1, #0
	muls r2, r3, r2
	asrs r1, r2, #0xc
	ldr r3, [r7, #0x20]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	b _08076FEC
	.align 2, 0
_08077040: .4byte 0x080C5A48
_08077044:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0
