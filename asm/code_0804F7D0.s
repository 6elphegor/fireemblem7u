	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableEfxStatusUnits
DisableEfxStatusUnits: @ 0x0804F7D0
	push {r4, lr}
	ldr r4, _0804F7EC @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F7EC: .4byte 0x0201776C
