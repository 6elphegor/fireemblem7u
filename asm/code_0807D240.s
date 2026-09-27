	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D240
sub_0807D240: @ 0x0807D240
	push {lr}
	movs r0, #0x26
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0807D266
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0807D266
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D266
	movs r0, #1
	b _0807D268
_0807D266:
	movs r0, #0
_0807D268:
	pop {r1}
	bx r1
