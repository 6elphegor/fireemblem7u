	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrPopupDone
CheckEkrPopupDone: @ 0x0806B068
	ldr r0, _0806B074 @ =0x0202013C
	ldr r0, [r0]
	cmp r0, #1
	beq _0806B078
	movs r0, #0
	b _0806B07A
	.align 2, 0
_0806B074: .4byte 0x0202013C
_0806B078:
	movs r0, #1
_0806B07A:
	bx lr
