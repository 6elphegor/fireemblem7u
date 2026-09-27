	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeBgmOut
FadeBgmOut: @ 0x080035EC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bge _080035FE
	movs r0, #6
	str r0, [r7]
_080035FE:
	ldr r0, _08003660 @ =0x03000038
	ldr r1, [r0]
	cmp r1, #0
	beq _08003616
	ldr r0, _08003660 @ =0x03000038
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003660 @ =0x03000038
	movs r1, #0
	str r1, [r0]
_08003616:
	ldr r0, _08003664 @ =0x0300003C
	ldr r1, [r0]
	cmp r1, #0
	beq _0800362E
	ldr r0, _08003664 @ =0x0300003C
	ldr r1, [r0]
	adds r0, r1, #0
	bl Proc_Break
	ldr r0, _08003664 @ =0x0300003C
	movs r1, #0
	str r1, [r0]
_0800362E:
	ldr r0, _08003668 @ =0x03005B10
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800366C @ =0x03005D20
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003670 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #6]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003660: .4byte 0x03000038
_08003664: .4byte 0x0300003C
_08003668: .4byte 0x03005B10
_0800366C: .4byte 0x03005D20
_08003670: .4byte 0x02024E1C
