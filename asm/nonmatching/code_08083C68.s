	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083C68
sub_08083C68: @ 0x08083C68
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08083C86
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDispById
_08083C86:
	pop {r0}
	bx r0
	.align 2, 0
