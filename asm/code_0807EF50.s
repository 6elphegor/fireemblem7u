	.include "macro.inc"

	.syntax unified

	thumb_func_start IsRathRecruited
IsRathRecruited: @ 0x0807EF50
	push {lr}
	movs r0, #0x32
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EF66
	movs r2, #1
_0807EF66:
	adds r0, r2, #0
	pop {r1}
	bx r1
