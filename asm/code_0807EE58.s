	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EE58
sub_0807EE58: @ 0x0807EE58
	push {lr}
	movs r0, #8
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EE6E
	movs r2, #1
_0807EE6E:
	adds r0, r2, #0
	pop {r1}
	bx r1
