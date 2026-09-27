	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08077B74
sub_08077B74: @ 0x08077B74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077B9C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077BA8
	ldr r0, _08077BA0 @ =0x0203E668
	ldr r1, _08077BA4 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077BB6
	.align 2, 0
_08077B9C: .4byte 0x04000006
_08077BA0: .4byte 0x0203E668
_08077BA4: .4byte 0x0203E660
_08077BA8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077BB6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077BF8
	ldr r0, _08077C00 @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C04 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077C08 @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C04 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077BF8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C00: .4byte 0x04000014
_08077C04: .4byte 0x0203E668
_08077C08: .4byte 0x04000016
