	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrPopup
EndEkrPopup: @ 0x0806B07C
	push {r4, lr}
	ldr r4, _0806B094 @ =0x02020138
	ldr r0, [r4]
	cmp r0, #0
	beq _0806B08E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806B08E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B094: .4byte 0x02020138
