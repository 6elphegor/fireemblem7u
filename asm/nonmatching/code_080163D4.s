	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseStaff
CanUnitUseStaff: @ 0x080163D4
	adds r3, r0, #0
	cmp r1, #0
	beq _08016408
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801640C @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016408
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _08016408
	cmp r1, #4
	beq _08016408
	cmp r1, #3
	bne _08016410
_08016408:
	movs r0, #0
	b _08016426
	.align 2, 0
_0801640C: .4byte 0x08BE222C
_08016410:
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r1, [r2, #7]
	adds r0, r1, r0
	movs r1, #0
	ldrb r0, [r0]
	ldrb r2, [r2, #0x1c]
	cmp r0, r2
	blt _08016424
	movs r1, #1
_08016424:
	adds r0, r1, #0
_08016426:
	bx lr
