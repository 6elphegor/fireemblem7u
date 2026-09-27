	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08051BD0
sub_08051BD0: @ 0x08051BD0
	ldr r0, _08051BDC @ =0x0201FAC4
	ldr r0, [r0]
	cmp r0, #0
	beq _08051BE0
	movs r0, #0
	b _08051BE2
	.align 2, 0
_08051BDC: .4byte 0x0201FAC4
_08051BE0:
	movs r0, #1
_08051BE2:
	bx lr
