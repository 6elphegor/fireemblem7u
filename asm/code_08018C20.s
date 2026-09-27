	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitLeaderCharId
GetUnitLeaderCharId: @ 0x08018C20
	adds r1, r0, #0
	movs r0, #0xc0
	ldrb r2, [r1, #0xb]
	ands r0, r2
	cmp r0, #0
	beq _08018C34
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	b _08018C36
_08018C34:
	movs r0, #0
_08018C36:
	bx lr
