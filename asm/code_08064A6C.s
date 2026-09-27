	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEkrDragonStatus
GetEkrDragonStatus: @ 0x08064A6C
	push {lr}
	bl GetAnimPosition
	cmp r0, #0
	beq _08064A80
	ldr r0, _08064A7C @ =0x02020050
	b _08064A82
	.align 2, 0
_08064A7C: .4byte 0x02020050
_08064A80:
	ldr r0, _08064A88 @ =0x02020040
_08064A82:
	pop {r1}
	bx r1
	.align 2, 0
_08064A88: .4byte 0x02020040
