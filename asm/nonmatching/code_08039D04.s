	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsWithinFlyingDistance
AiIsWithinFlyingDistance: @ 0x08039D04
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _08039D24
	subs r1, r0, r4
_08039D24:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _08039D32
	adds r0, r1, r3
	b _08039D36
_08039D32:
	subs r0, r0, r2
	adds r0, r1, r0
_08039D36:
	cmp r5, r0
	bge _08039D3E
	movs r0, #0
	b _08039D40
_08039D3E:
	movs r0, #1
_08039D40:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
