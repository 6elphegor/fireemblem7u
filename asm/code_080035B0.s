	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBgmVolume
SetBgmVolume: @ 0x080035B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080035E0 @ =0x03005B10
	ldr r1, _080035E4 @ =0x0000FFFF
	ldr r3, [r7]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	bl MPlayVolumeControl
	ldr r0, _080035E8 @ =0x03005D20
	ldr r1, _080035E4 @ =0x0000FFFF
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
_080035E0: .4byte 0x03005B10
_080035E4: .4byte 0x0000FFFF
_080035E8: .4byte 0x03005D20
