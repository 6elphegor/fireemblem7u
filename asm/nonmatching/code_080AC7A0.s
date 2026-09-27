	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC7A0
sub_080AC7A0: @ 0x080AC7A0
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
