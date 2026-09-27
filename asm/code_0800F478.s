	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F478
sub_0800F478: @ 0x0800F478
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F48E
	bl sub_080B4F70
	movs r0, #2
	b _0800F490
_0800F48E:
	movs r0, #0
_0800F490:
	pop {r1}
	bx r1
