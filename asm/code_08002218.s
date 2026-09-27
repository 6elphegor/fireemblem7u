	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002218
sub_08002218: @ 0x08002218
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #4
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x18]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08002248 @ =0x02022860
	adds r0, r1, r0
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_0800223E:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #4]
	cmp r0, r1
	blt _0800224C
	b _08002330
	.align 2, 0
_08002248: .4byte 0x02022860
_0800224C:
	ldr r0, _08002274 @ =0x02022240
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_0800226C:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002278
	b _08002328
	.align 2, 0
_08002274: .4byte 0x02022240
_08002278:
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002324 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #8]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #2
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _0800226C
	.align 2, 0
_08002324: .4byte 0x02022260
_08002328:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _0800223E
_08002330:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0
