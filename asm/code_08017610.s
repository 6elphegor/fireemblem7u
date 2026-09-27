	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSMSId
GetUnitSMSId: @ 0x08017610
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017626
	ldr r0, [r2, #4]
	ldrb r0, [r0, #6]
	b _08017650
_08017626:
	ldrb r0, [r2, #0x1c]
	bl GetTrap
	ldrb r0, [r0, #3]
	cmp r0, #0x35
	beq _08017646
	cmp r0, #0x35
	bgt _0801763C
	cmp r0, #0x34
	beq _08017642
	b _0801764E
_0801763C:
	cmp r0, #0x36
	beq _0801764A
	b _0801764E
_08017642:
	movs r0, #0x4f
	b _08017650
_08017646:
	movs r0, #0x50
	b _08017650
_0801764A:
	movs r0, #0x51
	b _08017650
_0801764E:
	movs r0, #0
_08017650:
	pop {r1}
	bx r1
