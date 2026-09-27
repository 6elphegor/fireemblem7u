	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnkSprite
PutUnkSprite: @ 0x08003450
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
_0800345C:
	b _08003460
_0800345E:
	.byte 0x39, 0xE0
_08003460:
	ldr r0, [r7]
	ldr r1, [r0]
	cmp r1, #1
	beq _0800347C
	ldr r0, _08003474 @ =0x03002F34
	ldr r1, [r0]
	ldr r0, _08003478 @ =0x03002A30
	cmp r1, r0
	bhs _0800347C
	b _0800347E
	.align 2, 0
_08003474: .4byte 0x03002F34
_08003478: .4byte 0x03002A30
_0800347C:
	b _080034D4
_0800347E:
	ldr r0, [r7]
	movs r2, #6
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, r2
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	str r0, [r7, #0xc]
	ldr r0, [r7]
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	movs r1, #0xff
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080034D0 @ =0x03002F34
	ldr r1, [r0]
	ldr r2, [r7]
	ldr r4, [r7, #0xc]
	lsls r3, r4, #0x10
	ldr r4, [r2]
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, [r7, #0x10]
	orrs r2, r3
	str r2, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, _080034D0 @ =0x03002F34
	ldr r1, [r0]
	ldr r2, [r7]
	ldrh r3, [r2, #4]
	strh r3, [r1]
	adds r1, #4
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	b _0800345C
	.align 2, 0
_080034D0: .4byte 0x03002F34
_080034D4:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
