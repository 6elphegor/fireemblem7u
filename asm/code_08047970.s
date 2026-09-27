	.include "macro.inc"

	.syntax unified

	thumb_func_start SioWarpFx_804C178
SioWarpFx_804C178: @ 0x08047970
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl sub_08047768
	pop {r0}
	bx r0
	.align 2, 0
