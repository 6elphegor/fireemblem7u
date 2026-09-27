	.include "macro.inc"

	.syntax unified

	thumb_func_start IsErkRecruited
IsErkRecruited: @ 0x0807EE90
	push {lr}
	movs r0, #0x13
	bl GetUnitFromCharId
	movs r2, #0
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _0807EEA6
	movs r2, #1
_0807EEA6:
	adds r0, r2, #0
	pop {r1}
	bx r1
