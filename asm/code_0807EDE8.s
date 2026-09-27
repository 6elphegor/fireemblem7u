	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EDE8
sub_0807EDE8: @ 0x0807EDE8
	push {lr}
	ldr r0, _0807EDFC @ =0x03005B10
	ldr r1, _0807EE00 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #1
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDFC: .4byte 0x03005B10
_0807EE00: .4byte 0x0000FFFF
