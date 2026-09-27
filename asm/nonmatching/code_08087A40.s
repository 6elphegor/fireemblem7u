	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_LoopFadeIn
CgText_LoopFadeIn: @ 0x08087A40
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _08087A5E
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _08087A60
_08087A5E:
	movs r1, #1
_08087A60:
	adds r0, r2, #0
	bl SetCgTextBlendAlpha
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08087A76
	adds r0, r4, #0
	bl Proc_Break
_08087A76:
	pop {r4}
	pop {r0}
	bx r0
