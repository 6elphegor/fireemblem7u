	.include "macro.inc"

	.syntax unified

	thumb_func_start SpacialSeTest_OnLoop
SpacialSeTest_OnLoop: @ 0x08013A48
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _08013AAC @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08013A66
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08013A66:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _08013AA6
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013A8E
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r4, r0, #0
_08013A8E:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013A9E
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
_08013A9E:
	movs r0, #0x9a
	adds r1, r4, #0
	bl PlaySeSpacial
_08013AA6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013AAC: .4byte 0x08B857F8
