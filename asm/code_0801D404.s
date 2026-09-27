	.include "macro.inc"

	.syntax unified

	thumb_func_start Make6CMOVEUNITForUnitBeingRescued
Make6CMOVEUNITForUnitBeingRescued: @ 0x0801D404
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0801D422
	adds r0, r3, #0
	bl StartMu
	b _0801D43C
_0801D422:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	bne _0801D432
	adds r0, r3, #0
	movs r1, #0x61
	b _0801D436
_0801D432:
	adds r0, r3, #0
	movs r1, #0x62
_0801D436:
	movs r2, #0xc
	bl sub_0806BA88
_0801D43C:
	pop {r1}
	bx r1
