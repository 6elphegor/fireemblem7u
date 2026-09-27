	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010048
sub_08010048: @ 0x08010048
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0801005E
	bl EndCgText
	movs r0, #2
	b _08010060
_0801005E:
	movs r0, #0
_08010060:
	pop {r1}
	bx r1
