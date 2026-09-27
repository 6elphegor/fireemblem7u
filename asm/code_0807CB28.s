	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CB28
sub_0807CB28: @ 0x0807CB28
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl StartBgmVolumeChange
	pop {r0}
	bx r0
