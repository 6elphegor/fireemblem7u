	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08051CC8
sub_08051CC8: @ 0x08051CC8
	ldr r0, _08051CD4 @ =0x0201FAC8
	ldr r0, [r0]
	cmp r0, #0
	beq _08051CD8
	movs r0, #0
	b _08051CDA
	.align 2, 0
_08051CD4: .4byte 0x0201FAC8
_08051CD8:
	movs r0, #1
_08051CDA:
	bx lr
