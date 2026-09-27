	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B180
sub_0800B180: @ 0x0800B180
	push {lr}
	adds r0, #0x5e
	movs r1, #8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800B192
	bl EndMapMain
_0800B192:
	pop {r0}
	bx r0
	.align 2, 0
