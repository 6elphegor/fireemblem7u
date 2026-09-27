	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C5BC
sub_0806C5BC: @ 0x0806C5BC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, _0806C670 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806C5DC
	ldr r1, _0806C674 @ =0x00000397
	adds r0, r1, #0
	bl m4aSongNumStart
_0806C5DC:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, _0806C678 @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	ldr r0, _0806C678 @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	rsbs r0, r1, #0
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	ldr r0, _0806C678 @ =0x080C5A48
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	movs r1, #0x80
	lsls r1, r1, #2
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r1, _0806C678 @ =0x080C5A48
	adds r0, r1, #0
	adds r1, #0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r1, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, #0
	adds r1, r2, #0
	bl Div
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl SetObjAffine
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C670: .4byte 0x0202BBF8
_0806C674: .4byte 0x00000397
_0806C678: .4byte 0x080C5A48
