	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080992D8
sub_080992D8: @ 0x080992D8
	push {lr}
	bl GetChapterDivinationTextIdHectorStory
	cmp r0, #0
	beq _080992EE
	bl GetChapterDivinationTextIdBeginning
	cmp r0, #0
	bne _080992EE
	movs r0, #1
	b _080992F0
_080992EE:
	movs r0, #0
_080992F0:
	pop {r1}
	bx r1
