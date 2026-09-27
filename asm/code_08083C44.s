	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083C44
sub_08083C44: @ 0x08083C44
	push {lr}
	bl GetDialogueBoxConfig
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08083C64
	movs r0, #0
	bl GetFaceDispById
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #0
	bl SetFaceDispById
_08083C64:
	pop {r0}
	bx r0
