	.include "macro.inc"

	.syntax unified

	thumb_func_start OverrideBgm
OverrideBgm: @ 0x08003A70
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08003A8C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _08003A90
	b _08003AE2
	.align 2, 0
_08003A8C: .4byte 0x0202BBF8
_08003A90:
	ldr r0, _08003AEC @ =0x02024E1C
	ldr r1, _08003AEC @ =0x02024E1C
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #4]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, _08003AEC @ =0x02024E1C
	movs r1, #7
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08003ABA
	ldr r1, _08003AF0 @ =0x03005D20
	adds r0, r1, #0
	movs r1, #3
	bl m4aMPlayFadeOutPause
_08003ABA:
	ldr r0, _08003AEC @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003AEC @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08003AE2
	ldr r2, _08003AF4 @ =0x03005B10
	ldr r0, [r7]
	movs r1, #0x20
	bl PlaySongDelayed
_08003AE2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003AEC: .4byte 0x02024E1C
_08003AF0: .4byte 0x03005D20
_08003AF4: .4byte 0x03005B10
