	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemDisplayUsable
IsItemDisplayUsable: @ 0x08016AB0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r5, #0xff
	ands r5, r2
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08016AD8 @ =0x08BE222C
	adds r4, r0, r1
	ldr r1, [r4, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016ADC
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseWeapon
	b _08016AEC
	.align 2, 0
_08016AD8: .4byte 0x08BE222C
_08016ADC:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08016AF2
	adds r0, r3, #0
	adds r1, r2, #0
	bl CanUnitUseStaff
_08016AEC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08016B26
_08016AF2:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08016B24
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016B20
	cmp r1, #4
	beq _08016B20
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08016B24
	cmp r5, #0x6a
	bne _08016B24
_08016B20:
	movs r0, #0
	b _08016B26
_08016B24:
	movs r0, #1
_08016B26:
	pop {r4, r5}
	pop {r1}
	bx r1
