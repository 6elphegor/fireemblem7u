	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CFC8
sub_0807CFC8: @ 0x0807CFC8
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807CFDE
	movs r2, #1
_0807CFDE:
	adds r0, r2, #0
	pop {r1}
	bx r1
