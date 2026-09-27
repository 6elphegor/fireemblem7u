	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_LoopFadeOut
CgText_LoopFadeOut: @ 0x08087ADC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08087AFA
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08087AFC
_08087AFA:
	movs r1, #1
_08087AFC:
	adds r0, r2, #0
	bl SetCgTextBlendAlpha
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne _08087B1A
	movs r0, #0x80
	lsls r0, r0, #9
	bl ClearCgTextFlag
	adds r0, r4, #0
	bl Proc_Break
_08087B1A:
	pop {r4}
	pop {r0}
	bx r0
