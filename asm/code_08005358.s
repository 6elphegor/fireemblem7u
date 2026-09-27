	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005358
sub_08005358: @ 0x08005358
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl sub_08005044
	ldr r2, _08005378 @ =0x02028D4C
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800530C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005378: .4byte 0x02028D4C
