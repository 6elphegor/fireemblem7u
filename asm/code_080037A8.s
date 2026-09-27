	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBgmCore
StartBgmCore: @ 0x080037A8
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08003808 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003808 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003808 @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _0800380C @ =0x03005B10
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003810 @ =0x03005D20
	adds r0, r1, #0
	bl m4aMPlayImmInit
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003808: .4byte 0x02024E1C
_0800380C: .4byte 0x03005B10
_08003810: .4byte 0x03005D20
