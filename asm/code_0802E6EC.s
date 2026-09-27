	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTacticianName
SetTacticianName: @ 0x0802E6EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802E6FC @ =0x0202BC18
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_0802E6FC: .4byte 0x0202BC18
