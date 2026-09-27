	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrWindowAppearUnexist
CheckEkrWindowAppearUnexist: @ 0x08051AEC
	ldr r0, _08051AF8 @ =0x0201FAC0
	ldr r0, [r0]
	cmp r0, #0
	beq _08051AFC
	movs r0, #0
	b _08051AFE
	.align 2, 0
_08051AF8: .4byte 0x0201FAC0
_08051AFC:
	movs r0, #1
_08051AFE:
	bx lr
