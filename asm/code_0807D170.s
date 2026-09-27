	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D170
sub_0807D170: @ 0x0807D170
	push {lr}
	movs r0, #0x10
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807D186
	movs r2, #1
_0807D186:
	adds r0, r2, #0
	pop {r1}
	bx r1
