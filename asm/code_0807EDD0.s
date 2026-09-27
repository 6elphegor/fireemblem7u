	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EDD0
sub_0807EDD0: @ 0x0807EDD0
	push {lr}
	ldr r0, _0807EDE0 @ =0x03005DA0
	ldr r1, _0807EDE4 @ =0x0000FFFF
	movs r2, #0x20
	bl MPlayVolumeControl
	pop {r0}
	bx r0
	.align 2, 0
_0807EDE0: .4byte 0x03005DA0
_0807EDE4: .4byte 0x0000FFFF
