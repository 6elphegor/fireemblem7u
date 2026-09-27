	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EDB8
sub_0807EDB8: @ 0x0807EDB8
	push {lr}
	ldr r0, _0807EDC8 @ =0x03005B10
	ldr r1, _0807EDCC @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDC8: .4byte 0x03005B10
_0807EDCC: .4byte 0x0000FFFF
