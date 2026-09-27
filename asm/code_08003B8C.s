	.include "macro.inc"

	.syntax unified

	thumb_func_start RestoreBgm
RestoreBgm: @ 0x08003B8C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	ldr r1, _08003BA8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003BAC
	b _08003C14
	.align 2, 0
_08003BA8: .4byte 0x0202BBF8
_08003BAC:
	ldr r0, _08003BB8 @ =0x02024E1C
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003BBC
	b _08003C14
	.align 2, 0
_08003BB8: .4byte 0x02024E1C
_08003BBC:
	ldr r1, _08003C1C @ =0x03005B10
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r0, _08003C20 @ =0x03005D20
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	bl m4aMPlayFadeInContinue
	ldr r0, _08003C24 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003C24 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003C24 @ =0x02024E1C
	ldr r1, _08003C24 @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003C24 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003C14:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003C1C: .4byte 0x03005B10
_08003C20: .4byte 0x03005D20
_08003C24: .4byte 0x02024E1C
