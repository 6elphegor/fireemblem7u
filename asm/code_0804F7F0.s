	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableEfxStatusUnits
EnableEfxStatusUnits: @ 0x0804F7F0
	push {r4, lr}
	ldr r4, _0804F80C @ =0x0201776C
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F80C: .4byte 0x0201776C
