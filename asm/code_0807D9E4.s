	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D9E4
sub_0807D9E4: @ 0x0807D9E4
	push {r4, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r4, r0, #0
	bl sub_08079D20
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA0C
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x13
	bne _0807DA0C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _0807DA0C
	movs r0, #1
	b _0807DA0E
_0807DA0C:
	movs r0, #0
_0807DA0E:
	pop {r4}
	pop {r1}
	bx r1
