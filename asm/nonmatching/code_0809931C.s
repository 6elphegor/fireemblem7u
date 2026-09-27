	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809931C
sub_0809931C: @ 0x0809931C
	push {lr}
	bl GetChapterDivinationPortrait
	cmp r0, #0x41
	beq _0809932A
	movs r0, #0
	b _0809932C
_0809932A:
	movs r0, #1
_0809932C:
	pop {r1}
	bx r1
