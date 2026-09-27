	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitFromCharIdAndFaction
GetUnitFromCharIdAndFaction: @ 0x08017D70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r3, #0x40
	adds r1, #1
	cmp r1, r3
	bge _08017DAA
	ldr r6, _08017DA0 @ =0x08B92EB0
	movs r5, #0xff
_08017D82:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08017DA4
	ldr r0, [r2]
	cmp r0, #0
	beq _08017DA4
	ldrb r0, [r0, #4]
	cmp r0, r4
	bne _08017DA4
	adds r0, r2, #0
	b _08017DAC
	.align 2, 0
_08017DA0: .4byte 0x08B92EB0
_08017DA4:
	adds r1, #1
	cmp r1, r3
	blt _08017D82
_08017DAA:
	movs r0, #0
_08017DAC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
