	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08003AF8
sub_08003AF8: @ 0x08003AF8
	push {r7, lr}
	mov r7, sp
	ldr r1, _08003B10 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003B14
	b _08003B7A
	.align 2, 0
_08003B10: .4byte 0x0202BBF8
_08003B14:
	ldr r0, _08003B20 @ =0x02024E1C
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _08003B24
	b _08003B7A
	.align 2, 0
_08003B20: .4byte 0x02024E1C
_08003B24:
	ldr r1, _08003B80 @ =0x03005B10
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOut
	ldr r1, _08003B84 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #6
	bl m4aMPlayFadeInContinue
	ldr r0, _08003B88 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003B88 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003B88 @ =0x02024E1C
	ldr r1, _08003B88 @ =0x02024E1C
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #4]
	ldr r0, _08003B88 @ =0x02024E1C
	ldrh r1, [r0, #2]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #2]
_08003B7A:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003B80: .4byte 0x03005B10
_08003B84: .4byte 0x03005D20
_08003B88: .4byte 0x02024E1C
