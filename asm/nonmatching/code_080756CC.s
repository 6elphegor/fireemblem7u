	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080756CC
sub_080756CC: @ 0x080756CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075700 @ =0x0203E0FC
	ldr r2, _08075700 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0x40
	bne _08075708
	ldr r1, _08075704 @ =sub_08075798
	adds r0, r1, #0
	movs r1, #9
	bl CallDelayed
	b _08075712
	.align 2, 0
_08075700: .4byte 0x0203E0FC
_08075704: .4byte sub_08075798
_08075708:
	ldr r1, _08075790 @ =sub_080757DC
	adds r0, r1, #0
	movs r1, #0xc
	bl CallDelayed
_08075712:
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #5
	bl SetSpriteAnimId
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075790: .4byte sub_080757DC
_08075794: .4byte 0x0203E0FC
