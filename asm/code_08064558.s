	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08064558
sub_08064558: @ 0x08064558
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806457E
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl CRSpell_RegisterBgPal
	b _08064590
_0806457E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08064590
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl Proc_Break
_08064590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
