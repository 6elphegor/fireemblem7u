	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitEfxDebuff
GetUnitEfxDebuff: @ 0x0804F840
	push {r4, lr}
	ldr r4, _0804F858 @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804F858: .4byte 0x0201776C
