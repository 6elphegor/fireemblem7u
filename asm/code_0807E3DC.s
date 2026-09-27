	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E3DC
sub_0807E3DC: @ 0x0807E3DC
	push {lr}
	ldr r0, _0807E3F4 @ =0x08CE0B18
	movs r1, #0x27
	bl sub_0807E3B0
	ldr r0, _0807E3F8 @ =0x08CE0B38
	movs r1, #0x26
	bl sub_0807E3B0
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F4: .4byte 0x08CE0B18
_0807E3F8: .4byte 0x08CE0B38
