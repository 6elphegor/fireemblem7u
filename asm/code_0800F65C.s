	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F65C
sub_0800F65C: @ 0x0800F65C
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F674
	movs r0, #1
	bl sub_080B3D20
	movs r0, #2
	b _0800F676
_0800F674:
	movs r0, #0
_0800F676:
	pop {r1}
	bx r1
	.align 2, 0
