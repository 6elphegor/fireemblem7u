	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F804
sub_0800F804: @ 0x0800F804
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F81A
	bl sub_080B3B70
	movs r0, #2
	b _0800F81C
_0800F81A:
	movs r0, #0
_0800F81C:
	pop {r1}
	bx r1
