	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048DE0
sub_08048DE0: @ 0x08048DE0
	push {lr}
	ldr r1, _08048DF0 @ =0x03005D20
	movs r0, #0x49
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
_08048DF0: .4byte 0x03005D20
