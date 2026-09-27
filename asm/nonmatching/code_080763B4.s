	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080763B4
sub_080763B4: @ 0x080763B4
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076464 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080763D2
	movs r0, #0xb4
	bl m4aSongNumStart
_080763D2:
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r1, _0807646C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r1, _0807646C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r2, _08076468 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076468 @ =0x0203E0FC
	ldr r3, _08076468 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08076468 @ =0x0203E0FC
	ldr r4, _08076468 @ =0x0203E0FC
	adds r3, r4, #0
	adds r4, #0x59
	ldrb r3, [r4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	bl sub_080726C0
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076464: .4byte 0x0202BBF8
_08076468: .4byte 0x0203E0FC
_0807646C: .4byte 0x0203A470
