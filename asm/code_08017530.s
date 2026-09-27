	.include "macro.inc"

	.syntax unified

	thumb_func_start CopyUnit
CopyUnit: @ 0x08017530
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r5, [r4, #0xb]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x48
	bl memcpy
	strb r5, [r4, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
