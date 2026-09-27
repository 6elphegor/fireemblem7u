	.include "macro.inc"

	.syntax unified

	thumb_func_start IsItemRepairable
IsItemRepairable: @ 0x08016D60
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08016DAC
	movs r0, #0xff
	ands r0, r4
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016DA8 @ =0x08BE222C
	adds r1, r1, r0
	ldr r2, [r1, #8]
	movs r0, #5
	ands r0, r2
	cmp r0, #0
	beq _08016DAC
	movs r0, #0xc1
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08016DAC
	movs r3, #8
	ands r3, r2
	asrs r0, r4, #8
	cmp r3, #0
	beq _08016D96
	movs r0, #0xff
_08016D96:
	movs r2, #0xff
	cmp r3, #0
	bne _08016D9E
	ldrb r2, [r1, #0x14]
_08016D9E:
	cmp r0, r2
	beq _08016DAC
	movs r0, #1
	b _08016DAE
	.align 2, 0
_08016DA8: .4byte 0x08BE222C
_08016DAC:
	movs r0, #0
_08016DAE:
	pop {r4}
	pop {r1}
	bx r1
