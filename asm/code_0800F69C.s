	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F69C
sub_0800F69C: @ 0x0800F69C
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F6B2
	bl sub_080B3D78
	movs r0, #2
	b _0800F6B4
_0800F6B2:
	movs r0, #0
_0800F6B4:
	pop {r1}
	bx r1
