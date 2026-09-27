	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeBgmOut_2
FadeBgmOut_2: @ 0x08003674
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _08003686
	movs r0, #6
	str r0, [r7]
_08003686:
	ldr r0, _080036FC @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _0800369E
	ldr r0, _080036FC @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _080036FC @ =0x03000038
	movs r1, #0
	str r1, [r0]
_0800369E:
	ldr r0, _08003700 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _080036B6
	ldr r0, _08003700 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003700 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_080036B6:
	ldr r0, _08003704 @ =0x03005B10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003708 @ =0x03005D20
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOutPause
	ldr r0, _0800370C @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _0800370C @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036FC: .4byte 0x03000038
_08003700: .4byte 0x0300003C
_08003704: .4byte 0x03005B10
_08003708: .4byte 0x03005D20
_0800370C: .4byte 0x02024E1C
