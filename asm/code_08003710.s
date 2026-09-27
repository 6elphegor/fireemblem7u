	.include "macro.inc"

	.syntax unified

	thumb_func_start Sound_FadeOutSE
Sound_FadeOutSE: @ 0x08003710
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	bne _08003722
	movs r0, #6
	str r0, [r7]
_08003722:
	ldr r0, _0800378C @ =0x03005D60
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003790 @ =0x03005E30
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003794 @ =0x03005DA0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _08003798 @ =0x03005A90
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _0800379C @ =0x03005AD0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080037A0 @ =0x03005CE0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	ldr r0, _080037A4 @ =0x03005DF0
	ldr r2, [r7]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	bl m4aMPlayFadeOut
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800378C: .4byte 0x03005D60
_08003790: .4byte 0x03005E30
_08003794: .4byte 0x03005DA0
_08003798: .4byte 0x03005A90
_0800379C: .4byte 0x03005AD0
_080037A0: .4byte 0x03005CE0
_080037A4: .4byte 0x03005DF0
