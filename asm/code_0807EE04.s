	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EE04
sub_0807EE04: @ 0x0807EE04
	push {lr}
	ldr r0, _0807EE18 @ =0x03005DA0
	ldr r1, _0807EE1C @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EE18: .4byte 0x03005DA0
_0807EE1C: .4byte 0x0000FFFF
