	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F540
sub_0800F540: @ 0x0800F540
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080B5B6C
	adds r4, #0x5e
	movs r0, #4
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	bne _0800F558
	movs r0, #2
	b _0800F55A
_0800F558:
	movs r0, #0
_0800F55A:
	pop {r4}
	pop {r1}
	bx r1
