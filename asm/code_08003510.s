	.include "macro.inc"

	.syntax unified

	thumb_func_start Sound_SetBGMVolume
Sound_SetBGMVolume: @ 0x08003510
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003590 @ =0x03005D60
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _08003598 @ =0x03005E30
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _0800359C @ =0x03005DA0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080035A0 @ =0x03005A90
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080035A4 @ =0x03005AD0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080035A8 @ =0x03005CE0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080035AC @ =0x03005DF0
	ldr r1, _08003594 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003590: .4byte 0x03005D60
_08003594: .4byte 0x0000FFFF
_08003598: .4byte 0x03005E30
_0800359C: .4byte 0x03005DA0
_080035A0: .4byte 0x03005A90
_080035A4: .4byte 0x03005AD0
_080035A8: .4byte 0x03005CE0
_080035AC: .4byte 0x03005DF0
