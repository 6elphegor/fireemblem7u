	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAnimAnotherSide
GetAnimAnotherSide: @ 0x080547A8
	push {r4, lr}
	ldr r4, _080547C0 @ =0x02000000
	bl GetAnimPosition
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080547C0: .4byte 0x02000000
