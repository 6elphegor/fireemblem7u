	.include "macro.inc"

	.syntax unified

	thumb_func_start FixROMUnitStructPtr
FixROMUnitStructPtr: @ 0x080179BC
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080179E8
	ldrb r1, [r3, #4]
	subs r1, #1
	cmp r1, #0
	bgt _080179DE
	movs r1, #0
	b _080179E6
_080179DE:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _080179EC @ =0x08BDCE18
	adds r1, r1, r0
_080179E6:
	str r1, [r2]
_080179E8:
	bx lr
	.align 2, 0
_080179EC: .4byte 0x08BDCE18
