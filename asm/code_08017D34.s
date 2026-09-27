	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitFromCharId
GetUnitFromCharId: @ 0x08017D34
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _08017D5C @ =0x08B92EB0
	movs r4, #0xff
_08017D3E:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08017D60
	ldr r0, [r1]
	cmp r0, #0
	beq _08017D60
	ldrb r0, [r0, #4]
	cmp r0, r3
	bne _08017D60
	adds r0, r1, #0
	b _08017D68
	.align 2, 0
_08017D5C: .4byte 0x08B92EB0
_08017D60:
	adds r2, #1
	cmp r2, #0xff
	ble _08017D3E
	movs r0, #0
_08017D68:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
